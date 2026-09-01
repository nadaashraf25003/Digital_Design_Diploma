####################################################################################
# ==================================================================================
#                     MASTER UNIFIED SYNTHESIS & TIMING SCRIPT
#                               Synopsys Design Compiler (DC)
# ==================================================================================
# This unified script merges all concepts, best practices, constraint formulations,
# optimization options, and reporting workflows used across all synthesis labs and
# assignments in the Digital Design Diploma.
####################################################################################

####################################################################################
# SECTION 1: USER & DESIGN CONFIGURATION
####################################################################################
puts "================================================================="
puts "                 STEP 1: CONFIGURATION & SETUP                   "
puts "================================================================="

# 1.1 Top-level Module Name
set TOP_MODULE         "System_Top"

# 1.2 Directories Setup
set RESULTS_DIR        "./results"
set REPORTS_DIR        "./reports"
set WORK_DIR           "./work"

file mkdir $RESULTS_DIR
file mkdir $REPORTS_DIR
file mkdir $WORK_DIR

# 1.3 Define Working Library Directory
define_design_lib work -path $WORK_DIR

# 1.4 Path Settings (RTL & Standard Cell DBs)
# Note: Update paths according to your environment
set LIB_PATH           "/home/ICer/Labs/std_cells"
set RTL_PATH           "/home/ICer/Labs/rtl"

lappend search_path $LIB_PATH
lappend search_path $RTL_PATH

# 1.5 Target & Link Library Setup (Multi-Corner PVT: SS, TT, FF)
set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"   ;# Slow-Slow (Max delay / Setup analysis)
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"     ;# Typical-Typical
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"   ;# Fast-Fast (Min delay / Hold analysis)

# Standard Cell Libraries (Target library for technology mapping)
set target_library [list $SSLIB $TTLIB $FFLIB]

# Link Libraries (Includes Target Libs, Memory Macros, Hard IPs, and Search Cache '*')
set link_library   [list * $SSLIB $TTLIB $FFLIB]


####################################################################################
# SECTION 2: READING RTL FILES & ELABORATION
####################################################################################
puts "================================================================="
puts "                 STEP 2: READING & LINKING RTL                   "
puts "================================================================="

set file_format verilog

# Method A: Direct read_file (commonly used in labs)
# read_file -format $file_format [list System_Top.v ALU.v ClkDiv.v CLK_GATE.v RegFile.v DATA_SYNC.v RST_SYNC.v SER_2_PAR.v CRC.v]

# Method B: analyze & elaborate (advanced / parameter override support)
# analyze -format $file_format [list System_Top.v ALU.v ClkDiv.v CLK_GATE.v RegFile.v DATA_SYNC.v RST_SYNC.v SER_2_PAR.v CRC.v]
# elaborate $TOP_MODULE

# Default read command:
read_file -format $file_format System_Top.v
# (Add any additional submodules here as needed)

# 2.1 Set Current Top-Level Design
current_design $TOP_MODULE

# 2.2 Link All Modules & Macros
link

# 2.3 Check Design Consistency before constraints
check_design > $REPORTS_DIR/check_design_pre_synth.rpt


####################################################################################
# SECTION 3: DC SYNTHESIS & NETLIST CLEANLINESS VARIABLES
####################################################################################
puts "================================================================="
puts "          STEP 3: NETLIST CLEANLINESS & RULES CONFIG             "
puts "================================================================="

# Prevent assign statements, feedthroughs, and multi-driven ports in the netlist
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

# Preserve Pre-mapped hard cells or dedicated logic (e.g., Integrated Clock Gating / Custom Cells)
# set_dont_touch [get_designs CLK_GATE]
# set_dont_touch [get_cells U0_CLK_GATE]


####################################################################################
# SECTION 4: PATH GROUPING FOR TIMING OPTIMIZATION
####################################################################################
puts "================================================================="
puts "                 STEP 4: CUSTOM PATH GROUPS                      "
puts "================================================================="
# DC optimizes the worst path in each path group independently.
# Grouping prevents critical I/O paths from starving internal Reg-to-Reg optimization.

group_path -name INREG  -from [all_inputs]
group_path -name REGOUT -to [all_outputs]
group_path -name INOUT  -from [all_inputs] -to [all_outputs]


####################################################################################
# SECTION 5: COMPLETE DESIGN TIMING & ENVIRONMENT CONSTRAINTS
####################################################################################
puts "================================================================="
puts "              STEP 5: APPLYING TIMING CONSTRAINTS                "
puts "================================================================="

# ----------------------------------------------------------------------------------
# 5.1 Clock Parameters Definition
# ----------------------------------------------------------------------------------
set CLK_NAME           "MASTER_CLK"
set CLK_PER            10.0                     ;# Primary Clock Period (ns)
set CLK_SETUP_SKEW     0.2                      ;# Clock setup uncertainty (ns)
set CLK_HOLD_SKEW      0.1                      ;# Clock hold uncertainty (ns)
set CLK_LAT            0.0                      ;# Clock network/source latency (ns)
set CLK_RISE           0.05                     ;# Clock rise transition/slew (ns)
set CLK_FALL           0.05                     ;# Clock fall transition/slew (ns)

