module hdma(
	input  reset,
	input  clk,
	input  ce, // 4 or 8 Mhz cpu clock
	input  speed,  // cpu speed mode use for amount of byte cycles
	
	// cpu register interface
	input        sel_reg,
	input  [3:0] addr,
	input        wr,
	output [7:0] dout,
	input  [7:0] din,
	
	input [1:0] lcd_mode, 
	
	// dma connection
	output reg hdma_rd,
	output reg hdma_active,
	output [15:0] hdma_source_addr,
	output [15:0] hdma_target_addr

);

//"The preparation time (4 clocks) is the same in single and double speed mode"
localparam START_DELAY = 3'd4;


//ff51-ff55 HDMA1-5 (GBC)
reg [11:0] hdma_source;        // ff51, ff52 only top 4 bits used
reg [8:0] hdma_target;	       // ff53 only lowest 5 bits used, ff54 only top 4 bits used

reg hdma_mode; 					// ff55 bit 7  - 1=General Purpose DMA 0=H-Blank DMA
reg hdma_enabled;					// ff55 !bit 7 when read
reg [7:0] hdma_length;			// ff55 bit 6:0 - dma transfer length (hdma_length+1)*16 bytes
reg hdma_end;
// it takes about 8us to transfer a block of 16 bytes. -> 500ns per byte -> 2Mhz
// 32 cycles in Normal Speed Mode, and 64 'fast' cycles in Double Speed Mode
reg [3:0] byte_cnt;  // 16bytes
// Normal speed: 2 cycles, Double speed: 4 cycles per byte.
wire [1:0] byte_cycles = speed ? 2'd3 : 2'd1;
reg [1:0] hdma_cnt;

