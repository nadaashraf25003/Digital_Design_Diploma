# =============================================================================
# Constraints for design_1_wrapper (Puzhi ZU4EV Board)
# =============================================================================

# --- 200 MHz Differential Reference Clock (Bank 65) ---
set_property -dict {PACKAGE_PIN L3 IOSTANDARD DIFF_SSTL12} [get_ports {clk_200_p[0]}]
set_property -dict {PACKAGE_PIN L2 IOSTANDARD DIFF_SSTL12} [get_ports {clk_200_n[0]}]

create_clock -period 5.000 -name sys_clk_pin [get_ports {clk_200_p[0]}]

# --- Hardware Outputs (Carrier Board LEDs 1 & 2 - Bank 43, 3.3V) ---
set_property -dict {PACKAGE_PIN AD10 IOSTANDARD LVCMOS33} [get_ports {LFSR_OUT_0[3]}]
set_property -dict {PACKAGE_PIN AD11 IOSTANDARD LVCMOS33} [get_ports {LFSR_OUT_0[2]}]
set_property -dict {PACKAGE_PIN AF12 IOSTANDARD LVCMOS33} [get_ports {LFSR_OUT_0[1]}]
set_property -dict {PACKAGE_PIN AB10 IOSTANDARD LVCMOS33} [get_ports {LFSR_OUT_0[0]}]

# --- Hardware Reset Input (Carrier Board Key 2 - Bank 43, 3.3V) ---
set_property -dict {PACKAGE_PIN AH10 IOSTANDARD LVCMOS33} [get_ports Reset_0]

# --- Bitstream Compression ---
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]