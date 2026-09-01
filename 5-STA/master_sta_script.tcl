####################################################################################
# ==================================================================================
#                     MASTER STATIC TIMING ANALYSIS (STA) SCRIPT
#                               Synopsys PrimeTime (PT)
# ==================================================================================
# This unified script merges all STA principles, setup/hold checks, OCV derating,
# clock skew/uncertainty modeling, timing exceptions, and comprehensive timing
# report generation for pre-layout and post-layout verification.
####################################################################################

puts "================================================================="
puts "                 STEP 1: STA ENVIRONMENT & SETUP                 "
puts "================================================================="

# 1.1 Top Module & Directory Variables
set TOP_MODULE         "System_Top"
set REPORTS_DIR        "./sta_reports"
set NETLIST_DIR        "../4-Synthesis/results"
set SPEF_DIR           "./parasitics"             ;# For post-layout STA

file mkdir $REPORTS_DIR

# 1.2 Search Path & Libraries
set LIB_PATH           "/home/ICer/Labs/std_cells"
lappend search_path $LIB_PATH
lappend search_path $NETLIST_DIR

# Multi-Corner DBs (PVT corners)
set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"   ;# Max delay (Setup analysis)
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"   ;# Min delay (Hold analysis)
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"     ;# Typical

# PrimeTime Link Libraries (Target & hard macros)
set link_path [list * $SSLIB $FFLIB $TTLIB]


####################################################################################
# SECTION 2: DESIGN INGESTION & LINKING
####################################################################################
puts "================================================================="
puts "             STEP 2: READING NETLIST & LINKING                   "
puts "================================================================="

# 2.1 Read Gate-Level Verilog Netlist
read_verilog $NETLIST_DIR/${TOP_MODULE}_netlist.v

# 2.2 Set Current Design & Link
current_design $TOP_MODULE
link

# 2.3 Post-Layout Parasitic Annotation (Optional: un-comment for post-route STA)
# read_parasitics -format SPEF -increment $SPEF_DIR/${TOP_MODULE}.spef


####################################################################################
# SECTION 3: TIMING CONSTRAINTS & SDC APPLICATION
####################################################################################
puts "================================================================="
puts "                 STEP 3: SOURCING SDC CONSTRAINTS                "
puts "================================================================="

# 3.1 Read SDC Constraints
read_sdc $NETLIST_DIR/${TOP_MODULE}.sdc

# 3.2 Pre-Analysis Timing Checks
check_timing -verbose > $REPORTS_DIR/check_timing.rpt


####################################################################################
# SECTION 4: ON-CHIP VARIATION (OCV) & CRPR / CPPR SETUP
####################################################################################
puts "================================================================="
puts "          STEP 4: ON-CHIP VARIATION (OCV) & DERATING             "
puts "================================================================="

# Set Timing Derate Factors (Accounts for local PVT variation across the die)
# Setup (Max delay): Derate launch early (speed up), capture late (slow down)
set_timing_derate -early 0.95 -cell_delay
set_timing_derate -late  1.05 -cell_delay
set_timing_derate -early 0.95 -net_delay
set_timing_derate -late  1.05 -net_delay

# Common Path Pessimism Removal (CPPR / CRPR)
# Eliminates artificial pessimism on shared clock tree branches
set timing_remove_clock_reconvergence_pessimism true


####################################################################################
# SECTION 5: TIMING PATH GROUPING
####################################################################################
puts "================================================================="
puts "                 STEP 5: CUSTOM PATH GROUPING                    "
puts "================================================================="

group_path -name INREG  -from [all_inputs]
group_path -name REGOUT -to   [all_outputs]
group_path -name INOUT  -from [all_inputs] -to [all_outputs]
group_path -name REG2REG -from [all_registers] -to [all_registers]


####################################################################################
# SECTION 6: COMPREHENSIVE STA TIMING ANALYSIS & REPORTS
####################################################################################
puts "================================================================="
puts "                 STEP 6: GENERATING STA REPORTS                  "
puts "================================================================="

# 6.1 Setup Analysis (Max Delay Paths - Critical Path, WNS, TNS)
report_timing -delay_type max \
              -max_paths 50 \
              -path_type full_clock_expanded \
              -nosplit \
              -input_pins \
              -nets \
              -transition_time \
              -capacitance > $REPORTS_DIR/setup_timing.rpt

# 6.2 Hold Analysis (Min Delay Paths - Race Conditions)
report_timing -delay_type min \
              -max_paths 50 \
              -path_type full_clock_expanded \
              -nosplit \
              -input_pins \
              -nets \
              -transition_time \
              -capacitance > $REPORTS_DIR/hold_timing.rpt

# 6.3 Clock Skew & Clock Latency Summary
report_clock_timing -type skew -verbose > $REPORTS_DIR/clock_skew.rpt
report_clock_timing -type latency -verbose > $REPORTS_DIR/clock_latency.rpt

# 6.4 Constraint Violations Summary (DRC + Timing)
report_constraint -all_violators -verbose > $REPORTS_DIR/constraint_violators.rpt

# 6.5 Quality of Results & Global Slack Summary
report_qor > $REPORTS_DIR/sta_qor.rpt

# 6.6 Recovery and Removal Analysis (Asynchronous Reset De-assertion)
report_timing -delay_type max -from [get_ports -quiet {RST rst_n}] > $REPORTS_DIR/recovery.rpt
report_timing -delay_type min -from [get_ports -quiet {RST rst_n}] > $REPORTS_DIR/removal.rpt

# 6.7 Analysis Coverage & Unconstrained Paths Check
report_analysis_coverage > $REPORTS_DIR/analysis_coverage.rpt

puts "================================================================="
puts "             STATIC TIMING ANALYSIS COMPLETED!                   "
puts "================================================================="

# Uncomment to launch PrimeTime GUI:
# start_gui

# Exit batch mode:
# exit
