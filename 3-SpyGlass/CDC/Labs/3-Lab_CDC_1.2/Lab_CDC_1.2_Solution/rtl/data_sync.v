module DATA_SYNC #(
    parameter BUS_WIDTH = 16
)(
    input  wire                 CLK,
    input  wire                 RST,
    input  wire [BUS_WIDTH-1:0] unsync_bus,
    input  wire                 bus_enable,

    output reg  [BUS_WIDTH-1:0] sync_bus,
    output reg                  enable_pulse_d
);

    // Internal connections
    reg [1:0] sync_reg;
    reg       enable_flop;

    wire                 enable_pulse;
    wire [BUS_WIDTH-1:0] sync_bus_c;

    // 2-Stage Multi-flop Synchronizer
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            sync_reg <= 2'b00;
        end else begin
            sync_reg <= {sync_reg[0], bus_enable};
        end
    end

    // Pulse Generator (Rising Edge Detection)
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            enable_flop <= 1'b0;
        end else begin
            enable_flop <= sync_reg[1];
        end
    end

    assign enable_pulse = sync_reg[1] && !enable_flop;

    // Multiplexing
    assign sync_bus_c = enable_pulse ? unsync_bus : sync_bus;

    // Destination Domain Flop (Data Latch)
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            sync_bus <= {BUS_WIDTH{1'b0}};
        end else begin
            sync_bus <= sync_bus_c;
        end
    end

    // Delay Generated Pulse
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            enable_pulse_d <= 1'b0;
        end else begin
            enable_pulse_d <= enable_pulse;
        end
    end

endmodule