
###################################################################
########################### Variables #############################
###################################################################

set SSLIB "/home/ICer/Labs/Lab_Formal_2/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/ICer/Labs/Lab_Formal_2/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/ICer/Labs/Lab_Formal_2/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

###################################################################
############################ Guidance #############################
###################################################################

# Synopsys setup variable
set synopsys_auto_setup true

# Formality Setup File

###################################################################
###################### Reference Container ########################
###################################################################

# Read Reference Design Verilog Files


# Read Reference technology libraries
read_db -container Ref [list $SSLIB $TTLIB $FFLIB]


# set the top Reference Design 
set_reference_design ALU
set_top ALU


###################################################################
#################### Implementation Container #####################
###################################################################

# Read Implementation Design Files


# Read Implementation technology libraries
read_db -container Imp [list $SSLIB $TTLIB $FFLIB]


# set the top Implementation Design
set_implementation_design ALU
set_top ALU


###################### Matching Compare points ####################



######################### Run Verification ########################

set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

########################### Reporting ############################# 
report_passing_points > "passing_points.rpt"
report_failing_points > "failing_points.rpt"
report_aborted_points > "aborted_points.rpt"
report_unverified_points > "unverified_points.rpt"


start_gui

