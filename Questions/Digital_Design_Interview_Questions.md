# 🎯 Digital Design Diploma — 100 Interview Questions

> **Coverage**: Verilog HDL · TCL · SpyGlass Lint/CDC · Synthesis (DC) · STA (PrimeTime) · Power Analysis · CDC Design · Formal Verification (Formality) · DFT · GLS · Physical Design (PnR)
>
> **Difficulty**: 70% Advanced · 30% Moderate
>
> **Question Formats**: Conceptual · Scenario-Based · Code Review · Mathematical · True/False · Fill-in-the-Blank · Diagram/Architecture

---

## 📘 Section 1 — Verilog HDL & Digital Architecture
*(12 Questions)*

---

### Q1 ⚡ [Advanced] — Blocking vs. Non-Blocking Race Condition
**Type: Code Review / Scenario**

Consider the following Verilog snippet:

```verilog
always @(posedge clk) begin
    a = b;
    b = a;
end
```

**a)** What is the result after the clock edge — does a swap occur? Explain why.

**b)** Rewrite the block using non-blocking assignments to achieve the intended swap behavior.

**c)** What is the underlying simulator execution model that makes non-blocking assignments safe for sequential logic?

> **Expected Answer**: With blocking `=`, `a` gets the old value of `b`, then `b` gets the **new** value of `a` (which already holds old `b`) — no swap occurs, both end up equal. Non-blocking `<=` schedules RHS evaluation first (simultaneously), then assignment — producing a true swap. The scheduler separates "evaluate" from "update" phases.

---

### Q2 ⚡ [Advanced] — Latch Inference Diagnosis
**Type: Code Review**

```verilog
always @(*) begin
    case (sel)
        2'b00: out = a;
        2'b01: out = b;
        2'b10: out = c;
    endcase
end
```

**a)** Will this code infer a latch? Why or why not?

**b)** Provide two correct methods to fix this without changing the functional intent.

**c)** What SpyGlass rule ID is triggered by this violation, and what severity does it carry?

> **Expected Answer**: Yes — `sel = 2'b11` has no assignment, so `out` must retain its value → D-Latch. Fix 1: add `default: out = 'x;` or any value. Fix 2: assign `out = 'x;` as a default at top of `always` block. SpyGlass rule: `InferLatch` / `W188`, severity **Error**.

---

### Q3 🟡 [Moderate] — FSM Architecture Styles
**Type: Conceptual**

Compare **Mealy vs. Moore** FSM output styles, and explain the 3 advantages of using the **3-process registered output** FSM style over the classic 2-process Mealy style in ASIC design.

> **Expected Answer**: Moore outputs depend only on current state; Mealy outputs depend on both state and inputs. 3-process benefits: (1) **Glitch-free outputs** — registered outputs eliminate combinational glitches on asynchronous signals; (2) **Setup-friendly** — the output register adds one cycle latency but improves timing closure; (3) **DFT-ready** — registered outputs are scannable flip-flops.

---

### Q4 ⚡ [Advanced] — LFSR & CRC Design
**Type: Conceptual + Mathematical**

**a)** For the CRC-8 polynomial $x^8 + x^2 + x + 1$, identify the feedback tap positions in the LFSR.

**b)** What is the maximal-length sequence period for an 8-bit LFSR?

**c)** Why is an all-zeros state forbidden in an LFSR, and how is it avoided in hardware?

> **Expected Answer**: (a) Taps at positions 8, 2, 1, 0 → XOR feedback from bits [7], [1], [0] back to bit[7] input. (b) Period = $2^8 - 1 = 255$. (c) All-zeros locks in a zero-only loop forever; avoided by loading a non-zero seed at reset or adding an extra gate.

---

### Q5 ⚡ [Advanced] — ALU Flags & Overflow Detection
**Type: Conceptual**

For a 16-bit signed ALU performing subtraction (`A - B`):

**a)** Write the Boolean expression for detecting **signed overflow**.

**b)** When does the **Carry** flag differ from the **Overflow** flag in a subtraction?

**c)** What is the difference between arithmetic right shift and logical right shift for signed numbers?

> **Expected Answer**: (a) Overflow = `(A[15] ^ B[15]) & (A[15] ^ result[15])` — signs of operands differ AND result sign differs from A. (b) Carry indicates unsigned borrow/overflow; Overflow is signed overflow — they can independently be 0 or 1. (c) Arithmetic right shift preserves the MSB (sign extension); logical shift fills with 0.

---

### Q6 ⚡ [Advanced] — Parameterized Register File
**Type: Code Review**

```verilog
module RegFile #(parameter DEPTH=8, parameter WIDTH=8) (
    input  clk, wr_en,
    input  [$clog2(DEPTH)-1:0] wr_addr, rd_addr,
    input  [WIDTH-1:0] wr_data,
    output reg [WIDTH-1:0] rd_data
);
    reg [WIDTH-1:0] mem [0:DEPTH-1];
    always @(posedge clk) begin
        if (wr_en) mem[wr_addr] <= wr_data;
        rd_data <= mem[rd_addr];
    end
endmodule
```

**a)** What is the read behavior — synchronous or asynchronous? What implication does this have on timing?

**b)** If simultaneously `wr_addr == rd_addr` and `wr_en == 1`, what value does `rd_data` capture on the clock edge (new or old)?

**c)** How would you implement "read-first" vs. "write-first" behavior?

> **Expected Answer**: (a) Synchronous read — rd_data is registered, adding one cycle read latency, which the STA tool sees as a Reg-to-Reg path through the memory array. (b) Old value — because both assignments happen simultaneously with `<=`; the read sees the pre-edge value. (c) Write-first: `if (wr_en && wr_addr==rd_addr) rd_data <= wr_data; else rd_data <= mem[rd_addr];`

---

### Q7 🟡 [Moderate] — Testbench Self-Checking
**Type: Conceptual**

What is the difference between a **directed testbench** and a **self-checking testbench**? List three elements a professional self-checking testbench must contain.

> **Expected Answer**: Directed TB manually applies vectors; self-checking TB automatically compares DUT output to expected values using assertions. Three elements: (1) **Clock generator** with precise period; (2) **Driver tasks** for stimulus; (3) **Checker/scoreboard** with `$display` pass/fail + `err_count` tracking, plus `$finish`.

---

### Q8 ⚡ [Advanced] — Sensitivity List Pitfalls
**Type: Code Review**

```verilog
always @(a or b) begin
    c = a & b;
    d = c | e;
end
```

**a)** What SpyGlass rule is violated here? What is the fix?

**b)** What simulation bug does this create when `e` changes but `a` and `b` do not?

**c)** In synthesis, does the sensitivity list affect the final gate-level netlist? Explain.

> **Expected Answer**: (a) `W18` — incomplete sensitivity list; fix: use `always @(*)`. (b) `d` will not update when `e` changes alone — RTL simulation diverges from actual hardware behavior. (c) No — synthesis ignores the sensitivity list entirely and infers gates from the dataflow; the mismatch only causes Sim/Synth divergence.

---

### Q9 🟡 [Moderate] — `full_case` / `parallel_case` Dangers
**Type: Conceptual**

**a)** What does the `// synthesis parallel_case` pragma instruct the synthesis tool to do?

**b)** Why does SpyGlass flag this with rule `W398`?

**c)** What is the correct, synthesizable alternative?

> **Expected Answer**: (a) Tells synthesis each case arm is mutually exclusive → synthesizes priority MUX as a flat parallel MUX (saves area/timing). (b) Simulation still evaluates case with priority, so simulator and synthesis tool have different logic → functional mismatch. (c) Explicitly code all non-overlapping conditions or add `default:` so both tools see the same logic.

---

### Q10 ⚡ [Advanced] — `assign` vs. `always` vs. procedural timing
**Type: Fill-in-the-Blank**

Complete the table:

| Statement | Evaluated when… | Models… | Synthesizes to… |
|---|---|---|---|
| `assign y = a & b;` | __(1)__ | __(2)__ | __(3)__ |
| `always @(*)` with `=` | __(4)__ | __(5)__ | __(6)__ |
| `always @(posedge clk)` with `<=` | __(7)__ | __(8)__ | __(9)__ |

> **Expected Answer**: (1) Any time a or b changes; (2) Continuous wire-level logic; (3) AND gate; (4) Any input changes; (5) Combinational logic; (6) Gates/MUX; (7) Active clock edge; (8) Sequential register transfer; (9) D flip-flop.

---

### Q11 ⚡ [Advanced] — Multi-Bit Counter with Terminal Flags
**Type: Design**

Design a **parameterized synchronous up/down counter** that:
- Has synchronous active-high load
- Asserts `High` flag when at max value (`2^WIDTH - 1`)
- Asserts `Low` flag when at min value (`0`)
- Uses non-blocking assignments throughout

Write the core `always` block and the flag `assign` statements.

---

### Q12 🟡 [Moderate] — Synthesizable vs. Non-Synthesizable Constructs
**Type: True/False + Explanation**

For each construct, state whether it is synthesizable:

| Construct | Synthesizable? |
|---|---|
| `initial begin … end` | __(1)__ |
| `#10 a = 1;` | __(2)__ |
| `$display("hello")` | __(3)__ |
| `always @(*)` | __(4)__ |
| `integer i; for (i=0; i<4; i=i+1)` | __(5)__ |

> **Expected Answer**: (1) No (simulation only); (2) No (time delay); (3) No (system task); (4) Yes; (5) Yes if loop bounds are constants (static unrolled by synthesis).

---

## 📘 Section 2 — TCL Scripting for EDA
*(8 Questions)*

---

### Q13 🟡 [Moderate] — TCL Substitution Rules
**Type: Scenario**

Predict the output of each line:

```tcl
set x 10
set y "x is $x"
set z {x is $x}
puts $y
puts $z
puts "Double: [expr $x * 2]"
```

> **Expected Answer**: `x is 10` / `x is $x` / `Double: 20`. Double quotes perform variable and command substitution; curly braces suppress all substitution.

