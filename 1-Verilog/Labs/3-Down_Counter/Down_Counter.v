/* 
1- This code we combine the sequential and combinational logic in the same always block
2- Using assign statement to implement zero flag logic
*/

module Down_Counter (

input     wire               clock,           
input     wire   [3:0]       in,
input     wire               latch,  
input     wire               dec,    
output    reg    [3:0]       counter,   
output    wire               zero  ) ;

always@(posedge clock) 
  begin      
     if (latch) 
       begin 
        counter <= in; 
       end     
    else if (dec && !zero) 
      begin 
        counter <= counter - 4'b0001; 
      end 
  end  

  assign zero = (counter == 4'b0) ;
  
  endmodule
