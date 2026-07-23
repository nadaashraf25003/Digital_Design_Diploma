`timescale 1us/1us

module ALU_TOP_TB();

/*************************************************************************/
/****************************** TB Parameters ****************************/
/*************************************************************************/

parameter    OP_DATA_WIDTH_TB   = 16 ;
parameter    Arith_OUT_WIDTH_TB = OP_DATA_WIDTH_TB + OP_DATA_WIDTH_TB ;          
parameter    Logic_OUT_WIDTH_TB = OP_DATA_WIDTH_TB ;
parameter    Shift_OUT_WIDTH_TB = OP_DATA_WIDTH_TB ;
parameter    CMP_OUT_WIDTH_TB   = 3 ;


// Clock Period
parameter  CLK_PERIOD  = 10 ,
           HIGH_PERIOD = 0.6 * CLK_PERIOD ,
           LOW_PERIOD  = 0.4 * CLK_PERIOD ;
		   
		   
/*************************************************************************/
/******************************** TB Signals *****************************/
/*************************************************************************/

   reg    signed   [OP_DATA_WIDTH_TB-1:0]    A_TB         ;
   reg    signed   [OP_DATA_WIDTH_TB-1:0]    B_TB         ;
   wire   signed   [Arith_OUT_WIDTH_TB-1:0]  Arith_OUT_TB ;   
   reg             [3:0]                     ALU_FUNC_TB  ;
   reg                                       CLK_TB       ;
   reg                                       RST_TB       ;
   wire                                      Arith_Flag_TB;
   wire            [Logic_OUT_WIDTH_TB-1:0]  Logic_OUT_TB ;
   wire                                      Logic_Flag_TB;
   wire            [Shift_OUT_WIDTH_TB-1:0]  Shift_OUT_TB ;
   wire                                      Shift_Flag_TB;
   wire            [CMP_OUT_WIDTH_TB-1:0]    CMP_OUT_TB   ;
   wire                                      CMP_Flag_TB  ;
   
   
  
//concatenate flags
wire [3:0] Flags ;

assign Flags = {Arith_Flag_TB , Logic_Flag_TB , CMP_Flag_TB , Shift_Flag_TB};
 
    
  
initial
  begin
    $dumpfile("ALU.vcd");
    $dumpvars ;

//initial values
CLK_TB = 1'b0;
RST_TB = 1'b1;

// RST Activation
#CLK_PERIOD
RST_TB = 1'b0 ;

// RST De-activation
#CLK_PERIOD
RST_TB = 1'b1 ;
    
    $display ("*** TEST CASE 1 -- Addition -- NEG + NEG ***");

// A_TB = -'d4    
A_TB = 'shFFFC;
// B_TB = -'d10    
B_TB = 'shFFF6;
ALU_FUNC_TB = 4'b0000; 

#CLK_PERIOD
    
   if (Arith_OUT_TB == -'d14 && Flags == 4'd8)
       $display ("Addition %0d + %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ;
   else
      begin
       $display ("Addition %0d + %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;
      end
    
    $display ("*** TEST CASE 2 -- Addition -- NEG + POS ***");

// A_TB = -'d22    
A_TB = 'shFFEA;
// B_TB = 'd31    
B_TB = 'sh001F;
ALU_FUNC_TB = 4'b0000; 

#CLK_PERIOD
    
   if (Arith_OUT_TB == 'd9 && Flags == 4'd8)
       $display ("Addition %0d + %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ;
   else
      begin
       $display ("Addition %0d + %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;
      end

    $display ("*** TEST CASE 3 -- Addition -- POS + NEG ***");

// A_TB = 'd227    
A_TB = 'sh00E3;
// B_TB = -'d22    
B_TB = 'shFFEA;
ALU_FUNC_TB = 4'b0000; 

#CLK_PERIOD
    
   if (Arith_OUT_TB == 'd205 && Flags == 4'd8)
       $display ("Addition %0d + %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ;
   else
      begin
       $display ("Addition %0d + %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;
      end
	  
    $display ("*** TEST CASE 4 -- Addition -- POS + POS ***");

// A_TB = 'd19    
A_TB = 'sh0013;
// B_TB = 'd31    
B_TB = 'sh001F;
ALU_FUNC_TB = 4'b0000; 

#CLK_PERIOD
    
   if (Arith_OUT_TB == 'd50 && Flags == 4'd8)
       $display ("Addition %0d + %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ;
   else
      begin
       $display ("Addition %0d + %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;
      end
	

    $display ("*** TEST CASE 5 -- Subtraction -- NEG - NEG  ***") ;

// A_TB = -'d22    
A_TB = 'shFFEA;
// B_TB = -'d10    
B_TB = 'shFFF6;
ALU_FUNC_TB = 4'b0001; 

#CLK_PERIOD
    
   if (Arith_OUT_TB == -'d12 && Flags == 'd8)      
      $display ("Subtraction %0d - %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ; 
   else
      $display ("Subtraction %0d - %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;

    $display ("*** TEST CASE 6 -- Subtraction -- NEG - POS  ***") ;

// A_TB = -'d22    
A_TB = 'shFFEA;
// B_TB = 'd5    
B_TB = 'sh0005;
ALU_FUNC_TB = 4'b0001; 

#CLK_PERIOD
    
   if (Arith_OUT_TB == -'d27 && Flags == 'd8)      
      $display ("Subtraction %0d - %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ; 
   else
      $display ("Subtraction %0d - %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;

	  
    $display ("*** TEST CASE 7 -- Subtraction -- POS - NEG  ***") ;

// A_TB = 'd163    
A_TB = 'sh00A3;
// B_TB = -'d7    
B_TB = 'shFFF9;
ALU_FUNC_TB = 4'b0001; 

#CLK_PERIOD
    
   if (Arith_OUT_TB == 'd170 && Flags == 'd8)      
      $display ("Subtraction %0d - %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ; 
   else
      $display ("Subtraction %0d - %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;

	  
    $display ("*** TEST CASE 8 -- Subtraction -- POS - POS  ***") ;

// A_TB = 'd12    
A_TB = 'sh000C;
// B_TB = 'd7    
B_TB = 'sh0007;
ALU_FUNC_TB = 4'b0001; 

#CLK_PERIOD
    
   if (Arith_OUT_TB == 'd5 && Flags == 'd8)      
      $display ("Subtraction %0d - %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ; 
   else
      $display ("Subtraction %0d - %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;	
	  
	  
    $display ("*** TEST CASE 9 -- Multiplication -- NEG * NEG  ***") ;

// A_TB = -'d22    
A_TB = 'shFFEA;
// B_TB = -'d10    
B_TB = 'shFFF6;
ALU_FUNC_TB = 4'b0010; 

#CLK_PERIOD
    
   if (Arith_OUT_TB == 'd220 && Flags == 'd8)      
      $display ("Multiplication %0d * %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ; 
   else
      $display ("Multiplication %0d * %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;

	  
    $display ("*** TEST CASE 10 -- Multiplication -- NEG * POS  ***") ;

// A_TB = -'d22    
A_TB = 'shFFEA;
// B_TB = 'd5    
B_TB = 'sh0005;
ALU_FUNC_TB = 4'b0010; 

#CLK_PERIOD
    
   if (Arith_OUT_TB == -'d110 && Flags == 'd8)      
      $display ("Multiplication %0d * %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ; 
   else
      $display ("Multiplication %0d * %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;

	  
    $display ("*** TEST CASE 11 -- Multiplication -- POS * NEG  ***") ;

// A_TB = 'd10   
A_TB = 'sh000A;
// B_TB = -'d7    
B_TB = 'shFFF9;
ALU_FUNC_TB = 4'b0010; 

#CLK_PERIOD
    
   if (Arith_OUT_TB == -'d70 && Flags == 'd8)      
      $display ("Multiplication %0d * %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ; 
   else
      $display ("Multiplication %0d * %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;

	  
    $display ("*** TEST CASE 12 -- Multiplication -- POS * POS  ***") ;

// A_TB = 'd12    
A_TB = 'sh000C;
// B_TB = 'd20    
B_TB = 'sh0014;
ALU_FUNC_TB = 4'b0010; 

#CLK_PERIOD
    
   if (Arith_OUT_TB == 'd240 && Flags == 'd8)      
      $display ("Multiplication %0d * %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ; 
   else
      $display ("Multiplication %0d * %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;	  
	  

    $display ("*** TEST CASE 13 -- Division -- NEG / NEG  ***") ;

// A_TB = -'d22    
A_TB = 'shFFEA;
// B_TB = -'d10    
B_TB = 'shFFF6;
ALU_FUNC_TB = 4'b0011;     

#CLK_PERIOD
    
   if (Arith_OUT_TB == 'd2 && Flags == 'd8)      
      $display ("Division %0d / %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ; 
   else
      $display ("Division %0d / %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;

	  
    $display ("*** TEST CASE 14 -- Division -- NEG / POS  ***") ;

// A_TB = -'d150    
A_TB = 'shFF6A;
// B_TB = 'd5    
B_TB = 'sh0005;
ALU_FUNC_TB = 4'b0011;     

#CLK_PERIOD
    
   if (Arith_OUT_TB == -'d30 && Flags == 'd8)      
      $display ("Division %0d / %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ; 
   else
      $display ("Division %0d / %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;

	  
    $display ("*** TEST CASE 15 -- Division -- POS / NEG  ***") ;

// A_TB = 'd10   
A_TB = 'sh000A;
// B_TB = -'d2    
B_TB = 'shFFFE;
ALU_FUNC_TB = 4'b0011;     

#CLK_PERIOD
    
   if (Arith_OUT_TB == -'d5 && Flags == 'd8)      
      $display ("Division %0d / %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ; 
   else
      $display ("Division %0d / %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;

	  
    $display ("*** TEST CASE 16 -- Division -- POS / POS  ***") ;

// A_TB = 'd20    
A_TB = 'sh0014;
// B_TB = 'd20    
B_TB = 'sh0014;
ALU_FUNC_TB = 4'b0011;     

#CLK_PERIOD
    
   if (Arith_OUT_TB == 'd1 && Flags == 'd8)      
      $display ("Division %0d / %0d IS PASSED = %0d",A_TB,B_TB,Arith_OUT_TB) ; 
   else
      $display ("Division %0d / %0d IS FAILED = %0d",A_TB,B_TB,Arith_OUT_TB) ;	 	  

    
    $display ("*** TEST CASE 17 -- ANDING -- ***") ;
 
A_TB = 'b1001;
B_TB = 'b0011;
ALU_FUNC_TB = 4'b0100;  

#CLK_PERIOD
        
   if (Logic_OUT_TB == 'b0001 && Flags == 'd4)     
    $display ("ANDING IS PASSED") ; 
   else
     $display ("ANDING IS FAILED") ;

    
    $display ("*** TEST CASE 18 -- ORING -- ***") ;

A_TB = 'b1001;
B_TB = 'b0011;
ALU_FUNC_TB = 4'b0101;  

#CLK_PERIOD
        
   if (Logic_OUT_TB == 'b1011 && Flags == 'd4)   
    $display ("ORING IS PASSED") ; 
   else
     $display ("ORING IS FAILED") ;

    
    $display ("*** TEST CASE 19 -- NANDING -- ***") ;
 
A_TB = 'b1001;
B_TB = 'b0011;
ALU_FUNC_TB = 4'b0110;  

#CLK_PERIOD
        
   if (Logic_OUT_TB == 'hfffe && Flags == 'd4)      
    $display ("NANDING IS PASSED") ; 
   else
     $display ("NANDING IS FAILED") ;

    
    $display ("*** TEST CASE 20 -- NORING -- ***") ;

A_TB = 'b1001;
B_TB = 'b0011;
ALU_FUNC_TB = 4'b0111;  

#CLK_PERIOD
        
   if (Logic_OUT_TB == 'hfff4 && Flags == 'd4)   
    $display ("NORING IS PASSED") ; 
   else
     $display ("NORING IS FAILED") ;

    
    $display ("*** TEST CASE 21 -- NOP -- ***") ;

A_TB = 'b1001;
B_TB = 'b0011;
ALU_FUNC_TB = 4'b1000;  

#CLK_PERIOD
        
   if (CMP_OUT_TB == 3'b0 && Flags == 'd2)    
    $display ("NOP IS PASSED") ; 
   else
     $display ("NOP IS FAILED") ;


    $display ("*** TEST CASE 22 -- CMP_EQ -- ***") ;

A_TB = 'b1001;
B_TB = 'b0011;
ALU_FUNC_TB = 4'b1001;  

#CLK_PERIOD
        
    if (CMP_OUT_TB == 3'b0 && Flags == 'd2)    
     $display ("CMP_EQ IS PASSED") ; 
   else
     $display ("CMP_EQ IS FAILED") ;
    
    
    $display ("*** TEST CASE 23 -- CMP_GR -- ***") ;

A_TB = 'b1001;
B_TB = 'b0011;
ALU_FUNC_TB = 4'b1010;  

#CLK_PERIOD
        
    if (CMP_OUT_TB == 3'b10 && Flags == 'd2)   
    $display ("CMP_GR IS PASSED") ; 
   else
     $display ("CMP_GR IS FAILED") ;

    
    $display ("*** TEST CASE 24 -- CMP_LS -- ***") ;

A_TB = 'b1001;
B_TB = 'b0011;
ALU_FUNC_TB = 4'b1011;  

#CLK_PERIOD
        
    if (Arith_OUT_TB == 3'b0 && Flags == 'd2) 
    $display ("CMP_LS IS PASSED") ; 
   else
     $display ("CMP_LS IS FAILED") ;

    
    $display ("*** TEST CASE 25 -- A_SF_R -- ***") ;
 
A_TB = 'b1001;
B_TB = 'b0011;
ALU_FUNC_TB = 4'b1100;  

#CLK_PERIOD
        
    if (Shift_OUT_TB == 'b0100 && Flags == 'd1)  
    $display ("A_SF_R IS PASSED") ; 
   else
     $display ("A_SF_R IS FAILED") ;

    
    $display ("*** TEST CASE 26 -- A_SF_L -- ***") ;
 
A_TB = 'b1001;
B_TB = 'b0011;
ALU_FUNC_TB = 4'b1101;  

#CLK_PERIOD
        
    if (Shift_OUT_TB == 'b10010 && Flags == 'd1)    
    $display ("A_SF_L IS PASSED") ; 
   else
     $display ("A_SF_L IS FAILED") ;

    
    $display ("*** TEST CASE 27 -- B_SF_R -- ***") ;
 
A_TB = 'b1001;
B_TB = 'b0011;
ALU_FUNC_TB = 4'b1110;  

#CLK_PERIOD
        
    if (Shift_OUT_TB == 'b01 && Flags == 'd1)    
    $display ("B_SF_R IS PASSED") ; 
   else
     $display ("B_SF_R IS FAILED") ;	 

    
    $display ("*** TEST CASE 28 -- B_SF_L -- ***") ;
 
A_TB = 'b1001;
B_TB = 'b0011;
ALU_FUNC_TB = 4'b1111;  

#CLK_PERIOD
        
   if (Shift_OUT_TB == 'b0110 && Flags == 'd1)    
    $display ("B_SF_L IS PASSED") ; 
   else
     $display ("B_SF_L IS FAILED") ;	 
	 
   #100 $stop;  //finished with simulation 
  end
  
  
// Clock Generator with 100 KHz (10 us)
  always  
   begin
    #LOW_PERIOD  CLK_TB = ~ CLK_TB ;
    #HIGH_PERIOD CLK_TB = ~ CLK_TB ;
   end

   // instantiate Design Unit
ALU_TOP # (.OP_DATA_WIDTH(OP_DATA_WIDTH_TB)) DUT (
.A(A_TB), 
.B(B_TB),
.ALU_FUNC(ALU_FUNC_TB),
.CLK(CLK_TB),
.RST(RST_TB),
.Arith_OUT(Arith_OUT_TB),
.Arith_Flag(Arith_Flag_TB),
.Logic_OUT(Logic_OUT_TB),
.Logic_Flag(Logic_Flag_TB),
.Shift_OUT(Shift_OUT_TB),
.Shift_Flag(Shift_Flag_TB),
.CMP_OUT(CMP_OUT_TB),
.CMP_Flag(CMP_Flag_TB)
);

endmodule