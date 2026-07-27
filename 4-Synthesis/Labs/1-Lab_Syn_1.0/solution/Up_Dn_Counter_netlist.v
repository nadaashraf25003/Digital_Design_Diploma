/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sat Jul 25 21:54:43 2026
/////////////////////////////////////////////////////////////


module Up_Dn_Counter ( IN, Load, Up, Down, clk, Counter, High, Low );
  input [4:0] IN;
  output [4:0] Counter;
  input Load, Up, Down, clk;
  output High, Low;
  wire   N18, N19, N20, N21, N22, N23, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33;

  EDFFHQX2M \Counter_reg[4]  ( .D(N23), .E(N18), .CK(clk), .Q(Counter[4]) );
  EDFFHQX2M \Counter_reg[3]  ( .D(N22), .E(N18), .CK(clk), .Q(Counter[3]) );
  EDFFHQX2M \Counter_reg[2]  ( .D(N21), .E(N18), .CK(clk), .Q(Counter[2]) );
  EDFFHQX2M \Counter_reg[1]  ( .D(N20), .E(N18), .CK(clk), .Q(Counter[1]) );
  EDFFHQX2M \Counter_reg[0]  ( .D(N19), .E(N18), .CK(clk), .Q(Counter[0]) );
  OAI2BB2X1M U18 ( .B0(n12), .B1(n13), .A0N(Load), .A1N(IN[4]), .Y(N23) );
  XOR3XLM U19 ( .A(n14), .B(n15), .C(n16), .Y(n13) );
  OAI2BB2X1M U20 ( .B0(n17), .B1(n18), .A0N(n19), .A1N(n15), .Y(n16) );
  NOR2X1M U21 ( .A(n15), .B(n19), .Y(n17) );
  OAI2BB2X1M U22 ( .B0(n12), .B1(n20), .A0N(IN[3]), .A1N(Load), .Y(N22) );
  XOR3XLM U23 ( .A(n18), .B(n15), .C(n19), .Y(n20) );
  OAI2BB1X1M U24 ( .A0N(n21), .A1N(n15), .B0(n22), .Y(n19) );
  OAI21X1M U25 ( .A0(n15), .A1(n21), .B0(Counter[2]), .Y(n22) );
  OAI2BB2X1M U26 ( .B0(n12), .B1(n23), .A0N(IN[2]), .A1N(Load), .Y(N21) );
  XOR3XLM U27 ( .A(n24), .B(n15), .C(n21), .Y(n23) );
  OAI21X1M U28 ( .A0(n25), .A1(n26), .B0(n27), .Y(n21) );
  OAI2BB2X1M U29 ( .B0(n28), .B1(n12), .A0N(IN[1]), .A1N(Load), .Y(N20) );
  AOI2B1X1M U30 ( .A1N(Counter[1]), .A0(n29), .B0(n30), .Y(n28) );
  MXI2X1M U31 ( .A(n27), .B(n31), .S0(n26), .Y(n30) );
  NAND2BX1M U32 ( .AN(Counter[0]), .B(Counter[1]), .Y(n31) );
  XNOR2X1M U33 ( .A(Counter[0]), .B(n26), .Y(n29) );
  OAI2BB2X1M U34 ( .B0(Counter[0]), .B1(n12), .A0N(IN[0]), .A1N(Load), .Y(N19)
         );
  NAND2BX1M U35 ( .AN(Load), .B(n12), .Y(N18) );
  AO21XLM U36 ( .A0(n26), .A1(n32), .B0(Load), .Y(n12) );
  NAND3BX1M U37 ( .AN(High), .B(n33), .C(Up), .Y(n32) );
  NOR4X1M U38 ( .A(n14), .B(n18), .C(n24), .D(n27), .Y(High) );
  CLKNAND2X2M U39 ( .A(Counter[1]), .B(Counter[0]), .Y(n27) );
  CLKINVX1M U40 ( .A(Counter[2]), .Y(n24) );
  CLKINVX1M U41 ( .A(Counter[3]), .Y(n18) );
  CLKINVX1M U42 ( .A(Counter[4]), .Y(n14) );
  CLKINVX1M U43 ( .A(n15), .Y(n26) );
  NOR2X1M U44 ( .A(n33), .B(Low), .Y(n15) );
  CLKINVX1M U45 ( .A(Down), .Y(n33) );
  NOR4BX1M U46 ( .AN(n25), .B(Counter[3]), .C(Counter[4]), .D(Counter[2]), .Y(
        Low) );
  NOR2X1M U47 ( .A(Counter[0]), .B(Counter[1]), .Y(n25) );
endmodule

