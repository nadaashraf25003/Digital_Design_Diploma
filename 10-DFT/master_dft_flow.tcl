####################################################################################
# ==================================================================================
#                     MASTER DESIGN FOR TESTABILITY (DFT) SCRIPT
#                           Synopsys DFT Compiler (DC-DFT)
# ==================================================================================
# This unified script merges all DFT concepts, scan chain architecture, test protocols,
# scan signal definitions, Pre/Post-DFT DRC checking, test-ready compilation, scan
# insertion, test coverage estimation, and comprehensive reporting across all DFT labs.
####################################################################################

puts "================================================================="
puts "                 STEP 1: DFT CONFIGURATION & SETUP               "
puts "================================================================="

# 1.1 Top Module & Directory Variables
set TOP_MODULE         "System_Top"
set RESULTS_DIR        "./results"
set REPORTS_DIR        "./reports"
set WORK_DIR           "./work"

file mkdir $RESULTS_DIR
file mkdir $REPORTS_DIR
file mkdir $WORK_DIR

define_design_lib work -path $WORK_DIR

# 1.2 Path Settings (RTL & Standard Cell Libraries)
set LIB_PATH           "/home/ICer/Labs/std_cells"
set RTL_PATH           "/home/ICer/Labs/rtl"

lappend search_path $LIB_PATH
lappend search_path $RTL_PATH

# 1.3 Target & Link Libraries (Multi-Corner DBs)
set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

set target_library [list $SSLIB $TTLIB $FFLIB]
set link_library   [list * $SSLIB $TTLIB $FFLIB]


####################################################################################
# SECTION 2: READING RTL & LINKING DESIGN
####################################################################################
puts "================================================================="
puts "                 STEP 2: READING & LINKING RTL                   "
puts "================================================================="

set file_format verilog

read_file -format $file_format ALU.v
read_file -format $file_format ClkDiv.v
read_file -format $file_format CLK_GATE.v
read_file -format $file_format RegFile.v
read_file -format $file_format mux2X1.v
read_file -format $file_format System_Top.v

current_design $TOP_MODULE
link
check_design > $REPORTS_DIR/check_design_pre_dft.rpt


####################################################################################
# SECTION 3: SOURCING DESIGN CONSTRAINTS & CASE ANALYSIS
####################################################################################
puts "================================================================="
puts "                 STEP 3: APPLYING TIMING CONSTRAINTS             "
puts "================================================================="

# 3.1 Netlist Cleanliness
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

# 3.2 Source Functional Constraints
source ./cons.tcl

# 3.3 Set Case Analysis for Functional Synthesis (test_mode = 0)
if {[sizeof_collection [get_ports -quiet test_mode]] > 0} {
    set_case_analysis 0 [get_ports test_mode]
}


####################################################################################
# SECTION 4: SCAN CHAIN CONFIGURATION & TEST-READY COMPILE
####################################################################################
puts "================================================================="
puts "        STEP 4: CONFIGURE SCAN ARCHITECTURE & COMPILE -SCAN      "
puts "================================================================="

# 4.1 Configure Scan Chains
# -clock_mixing no_mix: Clocks from different domains are never mixed in the same scan chain
# -style multiplexed_flip_flop: Replaces DFF with Muxed Scan-DFF
# -replace true: Replaces non-scan cells with scan equivalents
# -max_length: Maximum number of scan flip-flops per chain
set_scan_configuration -clock_mixing no_mix \
                       -style multiplexed_flip_flop \
                       -replace true \
                       -max_length 100

# 4.2 Initial Test-Ready Compile (Replaces standard DFFs with Scan-DFFs)
compile -scan


####################################################################################
# SECTION 5: TEST PROTOCOL TIMING & DFT SIGNAL DEFINITIONS
####################################################################################
puts "================================================================="
puts "             STEP 5: DEFINE DFT SIGNALS & TEST PROTOCOL          "
puts "================================================================="

# 5.1 Setting Test Timing Protocol Variables (Preclock Measure Protocol)
set test_default_period       100
set test_default_delay        0
set test_default_bidir_delay  0
set test_default_strobe       20
set test_default_strobe_width 0

# 5.2 Define Dedicated DFT Test Signals
# Scan Clock (active during test shift/capture)
if {[sizeof_collection [get_ports -quiet scan_clk]] > 0} {
    set_dft_signal -port [get_ports scan_clk] -type ScanClock -view existing_dft -timing {30 60}
} else {
    set_dft_signal -port [get_ports CLK]      -type ScanClock -view existing_dft -timing {30 60}
}