---

### Q14 ⚡ [Advanced] — EDA Collection Iteration
**Type: Scenario**

In Synopsys Design Compiler, you want to iterate over all input ports and print their names. Which of the following is correct and why?

```tcl
# Option A
foreach port [get_ports *] { puts $port }

# Option B
foreach_in_collection port [get_ports -filter "direction == in"] {
    puts [get_attribute $port name]
}
```

> **Expected Answer**: Option B is correct — `get_ports` returns a DC **collection object**, not a TCL list; `foreach` cannot iterate over it. `foreach_in_collection` is the correct EDA tool command. `get_attribute` extracts the name string.

---

### Q15 ⚡ [Advanced] — TCL `upvar` and Procedure Scope
**Type: Code Review**

```tcl
proc multiply_all {arr_name factor} {
    upvar $arr_name arr
    foreach key [array names arr] {
        set arr($key) [expr $arr($key) * $factor]
    }
}
array set prices {apples 5 oranges 3 bananas 2}
multiply_all prices 10
```

**a)** Without `upvar`, what happens to the array inside the proc?

**b)** After execution, what are the values in `prices`?

> **Expected Answer**: (a) TCL passes by value — a local copy is modified and the original is unchanged. `upvar` creates an alias to the caller's variable. (b) `apples=50, oranges=30, bananas=20`.

---

### Q16 🟡 [Moderate] — File I/O for Testbench Generation
**Type: Scenario**

Write a TCL script that reads a file `interface.v`, replaces all occurrences of the word `input` with `reg` and `output` with `wire`, then writes the result to `tb_signals.v`.

> **Expected Answer**:
> ```tcl
> set fh [open "interface.v" r]
> set content [read $fh]; close $fh
> regsub -all {\binput\b}  $content "reg"  content
> regsub -all {\boutput\b} $content "wire" content
> set fh [open "tb_signals.v" w+]
> puts $fh $content; close $fh
> ```

---

### Q17 ⚡ [Advanced] — Timing Budget Calculation in TCL
**Type: Scenario**

You are automating an SDC constraint script where the clock period is stored in variable `$CLK_PER`. Write TCL commands that:
1. Set input delay to 30% of the clock period
2. Set output delay to 20% of the clock period
3. Print both values

> **Expected Answer**:
> ```tcl
> set in_delay  [expr 0.30 * $CLK_PER]
> set out_delay [expr 0.20 * $CLK_PER]
> puts "Input delay:  $in_delay ns"
> puts "Output delay: $out_delay ns"
> ```

---

### Q18 ⚡ [Advanced] — Regex Pattern Matching for Report Parsing
**Type: Scenario**

You need to parse a timing report and extract every line containing the text `"slack (VIOLATED)"`. Write a TCL script using `regexp` to do this from a file.

> **Expected Answer**:
> ```tcl
> set fh [open "timing.rpt" r]
> while {[gets $fh line] >= 0} {
>     if {[regexp {slack \(VIOLATED\)} $line]} {
>         puts $line
>     }
> }
> close $fh
> ```

---

### Q19 🟡 [Moderate] — TCL List Operations
**Type: Fill-in-the-Blank**

Given `set clks {CLK_A CLK_B CLK_C CLK_D}`:

| Task | Command |
|---|---|
| Get 3rd element | __(1)__ |
| Remove CLK_B | __(2)__ |
| Add CLK_E at the end | __(3)__ |
| Find index of CLK_C | __(4)__ |
| Get length | __(5)__ |

> **Expected Answer**: (1) `lindex $clks 2`; (2) `set clks [lreplace $clks 1 1]`; (3) `lappend clks CLK_E`; (4) `lsearch $clks CLK_C`; (5) `llength $clks`.

---

### Q20 ⚡ [Advanced] — Conditional Port Existence Check
**Type: Scenario**

In a DC synthesis script, write a TCL snippet that applies `set_false_path` from port `RST_N` only if the port exists (to make the script portable across multiple designs).

> **Expected Answer**:
> ```tcl
> if {[sizeof_collection [get_ports -quiet RST_N]] > 0} {
>     set_false_path -from [get_ports RST_N]
>     echo "Applied false path on RST_N"
> }
> ```

---

## 📘 Section 3 — SpyGlass Lint & CDC Static Verification
*(10 Questions)*

---

### Q21 🟡 [Moderate] — Lint Policy Hierarchy
**Type: Conceptual**

List the 5 core SpyGlass Lint policy groups and briefly describe what category of violations each catches.

> **Expected Answer**: (1) **`lint`** — syntax/semantic, type mismatches; (2) **`morelint`** — advanced style, unused signals; (3) **`simulation`** — sim/synth mismatches (W415, W18); (4) **`latch`** — inferred latches (W188); (5) **`erc`** — electrical rules: combinational loops (W120), multi-driven nets (W422), floating inputs.

---

### Q22 ⚡ [Advanced] — Multi-Driven Net Hazard
**Type: Scenario**

```verilog
module top (input a, b, output out);
    assign out = a;
    assign out = b;
endmodule
```

**a)** Which SpyGlass ERC rule fires?

**b)** What happens in simulation when `a=1, b=0`?

**c)** What physical hardware hazard does this represent?

> **Expected Answer**: (a) `W422` — multi-driven net. (b) Simulation result is non-deterministic or `X`; simulator resolves conflicting drivers by strength or X. (c) Physical short-circuit between two driver outputs — can destroy gates and cause hot carrier injection.

---

### Q23 ⚡ [Advanced] — Waiver File Strategy
**Type: Scenario**

A design has an output port `STATUS_FLAGS[7:0]` on a child module that is intentionally left unconnected at the top level (it's an optional debug port). How do you properly document this in a SpyGlass waiver file?

> **Expected Answer**:
> ```tcl
> waive -rule "UnloadedOutTerm-ML" \
>       -module "ALU_TOP" \
>       -port "STATUS_FLAGS" \
>       -comment "Debug-only status flags. Intentionally unconnected in production integration."
> ```

---

### Q24 ⚡ [Advanced] — CDC Structural vs. Functional Goals
**Type: Conceptual**

Explain the 4-goal progression in SpyGlass CDC verification:
`cdc_setup_check` → `clock_reset_integrity` → `cdc_verify_struct` → `cdc_verify`

Why must they be run **in this order**?

> **Expected Answer**: (1) **cdc_setup_check**: Validates SGDC constraints, clock/reset definitions — without valid constraints, all subsequent goals are unreliable. (2) **clock_reset_integrity**: Checks for glitchy clocks, floating reset nets. (3) **cdc_verify_struct**: Detects structurally unsynchronized crossings, reconvergence violations (`Ac_unsync01/02`, `Ac_conv01`). (4) **cdc_verify**: Functional level — data stability, Gray code correctness, FIFO protocol. Each stage depends on the clean output of the previous.

---

### Q25 ⚡ [Advanced] — Reconvergence Hazard (`Ac_conv01`)
**Type: Scenario**

```
CLKA → Flop A → 2-FF Sync → Dest Logic ──┐
                                            ├──► AND Gate → Output
CLKA → Flop B → 2-FF Sync → Dest Logic ──┘
```

**a)** Why does SpyGlass flag `Ac_conv01` even though both signals are individually synchronized?

**b)** What is the correct fix?

> **Expected Answer**: (a) Each 2-FF synchronizer can resolve in either 1 or 2 cycles independently — if A resolves in 1 cycle and B resolves in 2 cycles, their AND gate sees different-time data, creating a functional race on the combined output. (b) Combine them into a single synchronized control token: send one signal through a single 2-FF, and gate the other based on that single synchronized enable.

---

### Q26 🟡 [Moderate] — SGDC Clock Domain Binding
**Type: Code Review**

Write an SGDC snippet that:
1. Declares clock `sys_clk` at 100 MHz (period=10 ns) in domain `d_sys`
2. Declares clock `usb_clk` at 60 MHz (period=16.67 ns) in domain `d_usb`
3. Marks them as unrelated asynchronous domains
4. Declares `rst_n` as asynchronous active-low reset

---

### Q27 ⚡ [Advanced] — Glitch on Synchronizer Input (`Ac_glitch01`)
**Type: Scenario**

```verilog
// WRONG:
assign crossing_signal = (state == RUN) & enable;
// Then passes directly to 2-FF synchronizer in CLKB domain
```

Why is this a CDC violation, and what is the correct coding pattern?

> **Expected Answer**: Combinational logic can produce glitches (hazard spikes shorter than a clock period) — the synchronizer can accidentally sample a glitch as a valid transition. The correct pattern: register `crossing_signal` in the source clock domain first, then feed the registered output into the 2-FF synchronizer. Only stable, registered signals should cross domain boundaries.

---

### Q28 🟡 [Moderate] — Quasi-Static Signal Definition
**Type: Conceptual**

**a)** What is a quasi-static signal in SpyGlass CDC terminology?

**b)** When is it safe to waive a CDC violation for a quasi-static signal?

**c)** Give a real-world example.

> **Expected Answer**: (a) A signal that is only changed during system initialization or controlled software configuration phases — never toggles during normal operation. (b) Safe to waive when software guarantees the signal is stable before any destination clock domain logic reads it. (c) Baud rate divisor register, DMA burst length configuration, mode select register.

---

### Q29 ⚡ [Advanced] — Clock Integrity Violation
**Type: Scenario**

A design uses a gated clock generated by: `assign gated_clk = clk & enable;`

**a)** Which SpyGlass CDC rule fires?

**b)** What is the specific danger of using standard logic gates for clock gating?

**c)** What is the correct hardware solution?

> **Expected Answer**: (a) `Clock_glitch01`. (b) The `&` gate can produce glitches when `enable` changes while `clk` is high — the glitch propagates as a false clock edge to flip-flops, corrupting data. (c) Use an **Integrated Clock Gating (ICG)** cell or latch-based clock gate: the enable is sampled by a latch on the falling edge of the clock, ensuring `gated_clk` only transitions when `clk` is low (glitch-free window).

---

