//============================================================================
// 
//  VIC20 replica for MiST
//  Copyright (C) 2018 György Szombathelyi
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
//============================================================================

`default_nettype none

module vic20_mist
(
   input         CLOCK_27,   // Input clock 27 MHz

   output  [5:0] VGA_R,
   output  [5:0] VGA_G,
   output  [5:0] VGA_B,
   output        VGA_HS,
   output        VGA_VS,

   output        LED,

   output        AUDIO_L,
   output        AUDIO_R,

   input         SPI_SCK,
   output        SPI_DO,
   input         SPI_DI,
   input         SPI_SS2,
   input         SPI_SS3,
   input         CONF_DATA0,

   output [12:0] SDRAM_A,
   inout  [15:0] SDRAM_DQ,
   output        SDRAM_DQML,
   output        SDRAM_DQMH,
   output        SDRAM_nWE,
   output        SDRAM_nCAS,
   output        SDRAM_nRAS,
   output        SDRAM_nCS,
   output  [1:0] SDRAM_BA,
   output        SDRAM_CLK,
   output        SDRAM_CKE,

`ifdef DEMISTIFY
    input         PS2_CLK_IN,
	input         PS2_DAT_IN,
    input  [64:0] C64_KEYS,
    input         TAPE_BUTTON_N,
	input         IEC_ATN_I,
	input         IEC_DATA_I,
	input         IEC_CLK_I,
	output        IEC_ATN_O,
	output        IEC_DATA_O,
	output        IEC_CLK_O,

    output [15:0] DAC_L,      
    output [15:0] DAC_R,

    output        HDMI_CLK,  // Direct HDMI

    output 		  VGA_DE,	 // HDMI
    output		  VGA_CLK,
    output  [5:0] vga_x_r,
    output  [5:0] vga_x_g,
    output  [5:0] vga_x_b,
    output 		  vga_x_hs,
    output 		  vga_x_vs,
`endif

   input         UART_RX,
   output        UART_TX
);

assign LED = ~ioctl_download & ~led_disk & cass_motor;
assign UART_TX = ~cass_motor;

`include "build_id.v"

localparam TAP_MEM_START = 22'h20000;

