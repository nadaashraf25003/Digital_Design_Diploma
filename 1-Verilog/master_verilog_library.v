// ==================================================================================
//               MASTER VERILOG RTL & DIGITAL DESIGN ARCHITECTURE LIBRARY
// ==================================================================================
// This unified Verilog file brings together all core digital architectures, coding
// styles, synthesizable constructs, and self-checking testbench templates from
// the Digital Design Diploma (Labs 1.0 - 5.2, Assignments 1.0 - 7.0).
// ==================================================================================

`timescale 1ns / 1ps

// ==================================================================================
// MODULE 1: PARAMETERIZED UP/DOWN SYNCHRONOUS COUNTER
// (Features: Synchronous Load, Enable, Up/Down direction, High/Low Roll-over flags)
// ==================================================================================
module Master_Up_Dn_Counter #(
    parameter WIDTH = 4
)(
    input  wire                 CLK,
    input  wire                 RST_N,
    input  wire                 Load,
    input  wire                 Up,
    input  wire                 Down,
    input  wire [WIDTH-1:0]     IN,
    output reg  [WIDTH-1:0]     Counter,
    output wire                 High,
    output wire                 Low
);

    always @(posedge CLK or negedge RST_N) begin
        if (!RST_N) begin
            Counter <= {WIDTH{1'b0}};
        end else if (Load) begin
            Counter <= IN;
        end else if (Up && !Down) begin
            Counter <= Counter + 1'b1;
        end else if (Down && !Up) begin
            Counter <= Counter - 1'b1;
        end
    end

    assign High = (Counter == {WIDTH{1'b1}}) ? 1'b1 : 1'b0;
    assign Low  = (Counter == {WIDTH{1'b0}}) ? 1'b1 : 1'b0;

endmodule


// ==================================================================================
// MODULE 2: PARAMETERIZED SYNCHRONOUS REGISTER FILE (REGFILE)
// (Features: Configurable Data Width & Depth, Synchronous Read/Write, Reset)
// ==================================================================================
module Master_RegFile #(
    parameter DATA_WIDTH = 16,
    parameter ADDR_WIDTH = 4,
    parameter MEM_DEPTH  = 16
)(
    input  wire                   CLK,
    input  wire                   RST_N,
    input  wire                   WrEn,
    input  wire                   RdEn,
    input  wire [ADDR_WIDTH-1:0]  Address,
    input  wire [DATA_WIDTH-1:0]  WrData,
    output reg  [DATA_WIDTH-1:0]  RdData,
    output reg                    RdData_VLD
);

    integer i;
    reg [DATA_WIDTH-1:0] reg_array [0:MEM_DEPTH-1];

    always @(posedge CLK or negedge RST_N) begin
        if (!RST_N) begin
            RdData     <= {DATA_WIDTH{1'b0}};
            RdData_VLD <= 1'b0;
            for (i = 0; i < MEM_DEPTH; i = i + 1) begin
                reg_array[i] <= {DATA_WIDTH{1'b0}};
            end
        end else begin
            // Synchronous Write
            if (WrEn) begin
                reg_array[Address] <= WrData;
            end
            // Synchronous Read
            if (RdEn) begin
                RdData     <= reg_array[Address];
                RdData_VLD <= 1'b1;
            end else begin
                RdData_VLD <= 1'b0;
            end
        end
    end

endmodule


// ==================================================================================
// MODULE 3: COMPLETE MODULAR 16-BIT ALU WITH FLAG GENERATION
// (Features: Arithmetic, Logic, Shift, Compare Sub-units & Valid Flags)
// ==================================================================================
module Master_ALU #(
    parameter WIDTH = 16
)(
    input  wire                 CLK,
    input  wire                 RST_N,
    input  wire                 Enable,
    input  wire [3:0]           ALU_FUN,
    input  wire [WIDTH-1:0]     A,
    input  wire [WIDTH-1:0]     B,
    output reg  [WIDTH*2-1:0]   ALU_OUT,
    output reg                  Arith_Flag,
    output reg                  Logic_Flag,
    output reg                  CMP_Flag,
    output reg                  Shift_Flag,
    output reg                  Carry_OUT,
    output reg                  Zero_Flag
);

    reg [WIDTH*2-1:0] comb_out;
    reg               comb_carry;
    reg               comb_arith_f, comb_logic_f, comb_cmp_f, comb_shift_f;

    // Pure Combinational Processing (No Unintentional Latches: All defaults assigned)
    always @(*) begin
        comb_out     = {(WIDTH*2){1'b0}};
        comb_carry   = 1'b0;
        comb_arith_f = 1'b0;
        comb_logic_f = 1'b0;
        comb_cmp_f   = 1'b0;
        comb_shift_f = 1'b0;

        case (ALU_FUN)
            // Arithmetic Operations
            4'b0000: begin comb_out = A + B; {comb_carry, comb_out[WIDTH-1:0]} = A + B; comb_arith_f = 1'b1; end
            4'b0001: begin comb_out = A - B; comb_arith_f = 1'b1; end
            4'b0010: begin comb_out = A * B; comb_arith_f = 1'b1; end
            4'b0011: begin comb_out = (B != 0) ? (A / B) : {(WIDTH*2){1'b0}}; comb_arith_f = 1'b1; end

            // Logic Operations
            4'b0100: begin comb_out = A & B; comb_logic_f = 1'b1; end
            4'b0101: begin comb_out = A | B; comb_logic_f = 1'b1; end
            4'b0110: begin comb_out = ~(A & B); comb_logic_f = 1'b1; end
            4'b0111: begin comb_out = ~(A | B); comb_logic_f = 1'b1; end
            4'b1000: begin comb_out = A ^ B; comb_logic_f = 1'b1; end
            4'b1001: begin comb_out = ~(A ^ B); comb_logic_f = 1'b1; end

            // Comparison Operations
            4'b1010: begin comb_out = (A == B) ? 1 : 0; comb_cmp_f = 1'b1; end
            4'b1011: begin comb_out = (A > B)  ? 2 : 0; comb_cmp_f = 1'b1; end
            4'b1100: begin comb_out = (A < B)  ? 3 : 0; comb_cmp_f = 1'b1; end

            // Shift Operations
            4'b1101: begin comb_out = A >> 1; comb_shift_f = 1'b1; end
            4'b1110: begin comb_out = A << 1; comb_shift_f = 1'b1; end
            4'b1111: begin comb_out = {A[WIDTH-2:0], A[WIDTH-1]}; comb_shift_f = 1'b1; end

            default: begin
                comb_out     = {(WIDTH*2){1'b0}};
                comb_carry   = 1'b0;
                comb_arith_f = 1'b0;
                comb_logic_f = 1'b0;
                comb_cmp_f   = 1'b0;
                comb_shift_f = 1'b0;
            end
        endcase
    end

    // Sequential Output Registering
    always @(posedge CLK or negedge RST_N) begin
        if (!RST_N) begin
            ALU_OUT    <= {(WIDTH*2){1'b0}};
            Arith_Flag <= 1'b0;
            Logic_Flag <= 1'b0;
            CMP_Flag   <= 1'b0;
            Shift_Flag <= 1'b0;
            Carry_OUT  <= 1'b0;
            Zero_Flag  <= 1'b0;
        end else if (Enable) begin
            ALU_OUT    <= comb_out;
            Arith_Flag <= comb_arith_f;
            Logic_Flag <= comb_logic_f;
            CMP_Flag   <= comb_cmp_f;
            Shift_Flag <= comb_shift_f;
            Carry_OUT  <= comb_carry;
            Zero_Flag  <= (comb_out == {(WIDTH*2){1'b0}});
        end
    end

endmodule


// ==================================================================================
// MODULE 4: LINEAR FEEDBACK SHIFT REGISTER (LFSR) & CRC-8 ENCODER
// (Features: Configurable Polynomial, Seed Loading, Serial CRC generation)
// ==================================================================================
module Master_CRC_LFSR #(
    parameter WIDTH = 8,
    parameter [WIDTH-1:0] SEED = 8'hD8  // Polynomial: x^8 + x^2 + x + 1 (0xD8 taps)
)(
    input  wire             CLK,
    input  wire             RST_N,
    input  wire             DATA,
    input  wire             ACTIVE,
    output reg  [WIDTH-1:0] CRC_OUT,
    output reg              CRC_VLD
);

    reg [WIDTH-1:0] lfsr_reg;
    wire            feedback;

    assign feedback = DATA ^ lfsr_reg[0];

    always @(posedge CLK or negedge RST_N) begin
        if (!RST_N) begin
            lfsr_reg <= SEED;
            CRC_OUT  <= {WIDTH{1'b0}};
            CRC_VLD  <= 1'b0;
        end else if (ACTIVE) begin
            // Linear Feedback Shift Register Tap Equations
            lfsr_reg[0] <= lfsr_reg[1];
            lfsr_reg[1] <= lfsr_reg[2] ^ feedback;
            lfsr_reg[2] <= lfsr_reg[3] ^ feedback;
            lfsr_reg[3] <= lfsr_reg[4];
            lfsr_reg[4] <= lfsr_reg[5];
            lfsr_reg[5] <= lfsr_reg[6];
            lfsr_reg[6] <= lfsr_reg[7];
            lfsr_reg[7] <= feedback;
            CRC_VLD     <= 1'b0;
        end else begin
            CRC_OUT  <= lfsr_reg;
            CRC_VLD  <= 1'b1;
            lfsr_reg <= SEED; // Re-seed for next packet
        end
    end

endmodule


// ==================================================================================
// MODULE 5: 3-PROCESS FINITE STATE MACHINE (FSM) - GARAGE DOOR / LOCKER CONTROLLER
// (Features: Clean State Register, Combinational Next State, Registered Outputs)
// ==================================================================================
module Master_FSM_Controller (
    input  wire       CLK,
    input  wire       RST_N,
    input  wire       Activate_Cmd,
    input  wire       Sensor_Upper_Limit,
    input  wire       Sensor_Lower_Limit,
    output reg  [1:0] Motor_Speed,       // 00: Stop, 01: Slow, 10: Fast
    output reg        Motor_Up,
    output reg        Motor_Down,
    output reg  [1:0] Current_State_Out
);

    // State Encoding (Gray / One-Hot / Binary)
    localparam [1:0] IDLE_CLOSED = 2'b00,
                     OPENING     = 2'b01,
                     IDLE_OPEN   = 2'b10,
                     CLOSING     = 2'b11;

    reg [1:0] current_state, next_state;

    // Process 1: Sequential State Register
    always @(posedge CLK or negedge RST_N) begin
        if (!RST_N) begin
            current_state <= IDLE_CLOSED;
        end else begin
            current_state <= next_state;
        end
    end

    // Process 2: Combinational Next-State Logic (No latches: Default assigned)
    always @(*) begin
        next_state = current_state;
        case (current_state)
            IDLE_CLOSED: begin
                if (Activate_Cmd)
                    next_state = OPENING;
            end

            OPENING: begin
                if (Sensor_Upper_Limit)
                    next_state = IDLE_OPEN;
            end

            IDLE_OPEN: begin
                if (Activate_Cmd)
                    next_state = CLOSING;
            end

            CLOSING: begin
                if (Sensor_Lower_Limit)
                    next_state = IDLE_CLOSED;
            end

            default: next_state = IDLE_CLOSED;
        endcase
    end

    // Process 3: Output Logic (Registered for Glitch-Free Operation)
    always @(posedge CLK or negedge RST_N) begin
        if (!RST_N) begin
            Motor_Speed       <= 2'b00;
            Motor_Up          <= 1'b0;
            Motor_Down        <= 1'b0;
            Current_State_Out <= IDLE_CLOSED;
        end else begin
            Current_State_Out <= next_state;
            case (next_state)
                IDLE_CLOSED: begin
                    Motor_Speed <= 2'b00;
                    Motor_Up    <= 1'b0;
                    Motor_Down  <= 1'b0;
                end
                OPENING: begin
                    Motor_Speed <= 2'b10;
                    Motor_Up    <= 1'b1;
                    Motor_Down  <= 1'b0;
                end
                IDLE_OPEN: begin
                    Motor_Speed <= 2'b00;
                    Motor_Up    <= 1'b0;
                    Motor_Down  <= 1'b0;
                end
                CLOSING: begin
                    Motor_Speed <= 2'b01;
                    Motor_Up    <= 1'b0;
                    Motor_Down  <= 1'b1;
                end
                default: begin
                    Motor_Speed <= 2'b00;
                    Motor_Up    <= 1'b0;
                    Motor_Down  <= 1'b0;
                end
            endcase
        end
    end

endmodule
