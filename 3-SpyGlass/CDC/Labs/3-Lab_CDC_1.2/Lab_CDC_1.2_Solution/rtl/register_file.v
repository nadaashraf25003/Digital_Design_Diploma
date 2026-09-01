module register_file #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH      = 8,
    parameter ADDR_WIDTH = 3,
    parameter GATE_EN    = 1'b1,
    parameter MUX_SEL    = 1'b1,
    parameter MULT_CONST1= 8'hAA,
    parameter MULT_CONST2= 8'h55
)(
    input  wire                  clk,
    input  wire                  rst_n,

    // Write Port
    input  wire                  wr_en,
    input  wire [ADDR_WIDTH-1:0] wr_addr,
    input  wire [DATA_WIDTH-1:0] wr_data,
    input  wire [ADDR_WIDTH-1:0] rd_addr,

    // Configuration Outputs
    output reg  [DATA_WIDTH-1:0] out_reg0,
    output reg  [DATA_WIDTH-1:0] out_reg1,
    output reg  [DATA_WIDTH-1:0] out_reg2,
    output reg  [DATA_WIDTH-1:0] out_reg3
);

    reg [DATA_WIDTH-1:0] registers [0:DEPTH-1];
    integer i;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            registers[0] <= {6'b0, MUX_SEL, GATE_EN};
            registers[1] <= MULT_CONST1;
            registers[2] <= MULT_CONST2;
            for (i = 3; i < DEPTH; i = i + 1)
                registers[i] <= {DATA_WIDTH{1'b0}};
        end else if (wr_en) begin
            registers[wr_addr] <= wr_data;
        end
    end

    always @(*) begin
        out_reg0 = registers[0];
        out_reg1 = registers[1];
        out_reg2 = registers[2];
        out_reg3 = registers[rd_addr];
    end
    
endmodule