localparam CONF_STR =
{
    "VIC20;PRGCRTTAP;",
    "S0U,D64,Mount Disk;",
    "TC,Play/Stop TAP;",
	 "P1,Memory configuration;",
    "P1O78,Cartridge ,Off,ROM,RAM;",
    "P1O2,CRT with load address,Yes,No;",
    "P1O6,3K RAM Cartridge,Off,On;",
    "P1O45,8K+ RAM Cartridge,Off,8K,16K,24K;",
	 "P2,Megacart;",
	 "P2OF,Megacart,Off,On (overrides RAM);",
	 "P2F,ROM,Load Megacart ROM;",
	 "P2S1U,NV ,Mount NVRAM;",
	 "P2TG,Write NVRAM;",
	 "P3,Video / Audio;",
    "P3O3,Video,PAL,NTSC;",
    "P3OAB,Scanlines,Off,25%,50%,75%;",
    "P3OE,Composite blend,Off,On;",
    "P3OD,Tape sound,Off,On;",
    "P3O9,Audio Filter,On,Off;",
    "T0,Reset;",
    "T1,Reset with cart unload;",
    "V,v1.0.",`BUILD_DATE
};

reg uart_rxD;
reg uart_rxD2;

// UART_RX synchronizer
always @(posedge clk_sys) begin
	uart_rxD <= UART_RX;
	uart_rxD2 <= uart_rxD;
end

////////////////////   CLOCKS   ///////////////////
wire clk_sys;
wire clk_32;
wire clk_1541 = clk_32;
reg clk8m;
wire pll_locked;
wire pll27_locked;
reg clk_ref; //sync sdram to during prg downloading
reg  reset;
reg  c1541_reset;
reg cart_unload;
reg force_reset;

wire       pll_reconfig_busy;
wire       pll_areset;
wire       pll_configupdate;
wire       pll_scanclk;
wire       pll_scanclkena;
wire       pll_scandata;
wire       pll_scandataout;
wire       pll_scandone;
wire       pll_reconfig_reset;
wire [7:0] pll_rom_address;
wire       pll_rom_q;
wire       pll_write_from_rom;
wire       pll_write_rom_ena;
wire       pll_reconfig;
wire       q_reconfig_ntsc;
wire       q_reconfig_pal;

rom_reconfig_pal rom_reconfig_pal
(
    .address(pll_rom_address),
    .clock(clk_32),
    .rden(pll_write_rom_ena),
    .q(q_reconfig_pal)
);

rom_reconfig_ntsc rom_reconfig_ntsc
(
    .address(pll_rom_address),
    .clock(clk_32),
    .rden(pll_write_rom_ena),
    .q(q_reconfig_ntsc)
);

assign pll_rom_q = st_ntsc ? q_reconfig_ntsc : q_reconfig_pal;

pll_reconfig pll_reconfig_inst
(
    .busy(pll_reconfig_busy),
    .clock(clk_32),
    .counter_param(0),
    .counter_type(0),
    .data_in(0),
    .pll_areset(pll_areset),
    .pll_areset_in(0),
    .pll_configupdate(pll_configupdate),
    .pll_scanclk(pll_scanclk),
    .pll_scanclkena(pll_scanclkena),
    .pll_scandata(pll_scandata),
    .pll_scandataout(pll_scandataout),
    .pll_scandone(pll_scandone),
    .read_param(0),
    .reconfig(pll_reconfig),
    .reset(pll_reconfig_reset),
    .reset_rom_address(0),
    .rom_address_out(pll_rom_address),
    .rom_data_in(pll_rom_q),
    .write_from_rom(pll_write_from_rom),
    .write_param(0),
    .write_rom_ena(pll_write_rom_ena)
);


`ifdef DEMISTIFY_ATLAS_CYC
pll_vic20 pll_vic20
(
    .inclk0(CLOCK_27),
    .c0(clk_sys),                   //35.48 MHz PAL,    28.63 MHz NTSC
    .c1(HDMI_CLK),                  // x5 Direct HDMI   143.15 MHz
    .areset(pll_areset),
    .scanclk(pll_scanclk),
    .scandata(pll_scandata),
    .scanclkena(pll_scanclkena),
    .configupdate(pll_configupdate),
    .scandataout(pll_scandataout),
    .scandone(pll_scandone),
    .locked(pll_locked)
);
`else
pll_vic20 pll_vic20
(
    .inclk0(CLOCK_27),
    .c0(clk_sys),                   //35.48 MHz PAL, 28.63 MHz NTSC
    .areset(pll_areset),
    .scanclk(pll_scanclk),
    .scandata(pll_scandata),
    .scanclkena(pll_scanclkena),
    .configupdate(pll_configupdate),
    .scandataout(pll_scandataout),
    .scandone(pll_scandone),
    .locked(pll_locked)
);
`endif



always @(posedge clk_32) begin
    reg ntsc_d, ntsc_d2, ntsc_d3;
    reg [1:0] pll_reconfig_state = 0;
    reg [9:0] pll_reconfig_timeout;

    ntsc_d <= st_ntsc;
    ntsc_d2 <= ntsc_d;
    pll_write_from_rom <= 0;
    pll_reconfig <= 0;
    pll_reconfig_reset <= 0;
    case (pll_reconfig_state)
    2'b00:
    begin
        ntsc_d3 <= ntsc_d2;
        if (ntsc_d2 ^ ntsc_d3) begin
            pll_write_from_rom <= 1;
            pll_reconfig_state <= 2'b01;
        end
    end
    2'b01: pll_reconfig_state <= 2'b10;
    2'b10:
        if (~pll_reconfig_busy) begin
            pll_reconfig <= 1;
            pll_reconfig_state <= 2'b11;
            pll_reconfig_timeout <= 10'd1000;
        end
    2'b11:
    begin
        pll_reconfig_timeout <= pll_reconfig_timeout - 1'd1;
        if (pll_reconfig_timeout == 10'd1) begin
            // pll_reconfig stuck in busy state
            pll_reconfig_reset <= 1;
            pll_reconfig_state <= 2'b00;
        end
        if (~pll_reconfig & ~pll_reconfig_busy) pll_reconfig_state <= 2'b00;
    end
    default: ;
    endcase
end

pll27 pll
(
    .inclk0(CLOCK_27),
    .c0(clk_32), //32 MHz
	 .locked(pll27_locked)
);

always @(posedge clk_sys) begin
    reg [4:0] sys_count;
    clk8m <= !sys_count[1:0];
    clk_ref <= !sys_count;
    sys_count <= sys_count + 1'd1;

    reset <= st_reset | st_cart_unload | buttons[1] | rom_download | force_reset | fn_keys[10] | ~pll_locked;
    cart_unload <= 0;
    if (st_cart_unload | buttons[1] | (fn_keys[10] & mod_keys[0])) cart_unload <= 1;
    c1541_reset <= reset;
end

//////////////////   MIST ARM I/O   ///////////////////
wire        ps2Clk;
wire        ps2Data;

wire  [7:0] joystick_0;
wire  [7:0] joystick_1;
wire  [1:0] buttons;
wire  [1:0] switches;
wire        scandoubler_disable;
wire        ypbpr;
wire        no_csync;

// status word wires (9 is unused)
wire [31:0] status;
wire        st_reset               = status[0];
wire        st_cart_unload         = status[1];
wire        st_crt_no_load_address = status[2];
wire        st_ntsc                = status[3];        //negated defaults to NTSC
wire  [1:0] st_ram_expansion       = status[5:4];
wire        st_3k_expansion        = status[6];
wire  [1:0] st_8k_rom              = status[8:7];
wire        st_audio_filter        = ~status[9];
wire  [1:0] st_scanlines           = status[11:10];
wire        st_tap_play_btn        = status[12];
wire        st_tape_sound          = status[13];
wire        st_blend               = status[14];
wire        st_megacart            = status[15];
wire        st_writenv             = status[16];

wire [31:0] sd_lba;
wire [1:0]  sd_rd;
wire [1:0]  sd_wr;
wire        sd_ack;
wire  [7:0] sd_dout;
wire        sd_dout_strobe;
wire  [7:0] sd_din;
wire  [8:0] sd_buff_addr;
wire  [1:0] img_mounted;
wire [31:0] img_size;

// Multiplexers for sd related signals.
wire uio_sel_nvram;

wire [31:0] sd_lba_nvram, sd_lba_1541;
assign sd_lba = uio_sel_nvram ? sd_lba_nvram : sd_lba_1541;

wire sd_rd_nvram, sd_rd_1541;
assign sd_rd[1] = uio_sel_nvram ? sd_rd_nvram : 1'b0;
assign sd_rd[0] = uio_sel_nvram ? 1'b0 : sd_rd_1541;

wire sd_wr_nvram, sd_wr_1541;
assign sd_wr[1] = uio_sel_nvram ? sd_wr_nvram : 1'b0;
assign sd_wr[0] = uio_sel_nvram ? 1'b0 : sd_wr_1541;

wire [7:0] sd_din_nvram, sd_din_1541;
assign sd_din = uio_sel_nvram ? sd_din_nvram : sd_din_1541;

wire sd_ack_nvram, sd_ack_1541;
assign sd_ack_nvram = uio_sel_nvram ? sd_ack : 1'b0;
assign sd_ack_1541 = uio_sel_nvram ? 1'b0 : sd_ack;

wire sd_strobe_nvram, sd_strobe_1541;
assign sd_strobe_nvram = uio_sel_nvram ? sd_dout_strobe : 1'b0;
assign sd_strobe_1541 = uio_sel_nvram ? 1'b0 : sd_dout_strobe;

user_io #(.STRLEN($size(CONF_STR)>>3)) user_io
(
    .clk_sys(clk_sys),
    .clk_sd(clk_1541),
    .SPI_SS_IO(CONF_DATA0),
    .SPI_CLK(SPI_SCK),
    .SPI_MOSI(SPI_DI),
    .SPI_MISO(SPI_DO),

    .conf_str(CONF_STR),

    .status(status),
    .scandoubler_disable(scandoubler_disable),
    .ypbpr(ypbpr),
    .no_csync(no_csync),
    .buttons(buttons),
    .switches(switches),
    .joystick_0(joystick_0),
    .joystick_1(joystick_1),
    .ps2_kbd_clk(ps2Clk),
    .ps2_kbd_data(ps2Data),
    
    .sd_lba(sd_lba),
    .sd_rd(sd_rd),
    .sd_wr(sd_wr),
    .sd_ack(sd_ack),
    .sd_dout(sd_dout),
    .sd_dout_strobe(sd_dout_strobe),
    .sd_din(sd_din),
    .sd_buff_addr(sd_buff_addr),
    .sd_conf(0),
    .sd_sdhc(1),
    .img_mounted(img_mounted),
    .img_size(img_size)
);

wire  [7:0] col_in;
wire  [7:0] row_out;
wire  [7:0] row_in;
wire  [7:0] col_out;
wire [11:1] fn_keys;
wire  [2:0] mod_keys;

keyboard keyboard
(
    .reset(reset),
    .clk_sys(clk_sys),
`ifdef DEMISTIFY
    .ps2_kbd_clk(PS2_CLK_IN),
    .ps2_kbd_data(PS2_DAT_IN),
    .c64_keys(C64_KEYS),
`else
    .ps2_kbd_clk(ps2Clk),
    .ps2_kbd_data(ps2Data),
    .c64_keys({65{1'b1}}),
`endif
    .col_in(col_in),
    .row_out(row_out),
    .row_in(row_in),
    .col_out(col_out),
    .Fn(fn_keys),
    .mod(mod_keys)
);

wire  [7:0] vic20_joy = joystick_0 | joystick_1;
wire iec_clk_int;
wire iec_data_int;
wire iec_atn_int;

wire vic_wr_n;
wire vic_rom_sel;
wire vic_io2_sel;
wire vic_io3_sel;
wire vic_blk123_sel;
wire vic_blk5_sel;
wire vic_ram123_sel;

wire [7:0] to_vic;
wire [7:0] from_vic;

vic20 #(.I_EXTERNAL_ROM(1'b1)) VIC20
(
    .I_SYSCLK(clk_sys),
    .I_SYSCLK_EN(clk8m),
    .I_PAUSE(ioctl_download),
    .I_RESET(reset | mc_reset),
    .I_PAL(~st_ntsc),

    .I_JOY(~{vic20_joy[0],vic20_joy[1],vic20_joy[2],vic20_joy[3]}),
    .I_FIRE(~vic20_joy[4]),
    .O_VIDEO_R(R_O),
    .O_VIDEO_G(G_O),
    .O_VIDEO_B(B_O),
    .O_HSYNC(HS_O),
    .O_VSYNC(VS_O),

    `ifdef DEMISTIFY
    .O_DE   (vga_de_o),     
    `endif

    .atn_o(vic20_iec_atn_o),
    .clk_o(vic20_iec_clk_o),
    .data_o(vic20_iec_data_o),
	 .atn_i(iec_atn_int),
    .clk_i(iec_clk_int),
    .data_i(iec_data_int),

    .O_ROW_IN(row_in),
    .I_COL_OUT(col_out),
    .O_COL_IN(col_in),
    .I_ROW_OUT(row_out),
`ifdef DEMISTIFY
    .I_RESTORE_OUT(fn_keys[11]|~C64_KEYS[64]),
`else
    .I_RESTORE_OUT(fn_keys[11]),
`endif
    .I_CART_EN(st_megacart | (|st_8k_rom)),  // at $A000(8k)
    .I_CART_RO(st_megacart ? 1'b0 : (st_8k_rom != 2'd2)),
    .I_RAM_EXT(st_megacart ? 4'b1111 : {&st_ram_expansion, st_ram_expansion[1], |st_ram_expansion, st_3k_expansion}), //at $6000(8k),$4000(8k),$2000(8k),$0400(3k)

    .O_CASS_WRITE(cass_write),
    .I_CASS_READ(cass_read),
    .O_CASS_MOTOR(cass_motor),
    .I_CASS_SENSE(cass_sense),

    .O_AUDIO(vic_audio),
    .O_AUDIO_FILTERED(vic_audio_filtered),

    .o_extmem_sel(sdram_en),
    .o_extmem_r_wn(vic_wr_n),
    .o_extmem_addr(sdram_vic20_a),
    .i_extmem_data(to_vic),
    .o_extmem_data(from_vic),
	 .o_rom_sel(vic_rom_sel),
	 .o_io2_sel(vic_io2_sel),
	 .o_io3_sel(vic_io3_sel),
	 .o_blk123_sel(vic_blk123_sel),
	 .o_blk5_sel(vic_blk5_sel),
	 .o_ram123_sel(vic_ram123_sel),
    
    .o_p2_h(p2_h),

    // -- ROM setup bus
    .CONF_WR(ioctl_internal_memory_wr & ioctl_ram_wr),
    .CONF_AI(ioctl_target_addr[15:0]),
    .CONF_DI(ioctl_reg_inject_state ? ioctl_reg_data : ioctl_dout)
);

//////////////////   MEMORY   //////////////////
assign SDRAM_CLK = ~clk_sys;

wire  [7:0] sdram_out;
wire [15:0] sdram_vic20_a;
wire [22:0] sdram_a;
wire        sdram_en;
reg         sdram_access;
wire        p2_h;

wire [22:0] sdram_vic20_a_adj =
    cart_unload ? 16'ha004 : 
    sdram_vic20_a[15:13] == 3'b111 ? { st_ntsc, sdram_vic20_a } : // NTSC/PAL Kernal
	 mc_sdram_addr;
//   sdram_vic20_a;

always_comb begin
    casex ({megacart_download | rom_download | prg_download | tap_download, p2_h})
    'b01 : sdram_a = sdram_vic20_a_adj;
    'b00 : sdram_a = tap_play_addr;
    'b1X : sdram_a = ioctl_target_addr;
    endcase
end

wire mc_reset;
wire [22:0] mc_sdram_addr;
wire [7:0] mc_to_vic;
wire mc_sdram_wr_n;
wire mc_rom_sel;
wire mc_nvram_sel;
wire mc_qm;

megacart mc
(
	.clk(clk_sys),
	.reset_n(pll_locked & !st_reset & !force_reset),
	.active(st_megacart),
	.vic_addr(sdram_vic20_a),
	.vic_wr_n(vic_wr_n),
//	.vic_sdram_en(sdram_en),
	.vic_io2_sel(vic_io2_sel),
	.vic_io3_sel(vic_io3_sel),
	.vic_blk123_sel(vic_blk123_sel),
	.vic_blk5_sel(vic_blk5_sel),
	.vic_ram123_sel(vic_ram123_sel),
	.from_vic(from_vic),
	.to_vic(mc_to_vic),
	.mc_addr(mc_sdram_addr),
	.mc_wr_n(mc_sdram_wr_n),
	.mc_rom_sel(mc_rom_sel),
	.mc_nvram_sel(mc_nvram_sel),
	.mc_qm(mc_qm),
//	.mc_sdram_en(mc_sdram_en),
	.mc_soft_reset(mc_reset)
);

wire [7:0] mc_nvram_out;

megacart_nvram nvr
(
	// VIC20 interface
	.clk_a(clk_sys),
	.reset_n(pll_locked & !st_reset),
	.a_a(sdram_vic20_a),
	.d_a(from_vic),
	.q_a(mc_nvram_out),
	.we_a(mc_nvram_sel & ~vic_wr_n),
	// UserIO interface
	.clk_b(clk_1541),
	.readnv(img_mounted[1]),
	.writenv(st_writenv),
	.uio_busy(led_disk),
	.nvram_sel(uio_sel_nvram),
	.sd_lba         ( sd_lba_nvram    ),
	.sd_rd          ( sd_rd_nvram     ),
	.sd_wr          ( sd_wr_nvram     ),
	.sd_ack         ( sd_ack_nvram    ),
	.sd_buff_din    ( sd_din_nvram    ),
	.sd_buff_dout   ( sd_dout         ),
	.sd_buff_wr     ( sd_strobe_nvram ),
	.sd_buff_addr   ( sd_buff_addr    ),
	.img_size       ( img_size )
);


// Megacart can drive the data bus - as can NVRAM.
assign to_vic = mc_qm ? mc_to_vic : (mc_nvram_sel ? mc_nvram_out : sdram_out);

// SDRAM port arbitration

wire [7:0] sdram_in;
assign sdram_in =
	(megacart_download | rom_download | prg_download | tap_download) ? ioctl_dout
		: from_vic;

wire sdram_we;
assign sdram_we = (sdram_en & ~mc_sdram_wr_n) || // Write originates from VIC20
	cart_unload ||
	( ioctl_ram_wr &&
		(((rom_download || prg_download) && !ioctl_internal_memory_wr) ||
		(megacart_download || tap_download))
	);

wire sdram_oe;
assign sdram_oe = p2_h ? sdram_en & mc_sdram_wr_n : tap_sdram_oe;

wire [1:0] sdram_bank;
assign sdram_bank = {mc_nvram_sel,mc_rom_sel | megacart_download};

sdram ram
(
    .*,
    .clkref(ioctl_download ? ioctl_wr : p2_h),
    .init(~pll_locked),
    .clk(clk_sys),
    .bank(sdram_bank),
    .dout(sdram_out),
    .din (sdram_in),
    .addr(sdram_a),
    .we(sdram_we),
    .oe(sdram_oe)
);

//////////////////  PRG/ROM/TAP LOAD //////////////
wire        ioctl_wr;
wire        ioctl_ram_wr;
wire [24:0] ioctl_addr;
wire  [7:0] ioctl_dout;
wire        ioctl_download;
wire  [7:0] ioctl_index;
wire        rom_download = ioctl_download && !ioctl_index;
wire        prg_download = ioctl_download && (ioctl_index == 8'h01 || ioctl_index == 8'h41);
wire        tap_download = ioctl_download && ioctl_index == 8'h81;
wire        megacart_download = ioctl_download && (ioctl_index==8'h02);
reg   [4:0] ioctl_reg_inject_state = 0;
wire [22:0] ioctl_target_addr;
reg  [22:0] ioctl_tap_addr;
reg  [15:0] ioctl_prg_addr;
reg  [15:0] ioctl_reg_addr;
reg         ioctl_reg_wr;
reg   [7:0] ioctl_reg_data;

data_io data_io (
    // SPI interface
    .SPI_SCK        ( SPI_SCK ),
    .SPI_SS2        ( SPI_SS2 ),
    .SPI_DI         ( SPI_DI  ),
    // ram interface
    .clk_sys        ( clk_sys ),
    .clkref_n       ( ~clk_ref  ),
    .ioctl_download ( ioctl_download ),
    .ioctl_index    ( ioctl_index ),
    .ioctl_wr       ( ioctl_wr ),
    .ioctl_addr     ( ioctl_addr ),
    .ioctl_dout     ( ioctl_dout )
);


always_comb begin
    casex ({megacart_download , tap_download, rom_download, ioctl_addr[15:13]})
        'b0X1_00X: ioctl_target_addr = {7'h0, 2'b00, ioctl_addr[13:0]}; //1541
        'b0X1_010: ioctl_target_addr = {7'h0, 3'b111, ioctl_addr[12:0]}; //kernal pal
        'b0X1_011: ioctl_target_addr = {7'h1, 3'b111, ioctl_addr[12:0]}; //kernal ntsc
        'b0X1_100: ioctl_target_addr = {7'h0, 3'b110, ioctl_addr[12:0]}; //basic
        'b0X1_101: ioctl_target_addr = {7'h0, 4'b1000, ioctl_addr[11:0]}; //character
        'b000_XXX: ioctl_target_addr = {7'h0, ioctl_reg_inject_state ? ioctl_reg_addr : ioctl_prg_addr};
        'b010_XXX: ioctl_target_addr = ioctl_tap_addr;
        'b100_XXX: ioctl_target_addr = ioctl_addr[22:0];
         default: ioctl_target_addr = 0;
    endcase;
end

wire ioctl_internal_memory_wr =
    ioctl_reg_inject_state ||
    (rom_download && (ioctl_target_addr[15:13] == 3'b101)) || // only char rom is internal
    (prg_download && (ioctl_target_addr[15:10] == 6'b000000 ||
                      ioctl_target_addr[15:11] == 5'b00010 ||
                      ioctl_target_addr[15:11] == 5'b00011 ||
                      ioctl_target_addr[15:10] == 6'b100101));

always @(posedge clk_sys) begin
    reg old_prg_download;
	 reg old_mc_download;
    reg auto_reset;

    force_reset <= 0;
    old_prg_download <= prg_download;
    old_mc_download <= megacart_download;
    ioctl_ram_wr <= 0;
    if (prg_download && ioctl_wr) begin
        if (~st_crt_no_load_address) begin //cart/prg loading with address in the first 2 bytes
            if (ioctl_addr == 16'h0000) ioctl_prg_addr[7:0] <= ioctl_dout; else
            if (ioctl_addr == 16'h0001) ioctl_prg_addr[15:8] <= ioctl_dout; else begin
                ioctl_ram_wr <= 1;
                if (ioctl_addr != 16'h0002 && ioctl_prg_addr != 16'hbfff) ioctl_prg_addr <= ioctl_prg_addr + 1'd1;
            end
        end else begin
            if (ioctl_addr == 0)
                ioctl_prg_addr <= 16'ha000; // load to $a000 without header
            else if (ioctl_prg_addr != 16'hbfff)
                ioctl_prg_addr <= ioctl_prg_addr + 1'd1; // increment load addr, but don't overwrite ROMs
            ioctl_ram_wr <= 1;
        end
        if (ioctl_prg_addr == 16'ha000) auto_reset <= 1;
    end
    if (tap_download && ioctl_wr) begin
        ioctl_tap_addr <= ioctl_addr ? ioctl_tap_addr + 1'd1 : TAP_MEM_START; //load tap to 20000
        ioctl_ram_wr <= 1;
    end
    if (rom_download) ioctl_ram_wr <= ioctl_wr;
	 if (megacart_download) ioctl_ram_wr <= ioctl_wr;
    if (old_mc_download & ~megacart_download) force_reset<=1'b1;

    //prg download ended, adjust registers
    if (old_prg_download & ~prg_download) ioctl_reg_inject_state <= 1;
    
    case (ioctl_reg_inject_state)
		 1: begin ioctl_reg_addr <= 16'h2d; ioctl_reg_data <= ioctl_prg_addr[7:0];  ioctl_ram_wr <= 1; end
		 3: begin ioctl_reg_addr <= 16'h2e; ioctl_reg_data <= ioctl_prg_addr[15:8]; ioctl_ram_wr <= 1; end
		 5: begin ioctl_reg_addr <= 16'h2f; ioctl_reg_data <= ioctl_prg_addr[7:0];  ioctl_ram_wr <= 1; end
		 7: begin ioctl_reg_addr <= 16'h30; ioctl_reg_data <= ioctl_prg_addr[15:8]; ioctl_ram_wr <= 1; end
		 9: begin ioctl_reg_addr <= 16'h31; ioctl_reg_data <= ioctl_prg_addr[7:0];  ioctl_ram_wr <= 1; end
		11: begin ioctl_reg_addr <= 16'h32; ioctl_reg_data <= ioctl_prg_addr[15:8]; ioctl_ram_wr <= 1; end
		13: begin ioctl_reg_addr <= 16'hae; ioctl_reg_data <= ioctl_prg_addr[7:0];  ioctl_ram_wr <= 1; end
		15: begin ioctl_reg_addr <= 16'haf; ioctl_reg_data <= ioctl_prg_addr[15:8]; ioctl_ram_wr <= 1; end
		31: begin force_reset <= auto_reset; auto_reset <= 0; end
    endcase

    if (ioctl_reg_inject_state) ioctl_reg_inject_state <= ioctl_reg_inject_state + 1'd1;
end

//////////////////   TAPE   //////////////////

reg [22:0] tap_play_addr;
reg [22:0] tap_last_addr;
reg  [7:0] tap_data_in;
reg        tap_reset;
reg        tap_wrreq;
reg        tap_wrfull;
reg        tap_version;
reg        tap_sdram_oe;
wire       cass_read;
wire       cass_write;
wire       cass_motor;
wire       cass_sense;

always @(posedge clk_sys) begin
    reg p2_hD;

    if (reset) begin
        tap_play_addr <= TAP_MEM_START;
        tap_last_addr <= TAP_MEM_START;
        tap_sdram_oe <= 0;
        tap_reset <= 1;
    end else begin
        tap_reset <= 0;
        if (tap_download) begin
            tap_play_addr <= TAP_MEM_START;
            tap_last_addr <= ioctl_tap_addr;
            tap_reset <= 1;
            if (ioctl_addr == 24'h0C && ioctl_wr) begin
                tap_version <= ioctl_dout[0];
            end
        end
        p2_hD <= p2_h;
        tap_wrreq <= 0;
        if (p2_hD && !p2_h && !ioctl_download && tap_play_addr != tap_last_addr && !tap_wrfull) tap_sdram_oe <= 1;
        if (!p2_h && tap_sdram_oe) tap_data_in <= sdram_out;
        if (p2_h && !p2_hD && tap_sdram_oe) begin
            tap_wrreq <= 1;
            tap_sdram_oe <= 0;
            tap_play_addr <= tap_play_addr + 1'd1;
        end
    end
end

c1530 c1530
(
    .clk32(clk_sys),
    .restart_tape(tap_reset),
    .wav_mode(0),
    .tap_version(tap_version),
    .host_tap_in(tap_data_in),
    .host_tap_wrreq(tap_wrreq),
    .tap_fifo_wrfull(tap_wrfull),
    .tap_fifo_error(),
    .cass_read(cass_read),
    .cass_write(cass_write),
    .cass_motor(cass_motor),
    .cass_sense(cass_sense),
`ifdef DEMISTIFY
    .osd_play_stop_toggle(st_tap_play_btn | fn_keys[9] | ~TAPE_BUTTON_N),
`else
    .osd_play_stop_toggle(st_tap_play_btn | fn_keys[9]),
`endif
    .ear_input(uart_rxD2)
);
//////////////////   AUDIO   //////////////////

wire [15:0] vic_audio, vic_audio_filtered;
wire [15:0] audio_sel = st_audio_filter ? vic_audio_filtered : vic_audio;
wire [15:0] cass_audio = { 1'd0, (~cass_read | (cass_write & ~cass_motor & ~cass_sense)), 11'd0 };  // silence cass_write when motor is off because bit is in common with keyboard
wire [16:0] audio_out = st_tape_sound ? audio_sel + cass_audio : audio_sel;

sigma_delta_dac #(15) dac_l
(
    .CLK(clk_sys),
    .RESET(reset),
    .DACin(audio_out[16] ? 16'hffff : audio_out),
    .DACout(AUDIO_L)
);

sigma_delta_dac #(15) dac_r
(
    .CLK(clk_sys),
    .RESET(reset),
    .DACin(audio_out[16] ? 16'hffff : audio_out),
    .DACout(AUDIO_R)
);

`ifdef DEMISTIFY
// out = sel + tape.  (Where sel is either filtered or unfiltered audio)
assign DAC_L = {~audio_sel[15],audio_sel[14:0]};
assign DAC_R = {~audio_out[15],audio_out[14:0]};
`endif

//////////////////   VIDEO   //////////////////

wire  [3:0] R_O;
wire  [3:0] G_O;
wire  [3:0] B_O;
wire        HS_O;
wire        VS_O;

wire        hs,vs;

`ifdef DEMISTIFY
parameter OSD_X_OFFSET = 10'd0;
parameter OSD_Y_OFFSET = 10'd0;
parameter OSD_COLOR    = 3'd4;
parameter OSD_AUTO_CE = 1'b1;

wire [5:0] osd_r_o;
wire [5:0] osd_g_o;
wire [5:0] osd_b_o;
wire ce_x1;
wire vga_de_o;

osd #(OSD_X_OFFSET, OSD_Y_OFFSET, OSD_COLOR, OSD_AUTO_CE) osd
(
	.clk_sys ( clk_sys     ),
	.rotate  ( 2'b00   ),		// Rotate OSD [0] - rotate [1] - left or right
	.ce      ( ce_x1   ),		// clk_sys/4
	.SPI_DI  ( SPI_DI  ),
	.SPI_SCK ( SPI_SCK ),
	.SPI_SS3 ( SPI_SS3 ),
	.R_in    ( {R_O, R_O[3:2]} ),
	.G_in    ( {G_O, G_O[3:2]} ),
	.B_in    ( {B_O, B_O[3:2]} ),
	.HSync   ( HS_O  ),
	.VSync   ( VS_O  ),
	.R_out   ( osd_r_o ),
	.G_out   ( osd_g_o ),
	.B_out   ( osd_b_o )
);

// Without OSD
// assign vga_x_r  = {R_O, R_O[3:2]};
// assign vga_x_g  = {G_O, G_O[3:2]};
// assign vga_x_b  = {B_O, B_O[3:2]};

// OSD output
assign vga_x_r  = osd_r_o;
assign vga_x_g  = osd_g_o;
assign vga_x_b  = osd_b_o;
assign vga_x_hs = HS_O;
assign vga_x_vs = VS_O;

assign VGA_CLK = clk_sys; 
assign VGA_DE  = vga_de_o; 

`endif



mist_video #(.COLOR_DEPTH(4), .OSD_COLOR(3'd5), .SD_HCNT_WIDTH(10)) mist_video (
    .clk_sys     ( clk_sys    ),

    // OSD SPI interface
    .SPI_SCK     ( SPI_SCK    ),
    .SPI_SS3     ( SPI_SS3    ),
    .SPI_DI      ( SPI_DI     ),

    // scanlines (00-none 01-25% 10-50% 11-75%)
    .scanlines   ( st_scanlines  ),

    // non-scandoubled pixel clock divider 0 - clk_sys/4, 1 - clk_sys/2
    .ce_divider  ( 1'b0       ),

    // 0 = HVSync 31KHz, 1 = CSync 15KHz
    .scandoubler_disable ( scandoubler_disable ),
    // disable csync without scandoubler
    .no_csync    ( no_csync   ),
    // YPbPr always uses composite sync
    .ypbpr       ( ypbpr      ),
    // Rotate OSD [0] - rotate [1] - left or right
    .rotate      ( 2'b00      ),
    // composite-like blending
    .blend       ( st_blend      ),

    // video in
    .R           ( R_O        ),
    .G           ( G_O        ),
    .B           ( B_O        ),

    .HSync       ( HS_O       ),
    .VSync       ( VS_O       ),

    // MiST video output signals
    .VGA_R       ( VGA_R      ),
    .VGA_G       ( VGA_G      ),
    .VGA_B       ( VGA_B      ),
    .VGA_VS      ( vs         ),
    .VGA_HS      ( hs         )

    `ifdef DEMISTIFY_HDMI
                                ,
    .ce_x1_o	 ( ce_x1	  )
    `endif
);

// Use different alignment of csync @15kHz
wire   cs = ~(~HS_O | ~VS_O);
assign VGA_HS = (~no_csync & scandoubler_disable & ~ypbpr) ? cs : hs;
assign VGA_VS = (~no_csync & scandoubler_disable & ~ypbpr) ? 1'b1 : vs;

//////////////////   DISK   //////////////////

wire led_disk;
wire vic20_iec_atn_o;
wire vic20_iec_data_o;
wire vic20_iec_clk_o;

wire c1541_iec_atn_i;
wire c1541_iec_data_i;
wire c1541_iec_clk_i;

wire c1541_iec_atn_o;
wire c1541_iec_data_o;
wire c1541_iec_clk_o;

reg disk_present;
always @(posedge clk_1541) begin
	if(c1541_reset_32)
		disk_present<=1'b0;
	if(img_mounted[0])
		disk_present<=|img_size;
end

reg c1541_reset_32_d;
reg c1541_reset_32;

`ifdef DEMISTIFY
assign IEC_ATN_O = disk_present ? 1'b1 : vic20_iec_atn_o;
assign IEC_CLK_O = disk_present ? 1'b1 : vic20_iec_clk_o;
assign IEC_DATA_O = disk_present ? 1'b1 : vic20_iec_data_o;

assign iec_clk_int = disk_present ? c1541_iec_clk_o : IEC_CLK_I;
assign iec_data_int = disk_present ? c1541_iec_data_o : IEC_DATA_I;
assign iec_atn_int = disk_present ? c1541_iec_atn_o : IEC_ATN_I;
`else
assign iec_clk_int = c1541_iec_clk_o;
assign iec_data_int = c1541_iec_data_o;
assign iec_atn_int = c1541_iec_atn_o;
`endif

assign c1541_iec_atn_i = disk_present ? vic20_iec_atn_o : 1'b1;
assign c1541_iec_clk_i = disk_present ? vic20_iec_clk_o : 1'b1;
assign c1541_iec_data_i = disk_present ? vic20_iec_data_o : 1'b1;

// Sync reset to the 32MHz domain since some of the logic inside
// the emulated drive uses synchronous resets.
always @(posedge clk_1541) begin
	c1541_reset_32_d<=c1541_reset | ~pll27_locked;
	c1541_reset_32<=c1541_reset_32_d;
end
	
c1541_sd c1541_sd (
    .clk32 ( clk_1541 ),
    .reset ( c1541_reset_32 ),

    .disk_change ( img_mounted[0] ),
    .disk_mount ( |img_size ),
    .disk_num ( 10'd0 ), // always 0 on MiST, the image is selected by the OSD menu

    .iec_atn_i  ( c1541_iec_atn_i  ),
    .iec_data_i ( c1541_iec_data_i ),
    .iec_clk_i  ( c1541_iec_clk_i  ),
    .iec_atn_o  ( c1541_iec_atn_o  ),
    .iec_data_o ( c1541_iec_data_o ),
    .iec_clk_o  ( c1541_iec_clk_o  ),

    .sd_lba         ( sd_lba_1541    ),
    .sd_rd          ( sd_rd_1541     ),
    .sd_wr          ( sd_wr_1541     ),
    .sd_ack         ( sd_ack_1541    ),
    .sd_buff_din    ( sd_din_1541    ),
    .sd_buff_dout   ( sd_dout        ),
    .sd_buff_wr     ( sd_strobe_1541 ),
    .sd_buff_addr   ( sd_buff_addr   ),
    .led            ( led_disk       ),

    .c1541rom_clk   ( clk_sys         ),
    .c1541rom_addr  ( ioctl_addr[13:0]),
    .c1541rom_data  ( ioctl_dout      ),
    .c1541rom_wr    ( ioctl_wr & rom_download & !ioctl_addr[15:14] )
);


endmodule
