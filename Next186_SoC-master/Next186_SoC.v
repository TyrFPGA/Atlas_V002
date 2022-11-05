// Next186 SoC ATLAS port by DistWave

module Next186_SoC(

	input CLOCK_12,
	output	[11:0]DRAM_ADDR,
	output	[1:0]DRAM_BA,
	output	DRAM_CAS_N,
	output	DRAM_CKE,
	output	DRAM_CLK,
	output	DRAM_CS_N,
	inout		[15:0]DRAM_DQ,
	output	[1:0]DRAM_DQM,
	output	DRAM_RAS_N,
	output	DRAM_WE_N,
	output wire Out_TMDS_D0,
	output wire Out_TMDS_D1,
	output wire Out_TMDS_D2,
	output wire Out_TMDS_CLK,
	output wire Out_TMDS_D0_N,
	output wire Out_TMDS_D1_N,
	output wire Out_TMDS_D2_N,
	output wire Out_TMDS_CLK_N,
	output [7:0]LEDS,
	input BTN_USER,
	inout PS2_CLKA,
	inout PS2_DATA,
	inout PS2_CLKB,
	inout PS2_DATB,
	output AUDIO_L,
	output AUDIO_R,
	output SD_nCS,
	input SD_DO,
	output SD_CK,
	output SD_DI,
	input RX_EXT,
	output TX_EXT,
	output MIDI_OUT
);

	wire SDR_CLK;
	assign DRAM_CKE = 1'b1;
	wire [5:0]VGA_R;
	wire [5:0]VGA_G;
	wire [5:0]VGA_B;
	wire VGA_BLNK;
	wire VGA_VSYNC;
	wire VGA_HSYNC;
	wire [7:0] r8b,g8b,b8b;
	assign r8b = {VGA_R, 2'b00};
	assign g8b = {VGA_G, 2'b00};
	assign b8b = {VGA_B, 2'b00};
   wire clk125m;
	wire clkvga;
	wire VGA_CLK;
	wire HDMI_CLK;


	dd_buf sdrclk_buf
	(
		.datain_h(1'b1),
		.datain_l(1'b0),
		.outclock(SDR_CLK),
		.dataout(DRAM_CLK)
	);

	system sys_inst
	(
		.CLK_12MHZ(CLOCK_12),
		.VGA_R(VGA_R),
		.VGA_G(VGA_G),
		.VGA_B(VGA_B),
		.frame_on(),
		.VGA_HSYNC(VGA_HSYNC),
		.VGA_VSYNC(VGA_VSYNC),
		.VGA_BLNK(VGA_BLNK),
		.VGA_CLK(VGA_CLK),
		.HDMI_CLK(HDMI_CLK),
		.sdr_CLK_out(SDR_CLK),
		.sdr_n_CS_WE_RAS_CAS({DRAM_CS_N, DRAM_WE_N, DRAM_RAS_N, DRAM_CAS_N}),
		.sdr_BA(DRAM_BA),
		.sdr_ADDR(DRAM_ADDR),
		.sdr_DATA(DRAM_DQ),
		.sdr_DQM({DRAM_DQM}),
		.LED(LEDS),
		.BTN_RESET(~BTN_USER),
		.BTN_NMI(),
		.RS232_DCE_RXD(RX_EXT),
		.RS232_DCE_TXD(TX_EXT),
		.RS232_EXT_RXD(),
		.RS232_EXT_TXD(),
		.SD_n_CS(SD_nCS),
		.SD_DI(SD_DI),
		.SD_CK(SD_CK),
		.SD_DO(SD_DO),
		.AUD_L(AUDIO_L),
		.AUD_R(AUDIO_R),
		.MIDI_OUT(MIDI_OUT),
	 	.PS2_CLK1(PS2_CLKA),
		.PS2_CLK2(PS2_CLKB),
		.PS2_DATA1(PS2_DATA),
		.PS2_DATA2(PS2_DATB),
		.RS232_HOST_RXD(),
		.RS232_HOST_TXD(),
		.RS232_HOST_RST(),
		.GPIO()
	);

	hdmi hdmi_18bits
	(
		//clocks
		.CLK_DVI_I(HDMI_CLK),	 
		.CLK_PIXEL_I(VGA_CLK),		
	
		// components
		.R_I({VGA_R, 2'b00}),
		.G_I({VGA_G, 2'b00}),
		.B_I({VGA_B, 2'b00}),
		.BLANK_I(VGA_BLNK),
		.HSYNC_I(VGA_HSYNC),			
		.VSYNC_I(VGA_VSYNC),			
		.TMDS_D0_O(Out_TMDS_D0),		
		.TMDS_D1_O(Out_TMDS_D1),		
		.TMDS_D2_O(Out_TMDS_D2),		
		.TMDS_CLK_O(Out_TMDS_CLK)
	);	
endmodule

