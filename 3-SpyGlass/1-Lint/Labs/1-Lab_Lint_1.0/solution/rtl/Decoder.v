
// ************************************************************* //
// Module : Decoder 
// Author : Ali Eltemsah
// ************************************************************* //

module Decoder (

input  wire [1:0] IN ,
output reg        Arith_En,
output reg        Logic_En,
output reg        Cmp_En,
output reg        Shift_En
);


always @(*)
  begin
                Arith_En = 1'b0 ;
                Logic_En = 1'b0 ;
                Cmp_En   = 1'b0 ;
                Shift_En = 1'b0 ;
    case (IN)
     2'b00 : begin 
                Arith_En = 1'b1 ;
             end
     2'b01 : begin 
                Logic_En = 1'b1 ;
             end
     2'b10 : begin 
                Cmp_En = 1'b1 ;
             end
     2'b11 : begin 
                Shift_En = 1'b1 ;
             end
   endcase


 end 
 
 
 endmodule
