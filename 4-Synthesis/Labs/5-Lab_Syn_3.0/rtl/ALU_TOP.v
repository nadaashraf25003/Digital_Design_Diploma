
module ALU_TOP #(parameter WIDTH = 8, ADDR = 4) (

input    wire                     CLK,
input    wire                     RST,
input    wire                     ALU_Enable,
input    wire   [3:0]             ALU_FUN, 
input    wire   [WIDTH-1:0]       ALU_A,
input    wire   [WIDTH-1:0]       ALU_B,
output   wire                     ALU_VLD ,
output   wire   [2*WIDTH-1:0]     ALU_OUT 
);


wire                     ALU_CLK ;							 												 
						 

ClkDiv U0_ClkDiv (
.i_ref_clk(CLK),             
.i_rst(RST),                         
.o_div_clk(ALU_CLK)             
);


ALU # (.DATA_WIDTH(WIDTH)) U0_ALU (
.CLK(ALU_CLK),
.RST(RST),
.A(ALU_A), 
.B(ALU_B),
.Enable(ALU_Enable),
.ALU_FUN(ALU_FUN),
.ALU_OUT(ALU_OUT),
.OUT_VALID(ALU_VLD)
);	


endmodule