# ----------------------------------------------------------------------------------
# 5.2 Primary / Master Clock Definition
# ----------------------------------------------------------------------------------
create_clock -name $CLK_NAME -period $CLK_PER -waveform [list 0 [expr $CLK_PER/2.0]] [get_ports CLK]

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK_NAME]
set_clock_uncertainty -hold  $CLK_HOLD_SKEW  [get_clocks $CLK_NAME]
set_clock_transition  -rise  $CLK_RISE       [get_clocks $CLK_NAME]
set_clock_transition  -fall  $CLK_FALL       [get_clocks $CLK_NAME]
set_clock_latency     $CLK_LAT               [get_clocks $CLK_NAME]

# ----------------------------------------------------------------------------------
# 5.3 Generated Clocks (Divided Clocks & Gated Clocks)
# ----------------------------------------------------------------------------------
# A. Divided Clock (e.g., divided by 2 or N from master clock)
set REG_CLK_PER [expr $CLK_PER * 2]
create_generated_clock -name "REG_CLK" \
                       -source [get_ports CLK] \
                       -master_clock $CLK_NAME \
                       -divide_by 2 \
                       [get_pins -hierarchical *o_div_clk] ;# or port pin

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks REG_CLK]
set_clock_uncertainty -hold  $CLK_HOLD_SKEW  [get_clocks REG_CLK]

# B. Gated Clock (Gated branch generated from master clock)
create_generated_clock -name "ALU_CLK" \
                       -source [get_ports CLK] \
                       -master_clock $CLK_NAME \
                       -divide_by 1 \
                       [get_pins -hierarchical *GATED_CLK] ;# or clock gate output pin

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks ALU_CLK]
set_clock_uncertainty -hold  $CLK_HOLD_SKEW  [get_clocks ALU_CLK]

# ----------------------------------------------------------------------------------
# 5.4 Clock Networks & Reset Protection (Don't Touch High-Fanout Networks)
# ----------------------------------------------------------------------------------
# Clocks and asynchronous resets are routed during Physical Design (CTS/PnR)
set_dont_touch_network [get_clocks [all_clocks]]
if {[sizeof_collection [get_ports -quiet RST]] > 0} {
    set_dont_touch_network [get_ports RST]
}
if {[sizeof_collection [get_ports -quiet rst_n]] > 0} {
    set_dont_touch_network [get_ports rst_n]
}

# ----------------------------------------------------------------------------------
# 5.5 Clock Domain Relationships & CDC (Clock Domain Crossing)
# ----------------------------------------------------------------------------------
# Option 1: Asynchronous Clock Groups (if multiple asynchronous domains exist)
# set_clock_groups -asynchronous \
#                  -group [get_clocks CLKA_DOMAIN] \
#                  -group [get_clocks CLKB_DOMAIN]

# Option 2: False Paths across async domains
# set_false_path -from [get_clocks CLKA_DOMAIN] -to [get_clocks CLKB_DOMAIN]
# set_false_path -from [get_clocks CLKB_DOMAIN] -to [get_clocks CLKA_DOMAIN]

# Option 3: Constraining CDC Bus Delay (Max Delay for Data Synchronizers)
# set_max_delay 5 -from [get_cells U0_SER_2_PAR/PAR_DATA*] -to [get_cells U0_DATA_SYNC/sync_bus*]

# ----------------------------------------------------------------------------------
# 5.6 Multicycle Paths (MCP)
# ----------------------------------------------------------------------------------
# Example: Reg file to ALU path where data is stable for 2 cycles
# Setup multicycle of N cycles:
# set_multicycle_path -setup 2 -from [get_clocks REG_CLK] -to [get_clocks ALU_CLK]
# Hold multicycle must be adjusted to (N-1) cycles at the destination:
# set_multicycle_path -hold 1  -from [get_clocks REG_CLK] -to [get_clocks ALU_CLK] -end

# ----------------------------------------------------------------------------------
# 5.7 Input and Output Delays
# ----------------------------------------------------------------------------------
# External budget: typically 20% to 30% of target clock period
set in_delay_fast   [expr 0.2 * $CLK_PER]
set out_delay_fast  [expr 0.2 * $CLK_PER]
set in_delay_slow   [expr 0.2 * $REG_CLK_PER]
set out_delay_slow  [expr 0.2 * $REG_CLK_PER]

# Apply input delays (excluding clock and reset ports)
set all_in_except_clk [remove_from_collection [all_inputs] [get_ports {CLK RST rst_n}]]
set_input_delay $in_delay_fast -clock $CLK_NAME $all_in_except_clk

# Apply output delays
set_output_delay $out_delay_fast -clock $CLK_NAME [all_outputs]

