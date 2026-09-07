####################################################################################
# ==================================================================================
#                  MASTER PHYSICAL DESIGN (PNR) FLOW SCRIPT
#                       Cadence Encounter / Innovus Flow
# ==================================================================================
# This unified script covers the complete automated Physical Design (PnR) flow:
#   1. Design Import & MMMC Setup (LEF, Netlist, SDC, CapTable, Timing Corners)
#   2. Floorplanning & Power Network Planning (P/G Rings, Stripes, Rails)
#   3. Standard Cell Placement & Tie-Cell Insertion
#   4. Clock Tree Synthesis (CTS) & Clock Tree Optimization
#   5. Global & Detailed Routing (NanoRoute) with Wire/Via Optimization
#   6. Chip Finishing (Filler Cell Insertion & DRC / Connectivity Checks)
#   7. Signoff Outputs Generation (Netlists, SPF/SPEF, SDF, GDSII, Power Reports)
# ==================================================================================
####################################################################################

puts "================================================================="
puts "             STEP 1: DESIGN IMPORT & MMMC CONFIGURATION          "
puts "================================================================="

# ----------------------------------------------------------------------------------
# 1.1 Variables & Directory Setup
# ----------------------------------------------------------------------------------
set TOP_MODULE         "ALU_TOP"
set WORK_DIR           [pwd]
set DFT_NETLIST_DIR    "../10-DFT/results"
set STD_CELLS_DIR      "/home/ahesham/Labs/Lab_PNR_1/std_cells"
set IMPORT_DIR         "./import"
set REPORT_DIR         "./report"
set EXPORT_DIR         "./export"

# Create output directories
file mkdir $REPORT_DIR
file mkdir $EXPORT_DIR

# Flow configuration switches
set LOAD_EXISTING_FP   0    ;# 0: Generate new floorplan, 1: Load .fp file
set ROUTE_ECO_MODE     0    ;# 0: Clean route from scratch, 1: ECO refinement route

# ----------------------------------------------------------------------------------
# 1.2 Netlist & Library Definitions
# ----------------------------------------------------------------------------------
set GATE_NETLIST       "$DFT_NETLIST_DIR/${TOP_MODULE}.v"
# Fallback to local lab netlist if DFT netlist not found
if {![file exists $GATE_NETLIST]} {
    set GATE_NETLIST   "./dft/${TOP_MODULE}.v"
}

set FFLIB              "$STD_CELLS_DIR/libs/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.lib"
set SSLIB              "$STD_CELLS_DIR/libs/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.lib"
set TTLIB              "$STD_CELLS_DIR/libs/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.lib"

set TECH_LEF           "$STD_CELLS_DIR/lef/tsmc13fsg_7lm_tech.lef"
set MACRO_LEF          "$STD_CELLS_DIR/lef/tsmc13_m_macros.lef"
set DESIGN_LEF         "$IMPORT_DIR/ALU.lef"
set CAP_TABLE_FILE     "$STD_CELLS_DIR/captables/tsmc13fsg.capTbl"
set SDC_FILE           "./dft/${TOP_MODULE}_func.sdc"

# ----------------------------------------------------------------------------------
# 1.3 Configure Encounter Global UI / Design Variables
# ----------------------------------------------------------------------------------
setUIVar rda_Input ui_topcell           $TOP_MODULE
setUIVar rda_Input ui_netlist           $GATE_NETLIST
setUIVar rda_Input ui_timelib,min       $FFLIB
setUIVar rda_Input ui_timelib,max       $SSLIB
setUIVar rda_Input ui_timelib           $TTLIB

if {$LOAD_EXISTING_FP == 0 && [file exists $DESIGN_LEF]} {
    setUIVar rda_Input ui_leffile       [list $TECH_LEF $MACRO_LEF $DESIGN_LEF]
} else {
    setUIVar rda_Input ui_leffile       [list $TECH_LEF $MACRO_LEF]
}

setUIVar rda_Input ui_captbl_file       $CAP_TABLE_FILE
setUIVar rda_Input ui_timingcon_file    $SDC_FILE

