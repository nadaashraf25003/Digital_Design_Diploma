module LFSR #(
    parameter [7:0] SEED = 8'hA5,       // Initial seed value
    parameter [7:0] Taps = 8'b10101010  // Sequence polynomial taps
)(
    input  wire        Clock, 
    input  wire        Reset, 	
    input  wire        Enable, 	
    input  wire        OUT_Enable,
    output reg         OUT_LFSR_S, 
    output reg         Valid,
    output reg   [7:0] LFSR              // 8-bit LFSR shift register
);


    integer N;

    wire Bits0_6, Feedback;

    assign Bits0_6  = ~| LFSR[6:0];
    assign Feedback = Bits0_6 ^ LFSR[7];

    always @(posedge Clock or negedge Reset) begin
        if (!Reset) begin
            LFSR     <= SEED; // Uses parameter value on asynchronous reset
            OUT_LFSR_S <= 1'b0;
            Valid    <= 1'b0;
        end else if (Enable) begin    
            LFSR[0] <= Feedback;     
            for (N = 7; N >= 1; N = N - 1) begin
                if (Taps[N] == 1) 
                    LFSR[N] <= LFSR[N-1] ^ Feedback; 
                else 
                    LFSR[N] <= LFSR[N-1]; 
            end
        end else if (OUT_Enable) begin
            {LFSR[6:0], OUT_LFSR_S} <= LFSR[7:0];
            Valid <= 1'b1;
        end
    end

endmodule