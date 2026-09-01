module controller #(
    parameter DATA_WIDTH = 16
)(
    // Clocks and Resets
    input  wire                    sys_clk,
    input  wire                    div_clk,          // sys_clk / 2
    input  wire                    rst_n,

    // S/P Interface (div_clk domain)
    input  wire                    sp_valid,
    input  wire [DATA_WIDTH-1:0]   sp_data,

    // Write Interface 
    input  wire                    wr_en,
    output reg  [2:0]              wr_addr,
    output reg  [7:0]              wr_data,

    // Multiplier CDC Interface (sys_clk domain)
    input  wire                    mult_busy_sync,
    output reg  [DATA_WIDTH-1:0]   mult_data_out,
    output reg                     mult_start_pulse,
    //output reg                     mult_start_pulse_reg,

    // Async FIFO Read Interface (div_clk domain)
    input  wire                    fifo_empty,
    input  wire [7:0]              fifo_rdata,
    output reg                     fifo_rinc,

    // 8-bit P/S Interface (div_clk domain)
    input  wire                    ps_done,
    output reg  [7:0]              ps_in_data,
    output reg                     ps_enable
);

    //=============================================================
    // 0. Internal Synchronizers
    //=============================================================
    // S/P Valid sync to sys_clk
    reg [1:0] sp_valid_sync_reg;
    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) sp_valid_sync_reg <= 2'b00;
        else        sp_valid_sync_reg <= {sp_valid_sync_reg[0], sp_valid};
    end
    reg sp_valid_sync_d;
    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) sp_valid_sync_d <= 1'b0;
        else        sp_valid_sync_d <= sp_valid_sync_reg[1];
    end
    wire sp_valid_pulse = sp_valid_sync_reg[1] && !sp_valid_sync_d;

    // P/S All-Done sync to sys_clk
    reg ps_all_done;
    reg [1:0] ps_done_sync_reg;
    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) ps_done_sync_reg <= 2'b00;
        else        ps_done_sync_reg <= {ps_done_sync_reg[0], ps_all_done};
    end
    reg ps_done_sync_d;
    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) ps_done_sync_d <= 1'b0;
        else        ps_done_sync_d <= ps_done_sync_reg[1];
    end
    wire ps_done_pulse = ps_done_sync_reg[1] && !ps_done_sync_d;

/*
//----------------------------------------------------------
    reg   mult_start_pulse;
    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) begin
            mult_start_pulse_reg <= 'b0;
        end else begin
            mult_start_pulse_reg <= mult_start_pulse;
        end
    end
//----------------------------------------------------------
*/
    //=============================================================
    // 2. Main System FSM (sys_clk domain)
    //=============================================================
    localparam S_IDLE       = 2'b00;
    localparam S_START_MULT = 2'b01;
    localparam S_WAIT_DONE  = 2'b10;

    reg [1:0] state, next_state;

    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) state <= S_IDLE;
        else        state <= next_state;
    end

    always @(*) begin
        next_state       = state;
        mult_start_pulse = 1'b0;

        case (state)
            S_IDLE: begin
                if (sp_valid_pulse && !mult_busy_sync)
                    next_state = S_START_MULT;
            end

            S_START_MULT: begin
                mult_start_pulse = 1'b1;
                next_state       = S_WAIT_DONE;
            end

            S_WAIT_DONE: begin
                if (ps_done_pulse)
                    next_state = S_IDLE;
            end

            default: next_state = S_IDLE;
        endcase
    end

    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) begin
            mult_data_out <= {DATA_WIDTH{1'b0}};
        end else if (state == S_IDLE && sp_valid_pulse) begin
            mult_data_out <= sp_data;
        end
    end

    //=============================================================
    // 3. Internal Write
    //=============================================================

    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) begin 
            wr_data <= 8'b0;
        end 
        else if (state == S_IDLE && sp_valid_pulse && wr_en) begin 
            wr_data <= sp_data[7:0] + sp_data[15:8];
            wr_addr <= {2'b11, sp_data[0]};
        end 
    end

    //=============================================================
    // 4. Byte-by-Byte FIFO Reader & P/S Driver FSM (div_clk domain)
    //=============================================================
    // FSM States
    localparam R_IDLE      = 3'd0,
               R_LOAD_BYTE = 3'd1,
               R_WAIT_PS   = 3'd2,
               R_WAIT_FIFO = 3'd3,
               R_DONE_WAIT = 3'd4; 

    reg [2:0] r_state;
    reg [1:0] byte_cnt;

    always @(posedge div_clk or negedge rst_n) begin
        if (!rst_n) begin
            r_state     <= R_IDLE;
            fifo_rinc   <= 1'b0;
            ps_enable   <= 1'b0;
            ps_in_data  <= 8'd0;
            byte_cnt    <= 2'd0;
            ps_all_done <= 1'b0;
        end else begin
            fifo_rinc   <= 1'b0;
            ps_enable   <= 1'b0;
            ps_all_done <= 1'b0;

            case (r_state)
                R_IDLE: begin
                    if (!fifo_empty) begin
                        r_state <= R_LOAD_BYTE;
                    end
                end

                R_LOAD_BYTE: begin
                    ps_in_data <= fifo_rdata; // Latch valid byte from FIFO
                    ps_enable  <= 1'b1;       // Pulse P/S enable
                    r_state    <= R_WAIT_PS;
                end

                R_WAIT_PS: begin
                    if (ps_done) begin
                        fifo_rinc <= 1'b1;    // Increment FIFO read address
                        if (byte_cnt == 2'd3) begin
                            ps_all_done <= 1'b1;
                            byte_cnt    <= 2'd0;
                            r_state     <= R_DONE_WAIT; // Wait for fifo_empty to update
                        end else begin
                            byte_cnt <= byte_cnt + 1'b1;
                            r_state  <= R_WAIT_FIFO;
                        end
                    end
                end

                R_WAIT_FIFO: begin
                    // Wait cycle for fifo_rdata update between bytes
                    if (!fifo_empty) begin
                        r_state <= R_LOAD_BYTE;
                    end
                end

                R_DONE_WAIT: begin
                    // Ensure FIFO registers empty status before accepting new operations
                    if (fifo_empty) begin
                        r_state <= R_IDLE;
                    end
                end

                default: r_state <= R_IDLE;
            endcase
        end
    end

endmodule