//assign hdma_rd = hdma_active;
assign hdma_source_addr = {        hdma_source, byte_cnt };
assign hdma_target_addr = { 3'b100,hdma_target, byte_cnt };

reg [2:0] dma_delay;

reg [1:0] hdma_state;
parameter active=2'd0,blocksent=2'd1,wait_h=2'd2;

always @(posedge clk) begin
	if(reset) begin
		hdma_active <= 1'b0;
		hdma_state <= wait_h;
		hdma_enabled <= 1'b0;
		hdma_source <= 12'hFFF;
		hdma_target <= 9'h1FF;
		dma_delay <= 3'd0;
		hdma_rd <= 0;
		hdma_end <= 0;
	end
	else if(ce) begin
	   if(sel_reg && wr) begin
		
			case (addr)
				4'd1: hdma_source[11:4] <= din;
				4'd2: hdma_source[3:0]  <= din[7:4];
				4'd3: hdma_target[8:4]  <= din[4:0];
				4'd4: hdma_target[3:0]  <= din[7:4];
			 
				// writing the hdma register engages the dma engine
				4'h5: begin
							hdma_length <= {1'b0,din[6:0]};
							if (hdma_mode == 1 && hdma_enabled && !din[7]) begin  //terminate an active H-Blank transfer by writing zero to Bit 7 of FF55
								hdma_state <= wait_h;
								hdma_end <= 1'b1;
								hdma_rd <= 1'b0;
								hdma_enabled <= 1'b0;
							end else begin															  //normal trigger
								hdma_enabled <= 1'b1;
								hdma_mode <= din[7];
								dma_delay <= START_DELAY;
								hdma_cnt <= 2'd0;
								byte_cnt <= 4'd0;
								if (din[7] == 1) hdma_state <= wait_h;
							end
						end
			endcase
		end

		// Currently IRAM takes 1 CPU cycle to get data. If hdma_active is lowered
		// at the same time as hdma_rd then the CPU will read invalid data.
		if (hdma_end) begin
			hdma_active <= 0;
			hdma_end <= 0;
		end

		if (hdma_enabled) begin
			if(hdma_mode==0) begin 				                    //mode 0 GDMA do the transfer in one go after inital delay
				hdma_active <= 1'b1;
				hdma_rd <= 1'b1; // get data from RAM ready while waiting
				if (dma_delay>0) begin
				dma_delay <= dma_delay - 1'b1;
				end else begin
					if(hdma_length != 8'hFF) begin
						hdma_cnt <= hdma_cnt + 1'd1;
						if (hdma_cnt == byte_cycles) begin
							hdma_cnt <= 2'd0;
							byte_cnt <= byte_cnt + 1'b1;
							if (&byte_cnt) begin
								hdma_source <= hdma_source + 1'b1;
								hdma_target <= hdma_target + 1'b1;
								hdma_length <= hdma_length - 1'd1;
								if (hdma_length == 0) begin
									hdma_end <= 1'b1;
									hdma_rd <= 1'b0;
									hdma_enabled <= 1'b0;
								end
							end
						end
					end
			    end

			end else begin        			                       //mode 1 HDMA transfer 1 block (16bytes) in each H-Blank only
				case (hdma_state)
					
					wait_h:    begin 
								    if (lcd_mode == 2'b00 ) begin	// Mode 00:  h-blank
										dma_delay <= START_DELAY;
										hdma_state <= active;
									end
									 hdma_end <= 1'b1;
									 hdma_rd <= 1'b0;
							     end
				   
					blocksent: begin
									if (hdma_length == 8'hFF) begin //check if finished
										hdma_enabled <= 1'b0;
									end
									if (lcd_mode == 2'b11) // wait for mode 3, mode before h-blank
										hdma_state <= wait_h;	
								end

					active:    begin
									if(hdma_length != 8'hFF) begin
									  hdma_active <= 1'b1;
									  hdma_rd <= 1'b1; // get data from RAM ready while waiting
									  if (dma_delay>0) begin
										  dma_delay <= dma_delay - 1'b1;
									  end else begin
											hdma_cnt <= hdma_cnt + 1'd1;
											if (hdma_cnt == byte_cycles) begin
												hdma_cnt <= 2'd0;
												byte_cnt <= byte_cnt + 1'b1;
												if (&byte_cnt) begin
													hdma_source <= hdma_source + 1'b1;
													hdma_target <= hdma_target + 1'b1;
													hdma_length <= hdma_length - 1'd1;
													hdma_state <= blocksent;
													hdma_end <= 1'b1;
													hdma_rd <= 1'b0;
												end
											end
										end
									end else begin
										hdma_end <= 1'b1;
										hdma_rd <= 1'b0;
										hdma_enabled <= 1'b0;
									end
								 end
				endcase 	
			end
		end
	end
end

assign dout = (sel_reg && addr==4'd5) ? {~hdma_enabled, hdma_length[6:0]} : 8'hFF;

endmodule

/*
`timescale 1 ns/100 ps  // time-unit = 1 ns, precision = 100 ps

module hdma_tb;

   // duration for each bit = 125 * timescale = 125 * 1 ns  = 125ns // 8MHz
   localparam period = 125;  

	reg  reset = 1'd1;
	reg  clk = 1'd0;
	reg speed = 1'b0;
	
	// cpu register interface
	reg        sel_reg = 1'd0;
	reg  [3:0] addr    = 4'd0;
	reg        wr      = 1'd0;
	wire [7:0] dout;
	reg  [7:0] din     = 8'd0;
	
	reg [1:0] lcd_mode = 2'd0; 
	
	// dma connection
	wire hdma_rd;
	wire hdma_active;
	wire [15:0] hdma_source_addr;
	wire [15:0] hdma_target_addr;
	
	
	
	hdma hdma(
		.reset	          ( reset         ),
		.clk		          ( clk           ),
		.speed				 ( speed         ),
 		 
		// cpu register interface
		.sel_reg 	       ( sel_reg       ),
		.addr			       ( addr          ),
		.wr			       ( wr	           ),
		.dout			       ( dout       ),
		.din               ( din           ),
		
		.lcd_mode          ( lcd_mode      ),
		
		// dma connection
		.hdma_rd           ( hdma_rd          ),
		.hdma_active       ( hdma_active      ),
		.hdma_source_addr  ( hdma_source_addr ),
		.hdma_target_addr  ( hdma_target_addr ) 
		
	);
	
	always #62 clk <= !clk;
	initial begin
		reset <= 1'b0;
		sel_reg <= 1'b1;
		addr <= 4'd4;
		
		#1000 
		
		sel_reg <= 1'b1;
		addr <= 4'd1; // source h
		din <= 8'h20;
		wr <= 1'd1;
		
		#period  
		 wr <= 1'd0;	
		
		#period
	
		sel_reg <= 1'b1;
		addr <= 4'd2; // source l
		din <= 8'h40;
		wr <= 1'd1;
		
		#period
		wr <= 1'd0;	
		
		#period
	
		sel_reg <= 1'b1;
		addr <= 4'd3; // target h
		din <= 8'h82;
		wr <= 1'd1;
		#period
		wr <= 1'd0;	
		
		#period 
	
		sel_reg <= 1'b1;
		addr <= 4'd4; // target l
		din <= 8'h00;
		wr <= 1'd1;
		
		#period
		wr <= 1'd0;	
		
		#period
		$display("GDMA");
		sel_reg <= 1'b1;
		addr <= 4'd5; // trigger GDMA with length 
		din <= 8'h01;  // 20h bytes
		wr <= 1'd1;
		#period
		wr <= 1'd0;	
		
		#8000	
		
		lcd_mode <= 2'd1; 
		#2000
		
		lcd_mode <= 2'd0; 
		#8000
		
		$display("HDMA");
		sel_reg <= 1'b1;
		addr <= 4'd5; // trigger HDMA with length 
		din <= 8'h82;  // 30h bytes
		wr <= 1'd1;
		
		#period
		wr <= 1'd0;	
		
		#16000	
		
		lcd_mode <= 2'd2; 
		#2000
		
		lcd_mode <= 2'd3; 
		#2000
		
		lcd_mode <= 2'd0; 
		#16000

		lcd_mode <= 2'd2; 
		#2000
		
		lcd_mode <= 2'd3; 
		#2000
		
		lcd_mode <= 2'd0; 
		#16000
		
		sel_reg <= 1'b1;
		addr <= 4'd5;
		$display("Check FF55");
				
		#1000 

		$display("HDMA with cancel");
		sel_reg <= 1'b1;
		addr <= 4'd5; // trigger HDMA with length 
		din <= 8'h82;  // 30h bytes
		wr <= 1'd1;
		
		#period
		wr <= 1'd0;
		
		#16000	
		
		lcd_mode <= 2'd2; 
		#2000
		
		lcd_mode <= 2'd3; 
		#2000
		
      $display("canceling");
		sel_reg <= 1'b1;
		addr <= 4'd5; // trigger HDMA with length 
		din <= 8'h00;  // stop
		wr <= 1'd1;
		
		#period
		wr <= 1'd0;	
		
		#16000	
		
		sel_reg <= 1'b1;
		addr <= 4'd5;
		$display("Check FF55");
		
		lcd_mode <= 2'd2; 
		#2000
		
		lcd_mode <= 2'd3; 
		#2000
		$display("Test Complete");
	end  
  
endmodule
*/
