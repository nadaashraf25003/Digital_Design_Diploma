module top (
    input  wire sys_clk,
    input  wire mult_clk,
    input  wire rst_n,
    input  wire wr_en,

    // Serial Stream Interfaces
    input  wire serial_i,
    input  wire sp_en,
    output wire serial_o,
    output wire valid_o
);

    // Clocks
    wire        div_clk_1, div_clk_2, div_clk;
    wire        gated_mult_clk;

    // wr_reg 
    wire  [2:0] wr_addr;
    wire  [7:0] wr_data;

    // S/P Outputs
    wire [15:0] sp_parallel_data;
    wire        sp_valid;

    // Controller <-> Multiplier CDC Wires
    wire [15:0] ctrl_mult_data;
    wire        ctrl_mult_start;
    wire [15:0] sync_mult_data;
    wire        sync_mult_enable;

    // Multiplier Outputs
    wire [7:0]  mult_out_byte;
    wire        mult_valid;
    wire        mult_busy;
    wire        mult_busy_sync;

    // Async FIFO Wires
    wire [7:0]  fifo_rdata;
    wire        fifo_full;
    wire        fifo_empty;
    wire        fifo_rinc;

    // 8-Bit P/S Wires
    wire [7:0]  ps_in_data;
    wire        ps_enable;
    wire        ps_done;

    // register_file configuration outputs
    wire [7:0]  out_reg0;
    wire [7:0]  out_reg1;
    wire [7:0]  out_reg2;
    wire        write_enable;
    wire [2:0]  write_addr;
    wire [7:0]  write_data;

    assign div_clk = out_reg0[1] ? div_clk_1 : div_clk_2;


    wire  rst_n_sys, rst_n_mult;

    // 0. Reset Synchronizer
    RST_SYNC U0_RST_SYNC (
    .RST(rst_n),
    .CLK(sys_clk),
    .SYNC_RST(rst_n_sys)
    );

    RST_SYNC U1_RST_SYNC (
    .RST(rst_n),
    .CLK(mult_clk),
    .SYNC_RST(rst_n_mult)
    );
    
    // 0. Clock Divider_1 (sys_clk -> div_clk)
    clk_divider_1 u_clk_div (
        .sys_clk    (sys_clk),
        .rst_n      (rst_n_sys),
        .en         (out_reg0[2]),
        .divided_clk(div_clk_1)
    );

    // 1. Clock Divider_2 (sys_clk -> div_clk)
    clk_divider_2 u_clk_div_2 (
        .sys_clk    (sys_clk),
        .rst_n      (rst_n_sys),
        .en         (out_reg0[3]),
        .divided_clk(div_clk_2)
    );

    // 2. Register File (sys_clk domain)
    register_file u_reg_file (
        .clk         (sys_clk),
        .rst_n       (rst_n_sys),
        .wr_en       (wr_en),
        .wr_addr     (wr_addr),
        .wr_data     (wr_data),
        .out_reg0    (out_reg0),
        .out_reg1    (out_reg1),
        .out_reg2    (out_reg2),
        .out_reg3    (out_reg3)
    );

    // 3. Serial-to-Parallel Unit (div_clk domain)
    ser_to_par u_ser_to_par (
        .clk              (div_clk),
        .rst_n            (rst_n_sys),
        .enable           (sp_en),
        .serial_data_in   (serial_i),
        .parallel_data_out(sp_parallel_data),
        .valid_out        (sp_valid)
    );

    // 4. System Controller
    controller u_controller (
        .sys_clk         (sys_clk),
        .div_clk         (div_clk),
        .rst_n           (rst_n_sys),
        .wr_en           (wr_en),
        .wr_addr         (wr_addr),
        .wr_data         (wr_data),
        .sp_valid        (sp_valid),
        .sp_data         (sp_parallel_data),
        .mult_busy_sync  (mult_busy_sync),
        .mult_data_out   (ctrl_mult_data),
        //.mult_start_pulse(ctrl_mult_start),
        .mult_start_pulse_reg(ctrl_mult_start),
        .fifo_empty      (fifo_empty),
        .fifo_rdata      (fifo_rdata),
        .fifo_rinc       (fifo_rinc),
        .ps_done         (ps_done),
        .ps_in_data      (ps_in_data),
        .ps_enable       (ps_enable)
    );

    // 5. Data CDC Synchronizer (sys_clk -> gated_mult_clk)
    DATA_SYNC #( .BUS_WIDTH(16) ) u_data_sync (
        .CLK           (gated_mult_clk),
        .RST           (rst_n_mult),
        .unsync_bus    (ctrl_mult_data),
        .bus_enable    (ctrl_mult_start),
        .sync_bus      (sync_mult_data),
        .enable_pulse_d(sync_mult_enable)
    );

    // 6. Multiplier Unit (gated_mult_clk domain)
    mult_unit u_mult_unit (
        .clk      (gated_mult_clk),
        .rst_n    (rst_n_mult),
        .enable   (sync_mult_enable),
        .data_in  (sync_mult_data),
        .key_in   ({out_reg2, out_reg1}),
        .data_out (mult_out_byte),
        .valid_out(mult_valid),
        .busy     (mult_busy)
    );

    BIT_SYNC u_sync_mult_busy (
        .CLK  (sys_clk),
        .RST  (rst_n_sys),
        .ASYNC(mult_busy),
        .SYNC (mult_busy_sync)
    );

    // 7. Asynchronous FIFO (Write: gated_mult_clk | Read: div_clk)
    Async_fifo #(
        .D_SIZE(8),
        .A_SIZE(3),
        .P_SIZE(4),
        .F_DEPTH(8)
    ) u_async_fifo (
        .i_w_clk (gated_mult_clk),
        .i_w_rstn(rst_n_mult),
        .i_w_inc (mult_valid),
        .i_w_data(mult_out_byte),
        .i_r_clk (div_clk),
        .i_r_rstn(rst_n_sys),
        .i_r_inc (fifo_rinc),
        .o_r_data(fifo_rdata),
        .o_full  (fifo_full),
        .o_empty (fifo_empty)
    );

    // 8. Parallel-to-Serial Unit (8-bit per byte)
    par_to_ser #( .DATA_WIDTH(8) ) u_par_to_ser (
        .clk             (div_clk),
        .rst_n           (rst_n_sys),
        .enable          (ps_enable),
        .parallel_data_in(ps_in_data),
        .serial_data_out (serial_o),
        .valid_out       (valid_o),
        .done            (ps_done)
    );

    // 9. Clk gate 
    clock_gate u_clock_gate (
        .clk(mult_clk),
        .enable(out_reg0[0]),
        .gated_clk(gated_mult_clk)    
    );

endmodule
