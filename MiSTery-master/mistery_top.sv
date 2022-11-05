/********************************************/
/* Atari ST/STe/Mega STe core MiST toplevel */
/********************************************/

module mistery_top ( 
	// clock inputs
	input wire   [ 2-1:0] CLOCK_27,   // 27 MHz
	// LED outputs
	output wire           LED,        // LED Yellow
	// UART
	output wire           UART_TX,    // UART Transmitter (MIDI out)
	input wire            UART_RX,    // UART Receiver (MIDI in)
	// VGA
	output wire           VGA_HS,     // VGA H_SYNC
	output wire           VGA_VS,     // VGA V_SYNC
	output wire  [ 6-1:0] VGA_R,      // VGA Red[5:0]
	output wire  [ 6-1:0] VGA_G,      // VGA Green[5:0]
	output wire  [ 6-1:0] VGA_B,      // VGA Blue[5:0]
	// SDRAM
	inout wire  [ 16-1:0] SDRAM_DQ,   // SDRAM Data bus 16 Bits
	output wire [ 13-1:0] SDRAM_A,    // SDRAM Address bus 13 Bits
	output wire           SDRAM_DQML, // SDRAM Low-byte Data Mask
	output wire           SDRAM_DQMH, // SDRAM High-byte Data Mask
	output wire           SDRAM_nWE,  // SDRAM Write Enable
	output wire           SDRAM_nCAS, // SDRAM Column Address Strobe
	output wire           SDRAM_nRAS, // SDRAM Row Address Strobe
	output wire           SDRAM_nCS,  // SDRAM Chip Select
	output wire  [ 2-1:0] SDRAM_BA,   // SDRAM Bank Address
	output wire           SDRAM_CLK,  // SDRAM Clock
	output wire           SDRAM_CKE,  // SDRAM Clock Enable
	// AUDIO
	output wire           AUDIO_L,    // sigma-delta DAC output left
	output wire           AUDIO_R,    // sigma-delta DAC output right
	output wire [15:0]    DAC_L,      // DAC output left
	output wire [15:0]    DAC_R,      // DAC output right
	input  wire [15:0]    DAC_MIDI_L, // MIDI DAC input left
	input  wire [15:0]    DAC_MIDI_R, // MIDI DAC input right

	// SPI
	input wire            SPI_DO_IN,
	output wire           SPI_DO,
	input wire            SPI_DI,
	input wire            SPI_SCK,
	input wire            SPI_SS2,    // fpga
	input wire            SPI_SS3,    // OSD
	input wire            SPI_SS4,    // "sniff" mode
	input wire            CONF_DATA0,  // SPI_SS for user_io
	input wire            PS2K_CLK,
	input wire            PS2K_DAT,
	input wire            PS2M_CLK,
	input wire            PS2M_DAT
);

/* ------------------------------------------------------------------------------ */
/* ------------------------------- System settings ------------------------------ */
/* ------------------------------------------------------------------------------ */

wire reset = system_ctrl[0];
wire [1:0] fdc_wp = system_ctrl[7:6];
// usb target port on io controller is used for redirection of
// 0=nothing 1=rs232 2=printer 3=midi
wire [1:0] usb_redirection = system_ctrl[27:26];
wire blend = system_ctrl[29];

/* ------------------------------------------------------------------------------ */
/* ------------------------------ Clock generation ------------------------------ */
/* ------------------------------------------------------------------------------ */

wire pll_locked;
wire clk_2;
wire clk_32;
wire clk_96;
wire clk_128;

// 32.084 MHz base clock
wire mainclock;
clock32 clock32 (
	.inclk0     (CLOCK_27[0]),
	.c0         (mainclock  ),
	.c1			(SDRAM_CLK  )
);

clock clock (
  .inclk0       (mainclock  ), // input clock (32.084MHz)
  .c0           (clk_96     ), // output clock c0 (96MHz)
  .c1           (clk_32     ), // output clock c1 (32MHz)
  .c2           (clk_128    ), // output clock c2 (128MHz)
  .c3           (clk_2      ), // output clock c3 (2MHz)
//  .c4           (SDRAM_CLK  ), // output clock c4 (96MHz, phase shifted)
  .locked       (pll_locked )  // pll locked output
);

//assign SDRAM_CLK = clk_96;
assign SDRAM_CKE = 1'b1;

