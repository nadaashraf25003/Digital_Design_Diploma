onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group MEM /Async_fifo_tb/DUT/u_fifo_mem/A_SIZE
add wave -noupdate -expand -group MEM /Async_fifo_tb/DUT/u_fifo_mem/D_SIZE
add wave -noupdate -expand -group MEM /Async_fifo_tb/DUT/u_fifo_mem/F_DEPTH
add wave -noupdate -expand -group MEM /Async_fifo_tb/DUT/u_fifo_mem/P_SIZE
add wave -noupdate -expand -group MEM /Async_fifo_tb/DUT/u_fifo_mem/w_clk
add wave -noupdate -expand -group MEM /Async_fifo_tb/DUT/u_fifo_mem/w_rstn
add wave -noupdate -expand -group MEM /Async_fifo_tb/DUT/u_fifo_mem/w_full
add wave -noupdate -expand -group MEM /Async_fifo_tb/DUT/u_fifo_mem/w_inc
add wave -noupdate -expand -group MEM /Async_fifo_tb/DUT/u_fifo_mem/w_addr
add wave -noupdate -expand -group MEM /Async_fifo_tb/DUT/u_fifo_mem/r_addr
add wave -noupdate -expand -group MEM /Async_fifo_tb/DUT/u_fifo_mem/w_data
add wave -noupdate -expand -group MEM /Async_fifo_tb/DUT/u_fifo_mem/r_data
add wave -noupdate -expand -group MEM /Async_fifo_tb/DUT/u_fifo_mem/i
add wave -noupdate -expand -group MEM /Async_fifo_tb/DUT/u_fifo_mem/FIFO_MEM
add wave -noupdate -expand -group rd_domain /Async_fifo_tb/DUT/u_fifo_rd/P_SIZE
add wave -noupdate -expand -group rd_domain /Async_fifo_tb/DUT/u_fifo_rd/r_clk
add wave -noupdate -expand -group rd_domain /Async_fifo_tb/DUT/u_fifo_wr/w_clk
add wave -noupdate -expand -group rd_domain /Async_fifo_tb/DUT/u_fifo_rd/r_rstn
add wave -noupdate -expand -group rd_domain /Async_fifo_tb/DUT/u_fifo_rd/r_inc
add wave -noupdate -expand -group rd_domain /Async_fifo_tb/DUT/u_fifo_rd/sync_wr_ptr
add wave -noupdate -expand -group rd_domain /Async_fifo_tb/DUT/u_fifo_rd/rd_addr
add wave -noupdate -expand -group rd_domain /Async_fifo_tb/DUT/u_fifo_rd/empty
add wave -noupdate -expand -group rd_domain /Async_fifo_tb/DUT/u_fifo_rd/gray_rd_ptr
add wave -noupdate -expand -group rd_domain /Async_fifo_tb/DUT/u_fifo_rd/rd_ptr
add wave -noupdate -expand -group wr_domain /Async_fifo_tb/DUT/u_fifo_wr/P_SIZE
add wave -noupdate -expand -group wr_domain /Async_fifo_tb/DUT/u_fifo_wr/w_rstn
add wave -noupdate -expand -group wr_domain /Async_fifo_tb/DUT/u_fifo_wr/w_addr
add wave -noupdate -expand -group wr_domain /Async_fifo_tb/DUT/u_fifo_wr/w_inc
add wave -noupdate -expand -group wr_domain -radix binary /Async_fifo_tb/DUT/u_fifo_wr/gray_w_ptr
add wave -noupdate -expand -group wr_domain -radix binary /Async_fifo_tb/DUT/u_fifo_wr/sync_rd_ptr
add wave -noupdate -expand -group wr_domain /Async_fifo_tb/DUT/u_fifo_wr/full
add wave -noupdate -expand -group wr_domain /Async_fifo_tb/DUT/u_fifo_wr/w_ptr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {84 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ms
update
WaveRestoreZoom {0 ns} {823 ns}
