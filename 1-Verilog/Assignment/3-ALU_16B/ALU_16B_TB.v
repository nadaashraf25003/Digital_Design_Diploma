`timescale 1us/1ns

module ALU_16B_TB ();


  reg  [15:0]  A_TB;
  reg  [15:0]  B_TB;
  reg  [3:0]   ALU_FUN_TB;
  reg          CLK_TB;
  wire         Carry_Flag_TB;  
  wire         Arith_Flag_TB;
  wire         Logic_Flag_TB; 
  wire         CMP_Flag_TB; 
  wire         Shift_Flag_TB;
  wire [15:0]  ALU_OUT_TB ;
 
  
//concatenate flags
  wire [3:0] Flags ;


  
// parameters
parameter  CLK_PERIOD = 10 ;     // 100 KHz
  
  
  
assign Flags = {Arith_Flag_TB, Logic_Flag_TB , CMP_Flag_TB , Shift_Flag_TB};
  
 
  
initial
  begin
    $dumpfile("ALU.vcd");
    $dumpvars ;
    
//initial values
CLK_TB = 1'b0;
    
    $display ("*** TEST CASE 1 : Addition Without Carry ***");
    
A_TB = 16'd15;
B_TB = 16'd10;
ALU_FUN_TB = 4'b0000; 

#CLK_PERIOD
    
   if (ALU_OUT_TB == 16'd25 && Carry_Flag_TB == 1'b0 && Flags == 4'd8)
       $display ("Addition Without Carry IS PASSED") ;
   else
      begin
       $display ("Addition Without Carry IS FAILED") ;
      end
    
    $display ("*** TEST CASE 2 : Addition With Carry ***");
    
A_TB = 16'hfff2;
B_TB = 16'h000f;
ALU_FUN_TB = 4'b0000; 

#CLK_PERIOD
    
   if (ALU_OUT_TB == 16'h0001 && Carry_Flag_TB == 1'b1 && Flags == 4'd8)
       $display ("Addition With Carry IS PASSED") ;
   else
      begin
       $display ("Addition With Carry IS FAILED") ;
      end    

    $display ("*** TEST CASE 3 : Subtraction Without Borrow ***") ;

A_TB = 16'd15;
B_TB = 16'd10;
ALU_FUN_TB = 4'b0001; 

#CLK_PERIOD
    
   if (ALU_OUT_TB == 16'd5 && Carry_Flag_TB == 1'b0 && Flags == 4'd8)      
      $display ("Subtraction Without Borrow IS PASSED") ; 
   else
      $display ("Subtraction Without Borrow IS FAILED") ;


    $display ("*** TEST CASE 4 : Subtraction With Borrow ***") ;

A_TB = 16'd5;
B_TB = 16'd10;
ALU_FUN_TB = 4'b0001; 

#CLK_PERIOD
    
   if (ALU_OUT_TB == 16'hfffb && Carry_Flag_TB == 1'b1 && Flags == 4'd8)      
      $display ("Subtraction With Borrow IS PASSED") ; 
   else
      $display ("Subtraction With Borrow IS FAILED") ;

	  
    $display ("*** TEST CASE 5 : Multiplication ***") ;

A_TB = 16'd15;
B_TB = 16'd10;
ALU_FUN_TB = 4'b0010; 

#CLK_PERIOD
    
    if (ALU_OUT_TB == 16'd150 && Flags == 4'd8)         
    $display ("Multiplication IS PASSED") ; 
   else
     $display ("Multiplication IS PASSED") ;
    
    
    $display ("*** TEST CASE 6 : Division ***") ;
    
A_TB = 16'd15;
B_TB = 16'd10;
ALU_FUN_TB = 4'b0011;     

#CLK_PERIOD
    
   if (ALU_OUT_TB == 16'd1 && Flags == 4'd8)         
    $display ("Division IS PASSED") ; 
   else
     $display ("Division IS FAILED") ;   

    
    $display ("*** TEST CASE 7 : ANDING ***") ;
 
A_TB = 16'b1001;
B_TB = 16'b0011;
ALU_FUN_TB = 4'b0100;  

#CLK_PERIOD
        
   if (ALU_OUT_TB == 16'b0001 && Flags == 4'd4)     
    $display ("ANDING IS PASSED") ; 
   else
     $display ("ANDING IS FAILED") ;

    
    $display ("*** TEST CASE 8 : ORING ***") ;

A_TB = 16'b1001;
B_TB = 16'b0011;
ALU_FUN_TB = 4'b0101;  

#CLK_PERIOD
        
   if (ALU_OUT_TB == 16'b1011 && Flags == 4'd4)   
    $display ("ORING IS PASSED") ; 
   else
     $display ("ORING IS FAILED") ;

    
    $display ("*** TEST CASE 9 : NANDING ***") ;
 
A_TB = 16'b1001;
B_TB = 16'b0011;
ALU_FUN_TB = 4'b0110;  

#CLK_PERIOD
        
   if (ALU_OUT_TB == 16'hfffe && Flags == 4'd4)      
    $display ("NANDING IS PASSED") ; 
   else
     $display ("NANDING IS FAILED") ;

    
    $display ("*** TEST CASE 10 : NORING ***") ;

A_TB = 16'b1001;
B_TB = 16'b0011;
ALU_FUN_TB = 4'b0111;  

#CLK_PERIOD
        
   if (ALU_OUT_TB == 16'hfff4 && Flags == 4'd4)   
    $display ("NORING IS PASSED") ; 
   else
     $display ("NORING IS FAILED") ;

    
    $display ("*** TEST CASE 11 : XORING ***") ;

A_TB = 16'b1001;
B_TB = 16'b0011;
ALU_FUN_TB = 4'b1000;  

#CLK_PERIOD
        
   if (ALU_OUT_TB == 16'b1010 && Flags == 4'd4)    
    $display ("XORING IS PASSED") ; 
   else
     $display ("XORING IS FAILED") ;


    $display ("*** TEST CASE 12 : XNORING ***") ;

A_TB = 16'b1001;
B_TB = 16'b0011;
ALU_FUN_TB = 4'b1001;  

#CLK_PERIOD
        
    if (ALU_OUT_TB == 16'hfff5 && Flags == 4'd4)    
     $display ("XNORING IS PASSED") ; 
   else
     $display ("XNORING IS FAILED") ;
    
    
    $display ("*** TEST CASE 13 : CMP_EQ ***") ;

A_TB = 16'b1001;
B_TB = 16'b0011;
ALU_FUN_TB = 4'b1010;  

#CLK_PERIOD
        
    if (ALU_OUT_TB == 16'b0000 && Flags == 4'd2)   
    $display ("CMP_EQ IS PASSED") ; 
   else
     $display ("CMP_EQ IS FAILED") ;

    
    $display ("*** TEST CASE 14 : CMP_GR ***") ;

A_TB = 16'b1001;
B_TB = 16'b0011;
ALU_FUN_TB = 4'b1011;  

#CLK_PERIOD
        
    if (ALU_OUT_TB == 16'b0010 && Flags == 4'd2) 
    $display ("CMP_GR IS PASSED") ; 
   else
     $display ("CMP_GR IS FAILED") ;

    
    $display ("*** TEST CASE 15 : CMP_SM ***") ;
 
A_TB = 16'b1001;
B_TB = 16'b0011;
ALU_FUN_TB = 4'b1100;  

#CLK_PERIOD
        
    if (ALU_OUT_TB == 16'b0000 && Flags == 4'd2)  
    $display ("CMP_SM IS PASSED") ; 
   else
     $display ("CMP_SM IS FAILED") ;

    
    $display ("*** TEST CASE 16 : SFT_R ***") ;
 
A_TB = 16'b1001;
B_TB = 16'b0011;
ALU_FUN_TB = 4'b1101;  

#CLK_PERIOD
        
    if (ALU_OUT_TB == 16'b0100 && Flags == 4'd1)    
    $display ("SFT_R IS PASSED") ; 
   else
     $display ("SFT_R  IS FAILED") ;

    
    $display ("*** TEST CASE 17 : SFT_L ***") ;
 
A_TB = 16'b1001;
B_TB = 16'b0011;
ALU_FUN_TB = 4'b1110;  

#CLK_PERIOD
        
    if (ALU_OUT_TB == 16'b10010 && Flags == 4'd1)    
    $display ("SFT_L IS PASSED") ; 
   else
     $display ("SFT_L IS FAILED") ;	 

    
    $display ("*** TEST CASE 18 : NO_FUN***") ;
 
A_TB = 16'b1001;
B_TB = 16'b0011;
ALU_FUN_TB = 4'b1111;  

#CLK_PERIOD
        
   if (ALU_OUT_TB == 16'b0000 && Flags == 4'd0)    
    $display ("NO_FUN IS PASSED") ; 
   else
     $display ("NO_FUN IS FAILED") ;	 

	 
   #100 $finish;  //finished with simulation 
end
  

// Clock Generator with 100 KHz (10 us)
always  #(CLK_PERIOD/2) CLK_TB = ~ CLK_TB;  

// instantiate Design Unit
ALU_16B DUT (
.A(A_TB), 
.B(B_TB),
.ALU_FUN(ALU_FUN_TB),
.CLK(CLK_TB),
.Arith_Flag(Arith_Flag_TB),
.Carry_Flag(Carry_Flag_TB), 
.Logic_Flag(Logic_Flag_TB), 
.CMP_Flag(CMP_Flag_TB), 
.Shift_Flag(Shift_Flag_TB),
.ALU_OUT(ALU_OUT_TB)
);

endmodule