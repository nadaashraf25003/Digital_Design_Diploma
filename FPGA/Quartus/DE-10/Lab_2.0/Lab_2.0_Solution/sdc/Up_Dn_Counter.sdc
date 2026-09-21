
## Clock Signal (50 MHz)
create_clock -add -name sys_clk_pin -period 20 -waveform {0 10} [get_ports clk];