### Q30 🟡 [Moderate] — SpyGlass Flow Deliverables
**Type: Fill-in-the-Blank**

Match each SpyGlass output file to its purpose:

| File | Purpose |
|---|---|
| `moresimple.rpt` | __(1)__ |
| `summary.rpt` | __(2)__ |
| `elab_summary.rpt` | __(3)__ |
| `.awl` | __(4)__ |

> **Expected Answer**: (1) Filtered detailed violation list with line references; (2) High-level severity count (Errors/Warnings/Infos); (3) Design elaboration log — port connectivity, hierarchy resolution; (4) Waiver file — suppresses known-benign violations with justification.

---

## 📘 Section 4 — ASIC Synthesis (Synopsys Design Compiler)
*(12 Questions)*

---

### Q31 🟡 [Moderate] — PVT Library Corners
**Type: Conceptual**

**a)** What do SS, TT, FF stand for in standard cell library naming?

**b)** Which corner is used for **setup** analysis and why?

**c)** Which corner is used for **hold** analysis and why?

> **Expected Answer**: (a) Slow-Slow (worst process + voltage + temperature), Typical-Typical, Fast-Fast (best case). (b) SS corner for setup — cells are slowest, giving worst-case (maximum) propagation delays — represents the hardest setup scenario. (c) FF corner for hold — cells are fastest, giving minimum propagation delays — the data arrives so fast it might corrupt the same-edge capture.

---

### Q32 ⚡ [Advanced] — `link` vs. `elaborate` vs. `check_design`
**Type: Conceptual**

Describe what each DC command does and in what order they must be called:

1. `analyze -format verilog`
2. `elaborate`
3. `link`
4. `check_design`

> **Expected Answer**: (1) Parses and syntax-checks RTL into DC internal format. (2) Instantiates the design hierarchy, resolves parameters and generics. (3) Resolves all module references against the library and design database — fails if unresolved black boxes exist. (4) Reports structural issues: unconnected pins, multi-driven nets, missing connections — must be clean (0 errors) before applying constraints.

---

### Q33 ⚡ [Advanced] — Path Grouping Strategy
**Type: Conceptual + Scenario**

A design has 2000 internal registers, 30 inputs, and 25 outputs. Without path grouping, DC targets the single worst slack path globally.

**a)** What is the risk of not using path groups?

**b)** Write the 3 standard path group commands.

**c)** How does path grouping improve QoR?

> **Expected Answer**: (a) DC may fix I/O paths while ignoring critical Reg-to-Reg paths, or vice versa — unbalanced optimization. (b) `group_path -name INREG -from [all_inputs]`; `group_path -name REGOUT -to [all_outputs]`; `group_path -name INOUT -from [all_inputs] -to [all_outputs]`. (c) Each group gets independent optimization budget — DC targets all timing categories simultaneously, producing balanced WNS across paths.

---

### Q34 ⚡ [Advanced] — Multicycle Path Constraints
**Type: Mathematical + Scenario**

A divider block uses 2 clock cycles to compute its result. The source clock is 100 MHz (period = 10 ns).

**a)** Write the SDC commands for setup and hold MCP constraints.

**b)** What does the `-end` qualifier do in the hold constraint?

**c)** What happens to timing analysis if you specify MCP setup = 2 but forget the hold constraint?

> **Expected Answer**:
> ```tcl
> set_multicycle_path -setup 2 -from [get_clocks CLK] -to [get_cells U_DIV/result*]
> set_multicycle_path -hold  1 -from [get_clocks CLK] -to [get_cells U_DIV/result*] -end
> ```
> (b) `-end` moves the hold check reference edge at the **capture** side back by N-1 cycles, preventing over-tightening of the hold check. (c) The tool defaults hold to check at cycle 0 against the setup edge of cycle 2 — an impossibly tight hold check that will cause unnecessary buffer insertion and area/power bloat.

---

### Q35 ⚡ [Advanced] — Clock Gating for Power Reduction
**Type: Conceptual + Code**

**a)** What is Automatic Clock Gating (ICG) in Design Compiler?

**b)** Write the DC command to enable ICG with minimum bit-width of 4 using integrated positive-edge logic.

**c)** Why is `set_dont_touch_network` applied to clock nets before `compile_ultra`?

> **Expected Answer**: (a) DC identifies registers with a common clock enable and replaces them with an ICG cell that gates the clock — saving dynamic power when registers hold stable values. (b) `set_clock_gating_style -minimum_bitwidth 4 -positive_edge_logic {integrated}`. (c) DC would otherwise insert its own clock buffers during optimization, creating clock tree imbalance — CTS in PnR handles clock buffering properly with full physical awareness.

---

### Q36 🟡 [Moderate] — `set_fix_multiple_port_nets` — Why It Matters
**Type: Conceptual**

**a)** What problem does `set_fix_multiple_port_nets -all -buffer_constants -feedthroughs` solve?

**b)** What is a "feedthrough net" and why must it be buffered?

> **Expected Answer**: (a) A raw Verilog netlist can contain `assign` statements for constant drivers (tied inputs) and feedthrough nets (inputs directly connected to outputs). These are valid RTL but illegal in a physical gate-level netlist for PnR. The command inserts buffer cells to eliminate them. (b) A feedthrough is a primary input directly wired to a primary output with no logic — in PnR, this requires an explicit buffer so the net has a driver cell with physical coordinates.

---

### Q37 ⚡ [Advanced] — Generated Clock Definition
**Type: Code Review**

```tcl
create_generated_clock -name "REG_CLK" \
    -source [get_ports CLK] \
    -master_clock MASTER_CLK \
    -divide_by 2 \
    [get_pins U0_ClkDiv/o_div_clk]
```

**a)** What does `-divide_by 2` mean for timing analysis?

**b)** Why must you use `create_generated_clock` instead of `create_clock` here?

**c)** What happens to Reg-to-Reg paths between MASTER_CLK and REG_CLK domains?

> **Expected Answer**: (a) DC treats this clock as having half the frequency of MASTER_CLK (20 ns period if master is 10 ns). (b) `create_clock` on an internal pin implies an independent clock source — DC loses the phase relationship with the master. `create_generated_clock` maintains the parent-child relationship and propagates source latency correctly. (c) These are CDC paths that must be constrained with `set_clock_groups -asynchronous` or `set_multicycle_path` depending on the design intent.

---

### Q38 🟡 [Moderate] — Synthesis Output Deliverables
**Type: Fill-in-the-Blank**

Match each file format to its purpose and downstream consumer:

| File | Full Name | Used By |
|---|---|---|
| `top.v` (gate-level) | __(1)__ | __(2)__ |
| `top.ddc` | __(3)__ | __(4)__ |
| `top.sdc` | __(5)__ | __(6)__ |
| `top.sdf` | __(7)__ | __(8)__ |

> **Expected Answer**: (1) Verilog gate-level netlist; (2) PnR, GLS, Formality; (3) Synopsys Design Database binary; (4) Formality, incremental DC runs; (5) Synopsys Design Constraints; (6) PrimeTime STA, PnR; (7) Standard Delay Format; (8) GLS back-annotation in ModelSim/QuestaSim.

---

### Q39 ⚡ [Advanced] — `compile_ultra` vs. `compile`
**Type: Conceptual**

What are the 3 key algorithmic differences between `compile_ultra` and `compile -map_effort high`? Under what circumstances would you choose one over the other?

> **Expected Answer**: (1) `compile_ultra` performs **automatic ungrouping** of design hierarchy for global optimization across module boundaries (better QoR but slower). (2) Enables **register retiming** across logic cones. (3) Uses **advanced delay calculation** with more accurate RC models. Use `compile -map_effort high -no_autoungroup` when: (a) preserving hierarchy for formality flow; (b) run-time is limited; (c) design has hard-macro boundaries that should not be flattened.

---

### Q40 ⚡ [Advanced] — Wire Load Model
**Type: Conceptual**

**a)** What is a Wire Load Model (WLM) and when is it used?

**b)** After PnR, the actual wire capacitances are extracted into a `.spef` file. Why do the timing results often differ from the synthesis predictions?

**c)** What is the most accurate timing signoff flow?

> **Expected Answer**: (a) WLM is a statistical model that estimates wire RC (resistance × capacitance) based on net fanout, used in pre-layout synthesis when no physical routing exists. (b) WLM is averaged over a statistical distribution; actual routing depends on cell placement, congestion, and routing detours — actual RC can be significantly different. (c) Post-PnR SPEF back-annotation into PrimeTime for accurate parasitic-based STA.

---

### Q41 🟡 [Moderate] — `check_design` Output Interpretation
**Type: Scenario**

After running `check_design`, you see:

```
Warning: In design 'ALU_TOP', port 'STATUS[3]' is not connected. (ELAB-311)
Error: In design 'ALU_TOP', net 'carry_internal' has multiple drivers. (ELAB-318)
```

**a)** Which warning can be safely waived and how?

**b)** Which error is a showstopper and what is its fix?

---

### Q42 ⚡ [Advanced] — Operating Conditions & Multi-Corner Analysis
**Type: Conceptual**

```tcl
set_operating_conditions -max TSMC_SS_1P08V_125C \
                         -min TSMC_FF_1P32V_M40C \
                         -max_library $SSLIB \
                         -min_library $FFLIB
```

**a)** What does `-max` vs. `-min` operating condition represent?

**b)** What is the danger of analyzing hold with SS corner delays?

> **Expected Answer**: (a) `-max` = worst-case slow corner for setup (maximum delays); `-min` = best-case fast corner for hold (minimum delays). (b) SS corner gives pessimistic (large) delays — hold analysis with SS would show paths that are "too slow" — artificially passing hold when they might actually race at FF corner. Must use FF for hold.

---

## 📘 Section 5 — Static Timing Analysis (STA / PrimeTime)
*(12 Questions)*

---

### Q43 🟡 [Moderate] — The 4 Fundamental Timing Paths
**Type: Conceptual**

