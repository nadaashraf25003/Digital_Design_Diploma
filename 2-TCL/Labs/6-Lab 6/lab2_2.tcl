puts "**** File I/O & Regsub Lab****" 
# open the interface file
set fh1 [open "Interface.txt" r]
# read file value
set content1 [read $fh1]
# replace "input" with "reg"
regsub -all {input} $content1 "reg" content1
# replace "output" with "wire"
regsub -all {output} $content1 "wire" content1

# variable to keep track of signal is input or output
set type input

foreach elem $content1 {
    # if this element is signal size skip this element
    if { [string match {\[*:*\]} $elem ] } {
        continue;
    }
    # if this element is "reg" change var type to "input" then skip this element
    if { [string match {reg} $elem ] } {
        set type input
        continue;
    }
    # if this element is "wire" change var type to "output" then skip this element
    if { [string match {wire} $elem ] } {
        set type output
        continue;
    }
    # if last type was "input" change current element to "i_elementValue"
    if { [string match $type input] } {
        regsub $elem $content1 "i_$elem;" content1 
    }
    # if last type was "output" change current element to "o_elementValue"
    if { [string match $type output] } {
        regsub $elem $content1 "o_$elem;" content1 
    }
}

puts $content1

# open new file (create it)
set fh2 [open "tb.txt" w+]
# write the new content to te file
puts $fh2 $content1
# close the files
close $fh1
close $fh2