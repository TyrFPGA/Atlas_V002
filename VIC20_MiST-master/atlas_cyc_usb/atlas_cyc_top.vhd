library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.demistify_config_pkg.all;

-- -----------------------------------------------------------------------

entity atlas_top is
  	generic (
    	ATLAS_CYC_EAR   : natural := 0;        	-- 0 = JOY SEL pin,  1 = EAR pin
		ATLAS_CYC_VGA	: natural := 0			-- 0 = HDMI,  		 1 = VGA
    );
	port
	(
		CLK12M			:	 IN STD_LOGIC;
		CLK_X			:	 IN STD_LOGIC;
		KEY0			: 	 IN STD_LOGIC;
		LED				:	 OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		-- SDRAM
		DRAM_CLK		:	 OUT STD_LOGIC;
		DRAM_CKE		:	 OUT STD_LOGIC;
		DRAM_ADDR		:	 OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
		DRAM_BA			:	 OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		DRAM_DQ			:	 INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		DRAM_LDQM		:	 OUT STD_LOGIC;
		DRAM_UDQM		:	 OUT STD_LOGIC;
		DRAM_CS_N		:	 OUT STD_LOGIC;
		DRAM_WE_N		:	 OUT STD_LOGIC;
		DRAM_CAS_N		:	 OUT STD_LOGIC;
		DRAM_RAS_N		:	 OUT STD_LOGIC;
		-- HDMI TDMS [or VGA if ATLAS_CYC_VGA = 1]
		TMDS			:	 OUT STD_LOGIC_VECTOR(7 DOWNTO 0)	:= (others => '0');
		-- AUDIO
		SIGMA_R         : 	 OUT   STD_LOGIC;
		SIGMA_L         :	 OUT   STD_LOGIC;
		-- -- I2S audio		
		-- I2S_BCLK		: 	 OUT   STD_LOGIC				:= '0';
		-- I2S_LRCLK		: 	 OUT   STD_LOGIC				:= '0';
		-- I2S_DATA		: 	 OUT   STD_LOGIC				:= '0';		
		-- JOYSTICK 
		JOY1_B2_P9		: 	 IN    STD_LOGIC;
		JOY1_B1_P6		: 	 IN    STD_LOGIC;
		JOY1_UP			: 	 IN    STD_LOGIC;
		JOY1_DOWN		: 	 IN    STD_LOGIC;
		JOY1_LEFT		: 	 IN    STD_LOGIC;
		JOY1_RIGHT		: 	 IN    STD_LOGIC;

		-- SHARED PIN_P11: JOY SELECT Output / EAR Input
		JOYX_SEL_EAR		: INOUT STD_LOGIC    	:= '0';			

		-- PS2
		PS2_KEYBOARD_CLK   :  INOUT STD_LOGIC;
		PS2_KEYBOARD_DAT   :  INOUT STD_LOGIC;
		PDP_4k7			   :  OUT   STD_LOGIC;		--USB2PS2
    	PDM_4k7			   :  OUT   STD_LOGIC;
		
		PS2_MOUSE_CLK      :  INOUT STD_LOGIC;
		PS2_MOUSE_DAT      :  INOUT STD_LOGIC;
		-- UART
		UART_RXD           :  IN    STD_LOGIC;
		UART_TXD           :  OUT   STD_LOGIC;
		-- SD Card
		SD_CS_N_O          :  OUT   STD_LOGIC 			:= '1';
		SD_SCLK_O          :  OUT   STD_LOGIC 			:= '0';
		SD_MOSI_O          :  OUT   STD_LOGIC 			:= '0';
		SD_MISO_I          :  IN    STD_LOGIC
	
	);
END entity;

architecture RTL of atlas_top is
	
-- System clocks
	signal locked : std_logic;
	signal reset_n : std_logic;

-- SPI signals
	signal sd_clk : std_logic;
	signal sd_cs : std_logic;
	signal sd_mosi : std_logic;
	signal sd_miso : std_logic;
	