Name and describe the 4 fundamental timing path types in STA, stating the startpoint, endpoint, and which SDC constraints bound each.

> **Expected Answer**: (1) **In-to-Reg**: Primary input → D-pin; bounded by `set_input_delay` + `create_clock`. (2) **Reg-to-Reg**: Q of launch flop → D of capture flop; bounded by `create_clock` on both. (3) **Reg-to-Out**: Q of flop → Primary output; bounded by `create_clock` + `set_output_delay`. (4) **In-to-Out**: Primary input → Primary output combinational path; bounded by `set_input_delay` + `set_output_delay`.

---

### Q44 ⚡ [Advanced] — Setup Slack Calculation
**Type: Mathematical**

Given:
- Clock period = 10 ns
- Launch clock latency = 0.5 ns
- Capture clock latency = 0.8 ns
- $T_{cq\_max}$ = 0.3 ns
- $T_{comb\_max}$ = 6.2 ns
- $T_{setup}$ = 0.15 ns
- Clock uncertainty (setup) = 0.2 ns

Calculate:
1. Data Arrival Time
2. Data Required Time
3. Setup Slack
4. Is there a violation?

> **Expected Answer**:
> - DAT = 0.5 + 0.3 + 6.2 = **7.0 ns**
> - DRT = 10 + 0.8 − 0.15 − 0.2 = **10.45 ns**
> - Slack = 10.45 − 7.0 = **+3.45 ns** ✅ No violation.

---

### Q45 ⚡ [Advanced] — Hold Slack Calculation
**Type: Mathematical**

Using the same design, minimum path:
- Launch clock latency = 0.5 ns
- Capture clock latency = 0.8 ns
- $T_{cq\_min}$ = 0.1 ns
- $T_{comb\_min}$ = 0.2 ns
- $T_{hold}$ = 0.08 ns
- Clock uncertainty (hold) = 0.05 ns

Calculate:
1. Data Arrival Time (min)
2. Data Required Time (hold)
3. Hold Slack
4. Is there a violation?

> **Expected Answer**:
> - DAT = 0.5 + 0.1 + 0.2 = **0.8 ns**
> - DRT = 0.8 + 0.08 + 0.05 = **0.93 ns**
> - Hold Slack = 0.8 − 0.93 = **−0.13 ns** ❌ Hold Violation!

---

### Q46 ⚡ [Advanced] — Clock Skew Impact Analysis
**Type: Conceptual + Mathematical**

**a)** Define positive clock skew and negative clock skew.

**b)** For setup analysis: does positive skew help or hurt? Show using the formula.

**c)** For hold analysis: does positive skew help or hurt?

**d)** Why can deliberate "useful skew" be a timing closure technique?

> **Expected Answer**: (a) Positive: capture clock arrives later than launch ($T_{cap} > T_{launch}$); Negative: opposite. (b) Positive skew **helps setup** — DRT increases: $DRT = T_{period} + T_{cap} - T_{setup}$, so larger $T_{cap}$ gives more required time margin. (c) Positive skew **hurts hold** — DRT also increases: $DRT = T_{cap} + T_{hold}$, raising the minimum the data must arrive. (d) By intentionally delaying the capture clock on setup-critical paths, you borrow time without changing clock frequency — useful when a specific path cannot meet timing through logic optimization alone.

---

### Q47 ⚡ [Advanced] — OCV & Derating
**Type: Conceptual**

**a)** What physical phenomenon does On-Chip Variation (OCV) model?

**b)** For setup analysis, which path is derated late and which is derated early? Why?

**c)** Write the PrimeTime commands for ±5% derating.

> **Expected Answer**: (a) PVT gradients across the die — cells in different locations see different voltage drops, temperature gradients, and process variation, causing the same cell to have different delays at different die locations. (b) Setup OCV: launch path derated **late** (slow = worse for setup), capture path derated **early** (fast = less required time, also worse for setup). (c):
> ```tcl
> set_timing_derate -early 0.95 -cell_delay
> set_timing_derate -late  1.05 -cell_delay
> ```

---

### Q48 🟡 [Moderate] — CPPR / CRPR Explained
**Type: Conceptual**

**a)** What is Common Path Pessimism Removal (CPPR)?

**b)** Give an example of when CPPR applies.

**c)** What command enables it in PrimeTime?

> **Expected Answer**: (a) When launch and capture clock paths share common clock tree buffers, those shared cells cannot simultaneously be "fast" (for launch) AND "slow" (for capture) in a hold check, or vice versa. CPPR removes this artificial double-counting of the shared path variation. (b) Two flops clocked by the same clock with only a local routing difference in their last clock buffer — the trunk of the clock tree is common. (c) `set timing_remove_clock_reconvergence_pessimism true`.

---

### Q49 ⚡ [Advanced] — Recovery & Removal Checks
**Type: Conceptual**

**a)** What is the **Recovery** timing check for an asynchronous reset?

**b)** What is the **Removal** timing check?

**c)** How do they relate to Setup and Hold checks?

**d)** Why must asynchronous resets be **synchronously de-asserted**?

> **Expected Answer**: (a) Recovery: minimum time `rst_n` must be de-asserted (go inactive) before the next active clock edge — analogous to setup. (b) Removal: minimum time `rst_n` must remain asserted after the clock edge before it de-asserts — analogous to hold. (c) Recovery ↔ Setup; Removal ↔ Hold. (d) If rst_n de-asserts asynchronously too close to the clock edge, different flip-flops exit reset on different cycles — breaking deterministic chip initialization and causing functional failures.

---

### Q50 ⚡ [Advanced] — Fixing Setup vs. Hold Violations
**Type: Scenario**

For each scenario, identify the violation type and explain the correct fix:

1. Critical path slack = −500 ps; path passes through 12 logic levels.
2. Data path minimum delay = 0.15 ns; hold requirement = 0.25 ns.
3. Clock frequency must be maintained; setup slack = −800 ps on a single path.

> **Expected Answer**: (1) Setup violation — upsizing cells on the critical path or pipelining (insert pipeline register). (2) Hold violation — insert delay buffers on the data path to increase minimum delay above hold requirement. (3) Setup on fixed-frequency — restructure logic to reduce level count, or apply useful clock skew to delay the capture flop's clock.

---

### Q51 🟡 [Moderate] — WNS vs. TNS
**Type: Conceptual**

**a)** Define Worst Negative Slack (WNS) and Total Negative Slack (TNS).

**b)** A design has WNS = −200 ps and TNS = −15,000 ps. What does this tell you about the design?

**c)** Which metric is more important for final tape-out signoff?

> **Expected Answer**: (a) WNS = slack of the single most violating path (most negative). TNS = sum of all negative slacks across all violating endpoints. (b) Many paths are violating (TNS is large) but no single path is catastrophically bad (WNS is small) — suggests systematic delay issues, not one outlier path. (c) WNS must be ≥ 0 at signoff — a single negative slack means the chip will not function. TNS informs optimization priority but WNS is the hard requirement.

---

### Q52 ⚡ [Advanced] — False Path vs. Multicycle Path — When to Use Which?
**Type: Scenario**

For each situation, choose the correct SDC exception:

1. An asynchronous clock domain boundary between an entirely independent USB controller and the CPU subsystem.
2. A floating-point divider that architecturally takes 4 cycles to produce a result.
3. A scan shift path between scan-in and scan-out during test mode.
4. A configuration register that is written only at boot and never changes during operation.

> **Expected Answer**: (1) `set_clock_groups -asynchronous` or `set_false_path`; (2) `set_multicycle_path -setup 4` + `-hold 3 -end`; (3) `set_false_path -through [get_pins */SE]`; (4) `set_false_path` — quasi-static, never sampled in functional timing.

---

### Q53 🟡 [Moderate] — `$Fmax$ Formula
**Type: Mathematical**

Derive the expression for maximum operating frequency $F_{max}$ in terms of $T_{cq}$, $T_{comb}$, $T_{setup}$, $T_{uncertainty}$, and clock skew $T_{skew}$.

> **Expected Answer**:
> $$T_{period\_min} = T_{cq\_max} + T_{comb\_max} + T_{setup} + T_{uncertainty} - T_{skew}$$
> $$F_{max} = \frac{1}{T_{period\_min}}$$
> Positive skew reduces $T_{period\_min}$ → increases $F_{max}$.

---

### Q54 ⚡ [Advanced] — Input/Output Delay Modeling
**Type: Scenario**

A flip-flop in the PCB outside the chip has `Tco = 2 ns`, and the board trace delay is `0.5 ns`. The chip clock period is 10 ns. The external flip-flop and chip share the same clock source with 1 ns of board skew.

**a)** Calculate the appropriate `set_input_delay` value.

**b)** Write the SDC command.

> **Expected Answer**: (a) Input delay = Tco_external + trace_delay + board_skew = 2 + 0.5 + 1 = **3.5 ns** (b) `set_input_delay 3.5 -max -clock MASTER_CLK [all_inputs]`

---

## 📘 Section 6 — Clock Domain Crossing (CDC) Design
*(10 Questions)*

---

### Q55 🟡 [Moderate] — Metastability Fundamentals
**Type: Conceptual**

**a)** What is metastability, and at what voltage level does it occur?

**b)** Can metastability be eliminated entirely? Why or why not?

**c)** What design technique makes metastability **safe** for system reliability?

> **Expected Answer**: (a) An intermediate voltage state between logic 0 and 1 where the internal feedback transistors of a flip-flop are in unstable equilibrium — neither fully switching nor staying. (b) No — it is a fundamental physical property of bistable circuits when setup/hold is violated. Any async crossing can theoretically metastabilize. (c) Adding resolution time via multi-stage synchronizers exponentially increases MTBF — the system tolerates occasional metastability by ensuring it resolves before downstream logic samples the signal.

---

### Q56 ⚡ [Advanced] — MTBF Formula Analysis
**Type: Mathematical**

