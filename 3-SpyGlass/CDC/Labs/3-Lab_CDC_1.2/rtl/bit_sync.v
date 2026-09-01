module BIT_SYNC (
    input  wire CLK,
    input  wire RST,
    input  wire ASYNC,
    output wire SYNC
);

    reg [1:0] sync_reg;

    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            sync_reg <= 2'b00;
        end else begin
            sync_reg <= {sync_reg[0], ASYNC};
        end
    end

    assign SYNC = sync_reg[1];

endmodule