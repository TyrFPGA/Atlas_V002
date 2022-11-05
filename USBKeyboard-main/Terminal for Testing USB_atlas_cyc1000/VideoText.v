// FPGA video driver project 2019
// modified for USB Keyboard on 2021
// Antonio S�nchez (@TheSonders)

module VideoText(
	input wire  sys_clk,
	inout wire  DP,
    inout wire  DM,
    output wire PDP_4k7,
    output wire PDM_4k7,
    
    output wire LED_1,
    output wire LED_2,
    
    output wire [7:0] TMDS

);

wire VSync;
wire HSync;
wire vga_blank;
reg  VGA_CLK;
wire [1:0] VGA_Red;
wire [1:0] VGA_Green;
wire [1:0] VGA_Blue;

assign PDP_4k7=1'b0;
assign PDM_4k7=1'b0;

wire NewKey;
wire [7:0] Result;
wire [10:0] mem_addr;
wire [15:0] mem_data;
wire [15:0] ret_data;
wire we;
wire clk48,clk50,clock_dvi_s;

wire Device_Connected;
assign LED_2=(Device_Connected)?1'b0:1'b1;
assign LED_1=1'b1;

always @(posedge clk50) VGA_CLK<=~VGA_CLK;

///CLOCK CROSS DOMAIN ISSUE
wire [7:0] R0;
wire [7:0] R2;
reg [7:0] CDCR0=0;
reg [7:0] CDCR2=0;
reg [7:0] rR0=0;
reg [7:0] rR2=0;

//Slow to fast CD (double flop)
always @(posedge clk50) begin
    CDCR0<=R0;
    CDCR2<=R2;
    rR0<=CDCR0;
    rR2<=CDCR2;
end

wire Key_CapsLock;
wire Key_ScrollLock;
wire Key_NumLock;
reg LedCaps=0;
reg LedScroll=0;
reg LedNum=0;
always @(posedge clk48)begin
    LedCaps<=Key_CapsLock;
    LedScroll<=Key_ScrollLock;
    LedNum<=Key_NumLock;
end
//////////////////////////

pll PLL_inst(
    .inclk0(sys_clk),
    .c0(clk48),    
    .c1(clk50)
    );   

pll2 PLL2_inst(
    .inclk0(sys_clk),
//    .c0(VGA_CLK),    
    .c1(clock_dvi_s)
    );   

USB_L2 USB_inst (
    .clk(clk48),
    .LedNum(LedNum),
    .LedCaps(LedCaps),
    .LedScroll(LedScroll),
    .dp(DP),
    .dm(DM),
    .Rmodifiers(R0),
    .R0(R2),
    .Device_Connected(Device_Connected));

USB2ASCII USB2ASCII_inst (
    .clk(clk50),
    .R0(rR0),
    .R2(rR2),
    .Result(Result),
	.NewKey(NewKey),
    .Key_CapsLock(Key_CapsLock),
    .Key_ScrollLock(Key_ScrollLock),
    .Key_NumLock(Key_NumLock));

Text_Editor Editor_inst (
	.sys_clk(clk50),
	.NewKey(NewKey),
	.Ascii(Result),
	.mem_addr(mem_addr),
	.mem_data(mem_data),
	.we(we),
	.ret_data(ret_data));	 
	 
Video_Driver Video_inst (
	.sys_clk(clk50),         //clk50
	.we(we),
	.mem_addr(mem_addr),
	.mem_data(mem_data),
	.ret_data(ret_data),
	.VSync(VSync),
	.HSync(HSync),
	.Red(VGA_Red),
	.Green(VGA_Green),
	.Blue(VGA_Blue),
    .vga_blank(vga_blank)
    );	  


//BEGIN HDMI 1 NO SOUND (MULTICPM / Next186) 
assign TMDS[6] = 1'b0;
assign TMDS[4] = 1'b0;
assign TMDS[2] = 1'b0;
assign TMDS[0] = 1'b0;

hdmi hdmi_inst  (
    // clocks
    .CLK_PIXEL_I (VGA_CLK),
    .CLK_DVI_I   (clock_dvi_s),
    // components
    .R_I         ({4{VGA_Red}}  ),
    .G_I         ({4{VGA_Green}}),
    .B_I         ({4{VGA_Blue}} ),
    .BLANK_I     (vga_blank     ),
    .HSYNC_I     (HSync  ),
    .VSYNC_I     (VSync  ),
    .TMDS_D0_O   (TMDS[3]),
    .TMDS_D1_O   (TMDS[5]),
    .TMDS_D2_O   (TMDS[7]),
    .TMDS_CLK_O  (TMDS[1])
);
// END HDMI 1 



endmodule