-- internal SPI signals
	signal spi_toguest : std_logic;
	signal spi_fromguest : std_logic;
	signal spi_ss2 : std_logic;
	signal spi_ss3 : std_logic;
	signal spi_ss4 : std_logic;
	signal conf_data0 : std_logic;
	signal spi_clk_int : std_logic;

-- PS/2 Keyboard socket - used for second mouse
	signal ps2_keyboard_clk_in : std_logic;
	signal ps2_keyboard_dat_in : std_logic;
	signal ps2_keyboard_clk_out : std_logic;
	signal ps2_keyboard_dat_out : std_logic;

-- PS/2 Mouse
	signal ps2_mouse_clk_in: std_logic;
	signal ps2_mouse_dat_in: std_logic;
	signal ps2_mouse_clk_out: std_logic;
	signal ps2_mouse_dat_out: std_logic;

	signal intercept : std_logic;
	
-- Video
	signal vga_red: std_logic_vector(7 downto 0);
	signal vga_green: std_logic_vector(7 downto 0);
	signal vga_blue: std_logic_vector(7 downto 0);
	signal vga_hsync : std_logic;
	signal vga_vsync : std_logic;

-- RS232 serial
	signal rs232_rxd : std_logic;
	signal rs232_txd : std_logic;

-- IO
	signal joya : std_logic_vector(7 downto 0);
	signal joyb : std_logic_vector(7 downto 0);
	signal joyc : std_logic_vector(7 downto 0);
	signal joyd : std_logic_vector(7 downto 0);

-- -- I2S audio
-- component audio_top is
-- Port ( 	
-- 		clk_50MHz : in STD_LOGIC; -- system clock
-- 		dac_MCLK : out STD_LOGIC; -- outputs to PMODI2L DAC
-- 		dac_LRCK : out STD_LOGIC;
-- 		dac_SCLK : out STD_LOGIC;
-- 		dac_SDIN : out STD_LOGIC;
-- 		L_data : 	in std_logic_vector(15 downto 0);  	-- LEFT data (16-bit signed)
-- 		R_data : 	in std_logic_vector(15 downto 0)  	-- RIGHT data (16-bit signed) 
-- );
-- end component;	

-- DAC AUDIO     
signal dac_l: std_logic_vector(15 downto 0);
signal dac_r: std_logic_vector(15 downto 0);

-- I2S 
signal i2s_mclk		    : std_logic;

-- HDMI NSTC
signal clock_vga_s		: std_logic;
signal clock_dvi_s		: std_logic;
signal sound_hdmi_l_s	: std_logic_vector(15 downto 0);
signal sound_hdmi_r_s	: std_logic_vector(15 downto 0);
signal tdms_r_s			: std_logic_vector( 9 downto 0);
signal tdms_g_s			: std_logic_vector( 9 downto 0);
signal tdms_b_s			: std_logic_vector( 9 downto 0);
signal tdms_p_s			: std_logic_vector( 3 downto 0);
signal tdms_n_s			: std_logic_vector( 3 downto 0);

-- VGA signals  [ ATLAS_CYC_VGA = 1]
signal VGA_HS	:	  std_logic;
signal VGA_VS	:	  std_logic;
signal VGA_R	:	  std_logic_vector(1 DOWNTO 0);
signal VGA_G	:	  std_logic_vector(1 DOWNTO 0);
signal VGA_B	:	  std_logic_vector(1 DOWNTO 0);

-- VIDEO 
signal vga_clk  :  std_logic;
signal hdmi_clk  :  std_logic;
signal vga_de   :  std_logic;
signal vga_x_r  :  STD_LOGIC_VECTOR(5 DOWNTO 0); 
signal vga_x_g  :  STD_LOGIC_VECTOR(5 DOWNTO 0); 
signal vga_x_b  :  STD_LOGIC_VECTOR(5 DOWNTO 0); 
signal vga_x_hs :  std_logic; 
signal vga_x_vs :  std_logic; 

