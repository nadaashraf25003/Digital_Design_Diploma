
module ClkDiv #( 
 parameter RATIO_WD = 8 
)
(
 input  wire                   i_ref_clk ,             // Reference clock
 input  wire                   i_rst ,                 // Reset Signal
 input  wire                   i_clk_en,               // clock divider enable
 input  wire [RATIO_WD-1 : 0]  i_div_ratio,            // NOTE: divider is now fixed div-by-2 only;
                                                        // this port is intentionally left unused
                                                        // (bonus lint catch: Unused Input Port)
 output wire                   o_div_clk               // Divided clock
);

reg  div_clk ;

// Simple toggle flip-flop -> always divides i_ref_clk by exactly 2 when enabled
always @(posedge i_ref_clk or negedge i_rst)
 begin : div2_proc
  if(!i_rst)
   begin
    div_clk <= 1'b0 ;
   end
  else if (i_clk_en)
   begin
    div_clk <= ~div_clk ;
   end
 end

assign o_div_clk = i_clk_en & i_ref_clk & div_clk;

endmodule
