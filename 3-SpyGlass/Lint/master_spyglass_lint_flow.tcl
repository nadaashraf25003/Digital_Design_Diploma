####################################################################################
# ==================================================================================
#                  MASTER SPYGLASS LINT VERIFICATION SCRIPT
#                       Synopsys SpyGlass Lint Flow
# ==================================================================================
# This unified script covers:
#   1. Environment & File Setup (RTL sources, filelists, standard cells)
#   2. Project & Methodology Configuration (GuideWare RTL Handoff)
#   3. Execution of the 'lint/lint_rtl' Goal with Comprehensive Rule Checks
#   4. Waiver Application (.awl) & Detailed Report Generation
# ==================================================================================
####################################################################################

puts "================================================================="
puts "           STEP 1: SPYGLASS LINT ENVIRONMENT & FILE SETUP        "
puts "================================================================="

# ----------------------------------------------------------------------------------
# 1.1 Variables & Directory Definitions
# ----------------------------------------------------------------------------------
set TOP_MODULE         "ALU_TOP"
set WORK_DIR           [pwd]
set REPORTS_DIR        "./spyglass_reports"
set RTL_DIR            "../rtl"
set STD_CELLS_DIR      "../std_cells"
set WAIVER_FILE        "./lint_waivers.awl"

file mkdir $REPORTS_DIR

# ----------------------------------------------------------------------------------
# 1.2 Initialize SpyGlass Project
# ----------------------------------------------------------------------------------
new_project lint_verification_prj -force

# 1.3 Read RTL Design Files
# Option A: Read Source Filelist (.f) if available
if {[file exists "$RTL_DIR/rtl.f"]} {
    puts "--- Reading RTL Filelist: $RTL_DIR/rtl.f ---"
    read_file -type sourcelist "$RTL_DIR/rtl.f"
} else {
    # Option B: Read individual Verilog files
    puts "--- Reading Verilog RTL Sources ---"
    read_file -type verilog [list \
        $RTL_DIR/ALU_TOP.v \
        $RTL_DIR/ALU.v \
        $RTL_DIR/ClkDiv.v \
        $RTL_DIR/CLK_GATE.v \
        $RTL_DIR/RegFile.v \
        $RTL_DIR/DATA_SYNC.v \
        $RTL_DIR/RST_SYNC.v \
        $RTL_DIR/SER_2_PAR.v \
        $RTL_DIR/CRC.v \
    ]
}

# 1.4 Read Technology Standard Cell Libraries (if available)
if {[file exists "$STD_CELLS_DIR/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.lib"]} {
    read_file -type gateslib "$STD_CELLS_DIR/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.lib"
}

# 1.5 Read Waivers (if available)
if {[file exists $WAIVER_FILE]} {
    read_file -type awl $WAIVER_FILE
}

# ----------------------------------------------------------------------------------
# 1.6 Global Project Options & Methodology Setup
# ----------------------------------------------------------------------------------
set_option projectwdir                  $WORK_DIR
set_option language_mode                mixed
set_option designread_enable_synthesis  no
set_option designread_disable_flatten   no
set_option top                          $TOP_MODULE
set_option active_methodology           $SPYGLASS_HOME/GuideWare/latest/block/rtl_handoff

current_methodology $SPYGLASS_HOME/GuideWare/latest/block/rtl_handoff


####################################################################################
# SECTION 2: CONFIGURE & EXECUTE LINT GOAL (lint/lint_rtl)
####################################################################################
puts "================================================================="
puts "             STEP 2: RUNNING GOAL: lint/lint_rtl                 "
puts "================================================================="

current_goal lint/lint_rtl -alltop

# Enable advanced structural and coding rule checks
set_goal_option addrules { UnloadedOutTerm-ML W116 W123 W240 W415 }

if {[file exists $WAIVER_FILE]} {
    set_goal_option default_waiver_file $WAIVER_FILE
}

# Run the linting goal
run_goal


####################################################################################
# SECTION 3: GENERATE DETAILED LINT REPORTS
####################################################################################
puts "================================================================="
puts "             STEP 3: GENERATING LINT REPORTS                     "
puts "================================================================="

# 3.1 Concise Report of All Filtered Violations
capture $REPORTS_DIR/moresimple.rpt     { write_report moresimple }

# 3.2 High-Level Summary by Severity & RuleGroup
capture $REPORTS_DIR/summary.rpt        { write_report summary }

# 3.3 Elaboration Summary Report
capture $REPORTS_DIR/elab_summary.rpt   { write_report elab_summary }

puts "================================================================="
puts "         SPYGLASS LINT FLOW COMPLETED SUCCESSFULLY!              "
puts "         Reports saved in: $REPORTS_DIR                          "
puts "================================================================="

# Save Project
save_project