component pll2 
    port (
--  areset : in std_logic;
    inclk0 : in std_logic;
    c0 : out std_logic
--    c1 : out std_logic;
--    locked : out std_logic
  );
end component;

-- SHARE PIN P11 EAR IN / JOY SEL OUT  
signal EAR 		 	:  std_logic; 
signal JOYX_SEL_O 	:  std_logic; 

-- USB2PS2
component USB_PS2
    port (
    clk : in std_logic;
    LedNum : in std_logic;
    LedCaps : in std_logic;
    LedScroll : in std_logic;
    dp : inout std_logic;
    dm : inout std_logic;
    PS2data : out std_logic;
    PS2clock : out std_logic
  );
end component;

signal PS2data 		:  std_logic; 
signal PS2clock 	:  std_logic; 
signal clk48	    :  std_logic; 

begin

       
-- SPI
SD_CS_N_O<=sd_cs;
SD_MOSI_O<=sd_mosi;
sd_miso  <=SD_MISO_I;
SD_SCLK_O<=sd_clk;

-- External devices tied to GPIOs
ps2_mouse_dat_in<=ps2_mouse_dat;
ps2_mouse_dat <= '0' when ps2_mouse_dat_out='0' else 'Z';
ps2_mouse_clk_in<=ps2_mouse_clk;
ps2_mouse_clk <= '0' when ps2_mouse_clk_out='0' else 'Z';

-- ps2_keyboard_dat_in <=ps2_keyboard_dat;
-- ps2_keyboard_dat <= '0' when ps2_keyboard_dat_out='0' else 'Z';
-- ps2_keyboard_clk_in<=ps2_keyboard_clk;
-- ps2_keyboard_clk <= '0' when ps2_keyboard_clk_out='0' else 'Z';


-- USB2PS2
PDP_4k7	<= '0';
PDM_4k7	<= '0';

USB_PS2_inst : USB_PS2
  port map (
    clk => clk48,
    LedNum =>  '0',
    LedCaps =>  '0',
    LedScroll =>  '0',
    dp => PS2_KEYBOARD_CLK,
    dm => PS2_KEYBOARD_DAT,
    PS2data => PS2data,
    PS2clock => PS2clock
  );

ps2_keyboard_dat_in <=PS2data;
--PS2data <= '0' when ps2_keyboard_dat_out='0' else 'Z';
ps2_keyboard_clk_in<=PS2clock;
--PS2clock <= '0' when ps2_keyboard_clk_out='0' else 'Z';


pllUSB : pll2
port map (
	inclk0		=> CLK12M,			
	c0			=> clk48	
--	c1			=> clock_vga_s,			
--	locked		=> locked
);

	
PIN_P11_JOYSEL_1 : if ATLAS_CYC_EAR = 1 generate	-- EAR Input
	EAR 		 <= JOYX_SEL_EAR;
end generate PIN_P11_JOYSEL_1;

PIN_P11_JOYSEL_2 : if ATLAS_CYC_EAR = 0 generate	-- JOY Select Output
	JOYX_SEL_O   <= '1';	
	JOYX_SEL_EAR <= JOYX_SEL_O;	
	EAR 		 <= '0';
end generate PIN_P11_JOYSEL_2;

joya<="11" & JOY1_B2_P9 & JOY1_B1_P6 & JOY1_RIGHT & JOY1_LEFT & JOY1_DOWN & JOY1_UP;
joyb<=(others=>'1');
joyc<=(others=>'1');
joyd<=(others=>'1');


-- -- I2S audio
-- audio_i2s: audio_top
-- port map(
-- 	clk_50MHz => CLK12M,
-- 	dac_MCLK  => i2s_mclk,
-- 	dac_LRCK  => I2S_LRCLK,
-- 	dac_SCLK  => I2S_BCLK,
-- 	dac_SDIN  => I2S_DATA,
-- 	L_data    => std_logic_vector(dac_l),
-- 	R_data    => std_logic_vector(dac_r)
-- );		


