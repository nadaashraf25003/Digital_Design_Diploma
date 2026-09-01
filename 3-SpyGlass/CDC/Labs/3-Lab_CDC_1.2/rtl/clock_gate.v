module clock_gate (
    input  wire clk,
    input  wire enable,
    output wire gated_clk
);

/*
    reg latched_enable;

    always @(*) begin
        if (!clk)
            latched_enable = enable;
    end

    assign gated_clk = clk & latched_enable;
*/

    assign gated_clk = clk & enable;

endmodule
