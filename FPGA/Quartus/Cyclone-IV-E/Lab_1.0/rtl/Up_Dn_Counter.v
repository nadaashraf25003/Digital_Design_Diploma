module Up_Dn_Counter ( 
  input   wire            clk,            // Reference clock
  input   wire            rst,            // Reset input (Active High)
  input   wire            Up, Down,       // Control signals
  output  wire  [3:0]     Counter,        // 5-bit counter output
  output  wire            High, Low       // Flag outputs
);

  // Internal 30-bit registers for clock division
  reg [29:0] Counter_reg;
  reg [29:0] Counter_comb;

  // Map the 5 Most Significant Bits (MSBs) to output
  assign Counter = Counter_reg[29:26];

  // Sequential logic with active-high asynchronous reset
  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      Counter_reg <= 30'b0;
    end else begin
      Counter_reg <= Counter_comb;
    end
  end

  // Combinational counter behavior logic
  always @(*) begin
    if (Down && !Low) begin
      Counter_comb = Counter_reg - 1'b1;
    end else if (Up && !High && !Down) begin
      Counter_comb = Counter_reg + 1'b1;
    end else begin
      Counter_comb = Counter_reg;
    end
  end

  // Flag outputs based on 5-bit output state
  assign Low  = (Counter == 4'b0000);
  assign High = (Counter == 4'b1111);

endmodule