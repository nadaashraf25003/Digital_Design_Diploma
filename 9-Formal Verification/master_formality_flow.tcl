####################################################################################
# ==================================================================================
#               MASTER FORMAL EQUIVALENCE CHECKING (LEC) SCRIPT
#                               Synopsys Formality (FM)
# ==================================================================================
# This unified script merges all Formal Verification concepts, SVF guidance files,
# Reference vs. Implementation containers, DFT scan chain handling, compare point
# matching, automated verification, diagnosis, and comprehensive reporting.
####################################################################################

puts "================================================================="
puts "          STEP 1: FORMALITY CONFIGURATION & SETUP                "
puts "================================================================="

# 1.1 Top Module & Directory Definitions
set TOP_MODULE         "System_Top"
set REPORTS_DIR        "./fm_reports"
set RTL_DIR            "../4-Synthesis/rtl"
set NETLIST_DIR        "../4-Synthesis/results"
set DFT_DIR            "../10-DFT/results"
set STD_CELLS_DIR      "/home/ICer/Labs/std_cells"

file mkdir $REPORTS_DIR

# 1.2 Technology Standard Cell DB Files (Multi-Corner PVT)
set SSLIB "$STD_CELLS_DIR/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "$STD_CELLS_DIR/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "$STD_CELLS_DIR/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

# 1.3 Formality Guidance & Automated Setup
set synopsys_auto_setup true

# 1.4 Setup Verification Format (SVF) Guidance File from Design Compiler
# Note: SVF records all netlist logic transformations (register retiming, clock gating, FSM re-encoding)
set_svf "$NETLIST_DIR/${TOP_MODULE}.svf"


####################################################################################
# SECTION 2: REFERENCE CONTAINER (Golden Model - RTL or Pre-DFT Netlist)
####################################################################################
puts "================================================================="
puts "                 STEP 2: REFERENCE CONTAINER (Ref)               "
puts "================================================================="

# 2.1 Read Reference RTL Source Files
# Option A: Read all RTL Verilog files
read_verilog -container Ref [list \
    $RTL_DIR/System_Top.v \
    $RTL_DIR/ALU.v \
    $RTL_DIR/ClkDiv.v \
    $RTL_DIR/CLK_GATE.v \
    $RTL_DIR/RegFile.v \
    $RTL_DIR/DATA_SYNC.v \
    $RTL_DIR/RST_SYNC.v \
    $RTL_DIR/SER_2_PAR.v \
    $RTL_DIR/CRC.v \
]

# 2.2 Read Reference Technology Libraries
read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

# 2.3 Set Top Reference Design
set_reference_design $TOP_MODULE
set_top $TOP_MODULE


####################################################################################
# SECTION 3: IMPLEMENTATION CONTAINER (Synthesized / DFT / Routed Netlist)
####################################################################################
puts "================================================================="
puts "             STEP 3: IMPLEMENTATION CONTAINER (Imp)              "
puts "================================================================="

# 3.1 Read Implementation Netlist Files
# Option A: Read Verilog Netlist
# read_verilog -container Imp "$NETLIST_DIR/${TOP_MODULE}_netlist.v"

# Option B: Read Synopsys Binary Database (DDC format)
read_ddc -container Imp "$NETLIST_DIR/${TOP_MODULE}.ddc"

# 3.2 Read Implementation Technology Libraries
read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

# 3.3 Set Top Implementation Design
set_implementation_design $TOP_MODULE
set_top $TOP_MODULE


####################################################################################
# SECTION 4: DFT SCAN CHAIN HANDLING & FUNCTIONAL MODE CONSTANTS
####################################################################################
puts "================================================================="
puts "          STEP 4: DFT & TEST PORT CONSTRAINTS                    "
puts "================================================================="

# When verifying against a DFT Netlist with inserted scan chains:
# 4.1 Do NOT verify dedicated scan data in/out ports (they only exist post-DFT)
set_dont_verify_points -type port Ref:/WORK/*/SI -quiet
set_dont_verify_points -type port Imp:/WORK/*/SI -quiet
set_dont_verify_points -type port Ref:/WORK/*/SO -quiet
set_dont_verify_points -type port Imp:/WORK/*/SO -quiet

# 4.2 Set ATPG Test Controls to Inactive (Force Functional Mode)
# Forces test_mode and scan_enable to logic 0 during formal equivalence checking
set_constant Ref:/WORK/*/test_mode 0 -quiet
set_constant Imp:/WORK/*/test_mode 0 -quiet
set_constant Ref:/WORK/*/SE        0 -quiet
set_constant Imp:/WORK/*/SE        0 -quiet
set_constant Ref:/WORK/*/scan_rst  1 -quiet
set_constant Imp:/WORK/*/scan_rst  1 -quiet


####################################################################################
# SECTION 5: MATCHING COMPARE POINTS
####################################################################################
puts "================================================================="
puts "                 STEP 5: MATCHING COMPARE POINTS                 "
puts "================================================================="

# Automatically matches compare points (Primary Outputs, Registers/Latches, Black Boxes)
match

# Generate matched and unmatched points summary reports
report_matched_points   > "$REPORTS_DIR/matched_points.rpt"
report_unmatched_points > "$REPORTS_DIR/unmatched_points.rpt"


####################################################################################
# SECTION 6: RUNNING VERIFICATION & DIAGNOSIS
####################################################################################
puts "================================================================="
puts "                 STEP 6: RUNNING FORMAL VERIFICATION             "
puts "================================================================="

# Execute formal mathematical proof
set successful [verify]

if {!$successful} {
    puts "############################################################"
    puts "#  WARNING: FORMAL VERIFICATION FAILED! RUNNING DIAGNOSIS  #"
    puts "############################################################"
    diagnose
    analyze_points -failing > "$REPORTS_DIR/failing_diagnosis.rpt"
} else {
    puts "############################################################"
    puts "#  SUCCESS: DESIGNS ARE FORMALLY EQUIVALENT (VERIFIED)!    #"
    puts "############################################################"
}


####################################################################################
# SECTION 7: EXPORTING FORMALITY REPORTS
####################################################################################
puts "================================================================="
puts "                 STEP 7: WRITING FORMAL REPORTS                  "
puts "================================================================="

report_passing_points    > "$REPORTS_DIR/passing_points.rpt"
report_failing_points    > "$REPORTS_DIR/failing_points.rpt"
report_aborted_points    > "$REPORTS_DIR/aborted_points.rpt"
report_unverified_points > "$REPORTS_DIR/unverified_points.rpt"
report_status            > "$REPORTS_DIR/formal_status.rpt"

puts "================================================================="
puts "               FORMALITY FLOW COMPLETED!                         "
puts "================================================================="

# Uncomment to inspect equivalence in GUI:
# start_gui

# exit