-- BEGIN VGA ATLAS -------------------  
VGA_R <=vga_red(7 downto 6);
VGA_G <=vga_green(7 downto 6);
VGA_B <=vga_blue(7 downto 6);
VGA_HS<=vga_hsync;
VGA_VS<=vga_vsync;

PINS_HDMI_VGA_1 : if ATLAS_CYC_VGA = 1 generate	-- VGA
TMDS(7)	<= VGA_R(1);		
TMDS(6)	<= VGA_R(0);		
TMDS(5)	<= VGA_G(1);			
TMDS(4)	<= VGA_G(0);		
TMDS(3)	<= VGA_B(1);	
TMDS(2)	<= VGA_B(0);
TMDS(1)	<= VGA_VS;
TMDS(0)	<= VGA_HS;
end generate PINS_HDMI_VGA_1;
-- END VGA ATLAS -------------------  




-- BEGIN HDMI ATLAS -------------------   
PINS_HDMI_VGA_2 : if ATLAS_CYC_VGA = 0 generate	-- HDMI TDMS

-- PLL VIDEO
-- pllvideo : pll2
-- port map (
-- 	inclk0		=> CLK12M,				--      PAL       NTSC
-- 	c0			=> clock_dvi_s,			-- x5	177.5     143.2
-- 	c1			=> clock_vga_s,			-- x 	35.5      28.63
-- 	locked		=> locked
-- );

clock_vga_s <= vga_clk;
clock_dvi_s <= hdmi_clk;

-- HDMI AUDIO
sound_hdmi_l_s <= dac_l;
sound_hdmi_r_s <= dac_r;
-- sound_hdmi_l_s <= '0' & std_logic_vector(dac_l(15 downto 1));
-- sound_hdmi_r_s <= '0' & std_logic_vector(dac_r(15 downto 1));


------------------------------------------------------------------------------------------------------
-- JUST LEAVE ONE HDMI WRAPPER (1/2/3) UNCOMMENTED                                                  --
-- SELECT PROJECT FILES FOR HDMI WRAPPER (1/2/3) AT DeMiSTify/Board/atlas_cyc/atlas_cyc_support.tcl --
------------------------------------------------------------------------------------------------------


---- BEGIN HDMI 1 NO SOUND (MULTICPM / Next186) -> ok PAL&NTSC

TMDS(6)	<= '0';
TMDS(4)	<= '0';
TMDS(2)	<= '0'; 
TMDS(0)	<= '0';

inst_hdmi : entity work.hdmi
port map(
	-- clocks
	CLK_PIXEL_I	=> clock_vga_s,
	CLK_DVI_I	=> clock_dvi_s,
	--components
	R_I			=> vga_x_r & vga_x_r(4 downto 3),
	G_I			=> vga_x_g & vga_x_g(4 downto 3),
	B_I			=> vga_x_b & vga_x_b(4 downto 3),
	BLANK_I		=> not vga_de,
	HSYNC_I		=> vga_x_hs,
	VSYNC_I		=> vga_x_vs,
	TMDS_D0_O   => TMDS(3),		
	TMDS_D1_O   => TMDS(5),		
	TMDS_D2_O   => TMDS(7),		
	TMDS_CLK_O  => TMDS(1)
);

---- END HDMI 1 



----  BEGIN HDMI 2 (MSX)   -> ok PAL&NTSC, AUDIO IS NOT GOOD