Given:
- $\tau = 0.2$ ns, $T_0 = 1$ ns
- $f_{clk} = 200$ MHz (destination)
- $f_{data} = 10$ MHz (crossing frequency)
- $T_{clk} = 5$ ns, $T_{setup} = 0.15$ ns, $T_{co} = 0.3$ ns

**a)** Calculate $T_{res}$ for a 2-FF synchronizer (one extra FF adds one full $T_{clk}$).

**b)** Calculate MTBF.

**c)** Why does adding a third flip-flop to the synchronizer chain dramatically improve MTBF?

> **Expected Answer**:
> (a) $T_{res} = T_{clk} - T_{setup} - T_{co} + T_{clk} = (5 - 0.15 - 0.3) + 5 = 9.55$ ns (2-FF)
> (b) MTBF = $e^{9.55/0.2} / (1 \times 10^{-9} \times 200 \times 10^6 \times 10 \times 10^6)$ ≈ enormous (billions of years)
> (c) Each additional FF adds $T_{clk}$ to $T_{res}$ — the exponential $e^{T_{res}/\tau}$ means even a 5 ns addition multiplies MTBF by $e^{25}$ ≈ $7 \times 10^{10}$.

---

### Q57 ⚡ [Advanced] — Gray Code in Async FIFO
**Type: Mathematical + Conceptual**

**a)** Convert binary `0111` (7) to Gray code.

**b)** Convert binary `1000` (8) to Gray code.

**c)** Why is Gray code essential for async FIFO pointer synchronization, while binary is unsafe?

**d)** Write the Verilog expression to convert an N-bit binary to Gray.

> **Expected Answer**:
> (a) `0111 XOR 0011 = 0100`
> (b) `1000 XOR 0100 = 1100`
> (c) Binary 7→8 changes 4 bits simultaneously (0111→1000) — the 2-FF synchronizer sampling during transition might capture any of 16 combinations. Gray code changes exactly 1 bit — even if sampled mid-transition, the synchronizer captures either the old or new pointer value (both valid FIFO positions), never an erroneous intermediate address.
> (d) `assign gray = binary ^ (binary >> 1);`

---

### Q58 ⚡ [Advanced] — Async FIFO Full/Empty Conditions
**Type: Mathematical**

For a FIFO with address width N=3 (depth=8, pointers are 4 bits including wrap bit):

**a)** Write the mathematical condition for FIFO **empty** in terms of gray-coded pointers.

**b)** Write the mathematical condition for FIFO **full**.

**c)** Why is the full condition checked in the **write domain** and empty in the **read domain**?

> **Expected Answer**:
> (a) Empty (in read domain): `rptr_gray == wptr_gray_sync` — the synchronized write pointer equals the read pointer, indicating no unread data.
> (b) Full (in write domain): `wptr_gray[N:N-1] == ~rptr_gray_sync[N:N-1]` AND `wptr_gray[N-2:0] == rptr_gray_sync[N-2:0]` — write pointer has wrapped around and the top 2 bits are inverted relative to the read pointer.
> (c) The full flag controls the write side (prevents overflow) — must be evaluated with write-domain signals. The empty flag controls the read side (prevents underflow) — must be evaluated with read-domain signals.

---

### Q59 ⚡ [Advanced] — FIFO Depth Calculation
**Type: Mathematical**

A system writes data at 200 MHz (one word per clock) and reads at 80 MHz (one word per clock). A burst of 120 words is produced.

Calculate:
1. Time to write the burst
2. Words read during that time
3. Minimum required FIFO depth
4. Actual FIFO depth (next power of 2)

> **Expected Answer**:
> 1. Write time = 120 × (1/200 MHz) = 120 × 5 ns = **600 ns**
> 2. Words read = 600 ns / (1/80 MHz) = 600 ns / 12.5 ns = **48 words**
> 3. Min depth = 120 − 48 = **72 entries**
> 4. Actual depth = **128** (next power of 2 ≥ 72)

---

### Q60 🟡 [Moderate] — Reset Synchronizer Design
**Type: Conceptual + Code**

**a)** Why must an asynchronous reset be asserted **asynchronously** but de-asserted **synchronously**?

**b)** Draw the circuit topology of a reset synchronizer.

**c)** What is the role of the VCC (logic 1) input to the D-input of the first flip-flop?

> **Expected Answer**: (a) Async assertion: the clock may not be running at reset time (power-on, fault conditions) — must reset immediately regardless of clock. Sync de-assertion: if all flip-flops don't exit reset at the same clock edge, some may see combinational outputs from already-active blocks → glitches. (b) VCC → D of FF1; Q1 → D of FF2; Q2 = sync_rst_n. Async clear (rst_n) connected to both FFs. (c) VCC ensures that when reset is released, the flops will load logic '1' on the next clock edges, propagating the de-assertion signal cleanly.

---

### Q61 🟡 [Moderate] — Why You Cannot Use Multiple 2-FF Synchronizers for Multi-Bit Data
**Type: Conceptual**

A designer places separate 2-FF synchronizers on each bit of a 4-bit bus. Explain exactly why this is wrong.

> **Expected Answer**: Each flip-flop can resolve metastability in either 1 or 2 destination clock cycles independently. At any crossing event, bit[0] might resolve in 1 cycle while bit[3] resolves in 2 cycles — the destination domain sees a transient vector where some bits are updated and others are not. This coherence failure produces a completely erroneous intermediate vector that never existed in the source domain, causing functional corruption.

---

### Q62 ⚡ [Advanced] — Handshake Synchronizer Protocol
**Type: Conceptual + Diagram**

Describe the 4-phase handshake CDC protocol for multi-bit data transfer:

| Phase | Action | Signal State |
|---|---|---|
| Phase 1 | __(1)__ | __(2)__ |
| Phase 2 | __(3)__ | __(4)__ |
| Phase 3 | __(5)__ | __(6)__ |
| Phase 4 | __(7)__ | __(8)__ |

What is the main limitation of the handshake protocol vs. an Async FIFO?

> **Expected Answer**: (1) Source asserts REQ and puts data on bus; (2) REQ=1, ACK=0; (3) Destination synchronizes REQ, samples data, asserts ACK; (4) REQ=1, ACK=1; (5) Source sees synchronized ACK, de-asserts REQ; (6) REQ=0, ACK=1; (7) Destination sees de-asserted REQ, de-asserts ACK; (8) REQ=0, ACK=0. Limitation: maximum throughput = 1 transfer per 4 synchronizer latencies (8–12 cycles at destination frequency) — far lower than Async FIFO streaming.

---

### Q63 ⚡ [Advanced] — CDC in SpyGlass: `Ac_unsync02` Deep Dive
**Type: Scenario**

A 32-bit data bus crosses from CLKA to CLKB directly (no synchronizer). SpyGlass reports `Ac_unsync02`.

**a)** Is inserting 32 parallel 2-FF synchronizers the correct fix?

**b)** List three architecturally correct solutions with trade-offs.

> **Expected Answer**: (a) No — parallel synchronizers cause bus coherence failure (see Q61). Correct solutions: (1) **Async FIFO** — highest throughput, medium hardware cost, ideal for streaming; (2) **MUX-Recirculation (DATA_SYNC)** — source holds data stable, single-bit REQ synchronizes the load strobe — low cost but requires source to hold data; (3) **Handshake controller** — general purpose but low throughput, suitable for infrequent transfers.

---

### Q64 🟡 [Moderate] — CDC Verification Methodology: Simulation vs. Static
**Type: Conceptual**

**a)** Why is simulation alone insufficient for CDC verification?

**b)** What does SpyGlass CDC provide that simulation cannot?

> **Expected Answer**: (a) Simulation is input-vector-dependent — metastability events depend on exact timing between clock edges, which varies across PVT corners. No simulation can exhaustively cover all timing scenarios. (b) SpyGlass performs exhaustive static structural analysis — it mathematically checks all crossing paths regardless of stimulus, guaranteeing coverage of every possible metastability scenario in the design.

---

## 📘 Section 7 — Power Analysis & Clock Gating
*(5 Questions)*

---

### Q65 ⚡ [Advanced] — Power Components
**Type: Mathematical + Conceptual**

**a)** Write the full power equation and define each component.

**b)** A design's clock tree toggles at 200 MHz with 50 pF total load and 1.2V supply. Calculate the switching power.

**c)** Which power component dominates at high frequencies? At low frequencies (idle state)?

> **Expected Answer**:
> (a) $P_{total} = P_{internal} + P_{switching} + P_{leakage}$; $P_{switching} = \frac{1}{2} C V_{DD}^2 f \alpha$; $P_{leakage} = V_{DD} \cdot I_{leakage}$
> (b) $P = \frac{1}{2} \times 50 \times 10^{-12} \times 1.44 \times 200 \times 10^6 \times 1 = 7.2$ mW
> (c) Dynamic ($P_{internal} + P_{switching}$) dominates at high frequency; Leakage dominates at low frequency/idle — increasingly critical in advanced process nodes.

---

### Q66 ⚡ [Advanced] — VCD-Based Dynamic Power
**Type: Conceptual**

**a)** What does a Value Change Dump (VCD) file capture?

**b)** How does PrimeTime-PX use the VCD in power analysis?

**c)** What is the risk of using a VCD from an untypical workload scenario?

> **Expected Answer**: (a) Time-stamped event-driven records of every signal transition in the simulation — digital state changes and their exact simulation timestamps. (b) PT-PX reads the VCD to extract actual switching activity ($\alpha$ toggle rates) per net, then multiplies by capacitance and $V^2 f$ to compute accurate dynamic power. (c) The power report reflects only the simulated scenario — a test that doesn't activate major blocks gives underestimated power; worst-case power analysis requires maximum activity VCDs from stress tests.

---

### Q67 🟡 [Moderate] — Clock Gating Efficiency
**Type: Conceptual**

**a)** A design has 10,000 flip-flops. After ICG synthesis, 7,000 are gated with an average activity of 0.3 (30% of cycles they receive a clock). How much dynamic power is saved?

**b)** What is the minimum bit-width threshold for ICG and why?