# Define Global Power and Ground nets
set PWR_NET_NAME "VDD"
set GND_NET_NAME "VSS"
setUIVar rda_Input ui_pwrnet            $PWR_NET_NAME
setUIVar rda_Input ui_gndnet            $GND_NET_NAME

# Commit configuration into Encounter database
commitConfig

# ----------------------------------------------------------------------------------
# 1.4 Multi-Mode Multi-Corner (MMMC) Setup
# ----------------------------------------------------------------------------------
puts "--- Configuring MMMC Views (Setup & Hold Corners) ---"
create_library_set -name min_library -timing [list $FFLIB]
create_library_set -name max_library -timing [list $SSLIB]
create_library_set -name typ_library -timing [list $TTLIB]

create_constraint_mode -name func_mode -sdc_files [list $SDC_FILE]
create_rc_corner -name RCcorner -cap_table $CAP_TABLE_FILE

create_delay_corner -name min_corner -library_set min_library -rc_corner RCcorner
create_delay_corner -name max_corner -library_set max_library -rc_corner RCcorner

create_analysis_view -name setup1_analysis_view -delay_corner max_corner -constraint_mode func_mode
create_analysis_view -name hold1_analysis_view  -delay_corner min_corner -constraint_mode func_mode

set_analysis_view -setup [list setup1_analysis_view] -hold [list hold1_analysis_view]


####################################################################################
# SECTION 2: FLOORPLANNING & POWER NETWORK PLANNING
####################################################################################
puts "================================================================="
puts "           STEP 2: FLOORPLANNING & POWER NETWORK SETUP           "
puts "================================================================="

if {$LOAD_EXISTING_FP == 0} {
    # Initialize Floorplan:
    # -d <width> <height> <left_margin> <bottom_margin> <right_margin> <top_margin>
    floorPlan -d 120.13 120.13 3.0 3.0 3.0 3.0
    puts "Created new Floorplan: Dimensions 120.13u x 120.13u with 3.0u Core-to-IO margins."
} else {
    # Load pre-existing floorplan file
    loadFPlan "./${TOP_MODULE}.fp"
    puts "Loaded existing floorplan file: ./${TOP_MODULE}.fp"
}

# (Optional: Power Ring & Stripe Synthesis can be executed here if required)
# addRing -spacing_bottom 1.0 -spacing_top 1.0 -spacing_left 1.0 -spacing_right 1.0 ...
# addStripe -nets {VDD VSS} -layer METAL5 -width 2.0 -spacing 1.0 ...
# sroute -connect { blockPin padPin padRing corePin } -layerChangeRange { 1 6 }


####################################################################################
# SECTION 3: STANDARD CELL PLACEMENT & OPTIMIZATION
####################################################################################
puts "================================================================="
puts "            STEP 3: STANDARD CELL PLACEMENT & TIE CELLS          "
puts "================================================================="

# 3.1 Place Standard Cells with Pre- and In-Place Optimization
placeDesign -inPlaceOpt -prePlaceOpt

# 3.2 Add Tie-High and Tie-Low Cells to prevent floating inputs and ESD hazards
addTieHiLo -cell TIELOM -prefix LTIE
addTieHiLo -cell TIEHIM -prefix HTIE

# 3.3 Connect Global Power & Ground pins to all instances
globalNetConnect $PWR_NET_NAME -type pgpin -pin $PWR_NET_NAME -inst *
globalNetConnect $GND_NET_NAME -type pgpin -pin $GND_NET_NAME -inst *

# 3.4 Check Placement Legality
checkPlace $REPORT_DIR/placement_check.rpt


####################################################################################
# SECTION 4: CLOCK TREE SYNTHESIS (CTS)
####################################################################################
puts "================================================================="
puts "              STEP 4: CLOCK TREE SYNTHESIS (CTS)                 "
puts "================================================================="

set CTS_SPEC_FILE "Clock.ctstch"
set CTS_REPORT_DIR "$REPORT_DIR/clock_report"
file mkdir $CTS_REPORT_DIR