// MFP clock
// required: 2.4576 MHz
wire clk_mfp;
pll_mfp1 pll_mfp1 (
  .inclk0       (CLOCK_27[0]), // input clock (27MHz)
  .c0           (clk_mfp    )  // output clock c0 (2.4576MHz)
);

/* ------------------------------------------------------------------------------ */
/* -------------------------------- Video output -------------------------------- */
/* ------------------------------------------------------------------------------ */

wire        video_clk;
wire        viking_active;
wire        viking_hs, viking_vs;
wire  [3:0] viking_r, viking_g, viking_b;
wire        monomode;
wire  [3:0] r, g, b;
wire        hsync_n, vsync_n;
wire        blank_n;

wire  [1:0] scanlines = system_ctrl[21:20];

vidclkcntrl vidclkcntrl (
	.clkselect ( viking_active   ),
	.inclk0x   ( clk_32          ),
	.inclk1x   ( clk_128         ),
	.outclk    ( video_clk       )
);

wire [3:0] stvid_r   = viking_active?viking_r:(blank_n | monomode) ? r : 4'h0;
wire [3:0] stvid_g   = viking_active?viking_g:(blank_n | monomode) ? g : 4'h0;
wire [3:0] stvid_b   = viking_active?viking_b:(blank_n | monomode) ? b : 4'h0;
wire       stvid_hs  = viking_active?viking_hs:hsync_n;
wire       stvid_vs  = viking_active?viking_vs:vsync_n;

