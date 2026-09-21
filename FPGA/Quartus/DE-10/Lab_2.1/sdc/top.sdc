create_clock -name clk_50m -period 20.000 [get_ports clk_50m]
derive_pll_clocks
derive_clock_uncertainty
set_input_delay  0.5 -clock clk_50m [get_ports {LFSR_EN OUT_EN data_in}]
set_output_delay 0.5 -clock clk_50m [get_ports {LEDs valid_out crc_out}]