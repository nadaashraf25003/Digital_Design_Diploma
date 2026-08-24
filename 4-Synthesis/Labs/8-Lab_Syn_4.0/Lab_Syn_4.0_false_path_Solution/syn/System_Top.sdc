###################################################################

# Created by write_sdc on Thu Aug 20 22:49:14 2026

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports DATA]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports ACTIVE]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports RdEn]
set_load -pin_load 0.5 [get_ports {RdData[7]}]
set_load -pin_load 0.5 [get_ports {RdData[6]}]
set_load -pin_load 0.5 [get_ports {RdData[5]}]
set_load -pin_load 0.5 [get_ports {RdData[4]}]
set_load -pin_load 0.5 [get_ports {RdData[3]}]
set_load -pin_load 0.5 [get_ports {RdData[2]}]
set_load -pin_load 0.5 [get_ports {RdData[1]}]
set_load -pin_load 0.5 [get_ports {RdData[0]}]
create_clock [get_ports CLKA]  -name CLKA_DOMAIN  -period 70  -waveform {0 35}
set_clock_uncertainty -setup 0.2  [get_clocks CLKA_DOMAIN]
set_clock_uncertainty -hold 0.1  [get_clocks CLKA_DOMAIN]
set_clock_transition -max -rise 0.05 [get_clocks CLKA_DOMAIN]
set_clock_transition -min -rise 0.05 [get_clocks CLKA_DOMAIN]
set_clock_transition -max -fall 0.05 [get_clocks CLKA_DOMAIN]
set_clock_transition -min -fall 0.05 [get_clocks CLKA_DOMAIN]
create_clock [get_ports CLKB]  -name CLKB_DOMAIN  -period 20  -waveform {0 10}
set_clock_uncertainty -setup 0.2  [get_clocks CLKB_DOMAIN]
set_clock_uncertainty -hold 0.1  [get_clocks CLKB_DOMAIN]
set_clock_transition -max -rise 0.05 [get_clocks CLKB_DOMAIN]
set_clock_transition -min -rise 0.05 [get_clocks CLKB_DOMAIN]
set_clock_transition -max -fall 0.05 [get_clocks CLKB_DOMAIN]
set_clock_transition -min -fall 0.05 [get_clocks CLKB_DOMAIN]
group_path -name INOUT  -from [list [get_ports CLKA] [get_ports CLKB] [get_ports RST] [get_ports DATA] [get_ports ACTIVE] [get_ports RdEn]]  -to [list [get_ports {RdData[7]}] [get_ports {RdData[6]}] [get_ports {RdData[5]}] [get_ports {RdData[4]}] [get_ports {RdData[3]}] [get_ports {RdData[2]}] [get_ports {RdData[1]}] [get_ports {RdData[0]}]]
group_path -name INREG  -from [list [get_ports CLKA] [get_ports CLKB] [get_ports RST] [get_ports DATA] [get_ports ACTIVE] [get_ports RdEn]]
group_path -name REGOUT  -to [list [get_ports {RdData[7]}] [get_ports {RdData[6]}] [get_ports {RdData[5]}] [get_ports {RdData[4]}] [get_ports {RdData[3]}] [get_ports {RdData[2]}] [get_ports {RdData[1]}] [get_ports {RdData[0]}]]
set_input_delay -clock CLKA_DOMAIN  14  [get_ports DATA]
set_input_delay -clock CLKA_DOMAIN  14  [get_ports ACTIVE]
set_input_delay -clock CLKB_DOMAIN  4  [get_ports RdEn]
set_output_delay -clock CLKB_DOMAIN  4  [get_ports {RdData[7]}]
set_output_delay -clock CLKB_DOMAIN  4  [get_ports {RdData[6]}]
set_output_delay -clock CLKB_DOMAIN  4  [get_ports {RdData[5]}]
set_output_delay -clock CLKB_DOMAIN  4  [get_ports {RdData[4]}]
set_output_delay -clock CLKB_DOMAIN  4  [get_ports {RdData[3]}]
set_output_delay -clock CLKB_DOMAIN  4  [get_ports {RdData[2]}]
set_output_delay -clock CLKB_DOMAIN  4  [get_ports {RdData[1]}]
set_output_delay -clock CLKB_DOMAIN  4  [get_ports {RdData[0]}]
set_clock_groups -asynchronous -name CLKA_DOMAIN_1 -group [get_clocks CLKA_DOMAIN] -group [get_clocks CLKB_DOMAIN]