> **Expected Answer**: (a) Gated FFs consume clock power only when enabled: savings = 7000 × (1 - 0.3) = 4900 FFs worth of clock power = 49% reduction in clock-related dynamic power. (b) Minimum 4–8 bits — below this, the area and power of the ICG cell itself (a latch + AND gate) exceeds the power saved by gating. The `set_clock_gating_style -minimum_bitwidth 4` command enforces this.

---

### Q68 ⚡ [Advanced] — SDF for GLS Power
**Type: Conceptual**

Why does GLS power analysis use **SDF back-annotation** while RTL power analysis uses **nominal estimates**?

> **Expected Answer**: RTL-level power uses generic wire models (WLM) and estimated activity — only ballpark accuracy. SDF provides actual cell propagation delays and parasitic RC values extracted from physical routing. With SDF in GLS, glitch power (false transitions in combinational logic before steady state) is captured accurately — RTL simulation cannot model glitches since RTL has zero propagation delay and all inputs switch simultaneously.

---

### Q69 🟡 [Moderate] — SAIF vs. VCD vs. FSDB
**Type: Fill-in-the-Blank**

| Format | Full Name | Content | Best Used For |
|---|---|---|---|
| VCD | __(1)__ | __(2)__ | __(3)__ |
| SAIF | __(4)__ | __(5)__ | __(6)__ |
| FSDB | __(7)__ | __(8)__ | __(9)__ |

---

## 📘 Section 8 — Formal Verification (Logic Equivalence Checking)
*(8 Questions)*

---

### Q70 🟡 [Moderate] — LEC vs. Simulation vs. STA
**Type: Conceptual**

Compare the three verification methods:

| Method | Covers | Cannot Catch |
|---|---|---|
| Simulation | __(1)__ | __(2)__ |
| STA | __(3)__ | __(4)__ |
| LEC (Formality) | __(5)__ | __(6)__ |

> **Expected Answer**: Simulation: (1) Functional behavior for applied vectors; (2) Bugs in uncovered state space, timing. STA: (3) All timing paths (100% coverage); (4) Functional logic correctness, dynamic hazards. LEC: (5) Proves logical equivalence of two designs across 100% state space; (6) Does not verify the design is "correct" — only that two representations are identical.

---

### Q71 ⚡ [Advanced] — SVF (Setup Verification Format) — Why It's Critical
**Type: Conceptual**

Design Compiler performs FSM re-encoding, register retiming, and boundary optimization. Without an SVF file, Formality often reports "ABORTED" or "FAILED" even when the design is functionally correct.

**a)** Explain why FSM re-encoding breaks Formality without SVF.

**b)** Explain why register retiming breaks Formality without SVF.

**c)** How is the SVF generated and consumed?

> **Expected Answer**: (a) DC may change state encoding (e.g., Binary → One-Hot) — register names, bit-widths, and state values all change. Formality cannot match the retimed state bits back to the original RTL states without SVF guidance. (b) Retiming moves registers across combinational logic boundaries — a register that existed at a module output in RTL may now be at a logic gate input in the netlist. Without SVF, Formality cannot find the matching compare point. (c) Generated: `set_svf <name>.svf` before `compile` in DC; turns off with `set_svf -off`. Consumed: `set_svf <name>.svf` in `fm_shell` before `read_verilog`.

---

### Q72 ⚡ [Advanced] — Compare Points & Logic Cones
**Type: Conceptual**

**a)** What are Formality Compare Points? List the 3 types.

**b)** What happens if a compare point in the implementation has no matching point in the reference?

**c)** What does it mean when a compare point is reported as "ABORTED"?

> **Expected Answer**: (a) Points where Formality cuts the sequential circuit into bounded combinational cones: (1) Primary output ports; (2) D-inputs of all flip-flops and latches; (3) Inputs to black-box modules. (b) Listed in `unmatched_points.rpt` — could indicate unintended register removal by synthesis (optimization eliminated a register) — must be reviewed carefully. (c) The SAT solver ran out of memory or time budget for that cone — the equivalence is neither proven nor disproven — requires debugging (cone simplification, additional SVF guidance).

---

### Q73 🟡 [Moderate] — Handling Post-DFT Formal Verification
**Type: Code Review**

After DFT insertion, Formality fails with hundreds of mismatches. Write the 4 TCL commands needed to configure Formality correctly for post-DFT verification.

> **Expected Answer**:
> ```tcl
> set_dont_verify_points -type port Ref:/WORK/*/SI -quiet
> set_dont_verify_points -type port Imp:/WORK/*/SI -quiet
> set_dont_verify_points -type port Ref:/WORK/*/SO -quiet
> set_dont_verify_points -type port Imp:/WORK/*/SO -quiet
> set_constant Ref:/WORK/*/SE 0 -quiet
> set_constant Imp:/WORK/*/SE 0 -quiet
> set_constant Ref:/WORK/*/test_mode 0 -quiet
> set_constant Imp:/WORK/*/test_mode 0 -quiet
> ```

---

### Q74 ⚡ [Advanced] — Formality vs. Simulation: Exhaustiveness
**Type: Conceptual**

A design has 32 state registers. How many input combinations would a simulation need to exhaustively cover, vs. what Formality mathematically proves?

> **Expected Answer**: Simulation: $2^{32} \times$ (number of input combinations per state) = over 4 billion state combinations × input space — computationally impossible to cover exhaustively. Formality: uses BDD (Binary Decision Diagrams) and SAT solvers to mathematically reason about ALL possible states simultaneously — proves equivalence across the entire state space in minutes without enumeration.

---

### Q75 ⚡ [Advanced] — Diagnosing Formal Failures
**Type: Scenario**

`fm_shell` reports:

```
FAILED: 3 compare points
  - reg_out[7]: FAILED
  - reg_out[6]: FAILED
  - primary_output_STATUS: FAILED
```

**a)** What command do you run to investigate?

**b)** What does `analyze_points -failing` show you?

**c)** List 3 common root causes for Formality failures.

> **Expected Answer**: (a) `diagnose; analyze_points -failing`. (b) Shows the counter-example input vector that distinguishes the two implementations — the exact input combination that causes the mismatch. (c) (1) Missing SVF — DC optimization changed structure untracked; (2) DFT test mode not set to functional (SE=1 during verification); (3) Intentional RTL changes not reflected in re-running synthesis — stale netlist vs. new RTL.

---

### Q76 🟡 [Moderate] — Ref vs. Imp Containers
**Type: Scenario**

You are verifying a post-PnR netlist against the original RTL. Which design goes in `Ref` and which in `Imp`? What additional files must be loaded into each container?

> **Expected Answer**: **Ref**: RTL (`read_verilog` of all source `.v` files) + standard cell `.db` libraries. **Imp**: Post-PnR netlist (`read_verilog` of `top_pnr.v`) + same `.db` libraries. SVF must be loaded globally. For post-PnR: may also need `read_verilog` of standard cell gate models if not fully in the `.db`.

---

### Q77 ⚡ [Advanced] — Incremental LEC Points
**Type: Conceptual**

In a large 500K-gate design, Formality is taking 12 hours to complete. What 3 techniques can you apply to improve runtime without sacrificing coverage?

> **Expected Answer**: (1) **Cone decomposition / hierarchical verification** — verify sub-blocks independently with set boundaries, then top-level integration. (2) **Restrict verification scope** with `set_dont_verify_points` for known-stable blocks that haven't changed. (3) **SVF accuracy** — ensure comprehensive SVF was generated during synthesis so Formality doesn't waste time on unmatched topology exploration.

---

## 📘 Section 9 — Design for Testability (DFT)
*(10 Questions)*

---

### Q78 🟡 [Moderate] — Why DFT?
**Type: Conceptual**

Distinguish between **functional verification** and **manufacturing test**. Why can a chip pass all RTL simulations but still fail manufacturing test?

> **Expected Answer**: Functional verification confirms the design's logical behavior matches the specification. Manufacturing test detects physical silicon defects (metal shorts, opens, via voids, gate oxide defects) introduced during CMOS fabrication. A chip can be logically perfect but have a metal short between two adjacent traces from a lithography defect — simulation cannot model physical process variation. ATPG generates test patterns specifically targeting physical fault models (stuck-at-0, stuck-at-1, transition faults).

---

### Q79 ⚡ [Advanced] — Muxed-D Scan Flip-Flop Operation
**Type: Conceptual + Code**

**a)** Draw/describe the internal architecture of a Muxed-D Scan Flip-Flop (SDFF).

**b)** What is the state of `SE` during: normal functional operation, scan shift, capture?

**c)** Write a simple Verilog model of a Muxed-D SDFF.

> **Expected Answer**: (a) 2:1 MUX → D-FF: inputs are Functional_D (sel=0) and Scan_In (sel=1), controlled by SE. (b) Normal: SE=0; Shift: SE=1; Capture: SE=0 (one clock pulse). (c):
> ```verilog
> module SDFF(input CLK, SE, D, SI, output reg Q);
>     always @(posedge CLK)
>         Q <= SE ? SI : D;
> endmodule
> ```

---

### Q80 ⚡ [Advanced] — DFT DRC: Clock Controllability (D1)
**Type: Scenario**

A design has an internal clock divider generating `div_clk = clk / 4`. During scan shift mode, the tester needs to pulse the clock at full speed to shift data. The divider prevents this.

**a)** Which DFT DRC rule fires?

**b)** Draw/describe the fix.

> **Expected Answer**: (a) **D1: Clock Controllability violation** — the scan clock cannot be applied at the flip-flop clock pins because of the intervening divider. (b) Insert a `test_mode`-controlled 2:1 MUX at the clock input of the downstream logic: `gated_clk = test_mode ? scan_clk : div_clk`. When `test_mode=1`, `scan_clk` directly drives the scan chain, bypassing the divider. DC command: `set_dft_signal -port scan_clk -type ScanClock`.

---

### Q81 ⚡ [Advanced] — DFT DRC: Reset Controllability (D2)
**Type: Scenario**

During scan shift, the asynchronous reset is still active. This corrupts the scan chain by resetting flip-flops mid-shift.