# 4.1 Generate CTS Specification Template
clockDesign -genSpecOnly $CTS_SPEC_FILE

# 4.2 Execute Clock Tree Synthesis with target skew and insertion delay constraints
clockDesign -specFile $CTS_SPEC_FILE -outDir $CTS_REPORT_DIR -fixedInstBeforeCTS

# 4.3 Report Post-CTS Timing
# timeDesign -postCTS -outDir $REPORT_DIR/postCTS_timing


####################################################################################
# SECTION 5: GLOBAL & DETAILED ROUTING (NANOROUTE)
####################################################################################
puts "================================================================="
puts "              STEP 5: GLOBAL & DETAILED ROUTING                  "
puts "================================================================="

set MAX_ROUTING_LAYER 6

if {$ROUTE_ECO_MODE == 0} {
    # Full Global and Detailed Routing with Wire & Via Optimization
    setNanoRouteMode -quiet -routeTopRoutingLayer $MAX_ROUTING_LAYER
    routeDesign -globalDetail -viaOpt -wireOpt
    puts "Completed Global & Detailed Routing with max layer M${MAX_ROUTING_LAYER}."
} else {
    # Incremental / ECO Routing
    refinePlace -preserveRouting
    setNanoRouteMode -routeWithEco true
    globalDetailRoute
    puts "Completed ECO detailed routing."
}


####################################################################################
# SECTION 6: CHIP FINISHING & PHYSICAL DRC VERIFICATION
####################################################################################
puts "================================================================="
puts "            STEP 6: CHIP FINISHING & FILLER CELLS                "
puts "================================================================="

# 6.1 Add Filler Cells to ensure N-well and substrate continuity across all rows
set FILLER_CELL_LIST [list FILL1M FILL2M FILL4M FILL8M FILL16M FILL32M FILL64M]
addFiller -cell $FILLER_CELL_LIST -prefix FILLER -markFixed

# 6.2 Physical Design Rule Checks (DRC) & Connectivity Verification
verifyGeometry -report $REPORT_DIR/geometry_drc.rpt
verifyConnectivity -type all -report $REPORT_DIR/connectivity.rpt


####################################################################################
# SECTION 7: SIGNOFF EXPORT & OUTPUTS GENERATION
####################################################################################
puts "================================================================="
puts "             STEP 7: SIGNOFF EXPORT & OUTPUT GENERATION          "
puts "================================================================="

# 7.1 Export Post-PNR Gate-Level Netlist (for Formal Verification / GLS)
saveNetlist "$EXPORT_DIR/${TOP_MODULE}.v"

# 7.2 Export Post-PNR Netlist with Power/Ground Pins (for LVS verification)
saveNetlist "$EXPORT_DIR/${TOP_MODULE}_pg.v" -includePowerGround

# 7.3 Parasitic Extraction (SPF / SPEF)
rcOut -spf "$EXPORT_DIR/${TOP_MODULE}.spf"

# 7.4 Standard Delay Format (SDF) Generation (for Gate-Level Simulation)
delayCal -sdf "$EXPORT_DIR/${TOP_MODULE}.sdf" -version 3.0

# 7.5 Power Analysis Report
report_power -outfile "$REPORT_DIR/power.rpt"

# 7.6 Stream-out Final GDSII Layout
set GDS_MAP_FILE "$IMPORT_DIR/gds2InLayer.map"
if {[file exists $GDS_MAP_FILE]} {
    streamOut "$EXPORT_DIR/${TOP_MODULE}.gds" \
        -mapFile $GDS_MAP_FILE \
        -libName DesignLib \
        -stripes 1 \
        -units 2000 \
        -mode ALL
    puts "GDSII streamed out successfully: $EXPORT_DIR/${TOP_MODULE}.gds"
} else {
    puts "Warning: GDS Map file ($GDS_MAP_FILE) not found, skipping GDSII export."
}

puts "================================================================="
puts "          PHYSICAL DESIGN FLOW COMPLETED SUCCESSFULLY!           "
puts "================================================================="
