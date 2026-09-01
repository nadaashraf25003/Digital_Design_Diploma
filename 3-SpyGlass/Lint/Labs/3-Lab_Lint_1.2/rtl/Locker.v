// =====================================================
// Mealy FSM
// =====================================================
module LOCKER_Mealy_Lint (
    input  wire button_0,
    input  wire button_1,
    input  wire rst,
    input  wire clk,
    output reg  unlock
);

    // =====================================================
    // State Encoding
    // =====================================================
    // BUG2 : Duplicate state encoding
    // BUG3 : Unreachable state (ERROR)
    // BUG4 : Deadlock state
    // =====================================================
    localparam [2:0]
        IDLE     = 3'b000,
        S1       = 3'b001,
        S11      = 3'b001,   // duplicate encoding
        S011     = 3'b010,
        S1011    = 3'b110,
        DEADLOCK = 3'b101,
        ERROR    = 3'b111;   // never reached

    // -----------------------------------------------------
    reg [2:0] current_state;
    reg [2:0] next_state;

    // =====================================================
    // State Register
    // =====================================================
    // BUG7 : Blocking assignment
    // BUG8 : Mixed blocking/nonblocking
    // =====================================================
    always @(posedge clk or negedge rst) begin
        if (!rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // =====================================================
    // Next State Logic
    // =====================================================
    always @(*) begin
	unlock = 0;

        case (current_state)

            // -----------------------------------------------
            IDLE: begin
                if (button_1)
                    next_state = S1;   // BUG12 : missing else
            end

            // -----------------------------------------------
            S1: begin
                // BUG13 : Constant condition
                if (1'b1)
                    next_state = S11;
                else
                    next_state = IDLE;
            end

            // -----------------------------------------------
            S11: begin
                if (button_0)
                    next_state = S011;  // BUG14 : missing else
            end

            // -----------------------------------------------
            S011: begin
                if (button_0)
                    next_state = IDLE;
                if (button_1)
                    next_state = S1011;  // BUG15 : multiple assignments possible
            end

            // -----------------------------------------------
            S1011: begin
                if (button_0) begin
                    next_state = DEADLOCK;
		    unlock = 1;
                end
                else if (button_1)
                    next_state = IDLE;
                else
                    next_state = S1011;
            end

            // -----------------------------------------------
            // BUG16 : Deadlock state
            // -----------------------------------------------
            DEADLOCK: begin
                next_state = DEADLOCK;
            end

            // -----------------------------------------------
            // BUG17 : ERROR state exists but never entered
            //         (unreachable)
            // -----------------------------------------------
            ERROR: begin
                next_state = IDLE;
            end

            // -----------------------------------------------
            // BUG18 : Missing default case
            // -----------------------------------------------

        endcase
    end

endmodule
