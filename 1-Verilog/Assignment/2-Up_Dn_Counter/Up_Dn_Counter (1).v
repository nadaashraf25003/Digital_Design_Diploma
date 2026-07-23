module Up_Dn_Counter ( 
  input   wire  [4:0]     IN,
  input   wire            Load, Up, Down,
  input   wire            clk,
  output  reg   [4:0]     Counter,
  output  reg            High, Low 
  );
  
  
// Internal Signals
  reg [4:0]   Counter_comb ;
  
  
  
// Assign Counter Comb logic to Counter register  
  always @ (posedge clk)
    begin
      Counter <= Counter_comb ;    
    end
  
// Counter behaviour function   
  always @ (*)
   begin
     if (Load)
       begin
         Counter_comb = IN ;
       end
     else if (Down && !Low)
       begin
         Counter_comb = Counter - 5'b1;
       end
     else if (Up && !High && !Down)
       begin
         Counter_comb = Counter + 5'b1;
       end
     else 
       begin
         Counter_comb = Counter ;          // to avoid latch
       end
   end
  
// Down flag
  always @(*)
    begin
      if (Counter == 5'b0)
        Low = 1'b1 ;
      else
        Low = 1'b0 ;
    end
  
  
// Up flag
    always @(*)
    begin
      if (Counter == 5'b11111)
        High = 1'b1 ;
      else
        High = 1'b0 ;
    end
  
endmodule

  