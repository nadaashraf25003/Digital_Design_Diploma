
module ClkDiv (
 input  wire                   i_ref_clk ,             // Reference clock
 input  wire                   i_rst ,                 // Reset Signal
 input  wire                   i_clk_en,               // clock divider enable
 output wire                   o_div_clk               // Divided clock
);

reg     div_clk ;

always @(posedge i_ref_clk or negedge i_rst)             
 begin
  if(!i_rst)
   begin
    div_clk <= 0 ;	
   end
  else
   begin
    div_clk <= ~div_clk ;		                     
   end
 end


assign o_div_clk = i_clk_en ? div_clk : i_ref_clk ;              // if clock divider is disabled : generated clock is the reference clock


endmodule
