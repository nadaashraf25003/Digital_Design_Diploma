module clk_divider_2 (
    input  wire sys_clk,
    input  wire rst_n,
    input  wire en,
    output wire divided_clk
);

    reg [1:0] count;
    reg       div_clk;

    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) begin
            count       <= 2'b00;
            div_clk <= 1'b1;
        end else begin
            if (count == 2'b01) begin
                count       <= 2'b00;
                div_clk <= ~div_clk;
            end else begin
                count <= count + 1'b1;
            end
        end
    end

assign divided_clk = div_clk & en ;

endmodule
