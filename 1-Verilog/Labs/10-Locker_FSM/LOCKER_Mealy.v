/////////////////////////////////////
///////////// Mealy FSM ///////////// 
/////////////////////////////////////

module LOCKER_Mealy (
input  wire        button_0 , button_1 ,
input  wire        rst,
input  wire        clk,
output reg         unlock
);


localparam  [2:0]    IDLE = 3'b000,
                     S1 = 3'b001,
                     S11 = 3'b011,
					 S011 = 3'b010,
					 S1011 = 3'b110;
					 
reg    [2:0]         current_state,
                     next_state ;
		
// state transition 		
always @(posedge clk or negedge rst)
 begin
  if(!rst)
   begin
     current_state <= IDLE ;
   end
  else
   begin
     current_state <= next_state ;
   end
 end
 
// next_state logic
always @(*)
 begin
  case(current_state)
  IDLE     : begin
              if(button_1)
			   next_state = S1 ;
              else
               next_state = IDLE ;			  
             end
  S1       : begin
              if(button_0)
			   next_state = IDLE ;
			  else if (button_1)
               next_state = S11 ;
              else
               next_state = S1 ;	   
            end
  S11     : begin
              if(button_0)
			   next_state = S011 ;
			  else if (button_1)
               next_state = IDLE ;
              else
               next_state = S11 ;	    
            end
  S011    : begin
              if(button_0)
			   next_state = IDLE ;
			  else if (button_1)
               next_state = S1011 ;
              else
               next_state = S011 ;	    
            end
  S1011   : begin
             if(button_0)
			   next_state = IDLE ;
		     else if (button_1)
               next_state = IDLE ;
             else
               next_state = S1011 ;	   
            end			 
  default :   next_state = IDLE ;		 
  
  endcase
end	


// next_state logic
always @(*)
 begin
  case(current_state)
  IDLE     : begin
              unlock   =  1'b0 ;		  
             end
  S1       : begin
              unlock   =  1'b0 ;
             end	
  S11      : begin
              unlock   =  1'b0 ;	   
             end
  S011     : begin
              unlock   =  1'b0 ;	   
             end
  S1011    : begin
              if(button_0)
               unlock   =  1'b1 ;	
		      else if (button_1)
               unlock   =  1'b0 ;	
              else
               unlock   =  1'b0 ;	  					   
             end			 
  default  : begin
              unlock   =  1'b0 ;
             end			  
  endcase
 end	
		
		
endmodule					 