-- hdmi: entity work.hdmi
-- generic map (
-- 	FREQ	=> 35480000,	-- pixel clock frequency 
-- 	CTS		=> 35480,		-- CTS = Freq(pixclk) * N / (128 * Fs)
-- 	-- FREQ	=> 28630000,	-- pixel clock frequency 
-- 	-- CTS	=> 28630,		-- CTS = Freq(pixclk) * N / (128 * Fs)
-- 	FS		=> 48000,		-- audio sample rate - should be 32000, 41000 or 48000 = 48KHz
-- 	N		=> 6144			-- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300 (Check HDMI spec 7.2 for details)
-- ) 
-- port map (
-- 	I_CLK_PIXEL		=> clock_vga_s,
-- 	I_R				=> vga_x_r & vga_x_r(4 downto 3),
-- 	I_G				=> vga_x_g & vga_x_g(4 downto 3),
-- 	I_B				=> vga_x_b & vga_x_b(4 downto 3),
-- 	I_BLANK			=> not vga_de,
-- 	I_HSYNC			=> vga_x_hs,
-- 	I_VSYNC			=> vga_x_vs,
-- 	-- PCM audio
-- 	I_AUDIO_ENABLE	=> '1',
-- 	I_AUDIO_PCM_L 	=> sound_hdmi_l_s,
-- 	I_AUDIO_PCM_R	=> sound_hdmi_r_s,
-- 	-- TMDS parallel pixel synchronous outputs (serialize LSB first)
-- 	O_RED			=> tdms_r_s,
-- 	O_GREEN			=> tdms_g_s,
-- 	O_BLUE			=> tdms_b_s
-- );

-- hdmio: entity work.hdmi_out_altera
-- port map (
-- 	clock_pixel_i		=> clock_vga_s,
-- 	clock_tdms_i		=> clock_dvi_s,
-- 	red_i				=> tdms_r_s,
-- 	green_i				=> tdms_g_s,
-- 	blue_i				=> tdms_b_s,
-- 	tmds_out_p			=> tdms_p_s,
-- 	tmds_out_n			=> tdms_n_s
-- );

-- TMDS(7)	<= tdms_p_s(2);	-- 2+		
-- TMDS(6)	<= tdms_n_s(2);	-- 2-		
-- TMDS(5)	<= tdms_p_s(1);	-- 1+			
-- TMDS(4)	<= tdms_n_s(1);	-- 1-		
-- TMDS(3)	<= tdms_p_s(0);	-- 0+		
-- TMDS(2)	<= tdms_n_s(0);	-- 0-	
-- TMDS(1)	<= tdms_p_s(3);	-- CLK+	
-- TMDS(0)	<= tdms_n_s(3);	-- CLK-

---- END HDMI 2 



---- BEGIN HDMI 3 (ATARI)    ok PAL, AUDIO 32k, 41k, 48k IS NOT GOOD, NTSC NOT TESTED

-- inst_dvid: entity work.hdmi
-- generic map (
-- 	FREQ	=> 35480000,	-- pixel clock frequency 
-- 	CTS		=> 35480,		-- CTS = Freq(pixclk) * N / (128 * Fs)
-- 	FS		=> 41000,		-- audio sample rate - should be 32000, 41000 or 48000 = 48KHz
-- 	N		=> 6144			-- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300 (Check HDMI spec 7.2 for details)
-- ) 
-- port map(
-- 	I_CLK_VGA	=> clock_vga_s,
-- 	I_CLK_TMDS	=> clock_dvi_s,
-- 	I_HSYNC		=> vga_x_hs,
-- 	I_VSYNC		=> vga_x_vs,
-- 	I_BLANK		=> not vga_de,
-- 	I_RED		=> vga_x_r & vga_x_r(4 downto 3),
-- 	I_GREEN		=> vga_x_g & vga_x_g(4 downto 3),
-- 	I_BLUE		=> vga_x_b & vga_x_b(4 downto 3),
-- 	I_AUDIO_PCM_L 	=> sound_hdmi_l_s,
-- 	I_AUDIO_PCM_R	=> sound_hdmi_r_s,
-- 	O_TMDS			=> TMDS
-- );

---- END HDMI 3 

---- END HDMI PAL ATLAS 


