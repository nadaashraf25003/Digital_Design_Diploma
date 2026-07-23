/* 
1- This code we sepeare the sequential always from combinational always
2- Using assign statement to implement zero flag logic
*/


module Down_Counter (

input     wire               clock,           
input     wire   [3:0]       in,
input     wire               latch,  
input     wire               dec,    
output    reg    [3:0]       counter,   
output    wire               zero  ) ;


reg    [3:0]  counter_comb  ;


always@(posedge clock) 
 begin   
  counter <= counter_comb ;
 end
  
always @(*)
 begin
   if (latch) 
     begin 
      counter_comb = in ; 
     end     
   else if (dec && !zero) 
     begin 
      counter_comb = counter - 4'b0001 ; 
     end 
   else 
     begin
      counter_comb = counter ;
     end	 
 end  

assign zero = (counter == 4'b0) ;
  
endmodule