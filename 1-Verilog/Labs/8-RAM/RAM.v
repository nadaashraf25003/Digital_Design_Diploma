module RAM # (
    parameter ADDR_WIDTH = 3,
    parameter MEM_DEPTH = 8,
    parameter MEM_WIDTH = 16)
(
    input  wire                   write_enable,
    input  wire                   clk,
    input  wire  [ADDR_WIDTH-1:0] address,
    input  wire  [MEM_WIDTH-1:0]  data_in, 
    output reg   [MEM_WIDTH-1:0]  data_out

);

    // 2D Array
    reg [MEM_WIDTH-1:0] memory [MEM_DEPTH-1:0];        

    always @(posedge clk) 
	  begin
        if (write_enable) 
		  begin
            memory[address] <= data_in;
		  end
		else
          begin
            data_out <= memory[address]; 
          end
       end

endmodule