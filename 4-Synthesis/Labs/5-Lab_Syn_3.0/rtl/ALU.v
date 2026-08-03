module ALU # ( parameter DATA_WIDTH = 8 
) 
 (
  input  wire [DATA_WIDTH-1:0]    A,B,
  input  wire [3:0]               ALU_FUN,
  input  wire                     CLK,
  input  wire                     RST,
  input  wire                     Enable,
  output reg  [2*DATA_WIDTH-1:0]  ALU_OUT,
  output reg                      OUT_VALID
);
  

//internal_signals  
  reg   [DATA_WIDTH-1:0]    A_reg ;
  reg   [DATA_WIDTH-1:0]    B_reg ;
  reg   [2*DATA_WIDTH-1:0]  ALU_OUT_Comb;
  reg                       OUT_VALID_Comb;
  reg   [2*DATA_WIDTH-1:0]  ALU_OUT_reg;
  reg                       OUT_VALID_reg;

//registering inputs
always @(posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    A_reg <= 'b0 ;
    B_reg <= 'b0 ;
   end
  else
   begin
    A_reg <= A ;
    B_reg <= B ;
   end
 end 
 
always @(posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    ALU_OUT_reg   <= 'b0 ;
    OUT_VALID_reg <= 'b0 ;
   end
  else
   begin
    ALU_OUT_reg <= ALU_OUT_Comb;
    OUT_VALID_reg <= OUT_VALID_Comb;
   end
 end  
  
always @(*)
 begin
    OUT_VALID_Comb = 1'b1 ;
    ALU_OUT_Comb = 1'b0 ; 
    case (ALU_FUN) 
    4'b0000: begin
               ALU_OUT_Comb = A_reg + B_reg;
              end
    4'b0001: begin
               ALU_OUT_Comb = A_reg - B_reg;
              end
    4'b0010: begin
               ALU_OUT_Comb = A_reg * B_reg;
              end
    4'b0011: begin
               ALU_OUT_Comb = A_reg / B_reg;
              end
    4'b0100: begin
               ALU_OUT_Comb = A_reg & B_reg;
              end
    4'b0101: begin
               ALU_OUT_Comb = A_reg | B_reg;
              end
    4'b0110: begin
               ALU_OUT_Comb = ~ (A_reg & B_reg);
              end
    4'b0111: begin
               ALU_OUT_Comb = ~ (A_reg | B_reg);
              end     
    4'b1000: begin
               ALU_OUT_Comb =  (A_reg ^ B_reg);
              end
    4'b1001: begin
               ALU_OUT_Comb = ~ (A_reg ^ B_reg);
              end           
    4'b1010: begin
              if (A_reg==B_reg)
                 ALU_OUT_Comb = 16'b1;
              else
                 ALU_OUT_Comb = 16'b0;
              end
    4'b1011: begin
               if (A_reg>B_reg)
                 ALU_OUT_Comb = 16'b1;
               else
                 ALU_OUT_Comb = 16'b0;
              end 
    4'b1100: begin
               if (A_reg<B_reg)
                 ALU_OUT_Comb = 16'b11;
               else
                 ALU_OUT_Comb = 16'b0;
              end     
    4'b1101: begin
              ALU_OUT_Comb = A_reg >> 1;
             end
    4'b1110: begin 
              ALU_OUT_Comb = A_reg << 1;
             end
    default: begin
	     OUT_VALID_Comb = 1'b1 ;
              ALU_OUT_Comb = 16'b0;
             end
    endcase
 end

always @(*)
 begin
  ALU_OUT = 'b0 ;
  if(Enable) 
   begin 
      ALU_OUT   = ALU_OUT_reg ;                  
      OUT_VALID = OUT_VALID_reg ;
   end
  else
   begin
      ALU_OUT = 'b0 ;
      OUT_VALID = 'b0;
   end
 end

endmodule