end generate PINS_HDMI_VGA_2;
-- END HDMI ATLAS -------------------



guest: COMPONENT vic20_mist
	PORT map
	(
		CLOCK_27 => CLK12M,
		LED => LED(0),
		-- clocks
		SDRAM_DQ => DRAM_DQ,
		SDRAM_A => DRAM_ADDR,
		SDRAM_DQML => DRAM_LDQM,
		SDRAM_DQMH => DRAM_UDQM,
		SDRAM_nWE => DRAM_WE_N,
		SDRAM_nCAS => DRAM_CAS_N,
		SDRAM_nRAS => DRAM_RAS_N,
		SDRAM_nCS => DRAM_CS_N,
		SDRAM_BA => DRAM_BA,
		SDRAM_CLK => DRAM_CLK,
		SDRAM_CKE => DRAM_CKE,
		
		UART_TX  => open,
		UART_RX  => EAR,   
 
--		SPI_DO_IN => sd_mosi,
		SPI_DO => spi_fromguest,
		SPI_DI => spi_toguest,
		SPI_SCK => spi_clk_int,
		SPI_SS2	=> spi_ss2,
		SPI_SS3 => spi_ss3,
--		SPI_SS4 => spi_ss4,
		CONF_DATA0 => conf_data0,

		VGA_HS => vga_hsync,
		VGA_VS => vga_vsync,
		VGA_R => vga_red(7 downto 2),
		VGA_G => vga_green(7 downto 2),
		VGA_B => vga_blue(7 downto 2),
	        VGA_DE   => vga_de,
	        VGA_CLK  => vga_clk,
			HDMI_CLK => hdmi_clk,
			vga_x_r  => vga_x_r,
  			vga_x_g  => vga_x_g,
  			vga_x_b  => vga_x_b,
   			vga_x_hs => vga_x_hs,
   			vga_x_vs => vga_x_vs,
			DAC_L   => dac_l,
            DAC_R   => dac_r,
		AUDIO_L => sigma_l,
		AUDIO_R => sigma_r,
		PS2_CLK_IN => ps2_keyboard_clk_in or intercept, -- Block keyboard when OSD is active
		PS2_DAT_IN => ps2_keyboard_dat_in or intercept
);



-- Pass internal signals to external SPI interface
sd_clk <= spi_clk_int;

controller : entity work.substitute_mcu
	generic map (
		sysclk_frequency => 500,
--		SPI_FASTBIT=>3,			
--		SPI_INTERNALBIT=>2,		--needed to avoid hungs on the OSD
		debug => false,
		jtag_uart => false
	)
	port map (
		clk => CLK12M,
		reset_in  =>  KEY0,     -- or locked
		reset_out => reset_n,

		-- SPI signals
		spi_miso => sd_miso,
		spi_mosi	=> sd_mosi,
		spi_clk => spi_clk_int,
		spi_cs => sd_cs,
		spi_fromguest => spi_fromguest,
		spi_toguest => spi_toguest,
		spi_ss2 => spi_ss2,
		spi_ss3 => spi_ss3,
		spi_ss4 => spi_ss4,
		conf_data0 => conf_data0,
		
		-- PS/2 signals
		ps2k_clk_in => ps2_keyboard_clk_in,
		ps2k_dat_in => ps2_keyboard_dat_in,
		ps2k_clk_out => ps2_keyboard_clk_out,
		ps2k_dat_out => ps2_keyboard_dat_out,
		ps2m_clk_in => ps2_mouse_clk_in,
		ps2m_dat_in => ps2_mouse_dat_in,
		ps2m_clk_out => ps2_mouse_clk_out,
		ps2m_dat_out => ps2_mouse_dat_out,

		-- Buttons
		buttons => (0=>KEY0,others=>'1'),

		-- JOYSTICKS
		joy1 => joya,

		-- UART
		rxd => rs232_rxd,
		txd => rs232_txd,
		intercept => intercept
);

end rtl;

