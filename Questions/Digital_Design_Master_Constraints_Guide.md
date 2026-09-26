# 📐 Digital Design Diploma: Master Hardware & Timing Constraints Guide

> **Comprehensive Compilation**: Synopsys SDC · IEEE 1801 UPF · SpyGlass SGDC · DFT Test Protocols · Physical Design (PnR) · FPGA (XDC / QSF) · Signoff STA (PrimeTime)

---

## 📑 Table of Contents
1. [Timing Path Taxonomy & Constraint Fundamentals](#1-timing-path-taxonomy--constraint-fundamentals)
2. [Clock Definition & Clock Tree Constraints (SDC)](#2-clock-definition--clock-tree-constraints-sdc)
3. [I/O Interface & Boundary Constraints (SDC)](#3-io-interface--boundary-constraints-sdc)
4. [Timing Exceptions & Path Modifiers (SDC)](#4-timing-exceptions--path-modifiers-sdc)
5. [Environmental, DRC & Optimization Constraints](#5-environmental-drc--optimization-constraints)
6. [Signoff Static Timing Analysis (PrimeTime)](#6-signoff-static-timing-analysis-primetime)
7. [Low Power Intent Constraints (UPF / IEEE 1801)](#7-low-power-intent-constraints-upf--ieee-1801)
8. [Clock Domain Crossing Constraints (SpyGlass SGDC)](#8-clock-domain-crossing-constraints-spyglass-sgdc)
9. [Design for Testability (DFT) Constraints & Protocols](#9-design-for-testability-dft-constraints--protocols)
10. [Physical Design (PnR) Constraints & Rules](#10-physical-design-pnr-constraints--rules)
11. [FPGA Constraints (Vivado XDC & Quartus QSF)](#11-fpga-constraints-vivado-xdc--quartus-qsf)
12. [Complete Master Production SDC Script (`System_Top.sdc`)](#12-complete-master-production-sdc-script-system_topsdc)

---

## 1. Timing Path Taxonomy & Constraint Fundamentals

Every synchronous digital design is partitioned into four fundamental timing path categories:

| Path Category | Startpoint | Endpoint | Primary SDC Constraint |
| :--- | :--- | :--- | :--- |
| **Register-to-Register** | Clock pin of Launch Flip-Flop | Data input (D) pin of Capture Flip-Flop | `create_clock`, `create_generated_clock` |
| **Input-to-Register** | Primary Input Port of chip | Data input (D) pin of Capture Flip-Flop | `set_input_delay -clock` |
| **Register-to-Output** | Clock pin of Launch Flip-Flop | Primary Output Port of chip | `set_output_delay -clock` |
| **Input-to-Output** | Primary Input Port of chip | Primary Output Port of chip | `set_input_delay` + `set_output_delay` / `set_max_delay` |

---

## 2. Clock Definition & Clock Tree Constraints (SDC)

### `create_clock`
```tcl
# 100 MHz Master System Clock (50% duty cycle: rise=0ns, fall=5ns)
create_clock -name SYS_CLK -period 10.0 [get_ports clk_in]

# 50 MHz Clock with asymmetric duty cycle (rise=0ns, fall=6ns)
create_clock -name ASYM_CLK -period 20.0 -waveform {0 6.0} [get_ports clk_asym]

# Virtual Clocks for I/O Timing References (No physical port)
create_clock -name VCLK_IN  -period 10.0
create_clock -name VCLK_OUT -period 10.0
```

### `create_generated_clock`
```tcl
# Divide-by-2 generated clock on flip-flop Q pin
create_generated_clock -name CLK_DIV2 -source [get_ports clk] \
                       -divide_by 2 [get_pins u_div2/q_reg/Q]

# Divide-by-4 generated clock with inverted phase
create_generated_clock -name CLK_DIV4_INV -source [get_ports clk] \
                       -divide_by 4 -invert [get_pins u_div4/q_reg/Q]

# Master UART TX Clock derived from Clock Divider MUX output
create_generated_clock -name TX_CLK -source [get_ports clk] \
                       -divide_by 8 [get_pins u_clkdiv_mux/clk_out]

# Pure Combinational Gated Clock (Zero frequency alteration)
create_generated_clock -name GATED_ALU_CLK -source [get_ports clk] \
                       -combinational [get_pins u_icg/CLK_OUT]
```

### `set_clock_uncertainty`
```tcl
# Pre-CTS Setup Uncertainty (Jitter + Estimated Skew + Margin)
set_clock_uncertainty -setup 0.25 [get_clocks SYS_CLK]

# Pre-CTS Hold Uncertainty (Estimated Skew)
set_clock_uncertainty -hold  0.10 [get_clocks SYS_CLK]

# Post-CTS Clock Uncertainty (Jitter only, skew is extracted from layout)
set_clock_uncertainty -setup 0.05 [get_clocks SYS_CLK]
set_clock_uncertainty -hold  0.02 [get_clocks SYS_CLK]
```

### `set_clock_latency` & `set_propagated_clock`
```tcl
# Off-chip board trace clock arrival latencies
set_clock_latency -source -early 1.2 [get_clocks SYS_CLK]
set_clock_latency -source -late  1.8 [get_clocks SYS_CLK]

# Pre-CTS estimated on-chip insertion delay
set_clock_latency 0.8 [get_clocks SYS_CLK]

# Post-CTS: Activate real physical clock tree propagation
set_propagated_clock [all_clocks]
```

---

## 3. I/O Interface & Boundary Constraints (SDC)

### `set_input_delay`
```tcl
# Max Input Delay (for Setup): 25% of clock period (2.5ns on 10ns clock)
set_input_delay -max 2.5 -clock SYS_CLK [get_ports -filter "direction == in && name != clk"]

# Min Input Delay (for Hold): 5% of clock period (0.5ns)
set_input_delay -min 0.5 -clock SYS_CLK [get_ports -filter "direction == in && name != clk"]
```

### `set_output_delay`
```tcl
# Max Output Delay (External PCB trace + External Setup time): 3.0ns
set_output_delay -max 3.0 -clock SYS_CLK [get_ports -filter "direction == out"]

# Min Output Delay (Negative of external hold time requirement): -0.5ns
set_output_delay -min -0.5 -clock SYS_CLK [get_ports -filter "direction == out"]
```

### `set_driving_cell`, `set_input_transition` & `set_load`
```tcl
# Model input port drive strength using an inverter from standard cell library
set_driving_cell -lib_cell INV_X4 [all_inputs]
set_dont_touch_network [get_ports {clk rst_n}]

# Output pin capacitive load (50 fF on internal outputs, 5.0 pF on external pad)
set_load 0.05 [all_outputs]
set_load 5.0  [get_ports pad_tx_out]
```

---

## 4. Timing Exceptions & Path Modifiers (SDC)

### `set_false_path`
```tcl
# Cut asynchronous reset deassertion path
set_false_path -from [get_ports rst_n]

# Cut static/quasi-static configuration register paths
set_false_path -from [get_cells u_regfile/cfg_baud_div_reg*]

# Cut test/scan-mode paths during functional timing analysis
set_false_path -through [get_pins u_dft_mux/test_mode]
```

### `set_multicycle_path`
```tcl
# 2-Cycle Multicycle Path (Setup = 2 cycles, Hold = 1 cycle)
set_multicycle_path 2 -setup -from [get_cells u_alu/op_reg*] -to [get_cells u_alu/result_reg*]
set_multicycle_path 1 -hold  -from [get_cells u_alu/op_reg*] -to [get_cells u_alu/result_reg*]
```

### `set_clock_groups`
```tcl
# Asynchronous Clock Domains (System Clock vs UART TX Clock)
set_clock_groups -asynchronous \
                 -group [get_clocks SYS_CLK] \
                 -group [get_clocks TX_CLK]

# Logically Exclusive Clocks (Multiplexed Functional vs Test Clock)
set_clock_groups -logically_exclusive \
                 -group [get_clocks FUNC_CLK] \
                 -group [get_clocks TEST_CLK]
```

### `set_max_delay -datapath_only`
```tcl
# Bounding wire skew across asynchronous FIFO Gray pointers
set_max_delay 4.0 -datapath_only -from [get_cells u_fifo/wr_ptr_gray_reg*] \
                                 -to   [get_cells u_fifo/u_sync_wr/sync_reg1*]
```

---

## 5. Environmental, DRC & Optimization Constraints

```tcl
# Design Rule Constraints (DRCs)
set_max_transition  0.20 [current_design]
set_max_capacitance 0.15 [current_design]
set_max_fanout      16   [current_design]
set_max_area        0

# Custom Optimization Path Groups
group_path -name INREG  -from [all_inputs]
group_path -name REGOUT -to [all_outputs]
group_path -name INOUT  -from [all_inputs] -to [all_outputs]
group_path -name CORE   -critical_range 1.0 -weight 2.0 [get_clocks SYS_CLK]

# Clock Gating Insertion Rules
set_clock_gating_style -sequential_cell latch -control_point before -min_bitwidth 4
```

---

## 6. Signoff Static Timing Analysis (PrimeTime)

```tcl
# On-Chip Variation (OCV) Derate Settings
set_timing_derate -early 0.95 -clock [current_design]
set_timing_derate -late  1.05 -data  [current_design]
set_timing_derate -late  1.05 -clock [current_design]

# Signoff Audits
check_timing -include {unconstrained_endpoints no_clock loop no_input_delay no_output_delay}
report_timing -delay_type max -max_paths 50 -path_type full_clock -derate -crosstalk_delta
report_timing -delay_type min -max_paths 50 -path_type full_clock -derate
```

---

## 7. Low Power Intent Constraints (UPF / IEEE 1801)

```tcl
# 1. Power Domains
create_power_domain PD_TOP -include_scope
create_power_domain PD_ALU -elements {u_alu}

# 2. Power Switches (PMOS Header)
create_power_switch pwr_sw_alu \
    -domain PD_ALU \
    -input_supply_port  {in_pwr  VDD_TOP} \
    -output_supply_port {out_pwr VDD_ALU_SW} \
    -control_port       {sleep   u_pwr_ctrl/alu_sleep} \
    -on_state           {alu_on in_pwr {!sleep}}

# 3. Isolation & Level Shifters
set_isolation iso_alu_out -domain PD_ALU -clamp_value 0 -applies_to outputs
set_isolation_control iso_alu_out -domain PD_ALU -isolation_signal u_pwr_ctrl/alu_iso_en -isolation_sense high

set_level_shifter ls_low_to_high -domain PD_ALU -applies_to inputs -rule low_to_high

# 4. Power State Table (PST)
create_pst sys_pst -supplies {VDD_TOP VDD_ALU_SW VSS}
add_pst_state FULL_ON -pst sys_pst -state {1.20 1.20 0.0}
add_pst_state ALU_OFF -pst sys_pst -state {1.20 OFF  0.0}
```

---

## 8. Clock Domain Crossing Constraints (SpyGlass SGDC)

```tcl
current_design "System_Top"

# Clocks & Domains
clock -name "clk"           -domain DOMAIN_SYS  -tag SYS_CLK  -period 10.0 -edge {0 5.0}
clock -name "u_uart/tx_clk" -domain DOMAIN_UART -tag UART_CLK -period 80.0 -edge {0 40.0}

# Asynchronous Reset
reset -name "rst_n"         -value 0 -async

# Quasi-Static Configuration
quasi_static -name "u_regfile/baud_rate_div*"
quasi_static -name "u_regfile/config_parity_en"

# Synchronizer Cell Directives
sync_cell -name "DATA_SYNC" -input "unsync_in" -output "sync_out"
```

---

## 9. Design for Testability (DFT) Constraints & Protocols

```tcl
# DFT Signals Specification
set_dft_signal -view spec -type ScanClock   -port [get_ports clk]    -active_state 1
set_dft_signal -view spec -type Reset       -port [get_ports rst_n]  -active_state 0
set_dft_signal -view spec -type ScanEnable  -port [get_ports scan_en] -active_state 1
set_dft_signal -view spec -type ScanDataIn  -port [get_ports scan_in]
set_dft_signal -view spec -type ScanDataOut -port [get_ports scan_out]

# Scan Chain Configuration
set_scan_configuration -chain_count 4 -style multiplexed_flip_flop -add_lockup true
create_test_protocol
dft_drc -verbose
```

---

## 10. Physical Design (PnR) Constraints & Rules

```tcl
# Core Floorplan
create_floorplan -core_utilization 0.60 -aspect_ratio 1.0 \
                 -core_margin_top 10.0 -core_margin_bottom 10.0 \
                 -core_margin_left 10.0 -core_margin_right 10.0

# Macro Placement Halos
create_placement_halo -width 5.0 -sides {top bottom left right} [get_cells u_mem_macro]

# CTS Optimization Targets
set_clock_tree_options -clocks [get_clocks SYS_CLK] -target_skew 0.05 \
                       -target_latency 0.80 -max_transition 0.15 -max_capacitance 0.10

# Non-Default Routing Rules (NDR: 2W2S for Clocks)
create_routing_rule RULE_2W2S -multiplier_width 2 -multiplier_spacing 2
set_routing_rule -rule RULE_2W2S [get_nets -of_objects [get_clocks *]]

# Antenna Rules
set_antenna_rules -max_ratio 400.0 -diode_cell ANTENNA_X1
```

---

## 11. FPGA Constraints (Vivado XDC & Quartus QSF)

```tcl
# Vivado XDC Timing & Physical Pinout
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} [get_ports clk]

set_property PACKAGE_PIN E3    [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property PACKAGE_PIN D4    [get_ports uart_tx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_tx]
set_property DRIVE 8           [get_ports uart_tx]
set_property SLEW FAST         [get_ports uart_tx]

set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks sys_clk_pin] \
                               -group [get_clocks -include_generated_clocks tx_clk_pin]
```

---

## 12. Complete Master Production SDC Script (`System_Top.sdc`)

```tcl
################################################################################
#                   MASTER PRODUCTION SDC CONSTRAINT FILE
#                          System Controller SoC
################################################################################
current_design System_Top

# 1. Time Units & Operational Environment
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c \
                         -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c

# 2. Clocks Definition
set CLK_PER 10.0   ;# 100 MHz Master System Clock
create_clock -name REF_CLK  -period $CLK_PER [get_ports clk]
create_clock -name UART_CLK -period 80.0    [get_ports uart_clk]

create_clock -name VCLK_SYS  -period $CLK_PER
create_clock -name VCLK_UART -period 80.0

create_generated_clock -name TX_CLK -source [get_ports uart_clk] -divide_by 8 \
                       [get_pins u_clkdiv/clk_out]

create_generated_clock -name GATED_ALU_CLK -source [get_ports clk] -combinational \
                       [get_pins u_clk_gate/GATED_CLK]

# 3. Clock Uncertainties & Latencies
set_clock_uncertainty -setup 0.20 [get_clocks REF_CLK]
set_clock_uncertainty -hold  0.08 [get_clocks REF_CLK]
set_clock_uncertainty -setup 0.50 [get_clocks UART_CLK]
set_clock_uncertainty -hold  0.15 [get_clocks UART_CLK]

set_clock_transition 0.10 [all_clocks]

# 4. Input Constraints
set_input_delay -max [expr $CLK_PER * 0.25] -clock VCLK_SYS [get_ports rst_n]
set_input_delay -min [expr $CLK_PER * 0.05] -clock VCLK_SYS [get_ports rst_n]

set_input_delay -max 20.0 -clock VCLK_UART [get_ports uart_rx]
set_input_delay -min  4.0 -clock VCLK_UART [get_ports uart_rx]

set_driving_cell -lib_cell INV_X4 [all_inputs]
set_dont_touch_network [get_ports {clk uart_clk rst_n}]

# 5. Output Constraints
set_output_delay -max 20.0 -clock VCLK_UART [get_ports uart_tx]
set_output_delay -min -2.0 -clock VCLK_UART [get_ports uart_tx]
set_load 0.05 [all_outputs]

# 6. Timing Exceptions
set_clock_groups -asynchronous -group [get_clocks {REF_CLK GATED_ALU_CLK}] \
                               -group [get_clocks {UART_CLK TX_CLK}]

set_false_path -from [get_ports rst_n]

set_max_delay 4.0 -datapath_only -from [get_cells u_async_fifo/wr_ptr_gray_reg*] \
                                 -to   [get_cells u_async_fifo/u_sync/sync_reg1*]

# 7. Design Rule Constraints (DRCs)
set_max_transition  0.20 [current_design]
set_max_capacitance 0.15 [current_design]
set_max_fanout      16   [current_design]
set_max_area        0

# 8. Path Optimization Groups
group_path -name INREG  -from [all_inputs]
group_path -name REGOUT -to [all_outputs]
group_path -name INOUT  -from [all_inputs] -to [all_outputs]
group_path -name CORE   -critical_range 1.0 -weight 2.0 [get_clocks REF_CLK]
################################################################################
```
