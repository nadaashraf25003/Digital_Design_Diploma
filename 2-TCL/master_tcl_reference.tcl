####################################################################################
# ==================================================================================
#                     MASTER UNIFIED TCL SCRIPT & REFERENCE GUIDE
#                               Digital Design & EDA Automation
# ==================================================================================
# This unified script brings together all core concepts, syntax, control flows,
# data structures, procedures, file I/O, regex substitutions, and EDA automation
# examples taught across all TCL labs and assignments (Labs 1.0 - 2.2, Ass 1.0 - 1.2).
####################################################################################

puts "================================================================="
puts "             MASTER TCL DEMONSTRATION & REFERENCE                "
puts "================================================================="


####################################################################################
# SECTION 1: VARIABLES, PUTS & SUBSTITUTION RULES (Lab 1)
####################################################################################
puts "\n--- SECTION 1: Variables & Substitution ---"

set var0 25
set var1 50

# Double Quotes vs. Braces vs. Escaping:
puts "Double quotes allow variable substitution: var0 = $var0, var1 = $var1"
puts {Braces prevent substitution: var0 = $var0, var1 = $var1}
puts "Escaping dollar sign with backslash: \$var0 = $var0"


####################################################################################
# SECTION 2: OPERATORS & MATHEMATICAL EXPRESSIONS (Lab 2, Ass 1, Ass 2, Ass 3)
####################################################################################
puts "\n--- SECTION 2: Arithmetic, Logical, Bitwise & Math Expressions ---"

# 2.1 Arithmetic (Integer vs Float)
set A 35
set B 80
set C 35.0

puts "Integer Addition:        $A + $B = [expr $A + $B]"
puts "Integer Subtraction:     $A - $B = [expr $A - $B]"
puts "Integer Multiplication:  $A * $B = [expr $A * $B]"
puts "Integer Division:        $A / $B = [expr $A / $B]"          ;# Truncates to integer 0
puts "Floating Division:       $C / $B = [expr $C / $B]"          ;# 0.4375
puts "Integer Modulo:          $A % $B = [expr $A % $B]"

# 2.2 Logical Operations (Assignment 1)
set log_a 5
set log_b -1
set log_c 0
puts "Logical AND: ($log_a && $log_c) = [expr $log_a && $log_c]"  ;# 0 (false)
puts "Logical OR:  ($log_a || $log_b) = [expr $log_a || $log_b]"  ;# 1 (true)

# 2.3 Bitwise Operations (Assignment 2)
set bit_a 20  ;# binary 10100
set bit_b 5   ;# binary 00101
set bit_c 9   ;# binary 01001
puts "Bitwise AND: ($bit_a & $bit_c) = [expr $bit_a & $bit_c]"   ;# 0
puts "Bitwise OR:  ($bit_a | $bit_b) = [expr $bit_a | $bit_b]"   ;# 21
puts "Bitwise XOR: ($bit_a ^ $bit_a) = [expr $bit_a ^ $bit_a]"   ;# 0

# 2.4 Math Functions (Assignment 3)
set num_neg -64
set num_pos 49
puts "Absolute Value:  abs($num_neg)  = [expr abs($num_neg)]"
puts "Square Root:     sqrt($num_pos) = [expr sqrt($num_pos)]"


####################################################################################
# SECTION 3: STRING MANIPULATION & PATTERN MATCHING (Lab 3)
####################################################################################
puts "\n--- SECTION 3: String Operations ---"

set email1 "MahmoudAhmed@gmail.com"
set email2 "MostafaAli@hotmail.com"

# 3.1 String Length
puts "Email 1 Length: [string length $email1]"

# 3.2 Substring Extraction using Range & Index Search
set at_idx1 [string last "@" $email1]
set user_name [string range $email1 0 [expr $at_idx1 - 1]]
puts "Username in Uppercase: [string toupper $user_name]"

# 3.3 Domain Extraction
set at_idx2  [string last "@" $email2]
set dot_idx2 [string last "." $email2]
set domain_name [string range $email2 [expr $at_idx2 + 1] [expr $dot_idx2 - 1]]
puts "Email 2 Domain: $domain_name"

# 3.4 Append
set custom_user $user_name
append custom_user "@hotmail.com"
puts "Modified Email: $custom_user"

# 3.5 Pattern Matching
if {[string match "*gmail*" $email1]} {
    puts "$email1 is a Gmail account."
} else {
    puts "$email1 is NOT a Gmail account."
}


