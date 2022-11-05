
set_time_format -unit ns -decimal_places 3

# create_clock -name {clk_27} -period 37.037 -waveform { 0.000 18.500 } [get_ports {CLOCK_27[0]}]
# create_clock -name {SPI_SCK}  -period 41.666 -waveform { 20.8 41.666 } [get_ports {SPI_SCK}]

derive_pll_clocks -create_base_clocks
derive_clock_uncertainty;

set sdram_clk "${topmodule}clock32|altpll_component|auto_generated|pll1|clk[1]"
set mem_clk "${topmodule}clock|altpll_component|auto_generated|pll1|clk[0]"
set sys_clk "${topmodule}clock|altpll_component|auto_generated|pll1|clk[1]"
set vid_clk "${topmodule}clock|altpll_component|auto_generated|pll1|clk[2]"
set slow_clk "${topmodule}clock|altpll_component|auto_generated|pll1|clk[3]"

create_generated_clock -name kbclk -source [get_pins ${slow_clk}] -divide_by 2 ${topmodule}atarist|ikbd|HD63701V0_M6|core|CLK
#create_generated_clock -name kbrst -source [get_pins ${slow_clk}] -divide_by 2 ${topmodule}atarist|ikbd_reset


set_input_delay -clock [get_clocks $sdram_clk] -reference_pin [get_ports $RAM_CLK] -max 6.4 [get_ports $RAM_IN]
set_input_delay -clock [get_clocks $sdram_clk] -reference_pin [get_ports $RAM_CLK] -min 3.2 [get_ports $RAM_IN]


set_output_delay -clock [get_clocks $sdram_clk] -reference_pin [get_ports $RAM_CLK] -max 1.5 [get_ports $RAM_OUT]
set_output_delay -clock [get_clocks $sdram_clk] -reference_pin [get_ports $RAM_CLK] -min -0.8 [get_ports $RAM_OUT]

set_output_delay -clock [get_clocks $vid_clk] -max 0.5 [get_ports $VGA_OUT]
set_output_delay -clock [get_clocks $vid_clk] -min 0 [get_ports $VGA_OUT]


set_clock_groups -asynchronous -group $supportclk -group [get_clocks ${topmodule}clock|altpll_component|auto_generated|pll1|clk[*]]
set_clock_groups -asynchronous -group spiclk -group [get_clocks ${topmodule}clock|altpll_component|auto_generated|pll1|clk[*]]
set_clock_groups -asynchronous -group [get_clocks ${topmodule}pll_mfp1|altpll_component|auto_generated|pll1|clk[0]] -group [get_clocks ${topmodule}clock|altpll_component|auto_generated|pll1|clk[*]]


set_false_path -from $FALSE_IN
set_false_path -to $FALSE_OUT

set_false_path -to ${topmodule}ps2_kbd_clk_d

#[get_ports {SDRAM_CLK}]
#set_false_path -to [get_ports {UART_TX}]
#set_false_path -to [get_ports {AUDIO_L}]
#set_false_path -to [get_ports {AUDIO_R}]
#set_false_path -to [get_ports {LED}]


# SDRAM 96 MHz to memory 96 MHz
set_multicycle_path -from [get_clocks $sdram_clk] -to [get_clocks $mem_clk] -start -setup 2
set_multicycle_path -from [get_clocks $sdram_clk] -to [get_clocks $mem_clk] -start -hold 1

# SDRAM 96 MHz to system 32 MHz
set_multicycle_path -from [get_clocks $mem_clk] -to [get_clocks $sys_clk] -start -setup 2
set_multicycle_path -from [get_clocks $mem_clk] -to [get_clocks $sys_clk] -start -hold 1

# System 32 MHz to memory 96 MHz
set_multicycle_path -from [get_clocks $sys_clk] -to [get_clocks $mem_clk] -end -setup 2
set_multicycle_path -from [get_clocks $sys_clk] -to [get_clocks $mem_clk] -end -hold 1

# System 32 MHz to keyboard clk
set_multicycle_path -from [get_clocks $sys_clk] -to kbclk -end -setup 2
set_multicycle_path -from [get_clocks $sys_clk] -to kbclk -end -hold 1

# FX68K
set_multicycle_path -start -setup -from [get_keepers ${topmodule}atarist|fx68k|Ir[*]] -to [get_keepers ${topmodule}atarist|fx68k|microAddr[*]] 2
set_multicycle_path -start -hold -from [get_keepers ${topmodule}atarist|fx68k|Ir[*]] -to [get_keepers ${topmodule}atarist|fx68k|microAddr[*]] 1
set_multicycle_path -start -setup -from [get_keepers ${topmodule}atarist|fx68k|Ir[*]] -to [get_keepers ${topmodule}atarist|fx68k|nanoAddr[*]] 2
set_multicycle_path -start -hold -from [get_keepers ${topmodule}atarist|fx68k|Ir[*]] -to [get_keepers ${topmodule}atarist|fx68k|nanoAddr[*]] 1

# Viking 128 MHz to memory 96 MHz
set_multicycle_path -from [get_clocks $vid_clk] -to [get_clocks $mem_clk] -setup 2
set_multicycle_path -from [get_clocks $vid_clk] -to [get_clocks $mem_clk] -hold 1

set_multicycle_path -from ${topmodule}atarist|sdram|dout[*] -to ${topmodule}atarist|sdram|* -setup 2
set_multicycle_path -from ${topmodule}atarist|sdram|dout[*] -to ${topmodule}atarist|sdram|* -hold 1

# VGA
set_multicycle_path -start -to [get_ports $VGA_OUT] -setup 4
set_multicycle_path -start -to [get_ports $VGA_OUT] -hold 3

