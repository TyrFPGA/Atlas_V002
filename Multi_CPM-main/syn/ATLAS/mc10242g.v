module mc10242g
 (
	  input  CLK_12MHZ,
	  output [12:0]DRAM_A,
	  output [1:0]DRAM_BA,
	  output DRAM_NCAS,
	  output DRAM_CKE,
	  output DRAM_CLK,
	  output DRAM_CS,
	  inout  [15:0] DRAM_DQ,
	  output DRAM_DQMH,
	  output DRAM_DQML,
	  output DRAM_NRAS,
	  output DRAM_NWE,
	  output [7:0] TMDS=8'b0,
	  output [7:0] LED=8'bZ,
	  input  USER_BTN,
	  inout  PS2_CLK,
	  inout  PS2_DATA,
	  inout  MOUSE_CLK,
	  inout  MOUSE_DATA,
	  output AUDIO_L,
	  output AUDIO_R,
	  output SD_CS,
	  input  SD_MISO,
	  output SD_CLK,
	  output SD_MOSI,
	  input  RX2,
	  output TX2,
	  input  RX,
	  output RTS,
	  input  CTS,
	  output TX
	);




pll pll
(
  .inclk0 (CLK_12MHZ),
  .c0 (clk),
  .c1 (cpuClock),
  .c2 (clk_ram),
  .c3 (clk_ram_ph),
  .locked (pll_locked)
);

pll_hdmi pll_hdmi
(
  .inclk0 (CLK_12MHZ),
  .c0 (clk_vdi),
  .c1 (clk_pixel),
);

//
// mainly for comms communication.
//
//assign LED[0]=~TX;
//assign LED[1]=~RX;
//assign LED[2]=~CTS;
//assign LED[3]=~RTS;
//assign LED[4]=~TX2;
//assign LED[5]=~RX2;
//assign LED[7]=~USER_BTN;


assign TMDS[0]=1'b0;
assign TMDS[2]=1'b0;
assign TMDS[4]=1'b0;
assign TMDS[6]=1'b0;

wire [18:0] sramAddress;
wire [7:0]  sramDataIn;
wire [7:0]  sramDataOut;



Microcomputer Microcomputer
(
  .n_reset (USER_BTN),
  .clk     (clk),
  .cpuClock(cpuClock),
  .cpuData (LED),
  
  .sramDataIn	(sramDataIn),
  .sramDataOut (sramDataOut),
  .sramAddress	(sramAddress),
  .n_sRamWE		(n_sRamWE),
  .n_sRamOE		(n_sRamOE),
  .n_sRam1CS	(n_sRam1CS),
  .n_sRam2CS	(n_sRam2CS),
  
  .rxd1    (RX),
  .txd1    (TX),
  .rts1    (RTS),
  .cts1    (CTS),
//
  .rxd3    (RX2),
  .txd3    (TX2),
  .rts3    (1'b0),
  .cts3    (1'b0),

  .videoR0  (videoR0),
  .videoG0  (videoG0),
  .videoB0	(videoB0),
  .videoR1	(videoR1),
  .videoG1	(videoG1),
  .videoB1	(videoB1),
  .hSync		(hSync),
  .vSync	   (vSync),
  .hBlank	(hBlank),
  .vBlank	(vBlank),
  .cepix  	(cepix),

  
  .sdCS    (SD_CS),
  .sdMOSI  (SD_MOSI),
  .sdMISO  (SD_MISO),
  .sdSCLK  (SD_CLK),
  
  .ps2Data (PS2_DATA),
  .ps2Clk  (PS2_CLK)
);


assign DRAM_CLK=clk_ram_ph;

ssdram ram
(
  .clock_i   (clk_ram),
  .reset_i   (~pll_locked),
  .refresh_i (1'b1),
  //
  .addr_i     (sramAddress),
  .data_i     (sramDataIn),
  .data_o     (sramDataOut),
  .cs_i       (~n_sRam1CS || ~n_sRam2CS),
  .oe_i       (~n_sRamOE),
  .we_i       (~n_sRamWE),
  //
  .mem_cke_o    (DRAM_CKE),
  .mem_cs_n_o   (DRAM_CS),
  .mem_ras_n_o  (DRAM_NRAS),
  .mem_cas_n_o  (DRAM_NCAS),
  .mem_we_n_o   (DRAM_NWE),
  .mem_udq_o    (DRAM_DQMH),
  .mem_ldq_o    (DRAM_DQML),
  .mem_ba_o     (DRAM_BA),
  .mem_addr_o   (DRAM_A),
  .mem_data_io  (DRAM_DQ)
);

hdmi hdmi_18bits
(
	//clocks
	.CLK_DVI_I(clk_vdi),	 
	.CLK_PIXEL_I(clk_pixel),	

	// components
	.R_I({videoR1,videoR0,6'b0}),
	.G_I({videoG1,videoG0,6'b0}),
	.B_I({videoB1,videoB0,6'b0}),
	.BLANK_I((hBlank||vBlank)),
	.HSYNC_I(hSync),			
	.VSYNC_I(vSync),			
	.TMDS_D0_O(TMDS[3]),		
	.TMDS_D1_O(TMDS[5]),		
	.TMDS_D2_O(TMDS[7]),		
	.TMDS_CLK_O(TMDS[1])
);	
endmodule