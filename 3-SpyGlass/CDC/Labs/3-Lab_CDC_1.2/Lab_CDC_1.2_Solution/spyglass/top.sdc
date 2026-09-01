
current_design top


create_clock -name "SYSTEM_CLOCK" -period 10 -waveform "0 5" [get_ports sys_clk]
set_clock_uncertainty -setup 0.2  [get_clocks SYSTEM_CLOCK]
set_clock_uncertainty -hold 0.1   [get_clocks SYSTEM_CLOCK]
set_clock_transition  -rise 0.05  [get_clocks SYSTEM_CLOCK]
set_clock_transition  -fall 0.05  [get_clocks SYSTEM_CLOCK]

create_generated_clock -master_clock SYSTEM_CLOCK -source [get_ports sys_clk] \
                       -name "SYS_DIV0_CLK" [get_pin u_clk_div/divided_clk] \
                       -divide_by 2 -add
set_clock_uncertainty -setup 0.2 [get_clocks SYS_DIV0_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks SYS_DIV0_CLK]

create_generated_clock -master_clock SYSTEM_CLOCK -source [get_ports sys_clk] \
                       -name "SYS_DIV1_CLK" [get_pin u_clk_div_2/divided_clk] \
                       -divide_by 4 -add
set_clock_uncertainty -setup 0.2 [get_clocks SYS_DIV1_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks SYS_DIV1_CLK]

create_clock -name "MULT_CLOCK" -period 4 -waveform "0 2" [get_ports mult_clk]
set_clock_uncertainty -setup 0.2  [get_clocks MULT_CLOCK]
set_clock_uncertainty -hold 0.1   [get_clocks MULT_CLOCK]
set_clock_transition  -rise 0.05  [get_clocks MULT_CLOCK]
set_clock_transition  -fall 0.05  [get_clocks MULT_CLOCK]

create_generated_clock -master_clock MULT_CLOCK -source [get_ports mult_clk] \
                       -name "MULT_GATED_CLK" [get_pin u_clock_gate/gated_clk] \
                       -divide_by 1 -add
set_clock_uncertainty -setup 0.2 [get_clocks MULT_GATED_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks MULT_GATED_CLK]


set_clock_groups -asynchronous -group [get_clocks {SYSTEM_CLOCK SYS_DIV0_CLK SYS_DIV1_CLK}] \
                               -group [get_clocks {MULT_CLOCK MULT_GATED_CLK}]

####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
####################################################################################

#Constrain Input Paths
set_input_delay 1 -clock SYSTEM_CLOCK [get_port serial_i]
set_input_delay 1 -clock SYSTEM_CLOCK [get_port sp_en]
set_input_delay 1 -clock SYSTEM_CLOCK [get_port wr_en]

#Constrain Output Paths
set_output_delay 1 -clock SYSTEM_CLOCK [get_port serial_o]
set_output_delay 1 -clock SYSTEM_CLOCK [get_port valid_o]


