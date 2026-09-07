####################################################################################
# ==================================================================================
#               MASTER SPYGLASS CDC (CLOCK DOMAIN CROSSING) SCRIPT
#                       Synopsys SpyGlass CDC Verification
# ==================================================================================
# This unified script covers the complete automated SpyGlass CDC flow:
#   1. Project & Environment Configuration (RTL, Technology DB, SGDC, SDC)
#   2. Methodology & Goal Setup (GuideWare RTL Handoff)
#   3. Goal 1: cdc/cdc_setup_check (Clock/Reset setup & SGDC translation validation)
#   4. Goal 2: cdc/clock_reset_integrity (Clock/Reset domain glitch & structural checks)
#   5. Goal 3: cdc/cdc_verify_struct (Structural CDC, Synchronizer & Reconvergence check)
#   6. Goal 4: cdc/cdc_verify (Functional CDC, Data stability & FIFO verification)
#   7. Automated Waiver Handling (.awl) & Detailed Report Generation
# ==================================================================================
####################################################################################

puts "================================================================="
puts "           STEP 1: SPYGLASS CDC ENVIRONMENT & FILE SETUP         "
puts "================================================================="

# ----------------------------------------------------------------------------------
# 1.1 Variables & Directory Setup
# ----------------------------------------------------------------------------------
set TOP_MODULE         "top"
set WORK_DIR           [pwd]
set REPORTS_DIR        "./spyglass_reports"
set RTL_DIR            "../rtl"
set STD_CELLS_DIR      "../std_cells"
set SGDC_FILE          "./top.sgdc"
set SDC_FILE           "./top.sdc"
set WAIVER_FILE        "./top_waivers.awl"

file mkdir $REPORTS_DIR

# ----------------------------------------------------------------------------------
# 1.2 Initialize SpyGlass Project
# ----------------------------------------------------------------------------------
new_project cdc_verification_prj -force

# 1.3 Read RTL Design Files
read_file -type verilog [list \
    $RTL_DIR/top.v \
    $RTL_DIR/controller.v \
    $RTL_DIR/register_file.v \
    $RTL_DIR/mult_unit.v \
    $RTL_DIR/Async_fifo.v \
    $RTL_DIR/fifo_mem.v \
    $RTL_DIR/fifo_wr.v \
    $RTL_DIR/fifo_rd.v \
    $RTL_DIR/bit_sync.v \
    $RTL_DIR/data_sync.v \
    $RTL_DIR/DF_Sync.v \
    $RTL_DIR/clk_divider_1.v \
    $RTL_DIR/clk_divider_2.v \
    $RTL_DIR/clock_gate.v \
    $RTL_DIR/par_to_ser.v \
    $RTL_DIR/ser_to_par.v \
]

# 1.4 Read Technology Standard Cell Libraries
read_file -type gateslib "$STD_CELLS_DIR/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.lib"

# 1.5 Read Constraints (SGDC & SDC)
if {[file exists $SGDC_FILE]} {
    read_file -type sgdc $SGDC_FILE
}
if {[file exists $SDC_FILE]} {
    read_file -type sdc $SDC_FILE
}

# 1.6 Read Waiver File (if exists)
if {[file exists $WAIVER_FILE]} {
    read_file -type awl $WAIVER_FILE
}

# ----------------------------------------------------------------------------------
# 1.7 Global Project Options & Methodology
# ----------------------------------------------------------------------------------
set_option projectwdir                  $WORK_DIR
set_option language_mode                mixed
set_option designread_enable_synthesis  yes
set_option designread_disable_flatten   no
set_option top                          $TOP_MODULE
set_option active_methodology           $SPYGLASS_HOME/GuideWare/latest/block/rtl_handoff

current_methodology $SPYGLASS_HOME/GuideWare/latest/block/rtl_handoff


####################################################################################
# SECTION 2: GOAL 1 - cdc/cdc_setup_check
####################################################################################
puts "================================================================="
puts "             STEP 2: RUNNING cdc/cdc_setup_check                 "
puts "================================================================="
# Purpose: Validates clock/reset definitions, checks SDC-to-SGDC translation,
# and verifies that all domains and IO ports are constrained.

current_goal cdc/cdc_setup_check -alltop
set_goal_option sdc2sgdc yes

run_goal

# Export Setup Reports
capture $REPORTS_DIR/1_cdc_setup_check_moresimple.rpt { write_report moresimple }
capture $REPORTS_DIR/1_cdc_setup_check_summary.rpt    { write_report summary }


####################################################################################
# SECTION 3: GOAL 2 - cdc/clock_reset_integrity
####################################################################################
puts "================================================================="
puts "           STEP 3: RUNNING cdc/clock_reset_integrity             "
puts "================================================================="
# Purpose: Checks for glitches on clock/reset paths, floating resets, internally
# generated clocks, and validates clock gating circuitry.

current_goal cdc/clock_reset_integrity -alltop
set_goal_option sdc2sgdc yes
set_parameter use_inferred_clocks yes

run_goal

# Export Clock/Reset Integrity Reports
capture $REPORTS_DIR/2_clock_reset_integrity_moresimple.rpt { write_report moresimple }
capture $REPORTS_DIR/2_clock_reset_integrity_summary.rpt    { write_report summary }


####################################################################################
# SECTION 4: GOAL 3 - cdc/cdc_verify_struct
####################################################################################
puts "================================================================="
puts "             STEP 4: RUNNING cdc/cdc_verify_struct               "
puts "================================================================="
# Purpose: Performs structural analysis on all clock domain crossings:
# - Unsynchronized crossings (Ac_unsync01, Ac_unsync02)
# - Reconvergence of synchronized signals (Ac_conv01, Ac_conv02)
# - Glitch on control/enable crossings (Ac_glitch01)
# - Reset synchronizer topology (Ar_sync01, Ar_unsync01)

current_goal cdc/cdc_verify_struct -alltop
set_goal_option sdc2sgdc yes

run_goal

# Export Structural CDC Reports
capture $REPORTS_DIR/3_cdc_verify_struct_moresimple.rpt { write_report moresimple }
capture $REPORTS_DIR/3_cdc_verify_struct_summary.rpt    { write_report summary }


####################################################################################
# SECTION 5: GOAL 4 - cdc/cdc_verify (FUNCTIONAL CDC)
####################################################################################
puts "================================================================="
puts "               STEP 5: RUNNING cdc/cdc_verify                    "
puts "================================================================="
# Purpose: Formal/Functional verification of CDC protocols:
# - Data stability check on multi-bit buses
# - Gray code counter sequence checking (Ac_fifo01)
# - Handshake protocol compliance (Req/Ack)

current_goal cdc/cdc_verify -alltop
set_goal_option sdc2sgdc yes
if {[file exists $WAIVER_FILE]} {
    set_goal_option default_waiver_file $WAIVER_FILE
}

run_goal

# Export Functional CDC Reports
capture $REPORTS_DIR/4_cdc_verify_moresimple.rpt { write_report moresimple }
capture $REPORTS_DIR/4_cdc_verify_summary.rpt    { write_report summary }


####################################################################################
# SECTION 6: CDC SUMMARY & SIGNOFF
####################################################################################
puts "================================================================="
puts "          SPYGLASS CDC VERIFICATION FLOW COMPLETED!              "
puts "          All reports generated in: $REPORTS_DIR                 "
puts "================================================================="

# Save Project
save_project