**a)** Which DFT DRC rule fires?

**b)** Write the gate-level fix.

> **Expected Answer**: (a) **D2: Reset Controllability violation**. (b) Gate the reset with `test_mode`: `actual_rst_n = rst_n | test_mode;` — when `test_mode=1`, reset is held inactive (logic 1 for active-low reset), allowing free scan shifting. DC:
> ```tcl
> set_dft_signal -port scan_rst -type Reset -view existing_dft -active_state 0
> ```

---

### Q82 🟡 [Moderate] — Scan Chain Architecture
**Type: Conceptual**

**a)** Why is `-clock_mixing no_mix` important in scan chain configuration?

**b)** What happens if positive-edge and negative-edge flip-flops are in the same chain?

**c)** Why does DFT Compiler automatically place negative-edge flip-flops first in the chain?

> **Expected Answer**: (a) Mixing clocks from different domains in one chain causes hold time violations during scan shift — the chain data races through multiple domains on a single shift clock pulse. (b) On a rising shift clock edge, the positive-edge flop captures the new value while the negative-edge flop still holds the old — the chain works but the negative-edge flop's old data gets written over before it can be shifted out. (c) By placing neg-edge first, the neg-edge flops capture the SI data on the shift clock rising edge and pass to pos-edge on the falling edge — avoiding data overlap.

---

### Q83 ⚡ [Advanced] — ATPG Coverage
**Type: Conceptual**

**a)** What is stuck-at fault coverage and why does it matter?

**b)** What is the target coverage for production tape-out?

**c)** What are "untestable" faults and how are they classified?

> **Expected Answer**: (a) Percentage of all modeled stuck-at-0/stuck-at-1 faults that can be detected by generated ATPG patterns. Higher coverage = higher confidence no manufactured chip will escape with undetected defects. (b) Industry standard: ≥ 98% stuck-at fault coverage (often 99%+). (c) Untestable faults are physical nodes that cannot be controlled or observed through any combination of primary inputs/outputs even with scan access — typically clock pins, tied rails, redundant logic. Classified as: Redundant (logically masked), Unused (dead code), Tied (constant by design).

---

### Q84 ⚡ [Advanced] — Post-DFT Deliverables to TetraMAX
**Type: Fill-in-the-Blank**

Match the DFT output file to what TetraMAX needs it for:

| File | Purpose in ATPG |
|---|---|
| `top_dft.v` | __(1)__ |
| `top_dft.spf` | __(2)__ |
| `top_dft.sdc` | __(3)__ |
| `scan_paths.rpt` | __(4)__ |

> **Expected Answer**: (1) Gate-level netlist — TetraMAX uses structural connectivity to model faults and generate patterns; (2) STIL Protocol File — defines scan chain connectivity (SI/SO ports, SE, scan clock timing waveforms) for TetraMAX scan setup; (3) Timing constraints — ensures ATPG patterns respect scan clock periods and hold times; (4) Scan path report — audit document verifying chain integrity before ATPG.

---

### Q85 🟡 [Moderate] — `compile -scan` vs. `insert_dft`
**Type: Conceptual**

What is the functional difference between these two DC-DFT commands?

> **Expected Answer**: `compile -scan` replaces standard D flip-flops with **unstitched** scan flip-flops — each SDFF has its SI and SO pins floating. No scan chain connections are made yet. `insert_dft` physically stitches the unconnected scan ports into ordered chains: `SI → SDFF1.SI, SDFF1.Q → SDFF2.SI, ..., SDFFn.Q → SO`. After `insert_dft`, a complete, functional scan path exists from SI to SO.

---

### Q86 ⚡ [Advanced] — DFT's Impact on Formal Verification
**Type: Conceptual**

After DFT insertion, running Formality between pre-DFT RTL and post-DFT netlist fails. What 5 specific changes does DFT introduce that Formality must account for?

> **Expected Answer**: (1) **New ports added**: SI, SO, SE, scan_clk, scan_rst, test_mode — not in RTL; (2) **MUX inserted at every flip-flop D-input** — changes logic topology; (3) **Scan chain routing** changes FF connectivity; (4) **test_mode mux bypasses** clock dividers — creates alternative clock paths; (5) **Reset gating** with test_mode. Fix: use `set_dont_verify_points` on SI/SO ports, `set_constant SE=0, test_mode=0` to force functional mode.

---

## 📘 Section 10 — Gate-Level Simulation (GLS)
*(5 Questions)*

---

### Q87 🟡 [Moderate] — Why GLS After STA?
**Type: Conceptual**

STA proves all timing paths are clean. LEC proves the netlist matches the RTL. What additional failures can GLS catch that these two methods miss? List at least 4.

> **Expected Answer**: (1) **Asynchronous reset recovery/removal violations** — a reset that de-asserts metastably at the clock edge; STA checks the recovery time but GLS shows the actual sequential impact on downstream logic. (2) **CDC functional verification** — STA and LEC don't simulate data values through synchronizers and FIFOs; GLS with real delays validates handshake protocols. (3) **Glitch detection** — combinational hazards caused by unequal path delays produce glitches not visible in RTL (zero-delay) simulation. (4) **Multi-cycle / false path validation** — confirms that the logic actually completes in the allocated cycles under real delays. (5) **Functional X-state propagation** — ensures all flip-flops initialize correctly on reset.

---

### Q88 ⚡ [Advanced] — SDF Annotation Modes
**Type: Scenario**

Explain when you use each SDF mode and why:

| Mode | vsim Flag | Purpose | PVT Corner |
|---|---|---|---|
| Zero-delay | `+notimingchecks` | __(1)__ | __(2)__ |
| SDF Max | `-sdfmax` | __(3)__ | __(4)__ |
| SDF Min | `-sdfmin` | __(5)__ | __(6)__ |

> **Expected Answer**: (1) Pure functional verification — confirms logic is correct without timing; (2) N/A (no delays); (3) Setup-time worst-case verification — maximum delays show worst-case data arrival; (4) SS 1.08V 125°C; (5) Hold-time verification — minimum delays reveal fastest possible data propagation and potential hold races; (6) FF 1.32V −40°C.

---

### Q89 ⚡ [Advanced] — X-Propagation Problem
**Type: Scenario**

In GLS with SDF max annotation, 80% of the output waveforms show `XXXX` starting at time 0 and never resolving, even though the design works perfectly in RTL simulation.

**a)** What is the most likely cause?

**b)** What is the correct diagnostic approach?

**c)** How do you fix it?

> **Expected Answer**: (a) Flip-flops without asynchronous reset power up in state `X` in gate-level models. Any gate receiving X propagates X to its output — cascading X through the entire design. RTL is X-pessimistic about initial values (undefined) but synthesis-generated models are strictly `X` until actively reset. (b) Check if asynchronous reset pulse is applied at t=0 in the testbench; check if SDF load order is correct; use `+acc` flags to inspect individual flip-flop states. (c) Apply a clean reset pulse for ≥2 clock cycles at the start of simulation; any flip-flop without async reset must be force-initialized via `$deposit` or simulator `force` command.

---

### Q90 ⚡ [Advanced] — Notifier Register Mechanism
**Type: Conceptual**

A GLS simulation runs correctly for 10 µs then starts producing X on several outputs.

**a)** What is a timing notifier register in standard cell specify blocks?

**b)** How does it relate to the observed X corruption?

**c)** What are the two strategies to handle this?

> **Expected Answer**: (a) A Verilog `$setup`/`$hold` system task inside a `specify` block monitors setup/hold violations at a flip-flop pin. When a violation is detected, it writes X to a connected **notifier register** — the flip-flop model then forces its Q output to X to signal the timing failure. (b) A legitimate setup or hold violation in the design (often near reset or during mode transitions) triggers the notifier, propagating X downstream — the design may work at slow silicon but the SDF max simulation exposes a real marginal path. (c) (1) **Debug mode**: investigate which specific path is violating using `+timing_checks` and timing reports; (2) **Suppress during initialization only**: `+notimingchecks` or `+no_notifier` for the reset phase, then re-enable for functional verification.

---

### Q91 🟡 [Moderate] — Power Analysis Flow
**Type: Conceptual**

Describe the 5-step PrimeTime-PX flow for dynamic power analysis after GLS.

> **Expected Answer**:
> 1. Enable power mode: `set_app_var power_enable_analysis true; set_app_var power_analysis_mode time_based`
> 2. Read gate netlist and `link_design`
> 3. Read timing constraints: `read_sdc` + `read_sdf` (back-annotate delays)
> 4. Annotate switching activity: `read_vcd -strip_path tb/dut design.vcd`
> 5. Calculate and report: `update_power; report_power > power.rpt; report_power -hierarchy > power_hier.rpt`

---

## 📘 Section 11 — Physical Design (Place & Route)
*(8 Questions)*

---

### Q92 🟡 [Moderate] — PnR Flow Stages
**Type: Conceptual**

Name all 7 major stages of the physical design flow in order, with a one-sentence description of each.

> **Expected Answer**: (1) **Design Import & MMMC Setup** — load netlist, LEF, lib, define multi-corner views; (2) **Floorplanning & Power Planning** — define die/core area, insert VDD/VSS rings and stripes; (3) **Standard Cell Placement** — legally place all cells minimizing wirelength; (4) **Clock Tree Synthesis (CTS)** — build balanced clock buffer tree minimizing skew; (5) **Global & Detailed Routing** — NanoRoute assigns metal tracks and vias; (6) **Chip Finishing** — filler cells, antenna fix, DRC/LVS; (7) **Signoff Export** — GDSII, SPEF, post-PnR netlist, SDF.

---

### Q93 ⚡ [Advanced] — Floorplan Utilization & Aspect Ratio
**Type: Mathematical**

A design has:
- Total standard cell area: 15,000 µm²
- Die dimensions: 200 µm × 150 µm
- Core margins: 5 µm on all sides

Calculate:
1. Core area
2. Core utilization
3. Aspect ratio
4. Is this a reasonable utilization? Why?

