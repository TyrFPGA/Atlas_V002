create_clock -name {clk_12} -period 83.333 -waveform { 0.000 41.666 } [get_ports {clk12}]
create_generated_clock -name {vt52:terminal|vga:video|vgaclk} -divide_by 2 -source [get_ports {clk12}] [get_registers {vt52:terminal|vga:video|vgaclk}]
derive_clock_uncertainty
