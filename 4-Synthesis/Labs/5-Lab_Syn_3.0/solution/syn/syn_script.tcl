
########################### Define Top Module ############################
                                                   
set top_module ALU_TOP

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

################## Design Compiler Library Files #setup ######################

puts "###########################################"
puts "#      #setting Design Libraries           #"
puts "###########################################"

#Add the path of the libraries to the search_path variable
lappend search_path /home/ICer/Labs/Lab_Syn_3.0/std_cells
lappend search_path /home/ICer/Labs/Lab_Syn_3.0/rtl

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

######################## Reading RTL Files #################################

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

set file_format verilog

read_file -format $file_format ALU_TOP.v
read_file -format $file_format ALU.v
read_file -format $file_format ClkDiv.v

###################### Defining toplevel ###################################

current_design $top_module

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design

############################### Path groups ################################
puts "###############################################"
puts "################ Path groups ##################"
puts "###############################################"

group_path -name INREG -from [all_inputs]
group_path -name REGOUT -to [all_outputs]
group_path -name INOUT -from [all_inputs] -to [all_outputs]

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

# Constraints
# ----------------------------------------------------------------------------
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################

set CLK_PER 50
set ALU_CLK_PER [expr $CLK_PER * 2]

create_clock -name MASTER_CLK -period $CLK_PER -waveform "0 [expr $CLK_PER/2]" [get_ports CLK]
set_clock_uncertainty -setup 0.2  [get_clocks MASTER_CLK]
set_clock_uncertainty -hold 0.1   [get_clocks MASTER_CLK]
set_clock_transition  -rise 0.05  [get_clocks MASTER_CLK]
set_clock_transition  -fall 0.05  [get_clocks MASTER_CLK]
set_clock_latency 0 [get_clocks MASTER_CLK]

create_generated_clock -master_clock MASTER_CLK -source [get_ports CLK] \
                       -name "ALU_CLK" [get_port U0_ClkDiv/o_div_clk] \
                       -divide_by 2
set_clock_uncertainty -setup 0.2 [get_clocks ALU_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks ALU_CLK]

					   
set_dont_touch_network [get_clocks {MASTER_CLK ALU_CLK}]
set_dont_touch_network [get_ports RST]

####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
     
set in_delay  [expr 0.2*$ALU_CLK_PER]
set out_delay [expr 0.2*$ALU_CLK_PER]

#Constrain Input Paths
set_input_delay $in_delay -clock ALU_CLK [get_port ALU_FUN]
set_input_delay $in_delay -clock ALU_CLK [get_port ALU_Enable]
set_input_delay $in_delay -clock ALU_CLK [get_port ALU_A]
set_input_delay $in_delay -clock ALU_CLK [get_port ALU_B]

#Constrain Output Paths
set_output_delay $out_delay -clock ALU_CLK [get_port ALU_VLD]
set_output_delay $out_delay -clock ALU_CLK [get_port ALU_OUT]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port ALU_A]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port ALU_B]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port ALU_FUN]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port ALU_Enable]

#set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports {ALU_A ALU_B ALU_FUN ALU_Enable}]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################

set_load 50 [get_port ALU_VLD]
set_load 50 [get_port ALU_OUT]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
                         -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
		       -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" \
		       -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################

set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile -map_effort high 

#############################################################################
# Write out Design after initial compile
#############################################################################

write_file -format verilog -hierarchy -output ALU_TOP_Netlist.v
write_file -format ddc     -hierarchy -output ALU_TOP_Netlist.ddc
write_sdc  -nosplit ALU_TOP.sdc
write_sdf           ALU_TOP.sdf

################# reporting #######################

report_area -hierarchy > area.rpt
report_power -hierarchy > power.rpt
report_timing -max_paths 100 -delay_type min > hold.rpt
report_timing -max_paths 100 -delay_type max > setup.rpt
report_clock -attributes > clocks.rpt
report_constraint -all_violators > constraints.rpt

################# starting graphical user interface #######################

#gui_start

#exit