mist_video #(.OSD_COLOR(3'b010), .COLOR_DEPTH(4), .SD_HCNT_WIDTH(10), .OSD_X_OFFSET(10'd10)) mist_video(
	.clk_sys    ( video_clk ),
	.SPI_SCK    ( SPI_SCK ),
	.SPI_SS3    ( SPI_SS3 ),
	.SPI_DI     ( SPI_DI ),
	.R          ( stvid_r ),
	.G          ( stvid_g ),
	.B          ( stvid_b ),
	.HSync      ( stvid_hs ),
	.VSync      ( stvid_vs ),
	.VGA_R      ( VGA_R ),
	.VGA_G      ( VGA_G ),
	.VGA_B      ( VGA_B ),
	.VGA_VS     ( VGA_VS ),
	.VGA_HS     ( VGA_HS ),
	.ce_divider ( 1'b1 ),
	.rotate     ( 2'b00 ),
	.blend      ( blend & ~monomode & ~viking_active ),
	.scandoubler_disable( scandoubler_disable | monomode | viking_active ),
	.no_csync   ( monomode | viking_active | no_csync ),
	.scanlines  ( scanlines ),
	.ypbpr      ( ypbpr )
);

/* ------------------------------------------------------------------------------ */
/* ------------------------------- AUDIO DAC ------------------------------------ */
/* ------------------------------------------------------------------------------ */

wire [15:0] audio_mix_l, audio_mix_r;


reg [15:0] aud_l, aud_r;
always @(posedge clk_32) begin
	reg [15:0] old_l0, old_l1, old_r0, old_r1;
	
	old_l0 <= audio_mix_l;
	old_l1 <= old_l0;
	if(old_l0 == old_l1) aud_l <= old_l1;

	old_r0 <= audio_mix_r;
	old_r1 <= old_r0;
	if(old_r0 == old_r1) aud_r <= old_r1;
end

reg [15:0] out_l, out_r;
always @(posedge clk_32) begin
	reg [16:0] tmp_l, tmp_r;

	tmp_l <= {2'b00, aud_l[15:1]} +  {DAC_MIDI_L[15],DAC_MIDI_L};
	tmp_r <= {2'b00, aud_r[15:1]} +  {DAC_MIDI_R[15],DAC_MIDI_R};

	// clamp the output
	out_l <= (^tmp_l[16:15]) ? {tmp_l[16], {15{tmp_l[15]}}} : tmp_l[15:0];
	out_r <= (^tmp_r[16:15]) ? {tmp_r[16], {15{tmp_r[15]}}} : tmp_r[15:0];
end

assign DAC_L = out_l;
assign DAC_R = out_r;


/* ------------------------------------------------------------------------------ */
/* ------------------------------- MIDO output FIFO ----------------------------- */
/* ------------------------------------------------------------------------------ */
// filled by the CPU when writing to the acia data register
// emptied by the io controller when reading via SPI
// This happens in parallel to the real serial generation, so 
// physical and USB serial can be used at the same time

wire        midi_out_strobe;
wire  [7:0] midi_out;

io_fifo serial_out_fifo (
	.reset        ( reset ),

	.in_clk       ( clk_32 ),
	.in           ( midi_out ),
	.in_strobe    ( 1'b0 ),
	.in_enable    ( midi_out_strobe ),  // acia data write

	.out_clk      ( clk_32 ),
	.out          ( midi_data_from_acia ),
	.out_strobe   ( midi_strobe_from_acia ),
	.out_enable   ( 1'b0 ),

	.data_available ( midi_data_from_acia_available )
);

/* ------------------------------------------------------------------------------ */
/* -------------------------- Parallel port output FIFO ------------------------- */
/* ------------------------------------------------------------------------------ */
wire        parallel_out_strobe;
wire  [7:0] parallel_out;
wire        parallel_fifo_full;

// The printer busy signal is pulled down when the printer cannot accept further data
// if no printer redirection is being used this is wired to the extra joystick ports provided
// by the "gauntlet2 adapter". If no extra joystick ports are present, the busy signal will unconnected,
// and it's pulled up internally.

wire parallel_printer_busy = (usb_redirection == 2'd2)?parallel_fifo_full:joy2[4];

io_fifo #(.DEPTH(4)) parallel_out_fifo (
	.reset          ( reset ),

	.in_clk         ( clk_32 ),
	.in             ( parallel_out ),
	.in_strobe      ( parallel_out_strobe ),
	.in_enable      ( 1'b0 ),

	.out_clk        ( clk_32 ),
	.out            ( parallel_data_out ),
	.out_strobe     ( parallel_strobe_out ),
	.out_enable     ( 1'b0 ),

	.full           ( parallel_fifo_full ),
	.data_available ( parallel_data_out_available )
);

// extra joysticks are wired to the printer port
// using the "gauntlet2 interface", fire of
// joystick 0 is connected to the mfp I0 (busy)
wire [7:0] parallel_in = { ~joy2[0], ~joy2[1], ~joy2[2], ~joy2[3],~joy3[0], ~joy3[1], ~joy3[2], ~joy3[3] };
wire       parallel_in_strobe = ~joy3[4];

/* ------------------------------------------------------------------------------ */
/* -------------------------------- MiST data IO -------------------------------- */
/* ------------------------------------------------------------------------------ */

wire        dio_data_in_strobe_uio;
wire        dio_data_in_strobe_mist;
wire [15:0] dio_data_in_reg;
wire        dio_data_out_strobe;
wire [15:0] dio_data_out_reg;
wire        dio_dma_ack;
wire  [7:0] dio_dma_status;
wire        dio_dma_nak;
wire  [7:0] dio_status_in;
wire  [3:0] dio_status_index;
wire [23:1] dio_data_addr;
wire        dio_download;

wire [31:0] system_ctrl;

wire        spi_din = SPI_SS4 ? SPI_DI : SPI_DO_IN;

data_io data_io (
	.sck             ( SPI_SCK             ),
	.ss              ( SPI_SS2             ),
	.ss_sd           ( SPI_SS4             ),
	.sdi             ( spi_din             ),
	.sdo             ( dio_sdo             ),
	.clk             ( clk_32              ),
	.ctrl_out        ( system_ctrl         ),
	.video_adj       ( ),
	.data_in_strobe_uio ( dio_data_in_strobe_uio ),
	.data_in_strobe_mist( dio_data_in_strobe_mist),
	.data_in_reg     ( dio_data_in_reg     ),
	.data_addr       ( dio_data_addr       ),
	.data_download   ( dio_download        ),
	.data_out_strobe ( dio_data_out_strobe ),
	.data_out_reg    ( dio_data_out_reg    ),
	.dma_ack         ( dio_dma_ack         ),
	.dma_status      ( dio_dma_status      ),
	.dma_nak         ( dio_dma_nak         ),
	.status_in       ( dio_status_in       ),
	.status_index    ( dio_status_index    )
);

/* ------------------------------------------------------------------------------ */
/* ------------------------------ MiST user IO ---------------------------------- */
/* ------------------------------------------------------------------------------ */

// multiplex spi_do, drive it from user_io if that's selected, drive
// it from data_io if it's selected and leave it open else (also
// to be able to monitor sd card data directly)
wire user_io_sdo, dio_sdo;

assign SPI_DO = (CONF_DATA0 == 1'b0)?user_io_sdo:
	((SPI_SS2 == 1'b0)?dio_sdo:1'bZ);

// connection to transfer midi data from acia to io controller
wire [7:0] midi_data_from_acia;
wire midi_strobe_from_acia;
wire midi_data_from_acia_available;

// connection to transfer serial/rs232 data from mfp to io controller
wire [7:0] serial_data_from_mfp;
wire serial_strobe_from_mfp;
wire serial_data_from_mfp_available;
wire [7:0] serial_data_to_mfp;
wire serial_strobe_to_mfp;
wire [63:0] serial_status_from_mfp;

// connection to transfer parallel data from psg to io controller
wire [7:0] parallel_data_out;
wire parallel_strobe_out;
wire parallel_data_out_available;

// extra joystick interface
wire [15:0] joy0, joy1, joy2, joy3;

// RTC
wire [63:0] rtc;

// connection between io controller and ethernet controller
//   mac address transfer io controller -> ethernec
wire [31:0] eth_status;
wire [7:0] eth_mac_byte;
wire eth_mac_strobe, eth_mac_begin;
wire [7:0] eth_tx_read_byte;
wire eth_tx_read_strobe, eth_tx_read_begin;
wire [7:0] eth_rx_write_byte;
wire eth_rx_write_strobe, eth_rx_write_begin;

// ps2 keyboard-mouse emulation
reg ps2_kbd_clk;
reg ps2_kbd_data;
reg ps2_mouse_clk;
reg ps2_mouse_data;

wire ps2_kbd_clk_uio;
wire ps2_kbd_data_uio;
wire ps2_mouse_clk_uio;
wire ps2_mouse_data_uio;

wire [2:0] switches;
wire scandoubler_disable;
wire ypbpr;
wire no_csync;

// sd-card emulation for 2 images
wire [31:0] sd_lba;
wire  [1:0] sd_rd;
wire  [1:0] sd_wr;
wire        sd_ack;
wire        sd_ack_conf;
wire        sd_conf;
wire        sd_sdhc = 1'b1;
wire  [7:0] sd_dout;
wire        sd_dout_strobe;
wire  [7:0] sd_din;
wire  [8:0] sd_buff_addr;
wire  [1:0] img_mounted;
wire [31:0] img_size;

//// user io has an extra spi channel outside minimig core ////
user_io user_io(
	.clk_sys                     (clk_32),
	// the spi interface
	.SPI_CLK                     (SPI_SCK),
	.SPI_SS_IO                   (CONF_DATA0),
	.SPI_MISO                    (user_io_sdo),
	.SPI_MOSI                    (SPI_DI),

	// extra joysticks
	.joy0                        (joy0),
	.joy1                        (joy1),
	.joy2                        (joy2),
	.joy3                        (joy3),

	// serial/rs232 interface
	.serial_strobe_out           (serial_strobe_from_mfp),
	.serial_data_out             (serial_data_from_mfp),
	.serial_data_out_available   (serial_data_from_mfp_available),
	.serial_status_out           (serial_status_from_mfp),
	.serial_strobe_in            (serial_strobe_to_mfp),
	.serial_data_in              (serial_data_to_mfp),

	// parallel interface
	.parallel_strobe_out         (parallel_strobe_out),
	.parallel_data_out           (parallel_data_out),
	.parallel_data_out_available (parallel_data_out_available),

	// midi interface
	.midi_strobe_out             (midi_strobe_from_acia),
	.midi_data_out               (midi_data_from_acia),
	.midi_data_out_available     (midi_data_from_acia_available),

	// ethernet
	.eth_status                  (eth_status),
	.eth_mac_begin               (eth_mac_begin),
	.eth_mac_strobe              (eth_mac_strobe),
	.eth_mac_byte                (eth_mac_byte),
	.eth_tx_read_begin           (eth_tx_read_begin),
	.eth_tx_read_strobe          (eth_tx_read_strobe),
	.eth_tx_read_byte            (eth_tx_read_byte),
	.eth_rx_write_begin          (eth_rx_write_begin),
	.eth_rx_write_strobe         (eth_rx_write_strobe),
	.eth_rx_write_byte           (eth_rx_write_byte),

	// PS2 keyboard data
	.ps2_kbd_clk                 (ps2_kbd_clk_uio),
	.ps2_kbd_data                (ps2_kbd_data_uio),
	// PS2 mouse data
	.ps2_mouse_clk               (ps2_mouse_clk_uio),
	.ps2_mouse_data              (ps2_mouse_data_uio),

	// sd-card IO
	.sd_lba                      (sd_lba        ),
	.sd_rd                       (sd_rd         ),
	.sd_wr                       (sd_wr         ),
	.sd_ack                      (sd_ack        ),
	.sd_ack_conf                 (sd_ack_conf   ),
	.sd_conf                     (sd_conf       ),
	.sd_sdhc                     (sd_sdhc       ),
	.sd_dout                     (sd_dout       ),
	.sd_dout_strobe              (sd_dout_strobe),
	.sd_din                      (sd_din        ),
	.sd_buff_addr                (sd_buff_addr  ),
	.img_mounted                 (img_mounted   ),
	.img_size                    (img_size      ),

	// io controller requests to disable vga scandoubler
	.scandoubler_disable         (scandoubler_disable),
	.ypbpr                       (ypbpr),
	.no_csync                    (no_csync),
	.rtc                         (rtc),
	.SWITCHES                    (switches ),
	.CORE_TYPE                   (8'ha7)    // mist2 core id
);

/* ------------------------------------------------------------------------------ */
/* ------------------------------ The ATARI ST ---------------------------------- */
/* ------------------------------------------------------------------------------ */
`ifdef NO_TG68K
localparam TG68K_ENABLE = 1'b0;
`else
localparam TG68K_ENABLE = 1'b1;
`endif

`ifdef HAVE_PS2	
// Synchronise PS/2 signals
reg ps2_kbd_clk_d;
reg ps2_kbd_data_d;
reg ps2_mouse_clk_d;
reg ps2_mouse_data_d;

always @(posedge clk_96) begin
	ps2_kbd_clk_d <= PS2K_CLK;
	ps2_kbd_clk <= ps2_kbd_clk_d & ps2_kbd_clk_uio;
	ps2_kbd_data_d <= PS2K_DAT;
	ps2_kbd_data <= ps2_kbd_data_d & ps2_kbd_data_uio;
	ps2_mouse_clk_d <= PS2M_CLK;
	ps2_mouse_clk <= ps2_mouse_clk_d;
	ps2_mouse_data_d <= PS2M_DAT;
	ps2_mouse_data <= ps2_mouse_data_d;
end

`else

always @(*) begin
	ps2_kbd_clk <= ps2_kbd_clk_uio;
	ps2_kbd_data <= ps2_kbd_data_uio;
	ps2_mouse_clk <= ps2_mouse_clk_uio;
	ps2_mouse_data <= ps2_mouse_data_uio;
end

`endif

atarist_sdram #(TG68K_ENABLE) atarist(
	// System clocks / reset / settings
	.clk_96              ( clk_96 ),
	.clk_32              ( clk_32 ),
	.clk_128             ( clk_128 ),
	.clk_2               ( clk_2 ),
	.clk_mfp             ( clk_mfp ),
	.porb                ( pll_locked ),
	.system_ctrl         ( system_ctrl ),

	// Video output
	.r                   ( r ),
	.g                   ( g ),
	.b                   ( b ),
	.hsync_n             ( hsync_n ),
	.vsync_n             ( vsync_n ),
	.monomode            ( monomode ),
	.blank_n             ( blank_n ),

	.viking_active       ( viking_active ),
	.viking_r            ( viking_r ),
	.viking_g            ( viking_g ),
	.viking_b            ( viking_b ),
	.viking_hs           ( viking_hs ),
	.viking_vs           ( viking_vs ),

	// Sound output
	.audio_mix_l         ( audio_mix_l ),
	.audio_mix_r         ( audio_mix_r ),

	// MIDI OUT (parallel data)
	.midi_out_strobe     ( midi_out_strobe ),
	.midi_out            ( midi_out ),

	// MIDI UART
	.midi_rx             ( UART_RX ),
	.midi_tx             ( UART_TX ),

	// Parallel port IN-OUT
	.parallel_in_strobe  ( parallel_in_strobe ),
	.parallel_in         ( parallel_in ),
	.parallel_out_strobe ( parallel_out_strobe ),
	.parallel_out        ( parallel_out ),
	.parallel_printer_busy ( parallel_printer_busy ),

	// Serial port IN/OUT
	.serial_data_out_available (serial_data_from_mfp_available),
	.serial_strobe_out   ( serial_strobe_from_mfp ),
	.serial_data_out     ( serial_data_from_mfp ),
	.serial_status_out   ( serial_status_from_mfp ),
	.serial_strobe_in    ( serial_strobe_to_mfp ),
	.serial_data_in      ( serial_data_to_mfp ),

	// ROM/CART download / ACSI
	.data_in_strobe_rom  ( dio_data_in_strobe_uio ),
	.data_in_strobe_acsi ( dio_data_in_strobe_mist ),
	.data_in_reg         ( dio_data_in_reg ),
	.data_addr           ( dio_data_addr ),
	.data_download       ( dio_download ),

	.data_out_strobe     ( dio_data_out_strobe ),
	.data_out_reg        ( dio_data_out_reg ),
	.dma_ack             ( dio_dma_ack ),
	.dma_status          ( dio_dma_status ),
	.dma_nak             ( dio_dma_nak ),
	.dma_status_in       ( dio_status_in ),
	.dma_status_index    ( dio_status_index ),

	// FDC
	.img_mounted         ( img_mounted      ), // signaling that new image has been mounted
	.img_wp              ( fdc_wp           ), // write protect
	.img_size            ( img_size         ), // size of image in bytes
	.sd_lba              ( sd_lba           ),
	.sd_rd               ( sd_rd            ),
	.sd_wr               ( sd_wr            ),
	.sd_ack              ( sd_ack           ),
	.sd_buff_addr        ( sd_buff_addr     ),
	.sd_dout             ( sd_dout          ),
	.sd_din              ( sd_din           ),
	.sd_dout_strobe      ( sd_dout_strobe   ),
	.LED                 ( LED              ),

	// Ethernet
	.eth_status          ( eth_status ),
	.eth_mac_begin       ( eth_mac_begin ),
	.eth_mac_strobe      ( eth_mac_strobe ),
	.eth_mac_byte        ( eth_mac_byte ),
	.eth_tx_read_begin   ( eth_tx_read_begin ),
	.eth_tx_read_strobe  ( eth_tx_read_strobe ),
	.eth_tx_read_byte    ( eth_tx_read_byte ),
	.eth_rx_write_begin  ( eth_rx_write_begin ),
	.eth_rx_write_strobe ( eth_rx_write_strobe ),
	.eth_rx_write_byte   ( eth_rx_write_byte ),

	// PS2 keyboard data
	.ps2_kbd_clk         ( ps2_kbd_clk ),
	.ps2_kbd_data        ( ps2_kbd_data ),

	// PS2 mouse data
	.ps2_mouse_clk       ( ps2_mouse_clk ),
	.ps2_mouse_data      ( ps2_mouse_data ),

	// joysticks
	.joy0                ( joy0 ),
	.joy1                ( joy1 ),

	// RTC
	.rtc                 ( rtc ),

	// SDRAM pins
	.SDRAM_DQ            ( SDRAM_DQ ),   // SDRAM Data bus 16 Bits
	.SDRAM_A             ( SDRAM_A  ),   // SDRAM Address bus 13 Bits
	.SDRAM_DQML          ( SDRAM_DQML ), // SDRAM Low-byte Data Mask
	.SDRAM_DQMH          ( SDRAM_DQMH ), // SDRAM High-byte Data Mask
	.SDRAM_nWE           ( SDRAM_nWE  ), // SDRAM Write Enable
	.SDRAM_nCAS          ( SDRAM_nCAS ), // SDRAM Column Address Strobe
	.SDRAM_nRAS          ( SDRAM_nRAS ), // SDRAM Row Address Strobe
	.SDRAM_BA            ( SDRAM_BA   ), // SDRAM Bank Address
	.SDRAM_nCS           ( SDRAM_nCS  )  // SDRAM Chip Select
);

endmodule
