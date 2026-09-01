module clk_divider_1 (
    input  wire sys_clk,
    input  wire rst_n,
    input  wire en,
    output wire divided_clk
);

    reg       div_clk;

    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) begin
            div_clk <= 1'b1;
        end else begin
            // Toggle the output on every rising edge of sys_clk
            div_clk <= ~div_clk;
        end
    end

assign divided_clk = div_clk & en ;

endmodule