####################################################################################
# SECTION 4: LISTS & LOOP CONSTRUCTS (Lab 4)
####################################################################################
puts "\n--- SECTION 4: List Processing & Loops ---"

set list1 [list Jan Mar April May]
set list2 {June July August}

# 4.1 List Indexing & Length
puts "Length of list1: [llength $list1]"
puts "Element at index 2 in list2: [lindex $list2 2]"

# 4.2 List Search
if {[lsearch $list2 "Oct"] == -1} {
    puts "'Oct' is NOT in list2."
} else {
    puts "'Oct' was found in list2."
}

# 4.3 List Insertion & Appending
set list1 [linsert $list1 1 "Feb"]
lappend list2 "Sep" "Oct" "Nov" "Dec"

# 4.4 List Concatenation & Slicing
set all_months [concat $list1 $list2]
puts "All Months: [lrange $all_months 0 [expr [llength $all_months] - 1]]"

# 4.5 Join list into string
set formatted_str [join $all_months ", "]
puts "Comma-separated: $formatted_str"

# 4.6 For Loop over list indices
puts "\nIterating with 'for' loop (Uppercase):"
for {set i 0} {$i < [llength $list1]} {incr i} {
    puts "  Month: [string toupper [lindex $list1 $i]]"
}

# 4.7 Foreach Loop over list elements
puts "\nIterating with 'foreach' loop (Lowercase):"
foreach m $list2 {
    puts "  Month: [string tolower $m]"
}


####################################################################################
# SECTION 5: ASSOCIATIVE ARRAYS & PROCEDURES WITH UPVAR (Lab 5)
####################################################################################
puts "\n--- SECTION 5: Associative Arrays & Procedures ---"

# Procedure to calculate average GPA by passing array by reference using `upvar`
proc Calculate_Avg {arr_name} {
    upvar $arr_name local_arr
    
    set size [array size local_arr]
    set keys [array names local_arr]
    set sum 0.0
    
    foreach k $keys {
        set sum [expr $sum + $local_arr($k)]
    }
    
    if {$size > 0} {
        return [expr $sum / $size]
    } else {
        return 0
    }
}

# Setup Student Grades in Associative Arrays
array set Mohamed {Waves 70 Electronics 85 Control 65 Communication 78}
array set Mostafa {Waves 72 Electronics 77 Control 70 Communication 88}
array set Ahmed   {Waves 66 Electronics 80 Control 88 Communication 69}

puts "Mohamed's GPA: [Calculate_Avg Mohamed] %"
puts "Mostafa's GPA: [Calculate_Avg Mostafa] %"
puts "Ahmed's GPA:   [Calculate_Avg Ahmed] %"


####################################################################################
# SECTION 6: FILE I/O & REGULAR EXPRESSION TRANSFORMATION (Lab 6)
####################################################################################
puts "\n--- SECTION 6: File I/O & EDA Automated Testbench Generation ---"

# Practical EDA Automation Example:
# Reading a Verilog module interface definition and automatically converting it
# into a testbench harness (replacing inputs with regs, outputs with wires,
# and prefixing signals with i_ and o_).

set sample_interface_text {
module Counter (
    input [3:0] IN,
    input Load,
    input Up,
    input Down,
    input CLK,
    output High,
    output [3:0] Counter,
    output Low
);
}

# 6.1 Transformation using Regsub
set tb_content $sample_interface_text

# Replace Verilog port types:
regsub -all {\binput\b}  $tb_content "reg"  tb_content
regsub -all {\boutput\b} $tb_content "wire" tb_content

# Prefix input and output signals
set in_ports  [list IN Load Up Down CLK]
set out_ports [list High Counter Low]

foreach p $in_ports {
    regsub -all "\\m$p\\M" $tb_content "i_$p;" tb_content
}

foreach p $out_ports {
    regsub -all "\\m$p\\M" $tb_content "o_$p;" tb_content
}

puts "Transformed Testbench Declarations:"
puts $tb_content

# 6.2 Demonstrating File Write & Read operations
set test_filename "generated_tb_harness_sample.txt"
set write_fh [open $test_filename w+]
puts $write_fh $tb_content
close $write_fh

# Read back
set read_fh [open $test_filename r]
set file_data [read $read_fh]
close $read_fh

# Cleanup demo file
file delete -force $test_filename

puts "================================================================="
puts "               TCL MASTER FLOW COMPLETED!                        "
puts "================================================================="
