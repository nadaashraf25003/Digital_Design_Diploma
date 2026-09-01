# TCL Scripting for Digital Design & EDA Automation Guide

A comprehensive, structured guide and reference for **Tool Command Language (TCL)** used across ASIC design and EDA tools (Synopsys Design Compiler, PrimeTime, QuestaSim/ModelSim, Cadence Innovus, etc.).

This guide unifies all concepts, syntax, data structures, and automation techniques from the Diploma's TCL Labs and Assignments.

---

##  TCL Master File Location

- **Script**: [`master_tcl_reference.tcl`](file:///c:/Users/user/Desktop/DigitalDesign/Digital_Design_Diploma/2-TCL/master_tcl_reference.tcl)

---

##  How to Execute

### 1. In Terminal / Shell
```bash
tclsh master_tcl_reference.tcl
```

### 2. Inside Any EDA Tool (DC / PrimeTime / ModelSim / Vivado)
```tcl
source master_tcl_reference.tcl
```

---

##  Core Topics & Concept Breakdown

### 1. Variables & Substitution Rules (Lab 1)
- **Variable Definition**: `set varName value`
- **Variable Dereferencing**: `$varName`
- **Double Quotes (`"..."`)**: Allows variable and command substitution.
- **Curly Braces (`{...}`)**: Disables all substitutions (literal string).
- **Backslash Escaping (`\$`)**: Suppresses variable evaluation.

```tcl
set var0 25
puts "Value is $var0"    ;# Prints: Value is 25
puts {Value is $var0}   ;# Prints: Value is $var0
puts "Value is \$var0"  ;# Prints: Value is $var0
```

---

### 2. Expressions, Operators & Math Functions (Lab 2, Ass 1, 2, 3)
All mathematical and logical evaluations in TCL use the `expr` command.

| Category | Operators / Functions | Example | Result |
| :--- | :--- | :--- | :--- |
| **Arithmetic** | `+`, `-`, `*`, `/`, `%` | `expr 35 / 80` (int)<br>`expr 35.0 / 80` (float) | `0`<br>`0.4375` |
| **Logical** | `&&`, `\|\|`, `!` | `expr 5 && 0`<br>`expr 5 \|\| -1` | `0` (false)<br>`1` (true) |
| **Bitwise** | `&`, `\|`, `^`, `~`, `<<`, `>>` | `expr 20 & 9`<br>`expr 20 \| 5`<br>`expr 20 ^ 20` | `0`<br>`21`<br>`0` |
| **Math Functions** | `abs()`, `sqrt()`, `pow()`, `round()` | `expr abs(-64)`<br>`expr sqrt(49)` | `64`<br>`7.0` |

---

### 3. String Manipulation & Pattern Matching (Lab 3)
TCL provides rich built-in `string` commands for string operations:

- **Length**: `string length $str`
- **Index Search**: `string first "@" $str` or `string last "@" $str`
- **Range / Slice**: `string range $str <start_idx> <end_idx>`
- **Case Conversion**: `string toupper $str` / `string tolower $str`
- **Append**: `append strVar "additional text"`
- **Pattern Matching**: `string match "*pattern*" $str` (supports `*` and `?` globs)

```tcl
set email "MahmoudAhmed@gmail.com"
set at_idx [string last "@" $email]
set user_name [string range $email 0 [expr $at_idx - 1]]
puts [string toupper $user_name] ;# MAHMOUDAHMED
```

---

### 4. Lists & Iteration Loops (Lab 4)
Lists are ordered collections of strings or numbers, essential for handling collections of pins, clocks, and netlists in EDA tools.

- **Creation**: `set myList [list Jan Mar April]` or `set myList {Jan Mar April}`
- **Length**: `llength $myList`
- **Element Access**: `lindex $myList 2` (0-indexed)
- **Search**: `lsearch $myList "Mar"` (returns index, or `-1` if absent)
- **Insert**: `linsert $myList 1 "Feb"`
- **Append**: `lappend myList "May" "June"`
- **Concatenate**: `concat $list1 $list2`
- **Slice**: `lrange $myList 0 2`
- **Convert to/from String**: `join $myList ", "` and `split $str " "`

#### Loops:
```tcl
# For Loop:
for {set i 0} {$i < [llength $myList]} {incr i} {
    puts [lindex $myList $i]
}

# Foreach Loop:
foreach item $myList {
    puts [string tolower $item]
}
```

---

### 5. Associative Arrays & Procedures with `upvar` (Lab 5)
- **Associative Arrays**: Key-value hash tables (`arr(key)`).
- **Array Inspection**: `array size arrName`, `array names arrName`.
- **`proc`**: Defines reusable functions.
- **`upvar`**: Passes variables or arrays by reference from the calling scope into the procedure.

```tcl
proc Avg {arr_param} {
    upvar $arr_param arr
    set size [array size arr]
    set keys [array names arr]
    set sum 0.0
    foreach k $keys {
        set sum [expr $sum + $arr($k)]
    }
    return [expr $sum / $size]
}

array set StudentGrades {Waves 70 Electronics 85 Control 65 Communication 78}
puts "GPA: [Avg StudentGrades]%"
```

---

### 6. File I/O & Regular Expressions (`regsub`, `regexp`) (Lab 6)
Used extensively for parsing reports, modifying netlists, and generating automated testbenches.

- **File Open & Read**:
  ```tcl
  set fh [open "Interface.txt" r]
  set content [read $fh]
  close $fh
  ```
- **File Write**:
  ```tcl
  set fh [open "tb.txt" w+]
  puts $fh $content
  close $fh
  ```
- **Regex Substitution (`regsub`)**:
  ```tcl
  # Replace 'input' with 'reg' and 'output' with 'wire'
  regsub -all {\binput\b}  $content "reg"  content
  regsub -all {\boutput\b} $content "wire" content

  # Add testbench prefix 'i_' and 'o_'
  regsub -all {\bCLK\b} $content "i_CLK;" content
  ```

---

##  Quick EDA Scripting Reference

| Task in EDA Tools | TCL Command Pattern |
| :--- | :--- |
| Set Search Path | `lappend search_path /path/to/dir` |
| List of Ports | `set ports [get_ports *]` |
| Iterating over collections | `foreach_in_collection pin [get_pins *] { ... }` |
| Conditional Execution | `if {[sizeof_collection [get_ports -quiet RST]] > 0} { ... }` |
| String Matching Pins | `get_pins -hierarchical *o_div_clk` |
| Calculating timing budgets | `set in_delay [expr 0.2 * $CLK_PER]` |
