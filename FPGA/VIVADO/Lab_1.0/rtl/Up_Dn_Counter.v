module Up_Dn_Counter ( 
  input  wire       clk,
  input  wire       rst_n,
  input  wire       Up,Down,
  output wire [3:0] LED_Counter, // Top 4 bits displayed on onboard LEDs
  output wire       High, Low 
);

  reg [27:0] Counter;
  reg [27:0] Counter_comb;

  // Map upper 4 MSBs to onboard LEDs for human-visible speed
  assign LED_Counter = Counter[27:24];

  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      Counter <= 0;
    end
    else begin
       Counter <= Counter_comb;
    end
       
  end

  always @(*) begin
    if (Down && !Low) begin
      Counter_comb = Counter - 1'b1;
    end else if (Up && !High && !Down) begin
      Counter_comb = Counter + 1'b1;
    end else begin
      Counter_comb = Counter;
    end
  end

  assign Low  = (Counter == 28'd0);
  assign High = (&Counter);

endmodule