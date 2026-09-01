module cdc_lab0 (
    input  wire        CLKA,
    input  wire        CLKB,
    input  wire        RSTA_N,
    input  wire        RSTB_N,

    input  wire [7:0]  DATA_IN_A,
    input  wire        DATA_VALID_A,

    output reg  [7:0]  DATA_OUT_B,
    output reg         VALID_OUT_B
);

//------------- Pulse Generation ------------
reg  DATA_VALID_A_DELAY,
     DATA_VALID_A_PULSE;

always @(posedge CLKA or negedge RSTA_N) begin
    if (!RSTA_N) begin
        DATA_VALID_A_DELAY <= 1'b0;
        DATA_VALID_A_PULSE <= 1'b0;
    end
    else begin
        DATA_VALID_A_DELAY <= DATA_VALID_A;
        DATA_VALID_A_PULSE <= DATA_VALID_A & ~DATA_VALID_A_DELAY;
    end
end

reg [7:0] DATA_REG_A;
reg       VALID_REG_A;
always @(posedge CLKA or negedge RSTA_N) begin
    if (!RSTA_N) begin
        DATA_REG_A  <= 8'b0;
        VALID_REG_A <= 1'b0;
    end
    else begin
        if (DATA_VALID_A_PULSE) begin
            DATA_REG_A  <= DATA_IN_A;
            VALID_REG_A <= 1'b1;
        end
        else begin
            VALID_REG_A <= 1'b0;
        end
    end
end


// -------------------------------------------------------
// BUG #1:
// Direct asynchronous control crossing
// -------------------------------------------------------

reg  SYNC_FF0, SYNC_FF1 ;
wire VALID_REG_A_SYNC ;

always @(posedge CLKB or negedge RSTB_N) begin
    if (!RSTB_N) begin
        SYNC_FF0 <= 1'b0;
        SYNC_FF1 <= 1'b0;
    end
    else begin
        SYNC_FF0 <= VALID_REG_A;
        SYNC_FF1 <= SYNC_FF0;
    end
end

assign VALID_REG_A_SYNC = SYNC_FF1 ;

always @(posedge CLKB or negedge RSTB_N) begin
    if (!RSTB_N) begin
        VALID_OUT_B <= 1'b0;
    end
    else begin
        VALID_OUT_B <= VALID_REG_A_SYNC;
    end
end


// -------------------------------------------------------
// BUG #2:
// Direct multi-bit asynchronous data crossing
// -------------------------------------------------------

/*
always @(posedge CLKB or negedge RSTB_N) begin
    if (!RSTB_N) begin
        DATA_OUT_B <= 8'h00;
    end
    else begin
        if (VALID_REG_A)
            DATA_OUT_B <= DATA_REG_A;
    end
end
*/

/*
// Enable Based Synchronization Method
always @(posedge CLKB or negedge RSTB_N) begin
    if (!RSTB_N) begin
        DATA_OUT_B <= 8'h00;
    end
    else begin
        if (VALID_REG_A_SYNC)
            DATA_OUT_B <= DATA_REG_A;
    end
end
*/


// Recirculation MUX Based Synchronization Method

wire [7:0]  DATA_MUX ;

assign DATA_MUX = VALID_REG_A_SYNC ? DATA_REG_A :
                                     DATA_OUT_B;

always @(posedge CLKB or negedge RSTB_N) begin
    if (!RSTB_N) begin
        DATA_OUT_B <= 8'h00;
    end
    else begin
        DATA_OUT_B <= DATA_MUX;
    end
end


endmodule