# ----------------------------------------------------------------------------------
# 5.8 Driving Cells & Input Transition Modeling
# ----------------------------------------------------------------------------------
# Model realistic drive strength on input ports using standard cell buffer
set DRIVING_CELL    "BUFX2M"
set DRIVING_PIN     "Y"
set_driving_cell -library $SSLIB -lib_cell $DRIVING_CELL -pin $DRIVING_PIN $all_in_except_clk

# ----------------------------------------------------------------------------------
# 5.9 Output Capacitive Load Modeling
# ----------------------------------------------------------------------------------
# Model external capacitance load on all primary outputs (e.g., 0.5 pF)
set_load 0.5 [all_outputs]

# ----------------------------------------------------------------------------------
# 5.10 Operating Conditions (Min / Max PVT Analysis)
# ----------------------------------------------------------------------------------
# Min (Hold analysis / Best case): Fast Corner (-40C, High VDD 1.32V)
# Max (Setup analysis / Worst case): Slow Corner (125C, Low VDD 1.08V)
set_operating_conditions -min_library $FFLIB -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
                         -max_library $SSLIB -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

# ----------------------------------------------------------------------------------
# 5.11 Wire Load Model (Pre-layout Interconnect Estimation)
# ----------------------------------------------------------------------------------
set_wire_load_model -name tsmc13_wl30 -library $SSLIB
set_wire_load_mode enclosed


####################################################################################
# SECTION 6: POWER & CLOCK GATING CONFIGURATION
####################################################################################
puts "================================================================="
puts "             STEP 6: CLOCK GATING & POWER SETUP                  "
puts "================================================================="

# Automatic Clock Gating Insertion:
# Minimum register width for gating (e.g. registers >= 5 bits get ICG cells)
set_clock_gating_style -minimum_bitwidth 5 \
                       -positive_edge_logic {integrated} \
                       -control_point before


####################################################################################
# SECTION 7: MAPPING & OPTIMIZATION (COMPILATION)
####################################################################################
puts "================================================================="
puts "                 STEP 7: COMPILING DESIGN                        "
puts "================================================================="

# Option A: Standard compile with high mapping effort
# compile -map_effort high

# Option B: Standard compile with automatic clock gating insertion
# compile -map_effort high -gate_clock

# Option C: Advanced Compile Ultra (Top QoR with timing & arithmetic optimization)
compile_ultra -gate_clock -no_autoungroup


####################################################################################
# SECTION 8: EXPORTING SYNTHESIS ARTIFACTS & NETLISTS
####################################################################################
puts "================================================================="
puts "                 STEP 8: WRITING OUTPUT FILES                    "
puts "================================================================="

# 8.1 Gate-Level Netlist (Verilog)
write_file -format verilog -hierarchy -output $RESULTS_DIR/${TOP_MODULE}_netlist.v

# 8.2 Synopsys Database (DDC format, saves unmapped/mapped design state)
write_file -format ddc -hierarchy -output $RESULTS_DIR/${TOP_MODULE}.ddc

# 8.3 Standard Design Constraints (SDC format for PnR & STA)
write_sdc -nosplit $RESULTS_DIR/${TOP_MODULE}.sdc

# 8.4 Standard Delay Format (SDF format for gate-level timing simulation)
write_sdf $RESULTS_DIR/${TOP_MODULE}.sdf


####################################################################################
# SECTION 9: QUALITY OF RESULTS (QoR) & TIMING REPORTS
####################################################################################
puts "================================================================="
puts "                 STEP 9: GENERATING REPORTS                      "
puts "================================================================="

# 9.1 Area Report (Hierarchical breakdown)
report_area -hierarchy > $REPORTS_DIR/area.rpt

# 9.2 Power Report (Dynamic, Switching, and Leakage power)
report_power -hierarchy > $REPORTS_DIR/power.rpt

# 9.3 Setup Timing Analysis (Max delay paths)
report_timing -max_paths 100 -delay_type max > $REPORTS_DIR/setup.rpt

# 9.4 Hold Timing Analysis (Min delay paths)
report_timing -max_paths 100 -delay_type min > $REPORTS_DIR/hold.rpt

# 9.5 Clocks and Waveform Attributes
report_clock -attributes > $REPORTS_DIR/clocks.rpt

# 9.6 Timing & DRC Constraint Violations
report_constraint -all_violators > $REPORTS_DIR/constraints.rpt

# 9.7 Quality of Results (QoR) Summary
report_qor > $REPORTS_DIR/qor.rpt

# 9.8 Clock Gating Insertion Summary
report_clock_gating > $REPORTS_DIR/clock_gating.rpt

# 9.9 Resources and Arithmetic Implementations
report_resources -hierarchy > $REPORTS_DIR/resources.rpt


####################################################################################
# SECTION 10: COMPLETION / GUI
####################################################################################
puts "================================================================="
puts "          SYNTHESIS RUN FINISHED SUCCESSFULLY!                   "
puts "================================================================="

# Uncomment to launch DC GUI for schematic inspection:
# gui_start

# Exit DC batch mode:
# exit
