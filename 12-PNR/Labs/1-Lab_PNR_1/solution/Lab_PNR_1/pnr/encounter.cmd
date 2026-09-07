#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Tue Sep 16 20:43:19 2025                #
#                                                     #
#######################################################

#@(#)CDS: First Encounter v08.10-p004_1 (32bit) 11/04/2008 14:34 (Linux 2.6)
#@(#)CDS: NanoRoute v08.10-p008 NR081027-0018/USR58-UB (database version 2.30, 67.1.1) {superthreading v1.11}
#@(#)CDS: CeltIC v08.10-p002_1 (32bit) 10/23/2008 22:04:14 (Linux 2.6.9-67.0.10.ELsmp)
#@(#)CDS: CTE v08.10-p016_1 (32bit) Oct 26 2008 15:11:51 (Linux 2.6.9-67.0.10.ELsmp)
#@(#)CDS: CPE v08.10-p009

setUIVar rda_Input ui_topcell ALU_TOP
setUIVar rda_Input ui_netlist /home/ahesham/Labs/Lab_PNR_1/dft/ALU_TOP.v
setUIVar rda_Input ui_timelib,min /home/ahesham/Labs/Lab_PNR_1/std_cells/libs/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.lib
setUIVar rda_Input ui_timelib,max /home/ahesham/Labs/Lab_PNR_1/std_cells/libs/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.lib
setUIVar rda_Input ui_timelib /home/ahesham/Labs/Lab_PNR_1/std_cells/libs/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.lib
setUIVar rda_Input ui_leffile {/home/ahesham/Labs/Lab_PNR_1/std_cells/lef/tsmc13fsg_7lm_tech.lef /home/ahesham/Labs/Lab_PNR_1/std_cells/lef/tsmc13_m_macros.lef /home/ahesham/Labs/Lab_PNR_1/pnr/import/ALU.lef}
setUIVar rda_Input ui_captbl_file /home/ahesham/Labs/Lab_PNR_1/std_cells/captables/tsmc13fsg.capTbl
setUIVar rda_Input ui_timingcon_file /home/ahesham/Labs/Lab_PNR_1/dft/ALU_TOP_func.sdc
setUIVar rda_Input ui_pwrnet VDD
setUIVar rda_Input ui_gndnet VSS
commitConfig
create_library_set -name min_library -timing "../std_cells/libs/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.lib"
create_library_set -name max_library -timing "../std_cells/libs/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.lib"
create_library_set -name typ_library -timing "../std_cells/libs/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.lib"
create_constraint_mode -name func_mode -sdc_files {../dft/ALU_TOP_func.sdc}
create_rc_corner -name RCcorner -cap_table "../std_cells/captables/tsmc13fsg.capTbl"
create_delay_corner -name min_corner -library_set min_library -rc_corner RCcorner
create_delay_corner -name max_corner -library_set max_library -rc_corner RCcorner
create_analysis_view -name setup1_analysis_view -delay_corner max_corner -constraint_mode func_mode
create_analysis_view -name hold1_analysis_view  -delay_corner min_corner -constraint_mode func_mode
set_analysis_view -setup {setup1_analysis_view} -hold {hold1_analysis_view}
floorPlan -d 120.13 120.13 3.0 3.0 3.0 3.0
addRing -spacing_bottom 0.5 -width_left 1 -width_bottom 1 -width_top 1 -spacing_top 0.5 -layer_bottom METAL5 -center 1 -stacked_via_top_layer METAL7 -width_right 1 -around core -jog_distance 0.205 -offset_bottom 0.205 -layer_top METAL5 -threshold 0.205 -offset_left 0.205 -spacing_right 0.5 -spacing_left 0.5 -offset_right 0.205 -offset_top 0.205 -layer_right METAL6 -nets {VSS VDD } -stacked_via_bottom_layer METAL1 -layer_left METAL6
addStripe -block_ring_top_layer_limit METAL7 -max_same_layer_jog_length 0.8 -padcore_ring_bottom_layer_limit METAL5 -set_to_set_distance 40 -stacked_via_top_layer METAL7 -padcore_ring_top_layer_limit METAL7 -spacing 0.5 -merge_stripes_value 0.205 -layer METAL6 -block_ring_bottom_layer_limit METAL5 -width 1 -nets {VSS VDD } -stacked_via_bottom_layer METAL1
zoomBox -15.376 75.192 62.309 30.494
selectWire 4.7800 0.3900 5.7800 118.9200 6 VDD
deleteSelectedFromFPlan
selectWire 3.2800 1.8900 4.2800 117.4200 6 VSS
deleteSelectedFromFPlan
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { 1 7 } -blockPinTarget { nearestRingStripe nearestTarget } -padPinPortConnect { allPort oneGeom } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer 1 -allowLayerChange 1 -targetViaTopLayer 7 -crossoverViaTopLayer 7 -targetViaBottomLayer 1 -nets { VSS VDD }
setDrawView fplan
zoomBox -15.181 121.843 149.559 88.270
uiSetTool obstruct
createObstruct 0.553 115.687 118.934 118.215
zoomBox -8.154 9.023 130.626 -5.421
createObstruct 0.052 0.026 119.896 3.418
uiSetTool select
selectObstruct 0.0000 0.4100 119.7200 6.1500 defObstructName
deleteSelectedFromFPlan
zoomBox -1.921 5.154 18.198 -1.395
uiSetTool obstruct
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
panPage 1 0
panPage -1 0
panPage -1 0
panPage -1 0
panPage -1 0
panPage -1 0
panPage -1 0
createObstruct 0.092 0.570 119.645 2.835
placeDesign -inPlaceOpt -prePlaceOpt
addTieHiLo -cell TIELOM -prefix LTIE
addTieHiLo -cell TIEHIM -prefix HTIE
globalNetConnect VDD -type pgpin -pin VDD -inst *
globalNetConnect VSS -type pgpin -pin VSS -inst *
clockDesign -genSpecOnly Clock.ctstch
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
setDrawView place
setNanoRouteMode -quiet -routeTopRoutingLayer 6
setNanoRouteMode -quiet -routeWithSiDriven true
setNanoRouteMode -quiet -routeSiEffort max
routeDesign -globalDetail -viaOpt -wireOpt
