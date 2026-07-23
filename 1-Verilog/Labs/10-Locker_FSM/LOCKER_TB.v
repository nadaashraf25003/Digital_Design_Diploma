module LOCKER_TB;

reg        button_0_tb ;
reg        button_1_tb ;
reg        rst_tb ;
reg        clk_tb ;
wire       unlock_tb ;
  

  
 
////////////////////////////////////////////////////////
////////////////// initial block /////////////////////// 
////////////////////////////////////////////////////////


initial 
 begin
   
 // Save Waveform
   $dumpfile("LOCKER.vcd") ;       
   $dumpvars; 
 

 // initialization
   initialize();

 // Reset
   reset();
   
 // Input Sequence
   press_buttons(5'b10100,5'b01011); // input_1 for button_0 
                                     // input_2 for button_1

 // check output time
   wait(unlock_tb)
    $display("LOCKER IS UNLOCKED AT TIME %d", $time) ;
   
  $finish ;
 
 end  


////////////////////////////////////////////////////////
/////////////////////// TASKS //////////////////////////
////////////////////////////////////////////////////////

/////////////// Signals Initialization //////////////////

task initialize;
 begin
  button_0_tb = 1'b0 ;
  button_1_tb = 1'b0 ;
  clk_tb = 1'b0 ; 
 end
endtask

///////////////////////// RESET /////////////////////////
  
task reset;
 begin
 rst_tb =  'b1;
 #1
 rst_tb  = 'b0;
 #1
 rst_tb  = 'b1;
 end
endtask  

////////////////////// press_buttons /////////////////////
  
task press_buttons(
  input  reg   [4:0]     button0,
  input  reg   [4:0]     button1
);
  
  integer   loop ;
  
begin
  for(loop=0;loop<5;loop=loop+1)
   begin
     @(negedge clk_tb) 
     button_0_tb = button0[loop] ;
     button_1_tb = button1[loop] ;
   end   
 end
endtask    
////////////////////////////////////////////////////////
////////////////// Clock Generator  ////////////////////
////////////////////////////////////////////////////////

always #0.5  clk_tb = ~clk_tb ;
  

////////////////////////////////////////////////////////
/////////////////// DUT Instantation ///////////////////
////////////////////////////////////////////////////////

LOCKER_Mealy DUT (
.button_0(button_0_tb),
.button_1(button_1_tb),
.rst(rst_tb),
.clk(clk_tb),
.unlock(unlock_tb)
);


endmodule  