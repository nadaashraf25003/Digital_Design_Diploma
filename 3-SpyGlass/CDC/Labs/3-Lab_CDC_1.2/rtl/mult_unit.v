module mult_unit (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        enable,
    input  wire [15:0] data_in,
    input  wire [15:0] key_in,

    output reg  [7:0]  data_out,
    output reg         valid_out,
    output reg         busy
);

    wire [31:0] product = data_in * key_in; 
    reg  [23:0] shift_reg;
    reg  [2:0]  byte_cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shift_reg <= 24'd0;
            data_out  <= 8'd0;
            valid_out <= 1'b0;
            busy      <= 1'b0;
            byte_cnt  <= 3'd0;
        end else if (busy) begin
            if (byte_cnt == 3'd4) begin
                busy      <= 1'b0;
                valid_out <= 1'b0;
                byte_cnt  <= 3'd0;
            end else begin
                data_out  <= shift_reg[7:0];
                shift_reg <= shift_reg >> 8;
                valid_out <= 1'b1;
                byte_cnt  <= byte_cnt + 1'b1;
            end
        end else if (enable) begin
            data_out  <= product[7:0];  
            shift_reg <= product[31:8];
            valid_out <= 1'b1;
            busy      <= 1'b1;
            byte_cnt  <= 3'd1;
        end else begin
            valid_out <= 1'b0;
        end
    end

endmodule