module ser_to_par (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        enable,
    input  wire        serial_data_in,

    output reg  [15:0] parallel_data_out,
    output reg         valid_out
);

    reg [3:0] bit_count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            parallel_data_out <= 16'd0;
            bit_count        <= 4'd0;
            valid_out        <= 1'b0;
        end
        else if (enable) begin
            parallel_data_out <= {parallel_data_out[14:0], serial_data_in};

            if (bit_count == 4'd15) begin
                bit_count <= 4'd0;
                valid_out <= 1'b1;
            end
            else begin
                bit_count <= bit_count + 1'b1;
                valid_out <= 1'b0;
            end
        end
        else begin
            valid_out <= 1'b0;
        end
    end

endmodule