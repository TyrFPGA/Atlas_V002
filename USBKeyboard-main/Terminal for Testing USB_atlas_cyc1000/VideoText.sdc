# 12 MHz clock
create_clock -name {clk_12} -period 83.333 -waveform { 0.000 41.666 } [get_ports {CLK12M}]
# 50 MHz clock
#create_clock -name {clk_12} -period 20.000 -waveform {0.000 10.000} { CLK12M }

derive_pll_clocks -create_base_clocks
derive_clock_uncertainty

# Create a clock for i2s, audio-spi, i2c-hdmi
#create_clock -name i2sclk -period 83.333 {audio_top:audio_i2s|tcount[4]}

# Set pin definitions for downstream constraints
set RAM_CLK DRAM_CLK
set RAM_OUT {DRAM_DQ* DRAM_ADDR* DRAM_BA* DRAM_RAS_N DRAM_CAS_N DRAM_WE_N DRAM_*DQM DRAM_CS_N DRAM_CKE}
set RAM_IN  {DRAM_D*}

#set VGA_OUT {TMDS[*]}

#set HDMI_OUT {TMDS[*]}
# HDMI constraints to be checked and used in the core constraints file
#set_output_delay -clock [get_clocks $sysclk] -max 0 [get_ports $HDMI_OUT]
#set_output_delay -clock [get_clocks $sysclk] -min -5 [get_ports $HDMI_OUT]
#set_multicycle_path -to $HDMI_OUT -setup 2
#set_multicycle_path -to $HDMI_OUT -hold 1

# non timing-critical pins would be in the "FALSE_IN/OUT" collection (IN inputs, OUT outputs)
set FALSE_OUT {LED[*] SIGMA_* PS2_* I2S_* UART_TXD SD_CS_N_O SD_MOSI_O SD_SCLK_O JOYX_SEL_EAR}
set FALSE_IN  {KEY0 PS2_* UART_RXD JOY* SD_MISO_I JOYX_SEL_EAR}

