
module ClkDiv (
 input  wire                   i_ref_clk ,             // Reference clock
 input  wire                   i_rst ,                 // Reset Signal
 output reg                    o_div_clk               // Divided clock
);


always @(posedge i_ref_clk or negedge i_rst)  
 begin          
  if(!i_rst)
   begin
    o_div_clk <= 'd0 ;
   end
  else
   begin
    o_div_clk <= ~o_div_clk ; 
   end
 end


endmodule