# Scan Reset (active-low asynchronous reset)
if {[sizeof_collection [get_ports -quiet scan_rst]] > 0} {
    set_dft_signal -port [get_ports scan_rst] -type Reset -view existing_dft -active_state 0
} elseif {[sizeof_collection [get_ports -quiet RST]] > 0} {
    set_dft_signal -port [get_ports RST]      -type Reset -view existing_dft -active_state 0
}

# Test Mode Control (forces scan-safe logic and bypasses clock dividers)
if {[sizeof_collection [get_ports -quiet test_mode]] > 0} {
    set_dft_signal -port [get_ports test_mode] -type Constant -view existing_dft -active_state 1
    set_dft_signal -port [get_ports test_mode] -type TestMode -view spec         -active_state 1
}

# Scan Enable (SE: 1 = Shift Mode, 0 = Capture Mode)
set_dft_signal -port [get_ports SE] -type ScanEnable -view spec -active_state 1 -usage scan

# Scan Data In (SI) and Scan Data Out (SO) Ports
set_dft_signal -port [get_ports SI] -type ScanDataIn  -view spec
set_dft_signal -port [get_ports SO] -type ScanDataOut -view spec

# 5.3 Create Internal Test Protocol
create_test_protocol


####################################################################################
# SECTION 6: PRE-DFT DESIGN RULE CHECKING (DRC)
####################################################################################
puts "================================================================="
puts "                 STEP 6: PRE-DFT DRC VERIFICATION                "
puts "================================================================="

# Verifies testability rules (clock controllability, reset controllability)
dft_drc -verbose > $REPORTS_DIR/pre_dft_drc.rpt


####################################################################################
# SECTION 7: PREVIEW DFT & INSERT SCAN CHAINS
####################################################################################
puts "================================================================="
puts "                 STEP 7: INSERTING SCAN CHAINS                   "
puts "================================================================="

# 7.1 Preview Scan Chains & Cell Allocations
preview_dft -show scan_summary > $REPORTS_DIR/preview_dft.rpt

# 7.2 Insert Scan Chains (Stitch SDFFs together)
insert_dft

# 7.3 Incremental Compile for Timing & Routing Recovery
compile -scan -incremental


####################################################################################
# SECTION 8: POST-DFT DRC & TEST COVERAGE ESTIMATION
####################################################################################
puts "================================================================="
puts "          STEP 8: POST-DFT DRC & TEST COVERAGE REPORT            "
puts "================================================================="

# Run post-DFT DRC and compute estimated fault coverage
dft_drc -verbose -coverage_estimate > $REPORTS_DIR/post_dft_drc_coverage.rpt


####################################################################################
# SECTION 9: EXPORTING POST-DFT DELIVERABLES
####################################################################################
puts "================================================================="
puts "                 STEP 9: EXPORTING DFT DELIVERABLES              "
puts "================================================================="

# 9.1 Netlist & Database (clean names, no assign statements)
change_names -rules verilog -hierarchy
write_file -format verilog -hierarchy -output $RESULTS_DIR/${TOP_MODULE}_dft.v
write_file -format ddc     -hierarchy -output $RESULTS_DIR/${TOP_MODULE}_dft.ddc

# 9.2 STIL Procedure File (SPF) for TetraMAX ATPG
write_test_protocol -output $RESULTS_DIR/${TOP_MODULE}_dft.spf

# 9.3 Post-DFT Constraints
write_sdc -nosplit $RESULTS_DIR/${TOP_MODULE}_dft.sdc


####################################################################################
# SECTION 10: QUALITY OF RESULTS & DFT REPORTS
####################################################################################
puts "================================================================="
puts "                 STEP 10: GENERATING DFT REPORTS                 "
puts "================================================================="

report_area -hierarchy                                > $REPORTS_DIR/area_dft.rpt
report_power -hierarchy                               > $REPORTS_DIR/power_dft.rpt
report_timing -max_paths 50 -delay_type max           > $REPORTS_DIR/setup_dft.rpt
report_timing -max_paths 50 -delay_type min           > $REPORTS_DIR/hold_dft.rpt
report_clock -attributes                              > $REPORTS_DIR/clocks_dft.rpt
report_constraint -all_violators                      > $REPORTS_DIR/constraints_dft.rpt
report_scan_path -view real -chain all                > $REPORTS_DIR/scan_paths.rpt
report_dft_signal -view existing_dft                  > $REPORTS_DIR/dft_signals.rpt

puts "================================================================="
puts "                DFT INSERTION COMPLETED SUCCESSFULLY!            "
puts "================================================================="

# Uncomment to launch DC GUI:
# gui_start

# exit
