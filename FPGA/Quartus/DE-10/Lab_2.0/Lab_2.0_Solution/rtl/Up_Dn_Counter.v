module Up_Dn_Counter ( 
  input   wire  [4:0]     IN,             // 5-bit input value
  input   wire            Load, Up, Down, // Control signals
  input   wire            clk,            // Reference clock
  input   wire            rst,            // Reset input (Active High)
  output  wire  [4:0]     Counter,        // 5-bit counter output
  output  wire            High, Low       // Flag outputs
);

  // Internal 30-bit registers for clock division
  reg [29:0] Counter_reg;
  reg [29:0] Counter_comb;

  // Map the 5 Most Significant Bits (MSBs) to output
  assign Counter = Counter_reg[29:25];

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
    if (Load) begin
      Counter_comb = {IN, 25'b0};
    end else if (Down && !Low) begin
      Counter_comb = Counter_reg - 1'b1;
    end else if (Up && !High && !Down) begin
      Counter_comb = Counter_reg + 1'b1;
    end else begin
      Counter_comb = Counter_reg;
    end
  end

  // Flag outputs based on 5-bit output state
  assign Low  = (Counter == 5'b00000);
  assign High = (Counter == 5'b11111);

endmodule