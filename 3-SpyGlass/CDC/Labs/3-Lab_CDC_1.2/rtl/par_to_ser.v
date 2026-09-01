module par_to_ser #(
    parameter DATA_WIDTH = 8
)(
    input  wire                  clk,
    input  wire                  rst_n,
    input  wire                  enable,
    input  wire [DATA_WIDTH-1:0] parallel_data_in,

    output reg                   serial_data_out,
    output reg                   valid_out,
    output reg                   done
);

    reg [DATA_WIDTH-1:0]          shift_reg;
    reg [$clog2(DATA_WIDTH)-1:0] bit_cnt;
    reg                          busy;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shift_reg       <= {DATA_WIDTH{1'b0}};
            serial_data_out <= 1'b0;
            valid_out       <= 1'b0;
            done            <= 1'b0;
            busy            <= 1'b0;
            bit_cnt         <= 'd0;
        end else if (busy) begin
            serial_data_out <= shift_reg[DATA_WIDTH-1];
            shift_reg       <= {shift_reg[DATA_WIDTH-2:0], 1'b0};
            valid_out       <= 1'b1;

            if (bit_cnt == (DATA_WIDTH - 1)) begin
                busy    <= 1'b0;
                done    <= 1'b1;
                bit_cnt <= 'd0;
            end else begin
                bit_cnt <= bit_cnt + 1'b1;
                done    <= 1'b0;
            end
        end else if (enable) begin
            shift_reg <= parallel_data_in;
            busy      <= 1'b1;
            bit_cnt   <= 'd0;
            valid_out <= 1'b0;
            done      <= 1'b0;
        end else begin
            valid_out <= 1'b0;
            done      <= 1'b0;
        end
    end

endmodule