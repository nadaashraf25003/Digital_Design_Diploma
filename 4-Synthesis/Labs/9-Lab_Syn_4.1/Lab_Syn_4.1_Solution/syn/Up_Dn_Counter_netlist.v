/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Aug 20 20:57:59 2026
/////////////////////////////////////////////////////////////


module Up_Dn_Counter ( IN, Load, Up, Down, clk, Counter, High, Low );
  input [4:0] IN;
  output [4:0] Counter;
  input Load, Up, Down, clk;
  output High, Low;
  wire   N18, net26, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n34, n35, n36, n37,
         n38;

  SNPS_CLOCK_GATE_HIGH_Up_Dn_Counter clk_gate_Counter_reg ( .CLK(clk), .EN(N18), .ENCLK(net26) );
  DFFQX2M \Counter_reg[4]  ( .D(n34), .CK(net26), .Q(Counter[4]) );
  DFFQX2M \Counter_reg[3]  ( .D(n35), .CK(net26), .Q(Counter[3]) );
  DFFQX2M \Counter_reg[1]  ( .D(n37), .CK(net26), .Q(Counter[1]) );
  DFFQX2M \Counter_reg[2]  ( .D(n36), .CK(net26), .Q(Counter[2]) );
  DFFQX2M \Counter_reg[0]  ( .D(n38), .CK(net26), .Q(Counter[0]) );
  CLKMX2X2M U18 ( .A(n12), .B(IN[4]), .S0(Load), .Y(n34) );
  XOR3XLM U19 ( .A(Counter[4]), .B(n13), .C(n14), .Y(n12) );
  OAI2BB2X1M U20 ( .B0(n15), .B1(n16), .A0N(n17), .A1N(n13), .Y(n14) );
  CLKINVX1M U21 ( .A(Counter[3]), .Y(n16) );
  NOR2X1M U22 ( .A(n13), .B(n17), .Y(n15) );
  CLKMX2X2M U23 ( .A(n18), .B(IN[3]), .S0(Load), .Y(n35) );
  XOR3XLM U24 ( .A(Counter[3]), .B(n13), .C(n17), .Y(n18) );
  OAI2BB1X1M U25 ( .A0N(n19), .A1N(n13), .B0(n20), .Y(n17) );
  OAI21X1M U26 ( .A0(n13), .A1(n19), .B0(Counter[2]), .Y(n20) );
  CLKMX2X2M U27 ( .A(n21), .B(IN[2]), .S0(Load), .Y(n36) );
  XOR3XLM U28 ( .A(n13), .B(Counter[2]), .C(n19), .Y(n21) );
  OAI21X1M U29 ( .A0(n22), .A1(n23), .B0(n24), .Y(n19) );
  CLKMX2X2M U30 ( .A(n25), .B(IN[1]), .S0(Load), .Y(n37) );
  OAI21X1M U31 ( .A0(Counter[1]), .A1(n26), .B0(n27), .Y(n25) );
  MXI2X1M U32 ( .A(n28), .B(n29), .S0(n13), .Y(n27) );
  NOR2BX1M U33 ( .AN(Counter[1]), .B(Counter[0]), .Y(n28) );
  CLKXOR2X2M U34 ( .A(n23), .B(Counter[0]), .Y(n26) );
  MXI2X1M U35 ( .A(Counter[0]), .B(n30), .S0(Load), .Y(n38) );
  CLKINVX1M U36 ( .A(IN[0]), .Y(n30) );
  NAND3BX1M U37 ( .AN(Load), .B(n23), .C(n31), .Y(N18) );
  NAND3BX1M U38 ( .AN(High), .B(n32), .C(Up), .Y(n31) );
  AND4X1M U39 ( .A(Counter[4]), .B(Counter[3]), .C(Counter[2]), .D(n29), .Y(
        High) );
  CLKINVX1M U40 ( .A(n24), .Y(n29) );
  CLKNAND2X2M U41 ( .A(Counter[1]), .B(Counter[0]), .Y(n24) );
  CLKINVX1M U42 ( .A(n13), .Y(n23) );
  NOR2X1M U43 ( .A(n32), .B(Low), .Y(n13) );
  CLKINVX1M U44 ( .A(Down), .Y(n32) );
  NOR4BX1M U45 ( .AN(n22), .B(Counter[3]), .C(Counter[4]), .D(Counter[2]), .Y(
        Low) );
  NOR2X1M U46 ( .A(Counter[0]), .B(Counter[1]), .Y(n22) );
endmodule