> **Expected Answer**:
> 1. Core = (200 − 10) × (150 − 10) = 190 × 140 = **26,600 µm²**
> 2. Utilization = 15,000 / 26,600 = **56.4%**
> 3. Aspect ratio = 140 / 190 = **0.74**
> 4. Yes — 50–70% utilization is typical. Below 50% wastes area; above 80% causes routing congestion and makes CTS/routing difficult.

---

### Q94 ⚡ [Advanced] — Clock Tree Synthesis (CTS) Targets
**Type: Conceptual + Scenario**

**a)** Define clock skew, insertion delay, and transition time in the context of CTS.

**b)** After CTS, skew = 450 ps but the target is ≤ 200 ps. What are 3 approaches to reduce it?

**c)** Why must hold violations be re-checked after CTS?

> **Expected Answer**: (a) Skew: max difference in clock arrival time between any two FFs; Insertion delay: time for clock to travel from source pin to FF clock pins; Transition (slew): rise/fall time of clock waveform at FF pins. (b) (1) Restructure the clock tree topology to more balanced H-tree; (2) Add extra buffering on late-arriving branches; (3) Upsize clock buffers on high-fanout nodes. (c) Before CTS, clocks are ideal (zero delay). After CTS, real insertion delays exist — paths that had marginal hold timing during synthesis may now violate because the capture flop receives its clock later than the launch flop, reducing the data travel window.

---

### Q95 ⚡ [Advanced] — Power Delivery Network (PDN) Concepts
**Type: Conceptual**

**a)** Describe the 3-tier power delivery hierarchy in an ASIC.

**b)** What is IR drop and why is it dangerous?

**c)** What is electromigration and how does it limit power stripe width?

> **Expected Answer**: (a) (1) Power Rings — thick metal rings around core carrying VDD/VSS from pad to core; (2) Power Stripes — wide metal lines on upper layers (M5/M6) distributing current across the core; (3) Standard Cell Rails — M1 horizontal lines in each standard cell row connected to cell VDD/VSS pins. (b) IR drop = voltage drop across the resistance of power routes ($V = I \times R$). Excessive drop lowers $V_{DD}$ at cell locations → cells run slower → setup violations and functional failure. (c) Electromigration: electron wind physically displaces metal atoms over time, creating voids and shorts. Each metal layer has a maximum current density limit (A/µm) — exceeding it causes long-term reliability failure. Wider stripes reduce current density.

---

### Q96 ⚡ [Advanced] — Filler Cells vs. Tie Cells
**Type: Conceptual**

**a)** Why are filler cells (FILL1M, FILL4M, etc.) needed, and what do they contain?

**b)** Why can't floating gate inputs (unused logic inputs) be connected directly to VDD or VSS?

**c)** What cells replace direct VDD/VSS connections, and why are they necessary?

> **Expected Answer**: (a) Empty gaps between standard cells break the continuous N-well and P-substrate implant layers required by CMOS process — DRC violations occur without them. Filler cells contain no active transistors but maintain the implant continuity. (b) Direct connections to VDD/VSS rails are subject to ESD events during PCB handling — the voltage spike can rupture thin gate oxides (< 5 nm in modern nodes). (c) Tie-Hi (`TIEHIM`) and Tie-Lo (`TIELOM`) standard cells — they contain a protected transistor circuit with internal ESD clamps that safely produce logic 1 or 0 at their output, connected to unused gate inputs.

---

### Q97 🟡 [Moderate] — GDSII Tape-Out Process
**Type: Conceptual**

**a)** What does "tape-out" mean in the IC design flow?

**b)** What is GDSII and what information does it contain?

**c)** After GDSII generation, what are the two final foundry verification steps?

> **Expected Answer**: (a) Tape-out is the final delivery of the chip design to the semiconductor foundry — the point at which no further RTL/physical changes can be made. Historically referred to the magnetic tape that carried the design data. (b) GDSII (Graphic Data System II) is a binary stream format containing all physical mask layer geometries — every polygon, via, text label, and layer assignment needed to expose photolithography masks. (c) (1) **DRC (Design Rule Check)** — verifies all geometries meet foundry minimum spacing, width, and density rules; (2) **LVS (Layout vs. Schematic)** — verifies the extracted netlist from the layout matches the gate-level schematic connectivity.

---

### Q98 ⚡ [Advanced] — Antenna Violation
**Type: Conceptual**

**a)** What causes an antenna effect during fabrication?

**b)** What is the danger to the circuit?

**c)** Name two methods to fix antenna violations.

> **Expected Answer**: (a) During plasma etching, long metal routes act as antennas and accumulate charge from the ionized gas. When the charge is large enough, it drives current through connected gate oxides before the gate is connected to a protective source/drain diffusion. (b) The accumulated charge can rupture the thin gate oxide (2–5 nm) permanently, causing the transistor to fail or shift its threshold voltage — parametric yield loss. (c) (1) **Antenna diode insertion** — add a diode-connected transistor at the gate input to discharge accumulated charge through the substrate; (2) **Metal jumper** — break the long antenna route and re-route through a higher metal layer that has an intervening via (the via diffusion resets the antenna ratio).

---

### Q99 ⚡ [Advanced] — MMMC Setup in PnR
**Type: Conceptual**

**a)** What does MMMC (Multi-Mode Multi-Corner) mean in physical design?

**b)** Why do you need both `max_library` (SS) and `min_library` (FF) simultaneously active?

**c)** How does Encounter use MMMC during post-CTS timing optimization?

> **Expected Answer**: (a) MMMC simultaneously analyzes the design across multiple operating modes (functional, test, low-power) and multiple PVT corners (SS 125°C for setup, FF −40°C for hold) within a single PnR session. (b) Setup optimization needs worst-case slow timing (SS); hold optimization needs best-case fast timing (FF). Without both, fixing setup violations might introduce hold violations and vice versa — MMMC prevents oscillating fixes. (c) After CTS, Encounter runs timing analysis at all configured corners simultaneously — buffers inserted for hold at FF corner are also verified not to create setup issues at SS corner, and vice versa.

---

### Q100 ⚡ [Advanced] — Full ASIC Flow Integration Question
**Type: System-Level Scenario**

You are a digital backend engineer and the chip has just returned from the foundry with failures on 30% of units. The failing chips produce wrong outputs only at high temperature (125°C) and high frequency (design is running at 500 MHz).

**a)** What type of failure is most likely?

**b)** Trace through which steps of the ASIC flow may have failed to catch this.

**c)** Propose a complete corrective action plan for the next tape-out.

> **Expected Answer**:
> (a) **Setup timing violation** at the slow-slow process corner (SS + 125°C) — cells are at their slowest, paths that marginally met timing in the lab (typical conditions) violate at worst-case corners.
> (b) Possible flow gaps: (1) STA was not run at SS 125°C corner (only TT); (2) Wire load model was inaccurate pre-layout → actual routing RC is worse; (3) OCV derating was not applied; (4) SPEF back-annotation from PnR was not used for final STA; (5) Clock uncertainty margin was insufficient.
> (c) Corrective plan: (1) **Re-run STA at SS 1.08V 125°C** with SPEF back-annotation from the actual routed layout; (2) **Enable OCV derating** (±5% or use AOCV tables from foundry); (3) **Increase clock uncertainty margin** to cover measured jitter + skew; (4) **Fix critical paths** — upsize cells on violating paths or increase pipeline depth; (5) **Add timing margin guard** of +200–500 ps to all critical endpoints before tape-out.

---

## 📊 Summary Statistics

| Section | Topic | # Questions | Difficulty |
|---|---|---|---|
| 1 | Verilog HDL & Digital Architecture | 12 | 8 Adv / 4 Mod |
| 2 | TCL Scripting | 8 | 5 Adv / 3 Mod |
| 3 | SpyGlass Lint & CDC | 10 | 7 Adv / 3 Mod |
| 4 | ASIC Synthesis (DC) | 12 | 9 Adv / 3 Mod |
| 5 | Static Timing Analysis | 12 | 9 Adv / 3 Mod |
| 6 | CDC Design | 10 | 7 Adv / 3 Mod |
| 7 | Power Analysis | 5 | 3 Adv / 2 Mod |
| 8 | Formal Verification | 8 | 6 Adv / 2 Mod |
| 9 | DFT & Scan | 10 | 7 Adv / 3 Mod |
| 10 | Gate-Level Simulation | 5 | 4 Adv / 1 Mod |
| 11 | Physical Design (PnR) | 8 | 6 Adv / 2 Mod |
| **Total** | | **100** | **71 Adv / 29 Mod** |

---

## 🎓 Interview Tips

> [!TIP]
> **For behavioral interviews**: Always connect your answer to the diploma project experience — mention SpyGlass, Design Compiler, PrimeTime, Formality, or Cadence Encounter by name.

> [!IMPORTANT]
> **Key companies and what they focus on**:
> - **Digital Design RTL roles**: Q1–Q12, Q55–Q64 (CDC is always asked)
> - **Synthesis/STA roles**: Q31–Q54 heavily tested
> - **DFT-specialist roles**: Q78–Q86 are critical
> - **Physical Design roles**: Q92–Q100 are your foundation
> - **Verification roles**: Q70–Q77 (Formal), Q87–Q91 (GLS)

> [!NOTE]
> **Formula cheat sheet to memorize**:
> - Setup Slack = $(T_{period} + T_{cap\_clk} - T_{setup} - T_{unc}) - (T_{launch\_clk} + T_{cq\_max} + T_{comb\_max})$
> - Hold Slack = $(T_{launch\_clk} + T_{cq\_min} + T_{comb\_min}) - (T_{cap\_clk} + T_{hold} + T_{unc\_hold})$
> - Gray Code: `gray = binary ^ (binary >> 1)`
> - $F_{max} = 1 / (T_{cq} + T_{comb} + T_{setup} + T_{unc} - T_{skew})$
> - $P_{switching} = \frac{1}{2} C V_{DD}^2 f \alpha$
