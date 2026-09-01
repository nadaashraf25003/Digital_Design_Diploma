
/////////////////////////////////////////////////////////////
///////////////////// Serial 2 Parallel /////////////////////
/////////////////////////////////////////////////////////////

module SER_2_PAR # (parameter DATA_WIDTH = 8)
(
input    wire                      CLK,
input    wire                      RST,
input    wire                      SER_DATA,
input    wire                      SER_DATA_VLD,
output   reg    [DATA_WIDTH-1:0]   PAR_DATA, 
output   reg                       PAR_DATA_VLD 
);

/*
always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
  begin
    PAR_DATA <= 'b0 ;
    PAR_DATA_VLD <= 'b0 ;
   end
  else if(SER_DATA_VLD)
   begin
    PAR_DATA <= {SER_DATA,PAR_DATA[7:1]} ;
    PAR_DATA_VLD <= 'b0 ;	
   end	
  else 
   begin
    PAR_DATA_VLD <= 'b1 ;
   end   
 end

*/



reg    [DATA_WIDTH-1:0]   DATA; 
reg                       DATA_VLD; 

always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    DATA <= 'b0 ;
    DATA_VLD <= 'b0 ;
   end
  else if(SER_DATA_VLD)
   begin
    DATA <= {SER_DATA,DATA[7:1]} ;
    DATA_VLD <= 'b0 ;	
   end	
  else 
   begin
    DATA_VLD <= 'b1 ;
   end   
 end

//------------- Pulse Generation ------------
reg DATA_VLD_DELAY,
    DATA_VLD_PULSE;

always @ (posedge CLK or negedge RST) begin
    if(!RST) begin
        DATA_VLD_DELAY <= 1'b0;
        DATA_VLD_PULSE <= 1'b0;
    end
    else begin
        DATA_VLD_DELAY <= DATA_VLD;
        DATA_VLD_PULSE <= DATA_VLD & ~DATA_VLD_DELAY;
    end
end

//------------- Output Generation ------------
always @ (posedge CLK or negedge RST) begin
    if(!RST) begin
      PAR_DATA <= 'b0 ;
      PAR_DATA_VLD <= 'b0 ;
    end
    else if (DATA_VLD_PULSE) begin
      PAR_DATA     <= DATA;
      PAR_DATA_VLD <= DATA_VLD;
    end
   else begin
      PAR_DATA_VLD <= 1'b0;
    end
end

 
endmodule
