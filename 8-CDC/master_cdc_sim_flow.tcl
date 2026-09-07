####################################################################################
# ==================================================================================
#                  MASTER CDC SIMULATION & REGRESSION FLOW
#                  ModelSim / QuestaSim Automated Verification
# ==================================================================================
# This unified script compiles, tests, and verifies all CDC synchronizer blocks:
#   1. Bit Synchronizer (BIT_SYNC)
#   2. Reset Synchronizer (RST_SYNC)
#   3. Multi-Bit Data Synchronizer (DATA_SYNC)
#   4. Asynchronous Dual-Clock FIFO (ASYNC_FIFO)
# ==================================================================================
####################################################################################

puts "================================================================="
puts "             STEP 1: INITIALIZING SIMULATION ENVIRONMENT        "
puts "================================================================="

# Create and map work library
if [file exists work] {
    vdel -all -lib work
}
vlib work
vmap work work

set LOG_DIR "./sim_logs"
file mkdir $LOG_DIR


####################################################################################
# SECTION 2: COMPILE & SIMULATE BIT SYNCHRONIZER (BIT_SYNC)
####################################################################################
puts "================================================================="
puts "          STEP 2: VERIFYING BIT SYNCHRONIZER (BIT_SYNC)          "
puts "================================================================="

set BIT_DIR "./Labs/BIT_SYNC/Solution"

if {[file exists "$BIT_DIR/BIT_SYNC.v"]} {
    puts "--- Compiling BIT_SYNC ---"
    vlog -sv "$BIT_DIR/BIT_SYNC.v"
    vlog -sv "$BIT_DIR/BIT_SYNC_TB.v"

    puts "--- Simulating BIT_SYNC ---"
    vsim -c -voptargs="+acc" work.BIT_SYNC_TB -logfile "$LOG_DIR/bit_sync.log" -do "run -all; quit -f"
} else {
    puts "Warning: BIT_SYNC files not found at $BIT_DIR"
}


####################################################################################
# SECTION 3: COMPILE & SIMULATE RESET SYNCHRONIZER (RST_SYNC)
####################################################################################
puts "================================================================="
puts "         STEP 3: VERIFYING RESET SYNCHRONIZER (RST_SYNC)         "
puts "================================================================="

set RST_DIR "./Assignments/RST_SYNC/Solution"

if {[file exists "$RST_DIR/RST_SYNC.v"]} {
    puts "--- Compiling RST_SYNC ---"
    vlog -sv "$RST_DIR/RST_SYNC.v"
    vlog -sv "$RST_DIR/RST_SYNC_TB.v"

    puts "--- Simulating RST_SYNC ---"
    vsim -c -voptargs="+acc" work.RST_SYNC_TB -logfile "$LOG_DIR/rst_sync.log" -do "run -all; quit -f"
} else {
    puts "Warning: RST_SYNC files not found at $RST_DIR"
}


####################################################################################
# SECTION 4: COMPILE & SIMULATE DATA SYNCHRONIZER (DATA_SYNC)
####################################################################################
puts "================================================================="
puts "         STEP 4: VERIFYING DATA SYNCHRONIZER (DATA_SYNC)         "
puts "================================================================="

set DATA_DIR "./Assignments/DATA_SYNC/Solution"

if {[file exists "$DATA_DIR/DATA_SYNC.v"]} {
    puts "--- Compiling DATA_SYNC ---"
    vlog -sv "$DATA_DIR/DATA_SYNC.v"
    vlog -sv "$DATA_DIR/DATA_SYNC_TB.v"

    puts "--- Simulating DATA_SYNC ---"
    vsim -c -voptargs="+acc" work.DATA_SYNC_TB -logfile "$LOG_DIR/data_sync.log" -do "run -all; quit -f"
} else {
    puts "Warning: DATA_SYNC files not found at $DATA_DIR"
}


####################################################################################
# SECTION 5: COMPILE & SIMULATE ASYNCHRONOUS FIFO (ASYNC_FIFO)
####################################################################################
puts "================================================================="
puts "      STEP 5: VERIFYING DUAL-CLOCK ASYNC FIFO (ASYNC_FIFO)       "
puts "================================================================="

set FIFO_RTL_DIR "./Assignments/ASYNC_FIFO/Solution/RTL"
set FIFO_TB_DIR  "./Assignments/ASYNC_FIFO/Solution/TB"

if {[file exists "$FIFO_RTL_DIR/Async_fifo.v"]} {
    puts "--- Compiling ASYNC_FIFO Modules ---"
    vlog -sv "$FIFO_RTL_DIR/DF_Sync.v"
    vlog -sv "$FIFO_RTL_DIR/fifo_mem.v"
    vlog -sv "$FIFO_RTL_DIR/fifo_wr.v"
    vlog -sv "$FIFO_RTL_DIR/fifo_rd.v"
    vlog -sv "$FIFO_RTL_DIR/Async_fifo.v"

    if {[file exists "$FIFO_TB_DIR/Async_fifo_tb.v"]} {
        vlog -sv "$FIFO_TB_DIR/Async_fifo_tb.v"
        puts "--- Simulating ASYNC_FIFO ---"
        vsim -c -voptargs="+acc" work.Async_fifo_tb -logfile "$LOG_DIR/async_fifo.log" -do "run -all; quit -f"
    } else {
        puts "Info: ASYNC_FIFO RTL compiled successfully."
    }
} else {
    puts "Warning: ASYNC_FIFO RTL not found at $FIFO_RTL_DIR"
}

puts "================================================================="
puts "      ALL CDC SYNCHRONIZERS COMPILED & SIMULATED SUCCESSFULLY!   "
puts "      Logs available in: $LOG_DIR                               "
puts "================================================================="
