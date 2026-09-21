
module top (
    input  wire       clk_50m,    // PIN_
    input  wire       rst_n,      // PIN_
    input  wire       LFSR_EN,    // PIN_
    input  wire       OUT_EN,     // PIN_
    output wire [7:0] LEDs,       // PINs 
    output wire       crc_out,    // PIN_
    output wire       valid_out   // PIN_
);

    wire clk_10m;   // System logic clock (c0)
    wire clk_100m;  // Signal Tap 10x sampling clock (c1)

    // ALTPLL Core Instance
    My_PLL u_pll (
        .inclk0 (clk_50m),
        .c0     (clk_10m),
        .c1     (clk_100m)
    );

    // LFSR Core Instance
    LFSR u_crc (
        .Clock      (clk_10m),
        .Reset      (rst_n),
        .Enable     (LFSR_EN),
        .OUT_Enable (OUT_EN),
        .OUT_LFSR_S (crc_out),
        .Valid      (valid_out),
        .LFSR       (LEDs)
    );

endmodule





