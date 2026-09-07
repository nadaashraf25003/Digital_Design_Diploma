####################################################################################
# ==================================================================================
#                  MASTER GATE-LEVEL SIMULATION (GLS) & PT-PX SCRIPT
#              ModelSim / QuestaSim Simulation & Synopsys PrimeTime-PX
# ==================================================================================
# This unified master script covers:
#   1. Environment & Path Configuration
#   2. Gate-Level Simulation (GLS) Execution with SDF Back-Annotation
#   3. Switching Activity (VCD) Generation & Extraction
#   4. Synopsys PrimeTime-PX (PT-PX) Dynamic & Leakage Power Analysis
#   5. Comprehensive Power, Timing, and Activity Reporting
# ==================================================================================
####################################################################################

puts "================================================================="
puts "       STEP 1: GLS & PRIMETIME-PX ENVIRONMENT CONFIGURATION      "
puts "================================================================="

# ----------------------------------------------------------------------------------
# 1.1 Design & Directory Definitions
# ----------------------------------------------------------------------------------
set TOP_MODULE         "alu8_top"
set TESTBENCH_MODULE   "tb"
set WORK_DIR           [pwd]
set REPORTS_DIR        "./pt_reports"
set VCD_DIR            "./sim/VCD"
set SYN_RESULTS_DIR    "./syn/results_mul"
set PNR_RESULTS_DIR    "../../12-PNR/export"
set STD_CELLS_DIR      "./std_cells"

file mkdir $REPORTS_DIR
file mkdir $VCD_DIR

# ----------------------------------------------------------------------------------
# 1.2 Technology Standard Cell DB Files (Multi-Corner PVT)
# ----------------------------------------------------------------------------------
set SSLIB   "$STD_CELLS_DIR/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB   "$STD_CELLS_DIR/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB   "$STD_CELLS_DIR/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

set target_library [list $TTLIB $SSLIB $FFLIB]
set link_library   [list * $TTLIB $SSLIB $FFLIB]

# ----------------------------------------------------------------------------------
# 1.3 Design Netlist, SDC, and SDF File Selectors
# ----------------------------------------------------------------------------------
# Option A: Post-Synthesis Netlist & SDF
set NETLIST_FILE   "$SYN_RESULTS_DIR/${TOP_MODULE}_netlist.v"
set SDC_FILE       "$SYN_RESULTS_DIR/${TOP_MODULE}.sdc"
set SDF_FILE       "$SYN_RESULTS_DIR/${TOP_MODULE}.sdf"

# Option B: Post-PNR Netlist & SDF (uncomment if running post-layout GLS)
# set NETLIST_FILE   "$PNR_RESULTS_DIR/${TOP_MODULE}.v"
# set SDC_FILE       "../../12-PNR/dft/${TOP_MODULE}_func.sdc"
# set SDF_FILE       "$PNR_RESULTS_DIR/${TOP_MODULE}.sdf"

set VCD_FILE       "$VCD_DIR/Mult.vcd"


####################################################################################
# SECTION 2: QUESTA / MODELSIM GATE-LEVEL SIMULATION (DO SCRIPT REFERENCE)
####################################################################################
puts "================================================================="
puts "          STEP 2: SIMULATION SCRIPT CONFIGURATION (SIM)          "
puts "================================================================="
# NOTE: The simulation is typically launched using 'vsim -c -do run.do' or in GUI.
# Below is the automated command sequence for reference / automated batch spawning:
#
#   1. vlib work && vmap work work
#   2. vlog -sv $STD_CELLS_DIR/tsmc13_m.v
#   3. vlog -sv $NETLIST_FILE
#   4. vlog -sv ./sim/tb.v
#   5. vsim -sdfmax /${TESTBENCH_MODULE}/dut=${SDF_FILE} -sdfnoerror +notimingchecks work.${TESTBENCH_MODULE}
#   6. vcd file $VCD_FILE
#   7. vcd add -r /${TESTBENCH_MODULE}/dut/*
#   8. run -all
#   9. quit -f


####################################################################################
# SECTION 3: PRIMETIME-PX POWER ANALYSIS CONFIGURATION
####################################################################################
puts "================================================================="
puts "            STEP 3: PRIMETIME-PX POWER SETUP                     "
puts "================================================================="

# 3.1 Enable Power Analysis Mode in PrimeTime
set_app_var power_enable_analysis   true
set_app_var power_analysis_mode     time_based   ;# Options: averaged | time_based
set_app_var power_vcd_time_unit     1ns

# ----------------------------------------------------------------------------------
# 3.2 Read Gate-Level Netlist & Link Design
# ----------------------------------------------------------------------------------
puts "--- Reading Gate-Level Netlist: $NETLIST_FILE ---"
read_verilog $NETLIST_FILE
current_design $TOP_MODULE
link_design

# ----------------------------------------------------------------------------------
# 3.3 Read Timing Constraints & SDF Calibrated Delays
# ----------------------------------------------------------------------------------
if {[file exists $SDC_FILE]} {
    puts "--- Reading SDC Timing Constraints: $SDC_FILE ---"
    read_sdc $SDC_FILE
}

if {[file exists $SDF_FILE]} {
    puts "--- Back-annotating SDF Delays: $SDF_FILE ---"
    read_sdf $SDF_FILE
}


####################################################################################
# SECTION 4: SWITCHING ACTIVITY ANNOTATION (VCD / FSDB)
####################################################################################
puts "================================================================="
puts "           STEP 4: READ SWITCHING ACTIVITY (VCD)                 "
puts "================================================================="

if {[file exists $VCD_FILE]} {
    puts "--- Annotating Switching Activity from VCD: $VCD_FILE ---"
    # -strip_path removes the testbench hierarchy prefix so pins map directly to DUT
    read_vcd -strip_path "${TESTBENCH_MODULE}/dut" $VCD_FILE
} else {
    puts "Warning: VCD file $VCD_FILE not found! Power analysis will use default switching activity."
}

# 4.1 Update Power Calculations
puts "--- Calculating Dynamic & Leakage Power ---"
update_power


####################################################################################
# SECTION 5: COMPREHENSIVE POWER REPORTING & SIGNOFF
####################################################################################
puts "================================================================="
puts "            STEP 5: GENERATE POWER REPORTS                       "
puts "================================================================="

# 5.1 Summary Power Report (Internal, Switching, Leakage, Total)
report_power > "$REPORTS_DIR/power_summary.rpt"

# 5.2 Hierarchical Power Breakdown
report_power -hierarchy > "$REPORTS_DIR/power_hierarchy.rpt"

# 5.3 Detailed Power by Net/Instance
report_power -cell_power > "$REPORTS_DIR/power_cells.rpt"
report_power -net_power  > "$REPORTS_DIR/power_nets.rpt"

# 5.4 Check Power Analysis Quality and Annotation Coverage
check_power > "$REPORTS_DIR/power_check.rpt"

puts "================================================================="
puts "     PRIMETIME-PX POWER ANALYSIS COMPLETED SUCCESSFULLY!         "
puts "     Reports saved in: $REPORTS_DIR                             "
puts "================================================================="
