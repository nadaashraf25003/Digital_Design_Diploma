/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue Aug 11 23:43:18 2026
/////////////////////////////////////////////////////////////


module Decoder ( IN, OUT );
  input [1:0] IN;
  output [3:0] OUT;
  wire   n1, n2;

  NOR2X2M U1 ( .A(n2), .B(n1), .Y(OUT[3]) );
  NOR2X2M U2 ( .A(IN[1]), .B(n2), .Y(OUT[1]) );
  NOR2X2M U3 ( .A(IN[1]), .B(IN[0]), .Y(OUT[0]) );
  INVX2M U4 ( .A(IN[0]), .Y(n2) );
  INVX2M U5 ( .A(IN[1]), .Y(n1) );
  NOR2X2M U6 ( .A(IN[0]), .B(n1), .Y(OUT[2]) );
endmodule


module ARITHMETIC_UNIT_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0
 );
  input [15:0] a;
  input [15:0] b;
  output [15:0] quotient;
  output [15:0] remainder;
  output divide_by_0;
  wire   u_div_SumTmp_1__0_, u_div_SumTmp_1__1_, u_div_SumTmp_1__2_,
         u_div_SumTmp_1__3_, u_div_SumTmp_1__4_, u_div_SumTmp_1__5_,
         u_div_SumTmp_1__6_, u_div_SumTmp_1__7_, u_div_SumTmp_1__8_,
         u_div_SumTmp_1__9_, u_div_SumTmp_1__10_, u_div_SumTmp_1__11_,
         u_div_SumTmp_1__12_, u_div_SumTmp_1__13_, u_div_SumTmp_1__14_,
         u_div_SumTmp_2__0_, u_div_SumTmp_2__1_, u_div_SumTmp_2__2_,
         u_div_SumTmp_2__3_, u_div_SumTmp_2__4_, u_div_SumTmp_2__5_,
         u_div_SumTmp_2__6_, u_div_SumTmp_2__7_, u_div_SumTmp_2__8_,
         u_div_SumTmp_2__9_, u_div_SumTmp_2__10_, u_div_SumTmp_2__11_,
         u_div_SumTmp_2__12_, u_div_SumTmp_2__13_, u_div_SumTmp_3__0_,
         u_div_SumTmp_3__1_, u_div_SumTmp_3__2_, u_div_SumTmp_3__3_,
         u_div_SumTmp_3__4_, u_div_SumTmp_3__5_, u_div_SumTmp_3__6_,
         u_div_SumTmp_3__7_, u_div_SumTmp_3__8_, u_div_SumTmp_3__9_,
         u_div_SumTmp_3__10_, u_div_SumTmp_3__11_, u_div_SumTmp_3__12_,
         u_div_SumTmp_4__0_, u_div_SumTmp_4__1_, u_div_SumTmp_4__2_,
         u_div_SumTmp_4__3_, u_div_SumTmp_4__4_, u_div_SumTmp_4__5_,
         u_div_SumTmp_4__6_, u_div_SumTmp_4__7_, u_div_SumTmp_4__8_,
         u_div_SumTmp_4__9_, u_div_SumTmp_4__10_, u_div_SumTmp_4__11_,
         u_div_SumTmp_5__0_, u_div_SumTmp_5__1_, u_div_SumTmp_5__2_,
         u_div_SumTmp_5__3_, u_div_SumTmp_5__4_, u_div_SumTmp_5__5_,
         u_div_SumTmp_5__6_, u_div_SumTmp_5__7_, u_div_SumTmp_5__8_,
         u_div_SumTmp_5__9_, u_div_SumTmp_5__10_, u_div_SumTmp_6__0_,
         u_div_SumTmp_6__1_, u_div_SumTmp_6__2_, u_div_SumTmp_6__3_,
         u_div_SumTmp_6__4_, u_div_SumTmp_6__5_, u_div_SumTmp_6__6_,
         u_div_SumTmp_6__7_, u_div_SumTmp_6__8_, u_div_SumTmp_6__9_,
         u_div_SumTmp_7__0_, u_div_SumTmp_7__1_, u_div_SumTmp_7__2_,
         u_div_SumTmp_7__3_, u_div_SumTmp_7__4_, u_div_SumTmp_7__5_,
         u_div_SumTmp_7__6_, u_div_SumTmp_7__7_, u_div_SumTmp_7__8_,
         u_div_SumTmp_8__0_, u_div_SumTmp_8__1_, u_div_SumTmp_8__2_,
         u_div_SumTmp_8__3_, u_div_SumTmp_8__4_, u_div_SumTmp_8__5_,
         u_div_SumTmp_8__6_, u_div_SumTmp_8__7_, u_div_SumTmp_9__0_,
         u_div_SumTmp_9__1_, u_div_SumTmp_9__2_, u_div_SumTmp_9__3_,
         u_div_SumTmp_9__4_, u_div_SumTmp_9__5_, u_div_SumTmp_9__6_,
         u_div_SumTmp_10__0_, u_div_SumTmp_10__1_, u_div_SumTmp_10__2_,
         u_div_SumTmp_10__3_, u_div_SumTmp_10__4_, u_div_SumTmp_10__5_,
         u_div_SumTmp_11__0_, u_div_SumTmp_11__1_, u_div_SumTmp_11__2_,
         u_div_SumTmp_11__3_, u_div_SumTmp_11__4_, u_div_SumTmp_12__0_,
         u_div_SumTmp_12__1_, u_div_SumTmp_12__2_, u_div_SumTmp_12__3_,
         u_div_SumTmp_13__0_, u_div_SumTmp_13__1_, u_div_SumTmp_13__2_,
         u_div_SumTmp_14__0_, u_div_SumTmp_14__1_, u_div_SumTmp_15__0_,
         u_div_CryTmp_0__1_, u_div_CryTmp_0__2_, u_div_CryTmp_0__3_,
         u_div_CryTmp_0__4_, u_div_CryTmp_0__5_, u_div_CryTmp_0__6_,
         u_div_CryTmp_0__7_, u_div_CryTmp_0__8_, u_div_CryTmp_0__9_,
         u_div_CryTmp_0__10_, u_div_CryTmp_0__11_, u_div_CryTmp_0__12_,
         u_div_CryTmp_0__13_, u_div_CryTmp_0__14_, u_div_CryTmp_0__15_,
         u_div_CryTmp_1__1_, u_div_CryTmp_1__2_, u_div_CryTmp_1__3_,
         u_div_CryTmp_1__4_, u_div_CryTmp_1__5_, u_div_CryTmp_1__6_,
         u_div_CryTmp_1__7_, u_div_CryTmp_1__8_, u_div_CryTmp_1__9_,
         u_div_CryTmp_1__10_, u_div_CryTmp_1__11_, u_div_CryTmp_1__12_,
         u_div_CryTmp_1__13_, u_div_CryTmp_1__14_, u_div_CryTmp_1__15_,
         u_div_CryTmp_2__1_, u_div_CryTmp_2__2_, u_div_CryTmp_2__3_,
         u_div_CryTmp_2__4_, u_div_CryTmp_2__5_, u_div_CryTmp_2__6_,
         u_div_CryTmp_2__7_, u_div_CryTmp_2__8_, u_div_CryTmp_2__9_,
         u_div_CryTmp_2__10_, u_div_CryTmp_2__11_, u_div_CryTmp_2__12_,
         u_div_CryTmp_2__13_, u_div_CryTmp_2__14_, u_div_CryTmp_3__1_,
         u_div_CryTmp_3__2_, u_div_CryTmp_3__3_, u_div_CryTmp_3__4_,
         u_div_CryTmp_3__5_, u_div_CryTmp_3__6_, u_div_CryTmp_3__7_,
         u_div_CryTmp_3__8_, u_div_CryTmp_3__9_, u_div_CryTmp_3__10_,
         u_div_CryTmp_3__11_, u_div_CryTmp_3__12_, u_div_CryTmp_3__13_,
         u_div_CryTmp_4__1_, u_div_CryTmp_4__2_, u_div_CryTmp_4__3_,
         u_div_CryTmp_4__4_, u_div_CryTmp_4__5_, u_div_CryTmp_4__6_,
         u_div_CryTmp_4__7_, u_div_CryTmp_4__8_, u_div_CryTmp_4__9_,
         u_div_CryTmp_4__10_, u_div_CryTmp_4__11_, u_div_CryTmp_4__12_,
         u_div_CryTmp_5__1_, u_div_CryTmp_5__2_, u_div_CryTmp_5__3_,
         u_div_CryTmp_5__4_, u_div_CryTmp_5__5_, u_div_CryTmp_5__6_,
         u_div_CryTmp_5__7_, u_div_CryTmp_5__8_, u_div_CryTmp_5__9_,
         u_div_CryTmp_5__10_, u_div_CryTmp_5__11_, u_div_CryTmp_6__1_,
         u_div_CryTmp_6__2_, u_div_CryTmp_6__3_, u_div_CryTmp_6__4_,
         u_div_CryTmp_6__5_, u_div_CryTmp_6__6_, u_div_CryTmp_6__7_,
         u_div_CryTmp_6__8_, u_div_CryTmp_6__9_, u_div_CryTmp_6__10_,
         u_div_CryTmp_7__1_, u_div_CryTmp_7__2_, u_div_CryTmp_7__3_,
         u_div_CryTmp_7__4_, u_div_CryTmp_7__5_, u_div_CryTmp_7__6_,
         u_div_CryTmp_7__7_, u_div_CryTmp_7__8_, u_div_CryTmp_7__9_,
         u_div_CryTmp_8__1_, u_div_CryTmp_8__2_, u_div_CryTmp_8__3_,
         u_div_CryTmp_8__4_, u_div_CryTmp_8__5_, u_div_CryTmp_8__6_,
         u_div_CryTmp_8__7_, u_div_CryTmp_8__8_, u_div_CryTmp_9__1_,
         u_div_CryTmp_9__2_, u_div_CryTmp_9__3_, u_div_CryTmp_9__4_,
         u_div_CryTmp_9__5_, u_div_CryTmp_9__6_, u_div_CryTmp_9__7_,
         u_div_CryTmp_10__1_, u_div_CryTmp_10__2_, u_div_CryTmp_10__3_,
         u_div_CryTmp_10__4_, u_div_CryTmp_10__5_, u_div_CryTmp_10__6_,
         u_div_CryTmp_11__1_, u_div_CryTmp_11__2_, u_div_CryTmp_11__3_,
         u_div_CryTmp_11__4_, u_div_CryTmp_11__5_, u_div_CryTmp_12__1_,
         u_div_CryTmp_12__2_, u_div_CryTmp_12__3_, u_div_CryTmp_12__4_,
         u_div_CryTmp_13__1_, u_div_CryTmp_13__2_, u_div_CryTmp_13__3_,
         u_div_CryTmp_14__1_, u_div_CryTmp_14__2_, u_div_CryTmp_15__1_,
         u_div_PartRem_1__1_, u_div_PartRem_1__2_, u_div_PartRem_1__3_,
         u_div_PartRem_1__4_, u_div_PartRem_1__5_, u_div_PartRem_1__6_,
         u_div_PartRem_1__7_, u_div_PartRem_1__8_, u_div_PartRem_1__9_,
         u_div_PartRem_1__10_, u_div_PartRem_1__11_, u_div_PartRem_1__12_,
         u_div_PartRem_1__13_, u_div_PartRem_1__14_, u_div_PartRem_1__15_,
         u_div_PartRem_2__1_, u_div_PartRem_2__2_, u_div_PartRem_2__3_,
         u_div_PartRem_2__4_, u_div_PartRem_2__5_, u_div_PartRem_2__6_,
         u_div_PartRem_2__7_, u_div_PartRem_2__8_, u_div_PartRem_2__9_,
         u_div_PartRem_2__10_, u_div_PartRem_2__11_, u_div_PartRem_2__12_,
         u_div_PartRem_2__13_, u_div_PartRem_2__14_, u_div_PartRem_3__1_,
         u_div_PartRem_3__2_, u_div_PartRem_3__3_, u_div_PartRem_3__4_,
         u_div_PartRem_3__5_, u_div_PartRem_3__6_, u_div_PartRem_3__7_,
         u_div_PartRem_3__8_, u_div_PartRem_3__9_, u_div_PartRem_3__10_,
         u_div_PartRem_3__11_, u_div_PartRem_3__12_, u_div_PartRem_3__13_,
         u_div_PartRem_4__1_, u_div_PartRem_4__2_, u_div_PartRem_4__3_,
         u_div_PartRem_4__4_, u_div_PartRem_4__5_, u_div_PartRem_4__6_,
         u_div_PartRem_4__7_, u_div_PartRem_4__8_, u_div_PartRem_4__9_,
         u_div_PartRem_4__10_, u_div_PartRem_4__11_, u_div_PartRem_4__12_,
         u_div_PartRem_5__1_, u_div_PartRem_5__2_, u_div_PartRem_5__3_,
         u_div_PartRem_5__4_, u_div_PartRem_5__5_, u_div_PartRem_5__6_,
         u_div_PartRem_5__7_, u_div_PartRem_5__8_, u_div_PartRem_5__9_,
         u_div_PartRem_5__10_, u_div_PartRem_5__11_, u_div_PartRem_6__1_,
         u_div_PartRem_6__2_, u_div_PartRem_6__3_, u_div_PartRem_6__4_,
         u_div_PartRem_6__5_, u_div_PartRem_6__6_, u_div_PartRem_6__7_,
         u_div_PartRem_6__8_, u_div_PartRem_6__9_, u_div_PartRem_6__10_,
         u_div_PartRem_7__1_, u_div_PartRem_7__2_, u_div_PartRem_7__3_,
         u_div_PartRem_7__4_, u_div_PartRem_7__5_, u_div_PartRem_7__6_,
         u_div_PartRem_7__7_, u_div_PartRem_7__8_, u_div_PartRem_7__9_,
         u_div_PartRem_8__1_, u_div_PartRem_8__2_, u_div_PartRem_8__3_,
         u_div_PartRem_8__4_, u_div_PartRem_8__5_, u_div_PartRem_8__6_,
         u_div_PartRem_8__7_, u_div_PartRem_8__8_, u_div_PartRem_9__1_,
         u_div_PartRem_9__2_, u_div_PartRem_9__3_, u_div_PartRem_9__4_,
         u_div_PartRem_9__5_, u_div_PartRem_9__6_, u_div_PartRem_9__7_,
         u_div_PartRem_10__1_, u_div_PartRem_10__2_, u_div_PartRem_10__3_,
         u_div_PartRem_10__4_, u_div_PartRem_10__5_, u_div_PartRem_10__6_,
         u_div_PartRem_11__1_, u_div_PartRem_11__2_, u_div_PartRem_11__3_,
         u_div_PartRem_11__4_, u_div_PartRem_11__5_, u_div_PartRem_12__1_,
         u_div_PartRem_12__2_, u_div_PartRem_12__3_, u_div_PartRem_12__4_,
         u_div_PartRem_13__1_, u_div_PartRem_13__2_, u_div_PartRem_13__3_,
         u_div_PartRem_14__1_, u_div_PartRem_14__2_, u_div_PartRem_15__1_, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56;

  ADDFX2M u_div_u_fa_PartRem_0_14_1 ( .A(u_div_PartRem_15__1_), .B(n29), .CI(
        u_div_CryTmp_14__1_), .CO(u_div_CryTmp_14__2_), .S(u_div_SumTmp_14__1_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_1 ( .A(u_div_PartRem_1__1_), .B(n30), .CI(
        u_div_CryTmp_0__1_), .CO(u_div_CryTmp_0__2_) );
  ADDFX2M u_div_u_fa_PartRem_0_1_1 ( .A(u_div_PartRem_2__1_), .B(n30), .CI(
        u_div_CryTmp_1__1_), .CO(u_div_CryTmp_1__2_), .S(u_div_SumTmp_1__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_1 ( .A(u_div_PartRem_3__1_), .B(n30), .CI(
        u_div_CryTmp_2__1_), .CO(u_div_CryTmp_2__2_), .S(u_div_SumTmp_2__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_1 ( .A(u_div_PartRem_4__1_), .B(n30), .CI(
        u_div_CryTmp_3__1_), .CO(u_div_CryTmp_3__2_), .S(u_div_SumTmp_3__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_1 ( .A(u_div_PartRem_5__1_), .B(n30), .CI(
        u_div_CryTmp_4__1_), .CO(u_div_CryTmp_4__2_), .S(u_div_SumTmp_4__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_5_1 ( .A(u_div_PartRem_6__1_), .B(n30), .CI(
        u_div_CryTmp_5__1_), .CO(u_div_CryTmp_5__2_), .S(u_div_SumTmp_5__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_6_1 ( .A(u_div_PartRem_7__1_), .B(n30), .CI(
        u_div_CryTmp_6__1_), .CO(u_div_CryTmp_6__2_), .S(u_div_SumTmp_6__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_7_1 ( .A(u_div_PartRem_8__1_), .B(n29), .CI(
        u_div_CryTmp_7__1_), .CO(u_div_CryTmp_7__2_), .S(u_div_SumTmp_7__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_8_1 ( .A(u_div_PartRem_9__1_), .B(n29), .CI(
        u_div_CryTmp_8__1_), .CO(u_div_CryTmp_8__2_), .S(u_div_SumTmp_8__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_9_1 ( .A(u_div_PartRem_10__1_), .B(n29), .CI(
        u_div_CryTmp_9__1_), .CO(u_div_CryTmp_9__2_), .S(u_div_SumTmp_9__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_10_1 ( .A(u_div_PartRem_11__1_), .B(n29), .CI(
        u_div_CryTmp_10__1_), .CO(u_div_CryTmp_10__2_), .S(u_div_SumTmp_10__1_) );
  ADDFX2M u_div_u_fa_PartRem_0_11_1 ( .A(u_div_PartRem_12__1_), .B(n29), .CI(
        u_div_CryTmp_11__1_), .CO(u_div_CryTmp_11__2_), .S(u_div_SumTmp_11__1_) );
  ADDFX2M u_div_u_fa_PartRem_0_12_1 ( .A(u_div_PartRem_13__1_), .B(n29), .CI(
        u_div_CryTmp_12__1_), .CO(u_div_CryTmp_12__2_), .S(u_div_SumTmp_12__1_) );
  ADDFX2M u_div_u_fa_PartRem_0_13_1 ( .A(u_div_PartRem_14__1_), .B(n29), .CI(
        u_div_CryTmp_13__1_), .CO(u_div_CryTmp_13__2_), .S(u_div_SumTmp_13__1_) );
  ADDFX2M u_div_u_fa_PartRem_0_10_5 ( .A(u_div_PartRem_11__5_), .B(n43), .CI(
        u_div_CryTmp_10__5_), .CO(u_div_CryTmp_10__6_), .S(u_div_SumTmp_10__5_) );
  ADDFX2M u_div_u_fa_PartRem_0_11_4 ( .A(u_div_PartRem_12__4_), .B(n44), .CI(
        u_div_CryTmp_11__4_), .CO(u_div_CryTmp_11__5_), .S(u_div_SumTmp_11__4_) );
  ADDFX2M u_div_u_fa_PartRem_0_13_2 ( .A(u_div_PartRem_14__2_), .B(n27), .CI(
        u_div_CryTmp_13__2_), .CO(u_div_CryTmp_13__3_), .S(u_div_SumTmp_13__2_) );
  ADDFX2M u_div_u_fa_PartRem_0_9_6 ( .A(u_div_PartRem_10__6_), .B(n42), .CI(
        u_div_CryTmp_9__6_), .CO(u_div_CryTmp_9__7_), .S(u_div_SumTmp_9__6_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_12_3 ( .A(u_div_PartRem_13__3_), .B(n45), .CI(
        u_div_CryTmp_12__3_), .CO(u_div_CryTmp_12__4_), .S(u_div_SumTmp_12__3_) );
  ADDFX2M u_div_u_fa_PartRem_0_3_12 ( .A(u_div_PartRem_4__12_), .B(n36), .CI(
        u_div_CryTmp_3__12_), .CO(u_div_CryTmp_3__13_), .S(u_div_SumTmp_3__12_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_14 ( .A(u_div_PartRem_1__14_), .B(n34), .CI(
        u_div_CryTmp_0__14_), .CO(u_div_CryTmp_0__15_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_15 ( .A(u_div_PartRem_1__15_), .B(n33), .CI(
        u_div_CryTmp_0__15_), .CO(quotient[0]) );
  ADDFX2M u_div_u_fa_PartRem_0_2_13 ( .A(u_div_PartRem_3__13_), .B(n35), .CI(
        u_div_CryTmp_2__13_), .CO(u_div_CryTmp_2__14_), .S(u_div_SumTmp_2__13_) );
  ADDFX2M u_div_u_fa_PartRem_0_1_14 ( .A(u_div_PartRem_2__14_), .B(n34), .CI(
        u_div_CryTmp_1__14_), .CO(u_div_CryTmp_1__15_), .S(u_div_SumTmp_1__14_) );
  ADDFX2M u_div_u_fa_PartRem_0_4_11 ( .A(u_div_PartRem_5__11_), .B(n37), .CI(
        u_div_CryTmp_4__11_), .CO(u_div_CryTmp_4__12_), .S(u_div_SumTmp_4__11_) );
  ADDFX2M u_div_u_fa_PartRem_0_5_10 ( .A(u_div_PartRem_6__10_), .B(n38), .CI(
        u_div_CryTmp_5__10_), .CO(u_div_CryTmp_5__11_), .S(u_div_SumTmp_5__10_) );
  ADDFX2M u_div_u_fa_PartRem_0_7_8 ( .A(u_div_PartRem_8__8_), .B(n40), .CI(
        u_div_CryTmp_7__8_), .CO(u_div_CryTmp_7__9_), .S(u_div_SumTmp_7__8_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_8_7 ( .A(u_div_PartRem_9__7_), .B(n41), .CI(
        u_div_CryTmp_8__7_), .CO(u_div_CryTmp_8__8_), .S(u_div_SumTmp_8__7_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_6_9 ( .A(u_div_PartRem_7__9_), .B(n39), .CI(
        u_div_CryTmp_6__9_), .CO(u_div_CryTmp_6__10_), .S(u_div_SumTmp_6__9_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_0_12 ( .A(u_div_PartRem_1__12_), .B(n36), .CI(
        u_div_CryTmp_0__12_), .CO(u_div_CryTmp_0__13_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_13 ( .A(u_div_PartRem_1__13_), .B(n35), .CI(
        u_div_CryTmp_0__13_), .CO(u_div_CryTmp_0__14_) );
  ADDFX2M u_div_u_fa_PartRem_0_1_13 ( .A(u_div_PartRem_2__13_), .B(n35), .CI(
        u_div_CryTmp_1__13_), .CO(u_div_CryTmp_1__14_), .S(u_div_SumTmp_1__13_) );
  ADDFX2M u_div_u_fa_PartRem_0_1_12 ( .A(u_div_PartRem_2__12_), .B(n36), .CI(
        u_div_CryTmp_1__12_), .CO(u_div_CryTmp_1__13_), .S(u_div_SumTmp_1__12_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_10 ( .A(u_div_PartRem_1__10_), .B(n38), .CI(
        u_div_CryTmp_0__10_), .CO(u_div_CryTmp_0__11_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_11 ( .A(u_div_PartRem_1__11_), .B(n37), .CI(
        u_div_CryTmp_0__11_), .CO(u_div_CryTmp_0__12_) );
  ADDFX2M u_div_u_fa_PartRem_0_2_12 ( .A(u_div_PartRem_3__12_), .B(n36), .CI(
        u_div_CryTmp_2__12_), .CO(u_div_CryTmp_2__13_), .S(u_div_SumTmp_2__12_) );
  ADDFX2M u_div_u_fa_PartRem_0_1_11 ( .A(u_div_PartRem_2__11_), .B(n37), .CI(
        u_div_CryTmp_1__11_), .CO(u_div_CryTmp_1__12_), .S(u_div_SumTmp_1__11_) );
  ADDFX2M u_div_u_fa_PartRem_0_2_11 ( .A(u_div_PartRem_3__11_), .B(n37), .CI(
        u_div_CryTmp_2__11_), .CO(u_div_CryTmp_2__12_), .S(u_div_SumTmp_2__11_) );
  ADDFX2M u_div_u_fa_PartRem_0_1_10 ( .A(u_div_PartRem_2__10_), .B(n38), .CI(
        u_div_CryTmp_1__10_), .CO(u_div_CryTmp_1__11_), .S(u_div_SumTmp_1__10_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_8 ( .A(u_div_PartRem_1__8_), .B(n40), .CI(
        u_div_CryTmp_0__8_), .CO(u_div_CryTmp_0__9_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_9 ( .A(u_div_PartRem_1__9_), .B(n39), .CI(
        u_div_CryTmp_0__9_), .CO(u_div_CryTmp_0__10_) );
  ADDFX2M u_div_u_fa_PartRem_0_3_11 ( .A(u_div_PartRem_4__11_), .B(n37), .CI(
        u_div_CryTmp_3__11_), .CO(u_div_CryTmp_3__12_), .S(u_div_SumTmp_3__11_) );
  ADDFX2M u_div_u_fa_PartRem_0_2_10 ( .A(u_div_PartRem_3__10_), .B(n38), .CI(
        u_div_CryTmp_2__10_), .CO(u_div_CryTmp_2__11_), .S(u_div_SumTmp_2__10_) );
  ADDFX2M u_div_u_fa_PartRem_0_1_9 ( .A(u_div_PartRem_2__9_), .B(n39), .CI(
        u_div_CryTmp_1__9_), .CO(u_div_CryTmp_1__10_), .S(u_div_SumTmp_1__9_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_10 ( .A(u_div_PartRem_4__10_), .B(n38), .CI(
        u_div_CryTmp_3__10_), .CO(u_div_CryTmp_3__11_), .S(u_div_SumTmp_3__10_) );
  ADDFX2M u_div_u_fa_PartRem_0_2_9 ( .A(u_div_PartRem_3__9_), .B(n39), .CI(
        u_div_CryTmp_2__9_), .CO(u_div_CryTmp_2__10_), .S(u_div_SumTmp_2__9_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_8 ( .A(u_div_PartRem_2__8_), .B(n40), .CI(
        u_div_CryTmp_1__8_), .CO(u_div_CryTmp_1__9_), .S(u_div_SumTmp_1__8_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_0_6 ( .A(u_div_PartRem_1__6_), .B(n42), .CI(
        u_div_CryTmp_0__6_), .CO(u_div_CryTmp_0__7_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_7 ( .A(u_div_PartRem_1__7_), .B(n41), .CI(
        u_div_CryTmp_0__7_), .CO(u_div_CryTmp_0__8_) );
  ADDFX2M u_div_u_fa_PartRem_0_4_10 ( .A(u_div_PartRem_5__10_), .B(n38), .CI(
        u_div_CryTmp_4__10_), .CO(u_div_CryTmp_4__11_), .S(u_div_SumTmp_4__10_) );
  ADDFX2M u_div_u_fa_PartRem_0_3_9 ( .A(u_div_PartRem_4__9_), .B(n39), .CI(
        u_div_CryTmp_3__9_), .CO(u_div_CryTmp_3__10_), .S(u_div_SumTmp_3__9_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_8 ( .A(u_div_PartRem_3__8_), .B(n40), .CI(
        u_div_CryTmp_2__8_), .CO(u_div_CryTmp_2__9_), .S(u_div_SumTmp_2__8_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_7 ( .A(u_div_PartRem_2__7_), .B(n41), .CI(
        u_div_CryTmp_1__7_), .CO(u_div_CryTmp_1__8_), .S(u_div_SumTmp_1__7_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_9 ( .A(u_div_PartRem_5__9_), .B(n39), .CI(
        u_div_CryTmp_4__9_), .CO(u_div_CryTmp_4__10_), .S(u_div_SumTmp_4__9_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_8 ( .A(u_div_PartRem_4__8_), .B(n40), .CI(
        u_div_CryTmp_3__8_), .CO(u_div_CryTmp_3__9_), .S(u_div_SumTmp_3__8_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_7 ( .A(u_div_PartRem_3__7_), .B(n41), .CI(
        u_div_CryTmp_2__7_), .CO(u_div_CryTmp_2__8_), .S(u_div_SumTmp_2__7_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_6 ( .A(u_div_PartRem_2__6_), .B(n42), .CI(
        u_div_CryTmp_1__6_), .CO(u_div_CryTmp_1__7_), .S(u_div_SumTmp_1__6_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_0_4 ( .A(u_div_PartRem_1__4_), .B(n44), .CI(
        u_div_CryTmp_0__4_), .CO(u_div_CryTmp_0__5_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_5 ( .A(u_div_PartRem_1__5_), .B(n43), .CI(
        u_div_CryTmp_0__5_), .CO(u_div_CryTmp_0__6_) );
  ADDFX2M u_div_u_fa_PartRem_0_5_9 ( .A(u_div_PartRem_6__9_), .B(n39), .CI(
        u_div_CryTmp_5__9_), .CO(u_div_CryTmp_5__10_), .S(u_div_SumTmp_5__9_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_8 ( .A(u_div_PartRem_5__8_), .B(n40), .CI(
        u_div_CryTmp_4__8_), .CO(u_div_CryTmp_4__9_), .S(u_div_SumTmp_4__8_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_7 ( .A(u_div_PartRem_4__7_), .B(n41), .CI(
        u_div_CryTmp_3__7_), .CO(u_div_CryTmp_3__8_), .S(u_div_SumTmp_3__7_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_6 ( .A(u_div_PartRem_3__6_), .B(n42), .CI(
        u_div_CryTmp_2__6_), .CO(u_div_CryTmp_2__7_), .S(u_div_SumTmp_2__6_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_5 ( .A(u_div_PartRem_2__5_), .B(n43), .CI(
        u_div_CryTmp_1__5_), .CO(u_div_CryTmp_1__6_), .S(u_div_SumTmp_1__5_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_5_8 ( .A(u_div_PartRem_6__8_), .B(n40), .CI(
        u_div_CryTmp_5__8_), .CO(u_div_CryTmp_5__9_), .S(u_div_SumTmp_5__8_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_7 ( .A(u_div_PartRem_5__7_), .B(n41), .CI(
        u_div_CryTmp_4__7_), .CO(u_div_CryTmp_4__8_), .S(u_div_SumTmp_4__7_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_6 ( .A(u_div_PartRem_4__6_), .B(n42), .CI(
        u_div_CryTmp_3__6_), .CO(u_div_CryTmp_3__7_), .S(u_div_SumTmp_3__6_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_5 ( .A(u_div_PartRem_3__5_), .B(n43), .CI(
        u_div_CryTmp_2__5_), .CO(u_div_CryTmp_2__6_), .S(u_div_SumTmp_2__5_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_4 ( .A(u_div_PartRem_2__4_), .B(n44), .CI(
        u_div_CryTmp_1__4_), .CO(u_div_CryTmp_1__5_), .S(u_div_SumTmp_1__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_0_2 ( .A(u_div_PartRem_1__2_), .B(n28), .CI(
        u_div_CryTmp_0__2_), .CO(u_div_CryTmp_0__3_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_3 ( .A(u_div_PartRem_1__3_), .B(n45), .CI(
        u_div_CryTmp_0__3_), .CO(u_div_CryTmp_0__4_) );
  ADDFX2M u_div_u_fa_PartRem_0_6_8 ( .A(u_div_PartRem_7__8_), .B(n40), .CI(
        u_div_CryTmp_6__8_), .CO(u_div_CryTmp_6__9_), .S(u_div_SumTmp_6__8_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_5_7 ( .A(u_div_PartRem_6__7_), .B(n41), .CI(
        u_div_CryTmp_5__7_), .CO(u_div_CryTmp_5__8_), .S(u_div_SumTmp_5__7_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_6 ( .A(u_div_PartRem_5__6_), .B(n42), .CI(
        u_div_CryTmp_4__6_), .CO(u_div_CryTmp_4__7_), .S(u_div_SumTmp_4__6_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_5 ( .A(u_div_PartRem_4__5_), .B(n43), .CI(
        u_div_CryTmp_3__5_), .CO(u_div_CryTmp_3__6_), .S(u_div_SumTmp_3__5_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_4 ( .A(u_div_PartRem_3__4_), .B(n44), .CI(
        u_div_CryTmp_2__4_), .CO(u_div_CryTmp_2__5_), .S(u_div_SumTmp_2__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_3 ( .A(u_div_PartRem_2__3_), .B(n45), .CI(
        u_div_CryTmp_1__3_), .CO(u_div_CryTmp_1__4_), .S(u_div_SumTmp_1__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_6_7 ( .A(u_div_PartRem_7__7_), .B(n41), .CI(
        u_div_CryTmp_6__7_), .CO(u_div_CryTmp_6__8_), .S(u_div_SumTmp_6__7_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_5_6 ( .A(u_div_PartRem_6__6_), .B(n42), .CI(
        u_div_CryTmp_5__6_), .CO(u_div_CryTmp_5__7_), .S(u_div_SumTmp_5__6_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_5 ( .A(u_div_PartRem_5__5_), .B(n43), .CI(
        u_div_CryTmp_4__5_), .CO(u_div_CryTmp_4__6_), .S(u_div_SumTmp_4__5_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_4 ( .A(u_div_PartRem_4__4_), .B(n44), .CI(
        u_div_CryTmp_3__4_), .CO(u_div_CryTmp_3__5_), .S(u_div_SumTmp_3__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_3 ( .A(u_div_PartRem_3__3_), .B(n45), .CI(
        u_div_CryTmp_2__3_), .CO(u_div_CryTmp_2__4_), .S(u_div_SumTmp_2__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_2 ( .A(u_div_PartRem_2__2_), .B(n28), .CI(
        u_div_CryTmp_1__2_), .CO(u_div_CryTmp_1__3_), .S(u_div_SumTmp_1__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_7_7 ( .A(u_div_PartRem_8__7_), .B(n41), .CI(
        u_div_CryTmp_7__7_), .CO(u_div_CryTmp_7__8_), .S(u_div_SumTmp_7__7_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_6_6 ( .A(u_div_PartRem_7__6_), .B(n42), .CI(
        u_div_CryTmp_6__6_), .CO(u_div_CryTmp_6__7_), .S(u_div_SumTmp_6__6_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_5_5 ( .A(u_div_PartRem_6__5_), .B(n43), .CI(
        u_div_CryTmp_5__5_), .CO(u_div_CryTmp_5__6_), .S(u_div_SumTmp_5__5_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_4 ( .A(u_div_PartRem_5__4_), .B(n44), .CI(
        u_div_CryTmp_4__4_), .CO(u_div_CryTmp_4__5_), .S(u_div_SumTmp_4__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_3 ( .A(u_div_PartRem_4__3_), .B(n45), .CI(
        u_div_CryTmp_3__3_), .CO(u_div_CryTmp_3__4_), .S(u_div_SumTmp_3__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_2 ( .A(u_div_PartRem_3__2_), .B(n28), .CI(
        u_div_CryTmp_2__2_), .CO(u_div_CryTmp_2__3_), .S(u_div_SumTmp_2__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_7_6 ( .A(u_div_PartRem_8__6_), .B(n42), .CI(
        u_div_CryTmp_7__6_), .CO(u_div_CryTmp_7__7_), .S(u_div_SumTmp_7__6_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_6_5 ( .A(u_div_PartRem_7__5_), .B(n43), .CI(
        u_div_CryTmp_6__5_), .CO(u_div_CryTmp_6__6_), .S(u_div_SumTmp_6__5_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_5_4 ( .A(u_div_PartRem_6__4_), .B(n44), .CI(
        u_div_CryTmp_5__4_), .CO(u_div_CryTmp_5__5_), .S(u_div_SumTmp_5__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_3 ( .A(u_div_PartRem_5__3_), .B(n45), .CI(
        u_div_CryTmp_4__3_), .CO(u_div_CryTmp_4__4_), .S(u_div_SumTmp_4__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_2 ( .A(u_div_PartRem_4__2_), .B(n28), .CI(
        u_div_CryTmp_3__2_), .CO(u_div_CryTmp_3__3_), .S(u_div_SumTmp_3__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_8_6 ( .A(u_div_PartRem_9__6_), .B(n42), .CI(
        u_div_CryTmp_8__6_), .CO(u_div_CryTmp_8__7_), .S(u_div_SumTmp_8__6_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_7_5 ( .A(u_div_PartRem_8__5_), .B(n43), .CI(
        u_div_CryTmp_7__5_), .CO(u_div_CryTmp_7__6_), .S(u_div_SumTmp_7__5_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_6_4 ( .A(u_div_PartRem_7__4_), .B(n44), .CI(
        u_div_CryTmp_6__4_), .CO(u_div_CryTmp_6__5_), .S(u_div_SumTmp_6__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_5_3 ( .A(u_div_PartRem_6__3_), .B(n45), .CI(
        u_div_CryTmp_5__3_), .CO(u_div_CryTmp_5__4_), .S(u_div_SumTmp_5__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_2 ( .A(u_div_PartRem_5__2_), .B(n28), .CI(
        u_div_CryTmp_4__2_), .CO(u_div_CryTmp_4__3_), .S(u_div_SumTmp_4__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_8_5 ( .A(u_div_PartRem_9__5_), .B(n43), .CI(
        u_div_CryTmp_8__5_), .CO(u_div_CryTmp_8__6_), .S(u_div_SumTmp_8__5_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_7_4 ( .A(u_div_PartRem_8__4_), .B(n44), .CI(
        u_div_CryTmp_7__4_), .CO(u_div_CryTmp_7__5_), .S(u_div_SumTmp_7__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_6_3 ( .A(u_div_PartRem_7__3_), .B(n45), .CI(
        u_div_CryTmp_6__3_), .CO(u_div_CryTmp_6__4_), .S(u_div_SumTmp_6__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_5_2 ( .A(u_div_PartRem_6__2_), .B(n28), .CI(
        u_div_CryTmp_5__2_), .CO(u_div_CryTmp_5__3_), .S(u_div_SumTmp_5__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_9_5 ( .A(u_div_PartRem_10__5_), .B(n43), .CI(
        u_div_CryTmp_9__5_), .CO(u_div_CryTmp_9__6_), .S(u_div_SumTmp_9__5_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_8_4 ( .A(u_div_PartRem_9__4_), .B(n44), .CI(
        u_div_CryTmp_8__4_), .CO(u_div_CryTmp_8__5_), .S(u_div_SumTmp_8__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_7_3 ( .A(u_div_PartRem_8__3_), .B(n45), .CI(
        u_div_CryTmp_7__3_), .CO(u_div_CryTmp_7__4_), .S(u_div_SumTmp_7__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_6_2 ( .A(u_div_PartRem_7__2_), .B(n28), .CI(
        u_div_CryTmp_6__2_), .CO(u_div_CryTmp_6__3_), .S(u_div_SumTmp_6__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_9_4 ( .A(u_div_PartRem_10__4_), .B(n44), .CI(
        u_div_CryTmp_9__4_), .CO(u_div_CryTmp_9__5_), .S(u_div_SumTmp_9__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_8_3 ( .A(u_div_PartRem_9__3_), .B(n45), .CI(
        u_div_CryTmp_8__3_), .CO(u_div_CryTmp_8__4_), .S(u_div_SumTmp_8__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_7_2 ( .A(u_div_PartRem_8__2_), .B(n27), .CI(
        u_div_CryTmp_7__2_), .CO(u_div_CryTmp_7__3_), .S(u_div_SumTmp_7__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_10_4 ( .A(u_div_PartRem_11__4_), .B(n44), .CI(
        u_div_CryTmp_10__4_), .CO(u_div_CryTmp_10__5_), .S(u_div_SumTmp_10__4_) );
  ADDFX2M u_div_u_fa_PartRem_0_9_3 ( .A(u_div_PartRem_10__3_), .B(n45), .CI(
        u_div_CryTmp_9__3_), .CO(u_div_CryTmp_9__4_), .S(u_div_SumTmp_9__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_8_2 ( .A(u_div_PartRem_9__2_), .B(n27), .CI(
        u_div_CryTmp_8__2_), .CO(u_div_CryTmp_8__3_), .S(u_div_SumTmp_8__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_10_3 ( .A(u_div_PartRem_11__3_), .B(n45), .CI(
        u_div_CryTmp_10__3_), .CO(u_div_CryTmp_10__4_), .S(u_div_SumTmp_10__3_) );
  ADDFX2M u_div_u_fa_PartRem_0_9_2 ( .A(u_div_PartRem_10__2_), .B(n27), .CI(
        u_div_CryTmp_9__2_), .CO(u_div_CryTmp_9__3_), .S(u_div_SumTmp_9__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_11_3 ( .A(u_div_PartRem_12__3_), .B(n45), .CI(
        u_div_CryTmp_11__3_), .CO(u_div_CryTmp_11__4_), .S(u_div_SumTmp_11__3_) );
  ADDFX2M u_div_u_fa_PartRem_0_10_2 ( .A(u_div_PartRem_11__2_), .B(n27), .CI(
        u_div_CryTmp_10__2_), .CO(u_div_CryTmp_10__3_), .S(u_div_SumTmp_10__2_) );
  ADDFX2M u_div_u_fa_PartRem_0_11_2 ( .A(u_div_PartRem_12__2_), .B(n27), .CI(
        u_div_CryTmp_11__2_), .CO(u_div_CryTmp_11__3_), .S(u_div_SumTmp_11__2_) );
  ADDFX2M u_div_u_fa_PartRem_0_12_2 ( .A(u_div_PartRem_13__2_), .B(n27), .CI(
        u_div_CryTmp_12__2_), .CO(u_div_CryTmp_12__3_), .S(u_div_SumTmp_12__2_) );
  INVX2M U1 ( .A(b[6]), .Y(n42) );
  AND2X2M U2 ( .A(u_div_CryTmp_4__12_), .B(n52), .Y(quotient[4]) );
  AND2X2M U3 ( .A(u_div_CryTmp_5__11_), .B(n51), .Y(quotient[5]) );
  AND2X2M U4 ( .A(u_div_CryTmp_7__9_), .B(n50), .Y(quotient[7]) );
  AND2X2M U5 ( .A(u_div_CryTmp_8__8_), .B(n49), .Y(quotient[8]) );
  AND3X2M U6 ( .A(n53), .B(n35), .C(u_div_CryTmp_3__13_), .Y(quotient[3]) );
  AND2X2M U7 ( .A(u_div_CryTmp_2__14_), .B(n53), .Y(quotient[2]) );
  AND3X2M U8 ( .A(n51), .B(n38), .C(u_div_CryTmp_6__10_), .Y(quotient[6]) );
  AND2X2M U9 ( .A(u_div_CryTmp_1__15_), .B(n33), .Y(quotient[1]) );
  BUFX2M U10 ( .A(n48), .Y(n31) );
  BUFX2M U11 ( .A(n46), .Y(n28) );
  BUFX2M U12 ( .A(n47), .Y(n30) );
  BUFX2M U13 ( .A(n47), .Y(n29) );
  BUFX2M U14 ( .A(n46), .Y(n27) );
  BUFX2M U15 ( .A(n48), .Y(n32) );
  XNOR2X2M U16 ( .A(n31), .B(a[15]), .Y(u_div_SumTmp_15__0_) );
  XNOR2X2M U17 ( .A(n31), .B(a[14]), .Y(u_div_SumTmp_14__0_) );
  XNOR2X2M U18 ( .A(n31), .B(a[13]), .Y(u_div_SumTmp_13__0_) );
  XNOR2X2M U19 ( .A(n31), .B(a[12]), .Y(u_div_SumTmp_12__0_) );
  XNOR2X2M U20 ( .A(n31), .B(a[11]), .Y(u_div_SumTmp_11__0_) );
  XNOR2X2M U21 ( .A(n31), .B(a[10]), .Y(u_div_SumTmp_10__0_) );
  XNOR2X2M U22 ( .A(n31), .B(a[9]), .Y(u_div_SumTmp_9__0_) );
  XNOR2X2M U23 ( .A(n31), .B(a[8]), .Y(u_div_SumTmp_8__0_) );
  XNOR2X2M U24 ( .A(n32), .B(a[7]), .Y(u_div_SumTmp_7__0_) );
  XNOR2X2M U25 ( .A(n32), .B(a[6]), .Y(u_div_SumTmp_6__0_) );
  XNOR2X2M U26 ( .A(n32), .B(a[5]), .Y(u_div_SumTmp_5__0_) );
  XNOR2X2M U27 ( .A(n32), .B(a[4]), .Y(u_div_SumTmp_4__0_) );
  XNOR2X2M U28 ( .A(n32), .B(a[3]), .Y(u_div_SumTmp_3__0_) );
  XNOR2X2M U29 ( .A(n32), .B(a[2]), .Y(u_div_SumTmp_2__0_) );
  OR2X2M U30 ( .A(n31), .B(a[15]), .Y(u_div_CryTmp_15__1_) );
  INVX2M U31 ( .A(b[12]), .Y(n36) );
  NAND2X2M U32 ( .A(n3), .B(n4), .Y(u_div_CryTmp_13__1_) );
  INVX2M U33 ( .A(a[13]), .Y(n4) );
  INVX2M U34 ( .A(n31), .Y(n3) );
  NAND2X2M U35 ( .A(n5), .B(n6), .Y(u_div_CryTmp_12__1_) );
  INVX2M U36 ( .A(a[12]), .Y(n6) );
  INVX2M U37 ( .A(n31), .Y(n5) );
  NAND2X2M U38 ( .A(n7), .B(n8), .Y(u_div_CryTmp_11__1_) );
  INVX2M U39 ( .A(a[11]), .Y(n8) );
  INVX2M U40 ( .A(n31), .Y(n7) );
  NAND2X2M U41 ( .A(n9), .B(n10), .Y(u_div_CryTmp_10__1_) );
  INVX2M U42 ( .A(a[10]), .Y(n10) );
  INVX2M U43 ( .A(n31), .Y(n9) );
  NAND2X2M U44 ( .A(n11), .B(n12), .Y(u_div_CryTmp_9__1_) );
  INVX2M U45 ( .A(a[9]), .Y(n12) );
  INVX2M U46 ( .A(n31), .Y(n11) );
  NAND2X2M U47 ( .A(n13), .B(n14), .Y(u_div_CryTmp_8__1_) );
  INVX2M U48 ( .A(a[8]), .Y(n14) );
  INVX2M U49 ( .A(n31), .Y(n13) );
  NAND2X2M U50 ( .A(n15), .B(n16), .Y(u_div_CryTmp_7__1_) );
  INVX2M U51 ( .A(a[7]), .Y(n16) );
  INVX2M U52 ( .A(n32), .Y(n15) );
  NAND2X2M U53 ( .A(n17), .B(n18), .Y(u_div_CryTmp_6__1_) );
  INVX2M U54 ( .A(a[6]), .Y(n18) );
  INVX2M U55 ( .A(n32), .Y(n17) );
  NAND2X2M U56 ( .A(n19), .B(n20), .Y(u_div_CryTmp_5__1_) );
  INVX2M U57 ( .A(a[5]), .Y(n20) );
  INVX2M U58 ( .A(n32), .Y(n19) );
  NAND2X2M U59 ( .A(n21), .B(n22), .Y(u_div_CryTmp_4__1_) );
  INVX2M U60 ( .A(a[4]), .Y(n22) );
  INVX2M U61 ( .A(n32), .Y(n21) );
  NAND2X2M U62 ( .A(n21), .B(n23), .Y(u_div_CryTmp_3__1_) );
  INVX2M U63 ( .A(a[3]), .Y(n23) );
  NAND2X2M U64 ( .A(n21), .B(n24), .Y(u_div_CryTmp_2__1_) );
  INVX2M U65 ( .A(a[2]), .Y(n24) );
  NAND2X2M U66 ( .A(n21), .B(n25), .Y(u_div_CryTmp_1__1_) );
  INVX2M U67 ( .A(a[1]), .Y(n25) );
  NAND2X2M U68 ( .A(n21), .B(n26), .Y(u_div_CryTmp_0__1_) );
  INVX2M U69 ( .A(a[0]), .Y(n26) );
  INVX2M U70 ( .A(b[13]), .Y(n35) );
  NAND2X2M U71 ( .A(n1), .B(n2), .Y(u_div_CryTmp_14__1_) );
  INVX2M U72 ( .A(a[14]), .Y(n2) );
  INVX2M U73 ( .A(n31), .Y(n1) );
  INVX2M U74 ( .A(b[8]), .Y(n40) );
  INVX2M U75 ( .A(b[7]), .Y(n41) );
  INVX2M U76 ( .A(b[9]), .Y(n39) );
  INVX2M U77 ( .A(b[10]), .Y(n38) );
  INVX2M U78 ( .A(b[11]), .Y(n37) );
  INVX2M U79 ( .A(b[3]), .Y(n45) );
  INVX2M U80 ( .A(b[4]), .Y(n44) );
  INVX2M U81 ( .A(b[2]), .Y(n46) );
  INVX2M U82 ( .A(b[0]), .Y(n48) );
  INVX2M U83 ( .A(b[1]), .Y(n47) );
  INVX2M U84 ( .A(b[5]), .Y(n43) );
  XNOR2X2M U85 ( .A(n32), .B(a[1]), .Y(u_div_SumTmp_1__0_) );
  INVX2M U86 ( .A(b[14]), .Y(n34) );
  INVX2M U87 ( .A(b[15]), .Y(n33) );
  CLKMX2X2M U88 ( .A(u_div_PartRem_2__8_), .B(u_div_SumTmp_1__8_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__9_) );
  CLKMX2X2M U89 ( .A(u_div_PartRem_3__7_), .B(u_div_SumTmp_2__7_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__8_) );
  CLKMX2X2M U90 ( .A(u_div_PartRem_4__6_), .B(u_div_SumTmp_3__6_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__7_) );
  CLKMX2X2M U91 ( .A(u_div_PartRem_5__5_), .B(u_div_SumTmp_4__5_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__6_) );
  CLKMX2X2M U92 ( .A(u_div_PartRem_6__4_), .B(u_div_SumTmp_5__4_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__5_) );
  CLKMX2X2M U93 ( .A(u_div_PartRem_7__3_), .B(u_div_SumTmp_6__3_), .S0(
        quotient[6]), .Y(u_div_PartRem_6__4_) );
  CLKMX2X2M U94 ( .A(u_div_PartRem_8__2_), .B(u_div_SumTmp_7__2_), .S0(
        quotient[7]), .Y(u_div_PartRem_7__3_) );
  CLKMX2X2M U95 ( .A(u_div_PartRem_9__1_), .B(u_div_SumTmp_8__1_), .S0(
        quotient[8]), .Y(u_div_PartRem_8__2_) );
  CLKMX2X2M U96 ( .A(a[9]), .B(u_div_SumTmp_9__0_), .S0(quotient[9]), .Y(
        u_div_PartRem_9__1_) );
  CLKMX2X2M U97 ( .A(u_div_PartRem_2__7_), .B(u_div_SumTmp_1__7_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__8_) );
  CLKMX2X2M U98 ( .A(u_div_PartRem_3__6_), .B(u_div_SumTmp_2__6_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__7_) );
  CLKMX2X2M U99 ( .A(u_div_PartRem_4__5_), .B(u_div_SumTmp_3__5_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__6_) );
  CLKMX2X2M U100 ( .A(u_div_PartRem_5__4_), .B(u_div_SumTmp_4__4_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__5_) );
  CLKMX2X2M U101 ( .A(u_div_PartRem_6__3_), .B(u_div_SumTmp_5__3_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__4_) );
  CLKMX2X2M U102 ( .A(u_div_PartRem_7__2_), .B(u_div_SumTmp_6__2_), .S0(
        quotient[6]), .Y(u_div_PartRem_6__3_) );
  CLKMX2X2M U103 ( .A(u_div_PartRem_8__1_), .B(u_div_SumTmp_7__1_), .S0(
        quotient[7]), .Y(u_div_PartRem_7__2_) );
  CLKMX2X2M U104 ( .A(a[8]), .B(u_div_SumTmp_8__0_), .S0(quotient[8]), .Y(
        u_div_PartRem_8__1_) );
  CLKMX2X2M U105 ( .A(u_div_PartRem_2__6_), .B(u_div_SumTmp_1__6_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__7_) );
  CLKMX2X2M U106 ( .A(u_div_PartRem_3__5_), .B(u_div_SumTmp_2__5_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__6_) );
  CLKMX2X2M U107 ( .A(u_div_PartRem_4__4_), .B(u_div_SumTmp_3__4_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__5_) );
  CLKMX2X2M U108 ( .A(u_div_PartRem_5__3_), .B(u_div_SumTmp_4__3_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__4_) );
  CLKMX2X2M U109 ( .A(u_div_PartRem_6__2_), .B(u_div_SumTmp_5__2_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__3_) );
  CLKMX2X2M U110 ( .A(u_div_PartRem_7__1_), .B(u_div_SumTmp_6__1_), .S0(
        quotient[6]), .Y(u_div_PartRem_6__2_) );
  CLKMX2X2M U111 ( .A(a[7]), .B(u_div_SumTmp_7__0_), .S0(quotient[7]), .Y(
        u_div_PartRem_7__1_) );
  CLKMX2X2M U112 ( .A(u_div_PartRem_2__5_), .B(u_div_SumTmp_1__5_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__6_) );
  CLKMX2X2M U113 ( .A(u_div_PartRem_3__4_), .B(u_div_SumTmp_2__4_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__5_) );
  CLKMX2X2M U114 ( .A(u_div_PartRem_4__3_), .B(u_div_SumTmp_3__3_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__4_) );
  CLKMX2X2M U115 ( .A(u_div_PartRem_5__2_), .B(u_div_SumTmp_4__2_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__3_) );
  CLKMX2X2M U116 ( .A(u_div_PartRem_6__1_), .B(u_div_SumTmp_5__1_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__2_) );
  CLKMX2X2M U117 ( .A(a[6]), .B(u_div_SumTmp_6__0_), .S0(quotient[6]), .Y(
        u_div_PartRem_6__1_) );
  CLKMX2X2M U118 ( .A(u_div_PartRem_2__4_), .B(u_div_SumTmp_1__4_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__5_) );
  CLKMX2X2M U119 ( .A(u_div_PartRem_3__3_), .B(u_div_SumTmp_2__3_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__4_) );
  CLKMX2X2M U120 ( .A(u_div_PartRem_4__2_), .B(u_div_SumTmp_3__2_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__3_) );
  CLKMX2X2M U121 ( .A(u_div_PartRem_5__1_), .B(u_div_SumTmp_4__1_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__2_) );
  CLKMX2X2M U122 ( .A(a[5]), .B(u_div_SumTmp_5__0_), .S0(quotient[5]), .Y(
        u_div_PartRem_5__1_) );
  CLKMX2X2M U123 ( .A(u_div_PartRem_2__3_), .B(u_div_SumTmp_1__3_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__4_) );
  CLKMX2X2M U124 ( .A(u_div_PartRem_3__2_), .B(u_div_SumTmp_2__2_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__3_) );
  CLKMX2X2M U125 ( .A(u_div_PartRem_4__1_), .B(u_div_SumTmp_3__1_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__2_) );
  CLKMX2X2M U126 ( .A(a[4]), .B(u_div_SumTmp_4__0_), .S0(quotient[4]), .Y(
        u_div_PartRem_4__1_) );
  CLKMX2X2M U127 ( .A(u_div_PartRem_2__2_), .B(u_div_SumTmp_1__2_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__3_) );
  CLKMX2X2M U128 ( .A(u_div_PartRem_3__1_), .B(u_div_SumTmp_2__1_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__2_) );
  CLKMX2X2M U129 ( .A(a[3]), .B(u_div_SumTmp_3__0_), .S0(quotient[3]), .Y(
        u_div_PartRem_3__1_) );
  CLKMX2X2M U130 ( .A(u_div_PartRem_2__1_), .B(u_div_SumTmp_1__1_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__2_) );
  CLKMX2X2M U131 ( .A(a[2]), .B(u_div_SumTmp_2__0_), .S0(quotient[2]), .Y(
        u_div_PartRem_2__1_) );
  CLKMX2X2M U132 ( .A(a[1]), .B(u_div_SumTmp_1__0_), .S0(quotient[1]), .Y(
        u_div_PartRem_1__1_) );
  CLKMX2X2M U133 ( .A(u_div_PartRem_2__14_), .B(u_div_SumTmp_1__14_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__15_) );
  CLKMX2X2M U134 ( .A(u_div_PartRem_3__13_), .B(u_div_SumTmp_2__13_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__14_) );
  CLKMX2X2M U135 ( .A(u_div_PartRem_4__12_), .B(u_div_SumTmp_3__12_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__13_) );
  CLKMX2X2M U136 ( .A(u_div_PartRem_5__11_), .B(u_div_SumTmp_4__11_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__12_) );
  CLKMX2X2M U137 ( .A(u_div_PartRem_6__10_), .B(u_div_SumTmp_5__10_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__11_) );
  CLKMX2X2M U138 ( .A(u_div_PartRem_7__9_), .B(u_div_SumTmp_6__9_), .S0(
        quotient[6]), .Y(u_div_PartRem_6__10_) );
  CLKMX2X2M U139 ( .A(u_div_PartRem_8__8_), .B(u_div_SumTmp_7__8_), .S0(
        quotient[7]), .Y(u_div_PartRem_7__9_) );
  CLKMX2X2M U140 ( .A(u_div_PartRem_9__7_), .B(u_div_SumTmp_8__7_), .S0(
        quotient[8]), .Y(u_div_PartRem_8__8_) );
  CLKMX2X2M U141 ( .A(u_div_PartRem_10__6_), .B(u_div_SumTmp_9__6_), .S0(
        quotient[9]), .Y(u_div_PartRem_9__7_) );
  CLKMX2X2M U142 ( .A(u_div_PartRem_2__13_), .B(u_div_SumTmp_1__13_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__14_) );
  CLKMX2X2M U143 ( .A(u_div_PartRem_3__12_), .B(u_div_SumTmp_2__12_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__13_) );
  CLKMX2X2M U144 ( .A(u_div_PartRem_4__11_), .B(u_div_SumTmp_3__11_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__12_) );
  CLKMX2X2M U145 ( .A(u_div_PartRem_5__10_), .B(u_div_SumTmp_4__10_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__11_) );
  CLKMX2X2M U146 ( .A(u_div_PartRem_6__9_), .B(u_div_SumTmp_5__9_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__10_) );
  CLKMX2X2M U147 ( .A(u_div_PartRem_7__8_), .B(u_div_SumTmp_6__8_), .S0(
        quotient[6]), .Y(u_div_PartRem_6__9_) );
  CLKMX2X2M U148 ( .A(u_div_PartRem_8__7_), .B(u_div_SumTmp_7__7_), .S0(
        quotient[7]), .Y(u_div_PartRem_7__8_) );
  CLKMX2X2M U149 ( .A(u_div_PartRem_9__6_), .B(u_div_SumTmp_8__6_), .S0(
        quotient[8]), .Y(u_div_PartRem_8__7_) );
  CLKMX2X2M U150 ( .A(u_div_PartRem_10__5_), .B(u_div_SumTmp_9__5_), .S0(
        quotient[9]), .Y(u_div_PartRem_9__6_) );
  CLKMX2X2M U151 ( .A(u_div_PartRem_2__12_), .B(u_div_SumTmp_1__12_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__13_) );
  CLKMX2X2M U152 ( .A(u_div_PartRem_3__11_), .B(u_div_SumTmp_2__11_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__12_) );
  CLKMX2X2M U153 ( .A(u_div_PartRem_4__10_), .B(u_div_SumTmp_3__10_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__11_) );
  CLKMX2X2M U154 ( .A(u_div_PartRem_5__9_), .B(u_div_SumTmp_4__9_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__10_) );
  CLKMX2X2M U155 ( .A(u_div_PartRem_6__8_), .B(u_div_SumTmp_5__8_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__9_) );
  CLKMX2X2M U156 ( .A(u_div_PartRem_7__7_), .B(u_div_SumTmp_6__7_), .S0(
        quotient[6]), .Y(u_div_PartRem_6__8_) );
  CLKMX2X2M U157 ( .A(u_div_PartRem_8__6_), .B(u_div_SumTmp_7__6_), .S0(
        quotient[7]), .Y(u_div_PartRem_7__7_) );
  CLKMX2X2M U158 ( .A(u_div_PartRem_9__5_), .B(u_div_SumTmp_8__5_), .S0(
        quotient[8]), .Y(u_div_PartRem_8__6_) );
  CLKMX2X2M U159 ( .A(u_div_PartRem_10__4_), .B(u_div_SumTmp_9__4_), .S0(
        quotient[9]), .Y(u_div_PartRem_9__5_) );
  CLKMX2X2M U160 ( .A(u_div_PartRem_2__11_), .B(u_div_SumTmp_1__11_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__12_) );
  CLKMX2X2M U161 ( .A(u_div_PartRem_3__10_), .B(u_div_SumTmp_2__10_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__11_) );
  CLKMX2X2M U162 ( .A(u_div_PartRem_4__9_), .B(u_div_SumTmp_3__9_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__10_) );
  CLKMX2X2M U163 ( .A(u_div_PartRem_5__8_), .B(u_div_SumTmp_4__8_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__9_) );
  CLKMX2X2M U164 ( .A(u_div_PartRem_6__7_), .B(u_div_SumTmp_5__7_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__8_) );
  CLKMX2X2M U165 ( .A(u_div_PartRem_7__6_), .B(u_div_SumTmp_6__6_), .S0(
        quotient[6]), .Y(u_div_PartRem_6__7_) );
  CLKMX2X2M U166 ( .A(u_div_PartRem_8__5_), .B(u_div_SumTmp_7__5_), .S0(
        quotient[7]), .Y(u_div_PartRem_7__6_) );
  CLKMX2X2M U167 ( .A(u_div_PartRem_9__4_), .B(u_div_SumTmp_8__4_), .S0(
        quotient[8]), .Y(u_div_PartRem_8__5_) );
  CLKMX2X2M U168 ( .A(u_div_PartRem_10__3_), .B(u_div_SumTmp_9__3_), .S0(
        quotient[9]), .Y(u_div_PartRem_9__4_) );
  CLKMX2X2M U169 ( .A(u_div_PartRem_2__10_), .B(u_div_SumTmp_1__10_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__11_) );
  CLKMX2X2M U170 ( .A(u_div_PartRem_3__9_), .B(u_div_SumTmp_2__9_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__10_) );
  CLKMX2X2M U171 ( .A(u_div_PartRem_4__8_), .B(u_div_SumTmp_3__8_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__9_) );
  CLKMX2X2M U172 ( .A(u_div_PartRem_5__7_), .B(u_div_SumTmp_4__7_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__8_) );
  CLKMX2X2M U173 ( .A(u_div_PartRem_6__6_), .B(u_div_SumTmp_5__6_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__7_) );
  CLKMX2X2M U174 ( .A(u_div_PartRem_7__5_), .B(u_div_SumTmp_6__5_), .S0(
        quotient[6]), .Y(u_div_PartRem_6__6_) );
  CLKMX2X2M U175 ( .A(u_div_PartRem_8__4_), .B(u_div_SumTmp_7__4_), .S0(
        quotient[7]), .Y(u_div_PartRem_7__5_) );
  CLKMX2X2M U176 ( .A(u_div_PartRem_9__3_), .B(u_div_SumTmp_8__3_), .S0(
        quotient[8]), .Y(u_div_PartRem_8__4_) );
  CLKMX2X2M U177 ( .A(u_div_PartRem_10__2_), .B(u_div_SumTmp_9__2_), .S0(
        quotient[9]), .Y(u_div_PartRem_9__3_) );
  CLKMX2X2M U178 ( .A(u_div_PartRem_2__9_), .B(u_div_SumTmp_1__9_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__10_) );
  CLKMX2X2M U179 ( .A(u_div_PartRem_3__8_), .B(u_div_SumTmp_2__8_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__9_) );
  CLKMX2X2M U180 ( .A(u_div_PartRem_4__7_), .B(u_div_SumTmp_3__7_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__8_) );
  CLKMX2X2M U181 ( .A(u_div_PartRem_5__6_), .B(u_div_SumTmp_4__6_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__7_) );
  CLKMX2X2M U182 ( .A(u_div_PartRem_6__5_), .B(u_div_SumTmp_5__5_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__6_) );
  CLKMX2X2M U183 ( .A(u_div_PartRem_7__4_), .B(u_div_SumTmp_6__4_), .S0(
        quotient[6]), .Y(u_div_PartRem_6__5_) );
  CLKMX2X2M U184 ( .A(u_div_PartRem_8__3_), .B(u_div_SumTmp_7__3_), .S0(
        quotient[7]), .Y(u_div_PartRem_7__4_) );
  CLKMX2X2M U185 ( .A(u_div_PartRem_9__2_), .B(u_div_SumTmp_8__2_), .S0(
        quotient[8]), .Y(u_div_PartRem_8__3_) );
  CLKMX2X2M U186 ( .A(u_div_PartRem_10__1_), .B(u_div_SumTmp_9__1_), .S0(
        quotient[9]), .Y(u_div_PartRem_9__2_) );
  CLKMX2X2M U187 ( .A(u_div_PartRem_11__5_), .B(u_div_SumTmp_10__5_), .S0(
        quotient[10]), .Y(u_div_PartRem_10__6_) );
  CLKMX2X2M U188 ( .A(u_div_PartRem_12__4_), .B(u_div_SumTmp_11__4_), .S0(
        quotient[11]), .Y(u_div_PartRem_11__5_) );
  CLKMX2X2M U189 ( .A(u_div_PartRem_13__3_), .B(u_div_SumTmp_12__3_), .S0(
        quotient[12]), .Y(u_div_PartRem_12__4_) );
  CLKMX2X2M U190 ( .A(u_div_PartRem_14__2_), .B(u_div_SumTmp_13__2_), .S0(
        quotient[13]), .Y(u_div_PartRem_13__3_) );
  CLKMX2X2M U191 ( .A(u_div_PartRem_15__1_), .B(u_div_SumTmp_14__1_), .S0(
        quotient[14]), .Y(u_div_PartRem_14__2_) );
  CLKMX2X2M U192 ( .A(a[15]), .B(u_div_SumTmp_15__0_), .S0(quotient[15]), .Y(
        u_div_PartRem_15__1_) );
  CLKMX2X2M U193 ( .A(u_div_PartRem_11__4_), .B(u_div_SumTmp_10__4_), .S0(
        quotient[10]), .Y(u_div_PartRem_10__5_) );
  CLKMX2X2M U194 ( .A(u_div_PartRem_12__3_), .B(u_div_SumTmp_11__3_), .S0(
        quotient[11]), .Y(u_div_PartRem_11__4_) );
  CLKMX2X2M U195 ( .A(u_div_PartRem_13__2_), .B(u_div_SumTmp_12__2_), .S0(
        quotient[12]), .Y(u_div_PartRem_12__3_) );
  CLKMX2X2M U196 ( .A(u_div_PartRem_14__1_), .B(u_div_SumTmp_13__1_), .S0(
        quotient[13]), .Y(u_div_PartRem_13__2_) );
  CLKMX2X2M U197 ( .A(a[14]), .B(u_div_SumTmp_14__0_), .S0(quotient[14]), .Y(
        u_div_PartRem_14__1_) );
  CLKMX2X2M U198 ( .A(u_div_PartRem_11__3_), .B(u_div_SumTmp_10__3_), .S0(
        quotient[10]), .Y(u_div_PartRem_10__4_) );
  CLKMX2X2M U199 ( .A(u_div_PartRem_12__2_), .B(u_div_SumTmp_11__2_), .S0(
        quotient[11]), .Y(u_div_PartRem_11__3_) );
  CLKMX2X2M U200 ( .A(u_div_PartRem_13__1_), .B(u_div_SumTmp_12__1_), .S0(
        quotient[12]), .Y(u_div_PartRem_12__2_) );
  CLKMX2X2M U201 ( .A(a[13]), .B(u_div_SumTmp_13__0_), .S0(quotient[13]), .Y(
        u_div_PartRem_13__1_) );
  CLKMX2X2M U202 ( .A(u_div_PartRem_11__2_), .B(u_div_SumTmp_10__2_), .S0(
        quotient[10]), .Y(u_div_PartRem_10__3_) );
  CLKMX2X2M U203 ( .A(u_div_PartRem_12__1_), .B(u_div_SumTmp_11__1_), .S0(
        quotient[11]), .Y(u_div_PartRem_11__2_) );
  CLKMX2X2M U204 ( .A(a[12]), .B(u_div_SumTmp_12__0_), .S0(quotient[12]), .Y(
        u_div_PartRem_12__1_) );
  CLKMX2X2M U205 ( .A(u_div_PartRem_11__1_), .B(u_div_SumTmp_10__1_), .S0(
        quotient[10]), .Y(u_div_PartRem_10__2_) );
  CLKMX2X2M U206 ( .A(a[11]), .B(u_div_SumTmp_11__0_), .S0(quotient[11]), .Y(
        u_div_PartRem_11__1_) );
  CLKMX2X2M U207 ( .A(a[10]), .B(u_div_SumTmp_10__0_), .S0(quotient[10]), .Y(
        u_div_PartRem_10__1_) );
  AND3X1M U208 ( .A(n49), .B(n41), .C(u_div_CryTmp_9__7_), .Y(quotient[9]) );
  AND4X1M U209 ( .A(u_div_CryTmp_15__1_), .B(n54), .C(n30), .D(n28), .Y(
        quotient[15]) );
  AND3X1M U210 ( .A(n54), .B(n28), .C(u_div_CryTmp_14__2_), .Y(quotient[14])
         );
  AND2X1M U211 ( .A(u_div_CryTmp_13__3_), .B(n54), .Y(quotient[13]) );
  AND3X1M U212 ( .A(n55), .B(n45), .C(n44), .Y(n54) );
  AND3X1M U213 ( .A(n55), .B(n44), .C(u_div_CryTmp_12__4_), .Y(quotient[12])
         );
  AND2X1M U214 ( .A(u_div_CryTmp_11__5_), .B(n55), .Y(quotient[11]) );
  AND2X1M U215 ( .A(n56), .B(n43), .Y(n55) );
  AND2X1M U216 ( .A(u_div_CryTmp_10__6_), .B(n56), .Y(quotient[10]) );
  AND3X1M U217 ( .A(n49), .B(n42), .C(n41), .Y(n56) );
  AND2X1M U218 ( .A(n50), .B(n40), .Y(n49) );
  AND3X1M U219 ( .A(n51), .B(n38), .C(n39), .Y(n50) );
  AND2X1M U220 ( .A(n52), .B(n37), .Y(n51) );
  AND3X1M U221 ( .A(n53), .B(n36), .C(n35), .Y(n52) );
  NOR2X1M U222 ( .A(b[14]), .B(b[15]), .Y(n53) );
endmodule


module ARITHMETIC_UNIT_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [16:1] carry;

  ADDFX2M U2_15 ( .A(A[15]), .B(n2), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFX2M U2_1 ( .A(A[1]), .B(n16), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_14 ( .A(A[14]), .B(n3), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFX2M U2_13 ( .A(A[13]), .B(n4), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFX2M U2_12 ( .A(A[12]), .B(n5), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2M U2_11 ( .A(A[11]), .B(n6), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2M U2_10 ( .A(A[10]), .B(n7), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX2M U2_9 ( .A(A[9]), .B(n8), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2M U2_8 ( .A(A[8]), .B(n9), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n10), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n11), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n12), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n13), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n14), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n15), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  INVX2M U1 ( .A(B[2]), .Y(n15) );
  INVX2M U2 ( .A(B[3]), .Y(n14) );
  INVX2M U3 ( .A(B[4]), .Y(n13) );
  INVX2M U4 ( .A(B[5]), .Y(n12) );
  INVX2M U5 ( .A(B[6]), .Y(n11) );
  INVX2M U6 ( .A(B[7]), .Y(n10) );
  INVX2M U7 ( .A(B[8]), .Y(n9) );
  INVX2M U8 ( .A(B[9]), .Y(n8) );
  INVX2M U9 ( .A(B[10]), .Y(n7) );
  INVX2M U10 ( .A(B[11]), .Y(n6) );
  INVX2M U11 ( .A(B[12]), .Y(n5) );
  INVX2M U12 ( .A(B[13]), .Y(n4) );
  INVX2M U13 ( .A(B[14]), .Y(n3) );
  INVX2M U14 ( .A(B[1]), .Y(n16) );
  NAND2X2M U15 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U16 ( .A(A[0]), .Y(n1) );
  INVX2M U17 ( .A(B[15]), .Y(n2) );
  INVX2M U18 ( .A(B[0]), .Y(n17) );
  XNOR2X2M U19 ( .A(n17), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1M U20 ( .A(carry[16]), .Y(DIFF[16]) );
endmodule


module ARITHMETIC_UNIT_DW01_add_0 ( A, B, CI, SUM, CO );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:2] carry;

  ADDFX2M U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(SUM[16]), .S(
        SUM[15]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2M U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2M U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2M U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2M U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2M U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ARITHMETIC_UNIT_DW01_add_1 ( A, B, CI, SUM, CO );
  input [29:0] A;
  input [29:0] B;
  output [29:0] SUM;
  input CI;
  output CO;
  wire   n1, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69;

  AOI21BX2M U2 ( .A0(n18), .A1(A[28]), .B0N(n19), .Y(n1) );
  INVX2M U3 ( .A(n68), .Y(n17) );
  XNOR2X2M U4 ( .A(B[29]), .B(n1), .Y(SUM[29]) );
  INVX2M U5 ( .A(n69), .Y(SUM[15]) );
  BUFX2M U6 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U7 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U8 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U9 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U10 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U11 ( .A(A[5]), .Y(SUM[5]) );
  BUFX2M U12 ( .A(A[6]), .Y(SUM[6]) );
  BUFX2M U13 ( .A(A[7]), .Y(SUM[7]) );
  BUFX2M U14 ( .A(A[8]), .Y(SUM[8]) );
  BUFX2M U15 ( .A(A[9]), .Y(SUM[9]) );
  BUFX2M U16 ( .A(A[10]), .Y(SUM[10]) );
  BUFX2M U17 ( .A(A[11]), .Y(SUM[11]) );
  BUFX2M U18 ( .A(A[12]), .Y(SUM[12]) );
  BUFX2M U19 ( .A(A[13]), .Y(SUM[13]) );
  BUFX2M U20 ( .A(A[14]), .Y(SUM[14]) );
  OAI21X1M U21 ( .A0(A[28]), .A1(n18), .B0(B[28]), .Y(n19) );
  XOR3XLM U22 ( .A(B[28]), .B(A[28]), .C(n18), .Y(SUM[28]) );
  OAI21X1M U23 ( .A0(n20), .A1(n21), .B0(n22), .Y(n18) );
  CLKXOR2X2M U24 ( .A(n23), .B(n21), .Y(SUM[27]) );
  AOI2B1X1M U25 ( .A1N(n24), .A0(n25), .B0(n26), .Y(n21) );
  NAND2BX1M U26 ( .AN(n20), .B(n22), .Y(n23) );
  CLKNAND2X2M U27 ( .A(B[27]), .B(A[27]), .Y(n22) );
  NOR2X1M U28 ( .A(B[27]), .B(A[27]), .Y(n20) );
  CLKXOR2X2M U29 ( .A(n25), .B(n27), .Y(SUM[26]) );
  NOR2X1M U30 ( .A(n26), .B(n24), .Y(n27) );
  NOR2X1M U31 ( .A(B[26]), .B(A[26]), .Y(n24) );
  AND2X1M U32 ( .A(B[26]), .B(A[26]), .Y(n26) );
  OAI21X1M U33 ( .A0(n28), .A1(n29), .B0(n30), .Y(n25) );
  CLKXOR2X2M U34 ( .A(n31), .B(n29), .Y(SUM[25]) );
  AOI2B1X1M U35 ( .A1N(n32), .A0(n33), .B0(n34), .Y(n29) );
  NAND2BX1M U36 ( .AN(n28), .B(n30), .Y(n31) );
  CLKNAND2X2M U37 ( .A(B[25]), .B(A[25]), .Y(n30) );
  NOR2X1M U38 ( .A(B[25]), .B(A[25]), .Y(n28) );
  CLKXOR2X2M U39 ( .A(n33), .B(n35), .Y(SUM[24]) );
  NOR2X1M U40 ( .A(n34), .B(n32), .Y(n35) );
  NOR2X1M U41 ( .A(B[24]), .B(A[24]), .Y(n32) );
  AND2X1M U42 ( .A(B[24]), .B(A[24]), .Y(n34) );
  OAI21X1M U43 ( .A0(n36), .A1(n37), .B0(n38), .Y(n33) );
  CLKXOR2X2M U44 ( .A(n39), .B(n37), .Y(SUM[23]) );
  AOI2B1X1M U45 ( .A1N(n40), .A0(n41), .B0(n42), .Y(n37) );
  NAND2BX1M U46 ( .AN(n36), .B(n38), .Y(n39) );
  CLKNAND2X2M U47 ( .A(B[23]), .B(A[23]), .Y(n38) );
  NOR2X1M U48 ( .A(B[23]), .B(A[23]), .Y(n36) );
  CLKXOR2X2M U49 ( .A(n41), .B(n43), .Y(SUM[22]) );
  NOR2X1M U50 ( .A(n42), .B(n40), .Y(n43) );
  NOR2X1M U51 ( .A(B[22]), .B(A[22]), .Y(n40) );
  AND2X1M U52 ( .A(B[22]), .B(A[22]), .Y(n42) );
  OAI21X1M U53 ( .A0(n44), .A1(n45), .B0(n46), .Y(n41) );
  CLKXOR2X2M U54 ( .A(n47), .B(n45), .Y(SUM[21]) );
  AOI2B1X1M U55 ( .A1N(n48), .A0(n49), .B0(n50), .Y(n45) );
  NAND2BX1M U56 ( .AN(n44), .B(n46), .Y(n47) );
  CLKNAND2X2M U57 ( .A(B[21]), .B(A[21]), .Y(n46) );
  NOR2X1M U58 ( .A(B[21]), .B(A[21]), .Y(n44) );
  CLKXOR2X2M U59 ( .A(n49), .B(n51), .Y(SUM[20]) );
  NOR2X1M U60 ( .A(n50), .B(n48), .Y(n51) );
  NOR2X1M U61 ( .A(B[20]), .B(A[20]), .Y(n48) );
  AND2X1M U62 ( .A(B[20]), .B(A[20]), .Y(n50) );
  OAI21X1M U63 ( .A0(n52), .A1(n53), .B0(n54), .Y(n49) );
  CLKXOR2X2M U64 ( .A(n55), .B(n53), .Y(SUM[19]) );
  AOI2B1X1M U65 ( .A1N(n56), .A0(n57), .B0(n58), .Y(n53) );
  NAND2BX1M U66 ( .AN(n52), .B(n54), .Y(n55) );
  CLKNAND2X2M U67 ( .A(B[19]), .B(A[19]), .Y(n54) );
  NOR2X1M U68 ( .A(B[19]), .B(A[19]), .Y(n52) );
  CLKXOR2X2M U69 ( .A(n57), .B(n59), .Y(SUM[18]) );
  NOR2X1M U70 ( .A(n58), .B(n56), .Y(n59) );
  NOR2X1M U71 ( .A(B[18]), .B(A[18]), .Y(n56) );
  AND2X1M U72 ( .A(B[18]), .B(A[18]), .Y(n58) );
  OAI21X1M U73 ( .A0(n60), .A1(n61), .B0(n62), .Y(n57) );
  CLKXOR2X2M U74 ( .A(n63), .B(n61), .Y(SUM[17]) );
  AOI2B1X1M U75 ( .A1N(n64), .A0(n17), .B0(n65), .Y(n61) );
  NAND2BX1M U76 ( .AN(n60), .B(n62), .Y(n63) );
  CLKNAND2X2M U77 ( .A(B[17]), .B(A[17]), .Y(n62) );
  NOR2X1M U78 ( .A(B[17]), .B(A[17]), .Y(n60) );
  CLKXOR2X2M U79 ( .A(n17), .B(n66), .Y(SUM[16]) );
  NOR2X1M U80 ( .A(n65), .B(n64), .Y(n66) );
  NOR2X1M U81 ( .A(B[16]), .B(A[16]), .Y(n64) );
  AND2X1M U82 ( .A(B[16]), .B(A[16]), .Y(n65) );
  NAND2BX1M U83 ( .AN(n67), .B(n68), .Y(n69) );
  CLKNAND2X2M U84 ( .A(B[15]), .B(A[15]), .Y(n68) );
  NOR2X1M U85 ( .A(B[15]), .B(A[15]), .Y(n67) );
endmodule


module ARITHMETIC_UNIT_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [15:0] A;
  input [15:0] B;
  output [31:0] PRODUCT;
  input TC;
  wire   ab_15__15_, ab_15__14_, ab_15__13_, ab_15__12_, ab_15__11_,
         ab_15__10_, ab_15__9_, ab_15__8_, ab_15__7_, ab_15__6_, ab_15__5_,
         ab_15__4_, ab_15__3_, ab_15__2_, ab_15__1_, ab_15__0_, ab_14__15_,
         ab_14__14_, ab_14__13_, ab_14__12_, ab_14__11_, ab_14__10_, ab_14__9_,
         ab_14__8_, ab_14__7_, ab_14__6_, ab_14__5_, ab_14__4_, ab_14__3_,
         ab_14__2_, ab_14__1_, ab_14__0_, ab_13__15_, ab_13__14_, ab_13__13_,
         ab_13__12_, ab_13__11_, ab_13__10_, ab_13__9_, ab_13__8_, ab_13__7_,
         ab_13__6_, ab_13__5_, ab_13__4_, ab_13__3_, ab_13__2_, ab_13__1_,
         ab_13__0_, ab_12__15_, ab_12__14_, ab_12__13_, ab_12__12_, ab_12__11_,
         ab_12__10_, ab_12__9_, ab_12__8_, ab_12__7_, ab_12__6_, ab_12__5_,
         ab_12__4_, ab_12__3_, ab_12__2_, ab_12__1_, ab_12__0_, ab_11__15_,
         ab_11__14_, ab_11__13_, ab_11__12_, ab_11__11_, ab_11__10_, ab_11__9_,
         ab_11__8_, ab_11__7_, ab_11__6_, ab_11__5_, ab_11__4_, ab_11__3_,
         ab_11__2_, ab_11__1_, ab_11__0_, ab_10__15_, ab_10__14_, ab_10__13_,
         ab_10__12_, ab_10__11_, ab_10__10_, ab_10__9_, ab_10__8_, ab_10__7_,
         ab_10__6_, ab_10__5_, ab_10__4_, ab_10__3_, ab_10__2_, ab_10__1_,
         ab_10__0_, ab_9__15_, ab_9__14_, ab_9__13_, ab_9__12_, ab_9__11_,
         ab_9__10_, ab_9__9_, ab_9__8_, ab_9__7_, ab_9__6_, ab_9__5_, ab_9__4_,
         ab_9__3_, ab_9__2_, ab_9__1_, ab_9__0_, ab_8__15_, ab_8__14_,
         ab_8__13_, ab_8__12_, ab_8__11_, ab_8__10_, ab_8__9_, ab_8__8_,
         ab_8__7_, ab_8__6_, ab_8__5_, ab_8__4_, ab_8__3_, ab_8__2_, ab_8__1_,
         ab_8__0_, ab_7__15_, ab_7__14_, ab_7__13_, ab_7__12_, ab_7__11_,
         ab_7__10_, ab_7__9_, ab_7__8_, ab_7__7_, ab_7__6_, ab_7__5_, ab_7__4_,
         ab_7__3_, ab_7__2_, ab_7__1_, ab_7__0_, ab_6__15_, ab_6__14_,
         ab_6__13_, ab_6__12_, ab_6__11_, ab_6__10_, ab_6__9_, ab_6__8_,
         ab_6__7_, ab_6__6_, ab_6__5_, ab_6__4_, ab_6__3_, ab_6__2_, ab_6__1_,
         ab_6__0_, ab_5__15_, ab_5__14_, ab_5__13_, ab_5__12_, ab_5__11_,
         ab_5__10_, ab_5__9_, ab_5__8_, ab_5__7_, ab_5__6_, ab_5__5_, ab_5__4_,
         ab_5__3_, ab_5__2_, ab_5__1_, ab_5__0_, ab_4__15_, ab_4__14_,
         ab_4__13_, ab_4__12_, ab_4__11_, ab_4__10_, ab_4__9_, ab_4__8_,
         ab_4__7_, ab_4__6_, ab_4__5_, ab_4__4_, ab_4__3_, ab_4__2_, ab_4__1_,
         ab_4__0_, ab_3__15_, ab_3__14_, ab_3__13_, ab_3__12_, ab_3__11_,
         ab_3__10_, ab_3__9_, ab_3__8_, ab_3__7_, ab_3__6_, ab_3__5_, ab_3__4_,
         ab_3__3_, ab_3__2_, ab_3__1_, ab_3__0_, ab_2__15_, ab_2__14_,
         ab_2__13_, ab_2__12_, ab_2__11_, ab_2__10_, ab_2__9_, ab_2__8_,
         ab_2__7_, ab_2__6_, ab_2__5_, ab_2__4_, ab_2__3_, ab_2__2_, ab_2__1_,
         ab_2__0_, ab_1__15_, ab_1__14_, ab_1__13_, ab_1__12_, ab_1__11_,
         ab_1__10_, ab_1__9_, ab_1__8_, ab_1__7_, ab_1__6_, ab_1__5_, ab_1__4_,
         ab_1__3_, ab_1__2_, ab_1__1_, ab_1__0_, ab_0__15_, ab_0__14_,
         ab_0__13_, ab_0__12_, ab_0__11_, ab_0__10_, ab_0__9_, ab_0__8_,
         ab_0__7_, ab_0__6_, ab_0__5_, ab_0__4_, ab_0__3_, ab_0__2_, ab_0__1_,
         CARRYB_15__14_, CARRYB_15__13_, CARRYB_15__12_, CARRYB_15__11_,
         CARRYB_15__10_, CARRYB_15__9_, CARRYB_15__8_, CARRYB_15__7_,
         CARRYB_15__6_, CARRYB_15__5_, CARRYB_15__4_, CARRYB_15__3_,
         CARRYB_15__2_, CARRYB_15__1_, CARRYB_15__0_, CARRYB_14__14_,
         CARRYB_14__13_, CARRYB_14__12_, CARRYB_14__11_, CARRYB_14__10_,
         CARRYB_14__9_, CARRYB_14__8_, CARRYB_14__7_, CARRYB_14__6_,
         CARRYB_14__5_, CARRYB_14__4_, CARRYB_14__3_, CARRYB_14__2_,
         CARRYB_14__1_, CARRYB_14__0_, CARRYB_13__14_, CARRYB_13__13_,
         CARRYB_13__12_, CARRYB_13__11_, CARRYB_13__10_, CARRYB_13__9_,
         CARRYB_13__8_, CARRYB_13__7_, CARRYB_13__6_, CARRYB_13__5_,
         CARRYB_13__4_, CARRYB_13__3_, CARRYB_13__2_, CARRYB_13__1_,
         CARRYB_13__0_, CARRYB_12__14_, CARRYB_12__13_, CARRYB_12__12_,
         CARRYB_12__11_, CARRYB_12__10_, CARRYB_12__9_, CARRYB_12__8_,
         CARRYB_12__7_, CARRYB_12__6_, CARRYB_12__5_, CARRYB_12__4_,
         CARRYB_12__3_, CARRYB_12__2_, CARRYB_12__1_, CARRYB_12__0_,
         CARRYB_11__14_, CARRYB_11__13_, CARRYB_11__12_, CARRYB_11__11_,
         CARRYB_11__10_, CARRYB_11__9_, CARRYB_11__8_, CARRYB_11__7_,
         CARRYB_11__6_, CARRYB_11__5_, CARRYB_11__4_, CARRYB_11__3_,
         CARRYB_11__2_, CARRYB_11__1_, CARRYB_11__0_, CARRYB_10__14_,
         CARRYB_10__13_, CARRYB_10__12_, CARRYB_10__11_, CARRYB_10__10_,
         CARRYB_10__9_, CARRYB_10__8_, CARRYB_10__7_, CARRYB_10__6_,
         CARRYB_10__5_, CARRYB_10__4_, CARRYB_10__3_, CARRYB_10__2_,
         CARRYB_10__1_, CARRYB_10__0_, CARRYB_9__14_, CARRYB_9__13_,
         CARRYB_9__12_, CARRYB_9__11_, CARRYB_9__10_, CARRYB_9__9_,
         CARRYB_9__8_, CARRYB_9__7_, CARRYB_9__6_, CARRYB_9__5_, CARRYB_9__4_,
         CARRYB_9__3_, CARRYB_9__2_, CARRYB_9__1_, CARRYB_9__0_, CARRYB_8__14_,
         CARRYB_8__13_, CARRYB_8__12_, CARRYB_8__11_, CARRYB_8__10_,
         CARRYB_8__9_, CARRYB_8__8_, CARRYB_8__7_, CARRYB_8__6_, CARRYB_8__5_,
         CARRYB_8__4_, CARRYB_8__3_, CARRYB_8__2_, CARRYB_8__1_, CARRYB_8__0_,
         CARRYB_7__14_, CARRYB_7__13_, CARRYB_7__12_, CARRYB_7__11_,
         CARRYB_7__10_, CARRYB_7__9_, CARRYB_7__8_, CARRYB_7__7_, CARRYB_7__6_,
         CARRYB_7__5_, CARRYB_7__4_, CARRYB_7__3_, CARRYB_7__2_, CARRYB_7__1_,
         CARRYB_7__0_, CARRYB_6__14_, CARRYB_6__13_, CARRYB_6__12_,
         CARRYB_6__11_, CARRYB_6__10_, CARRYB_6__9_, CARRYB_6__8_,
         CARRYB_6__7_, CARRYB_6__6_, CARRYB_6__5_, CARRYB_6__4_, CARRYB_6__3_,
         CARRYB_6__2_, CARRYB_6__1_, CARRYB_6__0_, CARRYB_5__14_,
         CARRYB_5__13_, CARRYB_5__12_, CARRYB_5__11_, CARRYB_5__10_,
         CARRYB_5__9_, CARRYB_5__8_, CARRYB_5__7_, CARRYB_5__6_, CARRYB_5__5_,
         CARRYB_5__4_, CARRYB_5__3_, CARRYB_5__2_, CARRYB_5__1_, CARRYB_5__0_,
         CARRYB_4__14_, CARRYB_4__13_, CARRYB_4__12_, CARRYB_4__11_,
         CARRYB_4__10_, CARRYB_4__9_, CARRYB_4__8_, CARRYB_4__7_, CARRYB_4__6_,
         CARRYB_4__5_, CARRYB_4__4_, CARRYB_4__3_, CARRYB_4__2_, CARRYB_4__1_,
         CARRYB_4__0_, CARRYB_3__14_, CARRYB_3__13_, CARRYB_3__12_,
         CARRYB_3__11_, CARRYB_3__10_, CARRYB_3__9_, CARRYB_3__8_,
         CARRYB_3__7_, CARRYB_3__6_, CARRYB_3__5_, CARRYB_3__4_, CARRYB_3__3_,
         CARRYB_3__2_, CARRYB_3__1_, CARRYB_3__0_, CARRYB_2__14_,
         CARRYB_2__13_, CARRYB_2__12_, CARRYB_2__11_, CARRYB_2__10_,
         CARRYB_2__9_, CARRYB_2__8_, CARRYB_2__7_, CARRYB_2__6_, CARRYB_2__5_,
         CARRYB_2__4_, CARRYB_2__3_, CARRYB_2__2_, CARRYB_2__1_, CARRYB_2__0_,
         SUMB_15__14_, SUMB_15__13_, SUMB_15__12_, SUMB_15__11_, SUMB_15__10_,
         SUMB_15__9_, SUMB_15__8_, SUMB_15__7_, SUMB_15__6_, SUMB_15__5_,
         SUMB_15__4_, SUMB_15__3_, SUMB_15__2_, SUMB_15__1_, SUMB_15__0_,
         SUMB_14__14_, SUMB_14__13_, SUMB_14__12_, SUMB_14__11_, SUMB_14__10_,
         SUMB_14__9_, SUMB_14__8_, SUMB_14__7_, SUMB_14__6_, SUMB_14__5_,
         SUMB_14__4_, SUMB_14__3_, SUMB_14__2_, SUMB_14__1_, SUMB_13__14_,
         SUMB_13__13_, SUMB_13__12_, SUMB_13__11_, SUMB_13__10_, SUMB_13__9_,
         SUMB_13__8_, SUMB_13__7_, SUMB_13__6_, SUMB_13__5_, SUMB_13__4_,
         SUMB_13__3_, SUMB_13__2_, SUMB_13__1_, SUMB_12__14_, SUMB_12__13_,
         SUMB_12__12_, SUMB_12__11_, SUMB_12__10_, SUMB_12__9_, SUMB_12__8_,
         SUMB_12__7_, SUMB_12__6_, SUMB_12__5_, SUMB_12__4_, SUMB_12__3_,
         SUMB_12__2_, SUMB_12__1_, SUMB_11__14_, SUMB_11__13_, SUMB_11__12_,
         SUMB_11__11_, SUMB_11__10_, SUMB_11__9_, SUMB_11__8_, SUMB_11__7_,
         SUMB_11__6_, SUMB_11__5_, SUMB_11__4_, SUMB_11__3_, SUMB_11__2_,
         SUMB_11__1_, SUMB_10__14_, SUMB_10__13_, SUMB_10__12_, SUMB_10__11_,
         SUMB_10__10_, SUMB_10__9_, SUMB_10__8_, SUMB_10__7_, SUMB_10__6_,
         SUMB_10__5_, SUMB_10__4_, SUMB_10__3_, SUMB_10__2_, SUMB_10__1_,
         SUMB_9__14_, SUMB_9__13_, SUMB_9__12_, SUMB_9__11_, SUMB_9__10_,
         SUMB_9__9_, SUMB_9__8_, SUMB_9__7_, SUMB_9__6_, SUMB_9__5_,
         SUMB_9__4_, SUMB_9__3_, SUMB_9__2_, SUMB_9__1_, SUMB_8__14_,
         SUMB_8__13_, SUMB_8__12_, SUMB_8__11_, SUMB_8__10_, SUMB_8__9_,
         SUMB_8__8_, SUMB_8__7_, SUMB_8__6_, SUMB_8__5_, SUMB_8__4_,
         SUMB_8__3_, SUMB_8__2_, SUMB_8__1_, SUMB_7__14_, SUMB_7__13_,
         SUMB_7__12_, SUMB_7__11_, SUMB_7__10_, SUMB_7__9_, SUMB_7__8_,
         SUMB_7__7_, SUMB_7__6_, SUMB_7__5_, SUMB_7__4_, SUMB_7__3_,
         SUMB_7__2_, SUMB_7__1_, SUMB_6__14_, SUMB_6__13_, SUMB_6__12_,
         SUMB_6__11_, SUMB_6__10_, SUMB_6__9_, SUMB_6__8_, SUMB_6__7_,
         SUMB_6__6_, SUMB_6__5_, SUMB_6__4_, SUMB_6__3_, SUMB_6__2_,
         SUMB_6__1_, SUMB_5__14_, SUMB_5__13_, SUMB_5__12_, SUMB_5__11_,
         SUMB_5__10_, SUMB_5__9_, SUMB_5__8_, SUMB_5__7_, SUMB_5__6_,
         SUMB_5__5_, SUMB_5__4_, SUMB_5__3_, SUMB_5__2_, SUMB_5__1_,
         SUMB_4__14_, SUMB_4__13_, SUMB_4__12_, SUMB_4__11_, SUMB_4__10_,
         SUMB_4__9_, SUMB_4__8_, SUMB_4__7_, SUMB_4__6_, SUMB_4__5_,
         SUMB_4__4_, SUMB_4__3_, SUMB_4__2_, SUMB_4__1_, SUMB_3__14_,
         SUMB_3__13_, SUMB_3__12_, SUMB_3__11_, SUMB_3__10_, SUMB_3__9_,
         SUMB_3__8_, SUMB_3__7_, SUMB_3__6_, SUMB_3__5_, SUMB_3__4_,
         SUMB_3__3_, SUMB_3__2_, SUMB_3__1_, SUMB_2__14_, SUMB_2__13_,
         SUMB_2__12_, SUMB_2__11_, SUMB_2__10_, SUMB_2__9_, SUMB_2__8_,
         SUMB_2__7_, SUMB_2__6_, SUMB_2__5_, SUMB_2__4_, SUMB_2__3_,
         SUMB_2__2_, SUMB_2__1_, SUMB_1__14_, SUMB_1__13_, SUMB_1__12_,
         SUMB_1__11_, SUMB_1__10_, SUMB_1__9_, SUMB_1__8_, SUMB_1__7_,
         SUMB_1__6_, SUMB_1__5_, SUMB_1__4_, SUMB_1__3_, SUMB_1__2_,
         SUMB_1__1_, A1_28_, A1_27_, A1_26_, A1_25_, A1_24_, A1_23_, A1_22_,
         A1_21_, A1_20_, A1_19_, A1_18_, A1_17_, A1_16_, A1_15_, A1_14_,
         A1_12_, A1_11_, A1_10_, A1_9_, A1_8_, A1_7_, A1_6_, A1_5_, A1_4_,
         A1_3_, A1_2_, A1_1_, A1_0_, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80;

  ARITHMETIC_UNIT_DW01_add_1 FS_1 ( .A({1'b0, A1_28_, A1_27_, A1_26_, A1_25_, 
        A1_24_, A1_23_, A1_22_, A1_21_, A1_20_, A1_19_, A1_18_, A1_17_, A1_16_, 
        A1_15_, A1_14_, SUMB_15__0_, A1_12_, A1_11_, A1_10_, A1_9_, A1_8_, 
        A1_7_, A1_6_, A1_5_, A1_4_, A1_3_, A1_2_, A1_1_, A1_0_}), .B({n18, n31, 
        n30, n32, n29, n28, n25, n27, n24, n26, n23, n22, n19, n21, n20, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[31:2]) );
  ADDFX2M S5_14 ( .A(ab_15__14_), .B(CARRYB_14__14_), .CI(ab_14__15_), .CO(
        CARRYB_15__14_), .S(SUMB_15__14_) );
  ADDFX2M S3_14_14 ( .A(ab_14__14_), .B(CARRYB_13__14_), .CI(ab_13__15_), .CO(
        CARRYB_14__14_), .S(SUMB_14__14_) );
  ADDFX2M S2_14_13 ( .A(ab_14__13_), .B(CARRYB_13__13_), .CI(SUMB_13__14_), 
        .CO(CARRYB_14__13_), .S(SUMB_14__13_) );
  ADDFX2M S3_13_14 ( .A(ab_13__14_), .B(CARRYB_12__14_), .CI(ab_12__15_), .CO(
        CARRYB_13__14_), .S(SUMB_13__14_) );
  ADDFX2M S3_12_14 ( .A(ab_12__14_), .B(CARRYB_11__14_), .CI(ab_11__15_), .CO(
        CARRYB_12__14_), .S(SUMB_12__14_) );
  ADDFX2M S3_11_14 ( .A(ab_11__14_), .B(CARRYB_10__14_), .CI(ab_10__15_), .CO(
        CARRYB_11__14_), .S(SUMB_11__14_) );
  ADDFX2M S3_10_14 ( .A(ab_10__14_), .B(CARRYB_9__14_), .CI(ab_9__15_), .CO(
        CARRYB_10__14_), .S(SUMB_10__14_) );
  ADDFX2M S4_13 ( .A(ab_15__13_), .B(CARRYB_14__13_), .CI(SUMB_14__14_), .CO(
        CARRYB_15__13_), .S(SUMB_15__13_) );
  ADDFX2M S4_12 ( .A(ab_15__12_), .B(CARRYB_14__12_), .CI(SUMB_14__13_), .CO(
        CARRYB_15__12_), .S(SUMB_15__12_) );
  ADDFX2M S2_14_12 ( .A(ab_14__12_), .B(CARRYB_13__12_), .CI(SUMB_13__13_), 
        .CO(CARRYB_14__12_), .S(SUMB_14__12_) );
  ADDFX2M S2_13_13 ( .A(ab_13__13_), .B(CARRYB_12__13_), .CI(SUMB_12__14_), 
        .CO(CARRYB_13__13_), .S(SUMB_13__13_) );
  ADDFX2M S2_14_11 ( .A(ab_14__11_), .B(CARRYB_13__11_), .CI(SUMB_13__12_), 
        .CO(CARRYB_14__11_), .S(SUMB_14__11_) );
  ADDFX2M S2_13_12 ( .A(ab_13__12_), .B(CARRYB_12__12_), .CI(SUMB_12__13_), 
        .CO(CARRYB_13__12_), .S(SUMB_13__12_) );
  ADDFX2M S2_14_10 ( .A(ab_14__10_), .B(CARRYB_13__10_), .CI(SUMB_13__11_), 
        .CO(CARRYB_14__10_), .S(SUMB_14__10_) );
  ADDFX2M S2_12_13 ( .A(ab_12__13_), .B(CARRYB_11__13_), .CI(SUMB_11__14_), 
        .CO(CARRYB_12__13_), .S(SUMB_12__13_) );
  ADDFX2M S2_13_11 ( .A(ab_13__11_), .B(CARRYB_12__11_), .CI(SUMB_12__12_), 
        .CO(CARRYB_13__11_), .S(SUMB_13__11_) );
  ADDFX2M S2_14_9 ( .A(ab_14__9_), .B(CARRYB_13__9_), .CI(SUMB_13__10_), .CO(
        CARRYB_14__9_), .S(SUMB_14__9_) );
  ADDFX2M S2_12_12 ( .A(ab_12__12_), .B(CARRYB_11__12_), .CI(SUMB_11__13_), 
        .CO(CARRYB_12__12_), .S(SUMB_12__12_) );
  ADDFX2M S2_13_10 ( .A(ab_13__10_), .B(CARRYB_12__10_), .CI(SUMB_12__11_), 
        .CO(CARRYB_13__10_), .S(SUMB_13__10_) );
  ADDFX2M S2_14_8 ( .A(ab_14__8_), .B(CARRYB_13__8_), .CI(SUMB_13__9_), .CO(
        CARRYB_14__8_), .S(SUMB_14__8_) );
  ADDFX2M S2_11_13 ( .A(ab_11__13_), .B(CARRYB_10__13_), .CI(SUMB_10__14_), 
        .CO(CARRYB_11__13_), .S(SUMB_11__13_) );
  ADDFX2M S2_12_11 ( .A(ab_12__11_), .B(CARRYB_11__11_), .CI(SUMB_11__12_), 
        .CO(CARRYB_12__11_), .S(SUMB_12__11_) );
  ADDFX2M S2_13_9 ( .A(ab_13__9_), .B(CARRYB_12__9_), .CI(SUMB_12__10_), .CO(
        CARRYB_13__9_), .S(SUMB_13__9_) );
  ADDFX2M S2_11_12 ( .A(ab_11__12_), .B(CARRYB_10__12_), .CI(SUMB_10__13_), 
        .CO(CARRYB_11__12_), .S(SUMB_11__12_) );
  ADDFX2M S2_12_10 ( .A(ab_12__10_), .B(CARRYB_11__10_), .CI(SUMB_11__11_), 
        .CO(CARRYB_12__10_), .S(SUMB_12__10_) );
  ADDFX2M S2_10_13 ( .A(ab_10__13_), .B(CARRYB_9__13_), .CI(SUMB_9__14_), .CO(
        CARRYB_10__13_), .S(SUMB_10__13_) );
  ADDFX2M S2_11_11 ( .A(ab_11__11_), .B(CARRYB_10__11_), .CI(SUMB_10__12_), 
        .CO(CARRYB_11__11_), .S(SUMB_11__11_) );
  ADDFX2M S3_9_14 ( .A(ab_9__14_), .B(CARRYB_8__14_), .CI(ab_8__15_), .CO(
        CARRYB_9__14_), .S(SUMB_9__14_) );
  ADDFX2M S2_10_12 ( .A(ab_10__12_), .B(CARRYB_9__12_), .CI(SUMB_9__13_), .CO(
        CARRYB_10__12_), .S(SUMB_10__12_) );
  ADDFX2M S2_9_13 ( .A(ab_9__13_), .B(CARRYB_8__13_), .CI(SUMB_8__14_), .CO(
        CARRYB_9__13_), .S(SUMB_9__13_) );
  ADDFX2M S2_10_11 ( .A(ab_10__11_), .B(CARRYB_9__11_), .CI(SUMB_9__12_), .CO(
        CARRYB_10__11_), .S(SUMB_10__11_) );
  ADDFX2M S3_8_14 ( .A(ab_8__14_), .B(CARRYB_7__14_), .CI(ab_7__15_), .CO(
        CARRYB_8__14_), .S(SUMB_8__14_) );
  ADDFX2M S2_9_12 ( .A(ab_9__12_), .B(CARRYB_8__12_), .CI(SUMB_8__13_), .CO(
        CARRYB_9__12_), .S(SUMB_9__12_) );
  ADDFX2M S2_8_13 ( .A(ab_8__13_), .B(CARRYB_7__13_), .CI(SUMB_7__14_), .CO(
        CARRYB_8__13_), .S(SUMB_8__13_) );
  ADDFX2M S3_7_14 ( .A(ab_7__14_), .B(CARRYB_6__14_), .CI(ab_6__15_), .CO(
        CARRYB_7__14_), .S(SUMB_7__14_) );
  ADDFX2M S3_6_14 ( .A(ab_6__14_), .B(CARRYB_5__14_), .CI(ab_5__15_), .CO(
        CARRYB_6__14_), .S(SUMB_6__14_) );
  ADDFX2M S4_11 ( .A(ab_15__11_), .B(CARRYB_14__11_), .CI(SUMB_14__12_), .CO(
        CARRYB_15__11_), .S(SUMB_15__11_) );
  ADDFX2M S4_10 ( .A(ab_15__10_), .B(CARRYB_14__10_), .CI(SUMB_14__11_), .CO(
        CARRYB_15__10_), .S(SUMB_15__10_) );
  ADDFX2M S4_9 ( .A(ab_15__9_), .B(CARRYB_14__9_), .CI(SUMB_14__10_), .CO(
        CARRYB_15__9_), .S(SUMB_15__9_) );
  ADDFX2M S4_8 ( .A(ab_15__8_), .B(CARRYB_14__8_), .CI(SUMB_14__9_), .CO(
        CARRYB_15__8_), .S(SUMB_15__8_) );
  ADDFX2M S4_7 ( .A(ab_15__7_), .B(CARRYB_14__7_), .CI(SUMB_14__8_), .CO(
        CARRYB_15__7_), .S(SUMB_15__7_) );
  ADDFX2M S3_2_14 ( .A(ab_2__14_), .B(n17), .CI(ab_1__15_), .CO(CARRYB_2__14_), 
        .S(SUMB_2__14_) );
  ADDFX2M S1_14_0 ( .A(ab_14__0_), .B(CARRYB_13__0_), .CI(SUMB_13__1_), .CO(
        CARRYB_14__0_), .S(A1_12_) );
  ADDFX2M S1_13_0 ( .A(ab_13__0_), .B(CARRYB_12__0_), .CI(SUMB_12__1_), .CO(
        CARRYB_13__0_), .S(A1_11_) );
  ADDFX2M S1_12_0 ( .A(ab_12__0_), .B(CARRYB_11__0_), .CI(SUMB_11__1_), .CO(
        CARRYB_12__0_), .S(A1_10_) );
  ADDFX2M S1_11_0 ( .A(ab_11__0_), .B(CARRYB_10__0_), .CI(SUMB_10__1_), .CO(
        CARRYB_11__0_), .S(A1_9_) );
  ADDFX2M S1_10_0 ( .A(ab_10__0_), .B(CARRYB_9__0_), .CI(SUMB_9__1_), .CO(
        CARRYB_10__0_), .S(A1_8_) );
  ADDFX2M S1_9_0 ( .A(ab_9__0_), .B(CARRYB_8__0_), .CI(SUMB_8__1_), .CO(
        CARRYB_9__0_), .S(A1_7_) );
  ADDFX2M S1_8_0 ( .A(ab_8__0_), .B(CARRYB_7__0_), .CI(SUMB_7__1_), .CO(
        CARRYB_8__0_), .S(A1_6_) );
  ADDFX2M S1_7_0 ( .A(ab_7__0_), .B(CARRYB_6__0_), .CI(SUMB_6__1_), .CO(
        CARRYB_7__0_), .S(A1_5_) );
  ADDFX2M S1_6_0 ( .A(ab_6__0_), .B(CARRYB_5__0_), .CI(SUMB_5__1_), .CO(
        CARRYB_6__0_), .S(A1_4_) );
  ADDFX2M S1_5_0 ( .A(ab_5__0_), .B(CARRYB_4__0_), .CI(SUMB_4__1_), .CO(
        CARRYB_5__0_), .S(A1_3_) );
  ADDFX2M S1_4_0 ( .A(ab_4__0_), .B(CARRYB_3__0_), .CI(SUMB_3__1_), .CO(
        CARRYB_4__0_), .S(A1_2_) );
  ADDFX2M S1_3_0 ( .A(ab_3__0_), .B(CARRYB_2__0_), .CI(SUMB_2__1_), .CO(
        CARRYB_3__0_), .S(A1_1_) );
  ADDFX2M S2_14_1 ( .A(ab_14__1_), .B(CARRYB_13__1_), .CI(SUMB_13__2_), .CO(
        CARRYB_14__1_), .S(SUMB_14__1_) );
  ADDFX2M S2_13_1 ( .A(ab_13__1_), .B(CARRYB_12__1_), .CI(SUMB_12__2_), .CO(
        CARRYB_13__1_), .S(SUMB_13__1_) );
  ADDFX2M S2_12_1 ( .A(ab_12__1_), .B(CARRYB_11__1_), .CI(SUMB_11__2_), .CO(
        CARRYB_12__1_), .S(SUMB_12__1_) );
  ADDFX2M S2_11_1 ( .A(ab_11__1_), .B(CARRYB_10__1_), .CI(SUMB_10__2_), .CO(
        CARRYB_11__1_), .S(SUMB_11__1_) );
  ADDFX2M S2_10_1 ( .A(ab_10__1_), .B(CARRYB_9__1_), .CI(SUMB_9__2_), .CO(
        CARRYB_10__1_), .S(SUMB_10__1_) );
  ADDFX2M S2_9_1 ( .A(ab_9__1_), .B(CARRYB_8__1_), .CI(SUMB_8__2_), .CO(
        CARRYB_9__1_), .S(SUMB_9__1_) );
  ADDFX2M S2_8_1 ( .A(ab_8__1_), .B(CARRYB_7__1_), .CI(SUMB_7__2_), .CO(
        CARRYB_8__1_), .S(SUMB_8__1_) );
  ADDFX2M S2_7_1 ( .A(ab_7__1_), .B(CARRYB_6__1_), .CI(SUMB_6__2_), .CO(
        CARRYB_7__1_), .S(SUMB_7__1_) );
  ADDFX2M S2_6_1 ( .A(ab_6__1_), .B(CARRYB_5__1_), .CI(SUMB_5__2_), .CO(
        CARRYB_6__1_), .S(SUMB_6__1_) );
  ADDFX2M S2_5_1 ( .A(ab_5__1_), .B(CARRYB_4__1_), .CI(SUMB_4__2_), .CO(
        CARRYB_5__1_), .S(SUMB_5__1_) );
  ADDFX2M S2_4_1 ( .A(ab_4__1_), .B(CARRYB_3__1_), .CI(SUMB_3__2_), .CO(
        CARRYB_4__1_), .S(SUMB_4__1_) );
  ADDFX2M S2_3_1 ( .A(ab_3__1_), .B(CARRYB_2__1_), .CI(SUMB_2__2_), .CO(
        CARRYB_3__1_), .S(SUMB_3__1_) );
  ADDFX2M S2_14_2 ( .A(ab_14__2_), .B(CARRYB_13__2_), .CI(SUMB_13__3_), .CO(
        CARRYB_14__2_), .S(SUMB_14__2_) );
  ADDFX2M S2_13_3 ( .A(ab_13__3_), .B(CARRYB_12__3_), .CI(SUMB_12__4_), .CO(
        CARRYB_13__3_), .S(SUMB_13__3_) );
  ADDFX2M S2_13_2 ( .A(ab_13__2_), .B(CARRYB_12__2_), .CI(SUMB_12__3_), .CO(
        CARRYB_13__2_), .S(SUMB_13__2_) );
  ADDFX2M S2_12_4 ( .A(ab_12__4_), .B(CARRYB_11__4_), .CI(SUMB_11__5_), .CO(
        CARRYB_12__4_), .S(SUMB_12__4_) );
  ADDFX2M S2_12_3 ( .A(ab_12__3_), .B(CARRYB_11__3_), .CI(SUMB_11__4_), .CO(
        CARRYB_12__3_), .S(SUMB_12__3_) );
  ADDFX2M S2_12_2 ( .A(ab_12__2_), .B(CARRYB_11__2_), .CI(SUMB_11__3_), .CO(
        CARRYB_12__2_), .S(SUMB_12__2_) );
  ADDFX2M S2_11_5 ( .A(ab_11__5_), .B(CARRYB_10__5_), .CI(SUMB_10__6_), .CO(
        CARRYB_11__5_), .S(SUMB_11__5_) );
  ADDFX2M S2_11_4 ( .A(ab_11__4_), .B(CARRYB_10__4_), .CI(SUMB_10__5_), .CO(
        CARRYB_11__4_), .S(SUMB_11__4_) );
  ADDFX2M S2_11_3 ( .A(ab_11__3_), .B(CARRYB_10__3_), .CI(SUMB_10__4_), .CO(
        CARRYB_11__3_), .S(SUMB_11__3_) );
  ADDFX2M S2_11_2 ( .A(ab_11__2_), .B(CARRYB_10__2_), .CI(SUMB_10__3_), .CO(
        CARRYB_11__2_), .S(SUMB_11__2_) );
  ADDFX2M S2_10_6 ( .A(ab_10__6_), .B(CARRYB_9__6_), .CI(SUMB_9__7_), .CO(
        CARRYB_10__6_), .S(SUMB_10__6_) );
  ADDFX2M S2_10_5 ( .A(ab_10__5_), .B(CARRYB_9__5_), .CI(SUMB_9__6_), .CO(
        CARRYB_10__5_), .S(SUMB_10__5_) );
  ADDFX2M S2_10_4 ( .A(ab_10__4_), .B(CARRYB_9__4_), .CI(SUMB_9__5_), .CO(
        CARRYB_10__4_), .S(SUMB_10__4_) );
  ADDFX2M S2_10_3 ( .A(ab_10__3_), .B(CARRYB_9__3_), .CI(SUMB_9__4_), .CO(
        CARRYB_10__3_), .S(SUMB_10__3_) );
  ADDFX2M S2_10_2 ( .A(ab_10__2_), .B(CARRYB_9__2_), .CI(SUMB_9__3_), .CO(
        CARRYB_10__2_), .S(SUMB_10__2_) );
  ADDFX2M S2_9_7 ( .A(ab_9__7_), .B(CARRYB_8__7_), .CI(SUMB_8__8_), .CO(
        CARRYB_9__7_), .S(SUMB_9__7_) );
  ADDFX2M S2_9_6 ( .A(ab_9__6_), .B(CARRYB_8__6_), .CI(SUMB_8__7_), .CO(
        CARRYB_9__6_), .S(SUMB_9__6_) );
  ADDFX2M S2_9_5 ( .A(ab_9__5_), .B(CARRYB_8__5_), .CI(SUMB_8__6_), .CO(
        CARRYB_9__5_), .S(SUMB_9__5_) );
  ADDFX2M S2_9_4 ( .A(ab_9__4_), .B(CARRYB_8__4_), .CI(SUMB_8__5_), .CO(
        CARRYB_9__4_), .S(SUMB_9__4_) );
  ADDFX2M S2_9_3 ( .A(ab_9__3_), .B(CARRYB_8__3_), .CI(SUMB_8__4_), .CO(
        CARRYB_9__3_), .S(SUMB_9__3_) );
  ADDFX2M S2_9_2 ( .A(ab_9__2_), .B(CARRYB_8__2_), .CI(SUMB_8__3_), .CO(
        CARRYB_9__2_), .S(SUMB_9__2_) );
  ADDFX2M S2_8_8 ( .A(ab_8__8_), .B(CARRYB_7__8_), .CI(SUMB_7__9_), .CO(
        CARRYB_8__8_), .S(SUMB_8__8_) );
  ADDFX2M S2_8_7 ( .A(ab_8__7_), .B(CARRYB_7__7_), .CI(SUMB_7__8_), .CO(
        CARRYB_8__7_), .S(SUMB_8__7_) );
  ADDFX2M S2_8_6 ( .A(ab_8__6_), .B(CARRYB_7__6_), .CI(SUMB_7__7_), .CO(
        CARRYB_8__6_), .S(SUMB_8__6_) );
  ADDFX2M S2_8_5 ( .A(ab_8__5_), .B(CARRYB_7__5_), .CI(SUMB_7__6_), .CO(
        CARRYB_8__5_), .S(SUMB_8__5_) );
  ADDFX2M S2_8_4 ( .A(ab_8__4_), .B(CARRYB_7__4_), .CI(SUMB_7__5_), .CO(
        CARRYB_8__4_), .S(SUMB_8__4_) );
  ADDFX2M S2_8_3 ( .A(ab_8__3_), .B(CARRYB_7__3_), .CI(SUMB_7__4_), .CO(
        CARRYB_8__3_), .S(SUMB_8__3_) );
  ADDFX2M S2_8_2 ( .A(ab_8__2_), .B(CARRYB_7__2_), .CI(SUMB_7__3_), .CO(
        CARRYB_8__2_), .S(SUMB_8__2_) );
  ADDFX2M S2_7_9 ( .A(ab_7__9_), .B(CARRYB_6__9_), .CI(SUMB_6__10_), .CO(
        CARRYB_7__9_), .S(SUMB_7__9_) );
  ADDFX2M S2_7_8 ( .A(ab_7__8_), .B(CARRYB_6__8_), .CI(SUMB_6__9_), .CO(
        CARRYB_7__8_), .S(SUMB_7__8_) );
  ADDFX2M S2_7_7 ( .A(ab_7__7_), .B(CARRYB_6__7_), .CI(SUMB_6__8_), .CO(
        CARRYB_7__7_), .S(SUMB_7__7_) );
  ADDFX2M S2_7_6 ( .A(ab_7__6_), .B(CARRYB_6__6_), .CI(SUMB_6__7_), .CO(
        CARRYB_7__6_), .S(SUMB_7__6_) );
  ADDFX2M S2_7_5 ( .A(ab_7__5_), .B(CARRYB_6__5_), .CI(SUMB_6__6_), .CO(
        CARRYB_7__5_), .S(SUMB_7__5_) );
  ADDFX2M S2_7_4 ( .A(ab_7__4_), .B(CARRYB_6__4_), .CI(SUMB_6__5_), .CO(
        CARRYB_7__4_), .S(SUMB_7__4_) );
  ADDFX2M S2_7_3 ( .A(ab_7__3_), .B(CARRYB_6__3_), .CI(SUMB_6__4_), .CO(
        CARRYB_7__3_), .S(SUMB_7__3_) );
  ADDFX2M S2_7_2 ( .A(ab_7__2_), .B(CARRYB_6__2_), .CI(SUMB_6__3_), .CO(
        CARRYB_7__2_), .S(SUMB_7__2_) );
  ADDFX2M S2_6_10 ( .A(ab_6__10_), .B(CARRYB_5__10_), .CI(SUMB_5__11_), .CO(
        CARRYB_6__10_), .S(SUMB_6__10_) );
  ADDFX2M S2_6_9 ( .A(ab_6__9_), .B(CARRYB_5__9_), .CI(SUMB_5__10_), .CO(
        CARRYB_6__9_), .S(SUMB_6__9_) );
  ADDFX2M S2_6_8 ( .A(ab_6__8_), .B(CARRYB_5__8_), .CI(SUMB_5__9_), .CO(
        CARRYB_6__8_), .S(SUMB_6__8_) );
  ADDFX2M S2_6_7 ( .A(ab_6__7_), .B(CARRYB_5__7_), .CI(SUMB_5__8_), .CO(
        CARRYB_6__7_), .S(SUMB_6__7_) );
  ADDFX2M S2_6_6 ( .A(ab_6__6_), .B(CARRYB_5__6_), .CI(SUMB_5__7_), .CO(
        CARRYB_6__6_), .S(SUMB_6__6_) );
  ADDFX2M S2_6_5 ( .A(ab_6__5_), .B(CARRYB_5__5_), .CI(SUMB_5__6_), .CO(
        CARRYB_6__5_), .S(SUMB_6__5_) );
  ADDFX2M S2_6_4 ( .A(ab_6__4_), .B(CARRYB_5__4_), .CI(SUMB_5__5_), .CO(
        CARRYB_6__4_), .S(SUMB_6__4_) );
  ADDFX2M S2_6_3 ( .A(ab_6__3_), .B(CARRYB_5__3_), .CI(SUMB_5__4_), .CO(
        CARRYB_6__3_), .S(SUMB_6__3_) );
  ADDFX2M S2_6_2 ( .A(ab_6__2_), .B(CARRYB_5__2_), .CI(SUMB_5__3_), .CO(
        CARRYB_6__2_), .S(SUMB_6__2_) );
  ADDFX2M S2_5_11 ( .A(ab_5__11_), .B(CARRYB_4__11_), .CI(SUMB_4__12_), .CO(
        CARRYB_5__11_), .S(SUMB_5__11_) );
  ADDFX2M S2_5_10 ( .A(ab_5__10_), .B(CARRYB_4__10_), .CI(SUMB_4__11_), .CO(
        CARRYB_5__10_), .S(SUMB_5__10_) );
  ADDFX2M S2_5_8 ( .A(ab_5__8_), .B(CARRYB_4__8_), .CI(SUMB_4__9_), .CO(
        CARRYB_5__8_), .S(SUMB_5__8_) );
  ADDFX2M S2_5_6 ( .A(ab_5__6_), .B(CARRYB_4__6_), .CI(SUMB_4__7_), .CO(
        CARRYB_5__6_), .S(SUMB_5__6_) );
  ADDFX2M S2_5_4 ( .A(ab_5__4_), .B(CARRYB_4__4_), .CI(SUMB_4__5_), .CO(
        CARRYB_5__4_), .S(SUMB_5__4_) );
  ADDFX2M S2_5_3 ( .A(ab_5__3_), .B(CARRYB_4__3_), .CI(SUMB_4__4_), .CO(
        CARRYB_5__3_), .S(SUMB_5__3_) );
  ADDFX2M S2_5_2 ( .A(ab_5__2_), .B(CARRYB_4__2_), .CI(SUMB_4__3_), .CO(
        CARRYB_5__2_), .S(SUMB_5__2_) );
  ADDFX2M S2_4_12 ( .A(ab_4__12_), .B(CARRYB_3__12_), .CI(SUMB_3__13_), .CO(
        CARRYB_4__12_), .S(SUMB_4__12_) );
  ADDFX2M S2_4_10 ( .A(ab_4__10_), .B(CARRYB_3__10_), .CI(SUMB_3__11_), .CO(
        CARRYB_4__10_), .S(SUMB_4__10_) );
  ADDFX2M S2_4_8 ( .A(ab_4__8_), .B(CARRYB_3__8_), .CI(SUMB_3__9_), .CO(
        CARRYB_4__8_), .S(SUMB_4__8_) );
  ADDFX2M S2_4_6 ( .A(ab_4__6_), .B(CARRYB_3__6_), .CI(SUMB_3__7_), .CO(
        CARRYB_4__6_), .S(SUMB_4__6_) );
  ADDFX2M S2_4_4 ( .A(ab_4__4_), .B(CARRYB_3__4_), .CI(SUMB_3__5_), .CO(
        CARRYB_4__4_), .S(SUMB_4__4_) );
  ADDFX2M S2_4_2 ( .A(ab_4__2_), .B(CARRYB_3__2_), .CI(SUMB_3__3_), .CO(
        CARRYB_4__2_), .S(SUMB_4__2_) );
  ADDFX2M S2_3_13 ( .A(ab_3__13_), .B(CARRYB_2__13_), .CI(SUMB_2__14_), .CO(
        CARRYB_3__13_), .S(SUMB_3__13_) );
  ADDFX2M S2_3_12 ( .A(ab_3__12_), .B(CARRYB_2__12_), .CI(SUMB_2__13_), .CO(
        CARRYB_3__12_), .S(SUMB_3__12_) );
  ADDFX2M S2_3_10 ( .A(ab_3__10_), .B(CARRYB_2__10_), .CI(SUMB_2__11_), .CO(
        CARRYB_3__10_), .S(SUMB_3__10_) );
  ADDFX2M S2_3_8 ( .A(ab_3__8_), .B(CARRYB_2__8_), .CI(SUMB_2__9_), .CO(
        CARRYB_3__8_), .S(SUMB_3__8_) );
  ADDFX2M S2_3_6 ( .A(ab_3__6_), .B(CARRYB_2__6_), .CI(SUMB_2__7_), .CO(
        CARRYB_3__6_), .S(SUMB_3__6_) );
  ADDFX2M S2_3_4 ( .A(ab_3__4_), .B(CARRYB_2__4_), .CI(SUMB_2__5_), .CO(
        CARRYB_3__4_), .S(SUMB_3__4_) );
  ADDFX2M S2_3_2 ( .A(ab_3__2_), .B(CARRYB_2__2_), .CI(SUMB_2__3_), .CO(
        CARRYB_3__2_), .S(SUMB_3__2_) );
  ADDFX2M S1_2_0 ( .A(ab_2__0_), .B(n8), .CI(SUMB_1__1_), .CO(CARRYB_2__0_), 
        .S(A1_0_) );
  ADDFX2M S2_2_1 ( .A(ab_2__1_), .B(n7), .CI(SUMB_1__2_), .CO(CARRYB_2__1_), 
        .S(SUMB_2__1_) );
  ADDFX2M S2_14_7 ( .A(ab_14__7_), .B(CARRYB_13__7_), .CI(SUMB_13__8_), .CO(
        CARRYB_14__7_), .S(SUMB_14__7_) );
  ADDFX2M S2_13_8 ( .A(ab_13__8_), .B(CARRYB_12__8_), .CI(SUMB_12__9_), .CO(
        CARRYB_13__8_), .S(SUMB_13__8_) );
  ADDFX2M S2_14_6 ( .A(ab_14__6_), .B(CARRYB_13__6_), .CI(SUMB_13__7_), .CO(
        CARRYB_14__6_), .S(SUMB_14__6_) );
  ADDFX2M S2_12_9 ( .A(ab_12__9_), .B(CARRYB_11__9_), .CI(SUMB_11__10_), .CO(
        CARRYB_12__9_), .S(SUMB_12__9_) );
  ADDFX2M S2_13_7 ( .A(ab_13__7_), .B(CARRYB_12__7_), .CI(SUMB_12__8_), .CO(
        CARRYB_13__7_), .S(SUMB_13__7_) );
  ADDFX2M S2_14_5 ( .A(ab_14__5_), .B(CARRYB_13__5_), .CI(SUMB_13__6_), .CO(
        CARRYB_14__5_), .S(SUMB_14__5_) );
  ADDFX2M S2_11_10 ( .A(ab_11__10_), .B(CARRYB_10__10_), .CI(SUMB_10__11_), 
        .CO(CARRYB_11__10_), .S(SUMB_11__10_) );
  ADDFX2M S2_12_8 ( .A(ab_12__8_), .B(CARRYB_11__8_), .CI(SUMB_11__9_), .CO(
        CARRYB_12__8_), .S(SUMB_12__8_) );
  ADDFX2M S2_13_6 ( .A(ab_13__6_), .B(CARRYB_12__6_), .CI(SUMB_12__7_), .CO(
        CARRYB_13__6_), .S(SUMB_13__6_) );
  ADDFX2M S2_14_4 ( .A(ab_14__4_), .B(CARRYB_13__4_), .CI(SUMB_13__5_), .CO(
        CARRYB_14__4_), .S(SUMB_14__4_) );
  ADDFX2M S2_11_9 ( .A(ab_11__9_), .B(CARRYB_10__9_), .CI(SUMB_10__10_), .CO(
        CARRYB_11__9_), .S(SUMB_11__9_) );
  ADDFX2M S2_12_7 ( .A(ab_12__7_), .B(CARRYB_11__7_), .CI(SUMB_11__8_), .CO(
        CARRYB_12__7_), .S(SUMB_12__7_) );
  ADDFX2M S2_13_5 ( .A(ab_13__5_), .B(CARRYB_12__5_), .CI(SUMB_12__6_), .CO(
        CARRYB_13__5_), .S(SUMB_13__5_) );
  ADDFX2M S2_14_3 ( .A(ab_14__3_), .B(CARRYB_13__3_), .CI(SUMB_13__4_), .CO(
        CARRYB_14__3_), .S(SUMB_14__3_) );
  ADDFX2M S2_10_10 ( .A(ab_10__10_), .B(CARRYB_9__10_), .CI(SUMB_9__11_), .CO(
        CARRYB_10__10_), .S(SUMB_10__10_) );
  ADDFX2M S2_11_8 ( .A(ab_11__8_), .B(CARRYB_10__8_), .CI(SUMB_10__9_), .CO(
        CARRYB_11__8_), .S(SUMB_11__8_) );
  ADDFX2M S2_12_6 ( .A(ab_12__6_), .B(CARRYB_11__6_), .CI(SUMB_11__7_), .CO(
        CARRYB_12__6_), .S(SUMB_12__6_) );
  ADDFX2M S2_13_4 ( .A(ab_13__4_), .B(CARRYB_12__4_), .CI(SUMB_12__5_), .CO(
        CARRYB_13__4_), .S(SUMB_13__4_) );
  ADDFX2M S2_9_11 ( .A(ab_9__11_), .B(CARRYB_8__11_), .CI(SUMB_8__12_), .CO(
        CARRYB_9__11_), .S(SUMB_9__11_) );
  ADDFX2M S2_10_9 ( .A(ab_10__9_), .B(CARRYB_9__9_), .CI(SUMB_9__10_), .CO(
        CARRYB_10__9_), .S(SUMB_10__9_) );
  ADDFX2M S2_11_7 ( .A(ab_11__7_), .B(CARRYB_10__7_), .CI(SUMB_10__8_), .CO(
        CARRYB_11__7_), .S(SUMB_11__7_) );
  ADDFX2M S2_12_5 ( .A(ab_12__5_), .B(CARRYB_11__5_), .CI(SUMB_11__6_), .CO(
        CARRYB_12__5_), .S(SUMB_12__5_) );
  ADDFX2M S2_8_12 ( .A(ab_8__12_), .B(CARRYB_7__12_), .CI(SUMB_7__13_), .CO(
        CARRYB_8__12_), .S(SUMB_8__12_) );
  ADDFX2M S2_9_10 ( .A(ab_9__10_), .B(CARRYB_8__10_), .CI(SUMB_8__11_), .CO(
        CARRYB_9__10_), .S(SUMB_9__10_) );
  ADDFX2M S2_10_8 ( .A(ab_10__8_), .B(CARRYB_9__8_), .CI(SUMB_9__9_), .CO(
        CARRYB_10__8_), .S(SUMB_10__8_) );
  ADDFX2M S2_11_6 ( .A(ab_11__6_), .B(CARRYB_10__6_), .CI(SUMB_10__7_), .CO(
        CARRYB_11__6_), .S(SUMB_11__6_) );
  ADDFX2M S2_7_13 ( .A(ab_7__13_), .B(CARRYB_6__13_), .CI(SUMB_6__14_), .CO(
        CARRYB_7__13_), .S(SUMB_7__13_) );
  ADDFX2M S2_8_11 ( .A(ab_8__11_), .B(CARRYB_7__11_), .CI(SUMB_7__12_), .CO(
        CARRYB_8__11_), .S(SUMB_8__11_) );
  ADDFX2M S2_9_9 ( .A(ab_9__9_), .B(CARRYB_8__9_), .CI(SUMB_8__10_), .CO(
        CARRYB_9__9_), .S(SUMB_9__9_) );
  ADDFX2M S2_10_7 ( .A(ab_10__7_), .B(CARRYB_9__7_), .CI(SUMB_9__8_), .CO(
        CARRYB_10__7_), .S(SUMB_10__7_) );
  ADDFX2M S2_7_12 ( .A(ab_7__12_), .B(CARRYB_6__12_), .CI(SUMB_6__13_), .CO(
        CARRYB_7__12_), .S(SUMB_7__12_) );
  ADDFX2M S2_8_10 ( .A(ab_8__10_), .B(CARRYB_7__10_), .CI(SUMB_7__11_), .CO(
        CARRYB_8__10_), .S(SUMB_8__10_) );
  ADDFX2M S2_9_8 ( .A(ab_9__8_), .B(CARRYB_8__8_), .CI(SUMB_8__9_), .CO(
        CARRYB_9__8_), .S(SUMB_9__8_) );
  ADDFX2M S2_6_13 ( .A(ab_6__13_), .B(CARRYB_5__13_), .CI(SUMB_5__14_), .CO(
        CARRYB_6__13_), .S(SUMB_6__13_) );
  ADDFX2M S2_7_11 ( .A(ab_7__11_), .B(CARRYB_6__11_), .CI(SUMB_6__12_), .CO(
        CARRYB_7__11_), .S(SUMB_7__11_) );
  ADDFX2M S2_8_9 ( .A(ab_8__9_), .B(CARRYB_7__9_), .CI(SUMB_7__10_), .CO(
        CARRYB_8__9_), .S(SUMB_8__9_) );
  ADDFX2M S3_5_14 ( .A(ab_5__14_), .B(CARRYB_4__14_), .CI(ab_4__15_), .CO(
        CARRYB_5__14_), .S(SUMB_5__14_) );
  ADDFX2M S2_6_12 ( .A(ab_6__12_), .B(CARRYB_5__12_), .CI(SUMB_5__13_), .CO(
        CARRYB_6__12_), .S(SUMB_6__12_) );
  ADDFX2M S2_7_10 ( .A(ab_7__10_), .B(CARRYB_6__10_), .CI(SUMB_6__11_), .CO(
        CARRYB_7__10_), .S(SUMB_7__10_) );
  ADDFX2M S2_5_13 ( .A(ab_5__13_), .B(CARRYB_4__13_), .CI(SUMB_4__14_), .CO(
        CARRYB_5__13_), .S(SUMB_5__13_) );
  ADDFX2M S2_6_11 ( .A(ab_6__11_), .B(CARRYB_5__11_), .CI(SUMB_5__12_), .CO(
        CARRYB_6__11_), .S(SUMB_6__11_) );
  ADDFX2M S3_4_14 ( .A(ab_4__14_), .B(CARRYB_3__14_), .CI(ab_3__15_), .CO(
        CARRYB_4__14_), .S(SUMB_4__14_) );
  ADDFX2M S2_5_9 ( .A(ab_5__9_), .B(CARRYB_4__9_), .CI(SUMB_4__10_), .CO(
        CARRYB_5__9_), .S(SUMB_5__9_) );
  ADDFX2M S2_5_7 ( .A(ab_5__7_), .B(CARRYB_4__7_), .CI(SUMB_4__8_), .CO(
        CARRYB_5__7_), .S(SUMB_5__7_) );
  ADDFX2M S2_5_5 ( .A(ab_5__5_), .B(CARRYB_4__5_), .CI(SUMB_4__6_), .CO(
        CARRYB_5__5_), .S(SUMB_5__5_) );
  ADDFX2M S2_5_12 ( .A(ab_5__12_), .B(CARRYB_4__12_), .CI(SUMB_4__13_), .CO(
        CARRYB_5__12_), .S(SUMB_5__12_) );
  ADDFX2M S2_4_11 ( .A(ab_4__11_), .B(CARRYB_3__11_), .CI(SUMB_3__12_), .CO(
        CARRYB_4__11_), .S(SUMB_4__11_) );
  ADDFX2M S2_4_9 ( .A(ab_4__9_), .B(CARRYB_3__9_), .CI(SUMB_3__10_), .CO(
        CARRYB_4__9_), .S(SUMB_4__9_) );
  ADDFX2M S2_4_7 ( .A(ab_4__7_), .B(CARRYB_3__7_), .CI(SUMB_3__8_), .CO(
        CARRYB_4__7_), .S(SUMB_4__7_) );
  ADDFX2M S2_4_5 ( .A(ab_4__5_), .B(CARRYB_3__5_), .CI(SUMB_3__6_), .CO(
        CARRYB_4__5_), .S(SUMB_4__5_) );
  ADDFX2M S2_4_3 ( .A(ab_4__3_), .B(CARRYB_3__3_), .CI(SUMB_3__4_), .CO(
        CARRYB_4__3_), .S(SUMB_4__3_) );
  ADDFX2M S2_4_13 ( .A(ab_4__13_), .B(CARRYB_3__13_), .CI(SUMB_3__14_), .CO(
        CARRYB_4__13_), .S(SUMB_4__13_) );
  ADDFX2M S2_3_11 ( .A(ab_3__11_), .B(CARRYB_2__11_), .CI(SUMB_2__12_), .CO(
        CARRYB_3__11_), .S(SUMB_3__11_) );
  ADDFX2M S2_3_9 ( .A(ab_3__9_), .B(CARRYB_2__9_), .CI(SUMB_2__10_), .CO(
        CARRYB_3__9_), .S(SUMB_3__9_) );
  ADDFX2M S2_3_7 ( .A(ab_3__7_), .B(CARRYB_2__7_), .CI(SUMB_2__8_), .CO(
        CARRYB_3__7_), .S(SUMB_3__7_) );
  ADDFX2M S2_3_5 ( .A(ab_3__5_), .B(CARRYB_2__5_), .CI(SUMB_2__6_), .CO(
        CARRYB_3__5_), .S(SUMB_3__5_) );
  ADDFX2M S2_3_3 ( .A(ab_3__3_), .B(CARRYB_2__3_), .CI(SUMB_2__4_), .CO(
        CARRYB_3__3_), .S(SUMB_3__3_) );
  ADDFX2M S3_3_14 ( .A(ab_3__14_), .B(CARRYB_2__14_), .CI(ab_2__15_), .CO(
        CARRYB_3__14_), .S(SUMB_3__14_) );
  ADDFX2M S2_2_13 ( .A(ab_2__13_), .B(n14), .CI(SUMB_1__14_), .CO(
        CARRYB_2__13_), .S(SUMB_2__13_) );
  ADDFX2M S2_2_12 ( .A(ab_2__12_), .B(n16), .CI(SUMB_1__13_), .CO(
        CARRYB_2__12_), .S(SUMB_2__12_) );
  ADDFX2M S2_2_11 ( .A(ab_2__11_), .B(n15), .CI(SUMB_1__12_), .CO(
        CARRYB_2__11_), .S(SUMB_2__11_) );
  ADDFX2M S2_2_10 ( .A(ab_2__10_), .B(n13), .CI(SUMB_1__11_), .CO(
        CARRYB_2__10_), .S(SUMB_2__10_) );
  ADDFX2M S2_2_9 ( .A(ab_2__9_), .B(n12), .CI(SUMB_1__10_), .CO(CARRYB_2__9_), 
        .S(SUMB_2__9_) );
  ADDFX2M S2_2_8 ( .A(ab_2__8_), .B(n11), .CI(SUMB_1__9_), .CO(CARRYB_2__8_), 
        .S(SUMB_2__8_) );
  ADDFX2M S2_2_7 ( .A(ab_2__7_), .B(n10), .CI(SUMB_1__8_), .CO(CARRYB_2__7_), 
        .S(SUMB_2__7_) );
  ADDFX2M S2_2_6 ( .A(ab_2__6_), .B(n9), .CI(SUMB_1__7_), .CO(CARRYB_2__6_), 
        .S(SUMB_2__6_) );
  ADDFX2M S2_2_5 ( .A(ab_2__5_), .B(n6), .CI(SUMB_1__6_), .CO(CARRYB_2__5_), 
        .S(SUMB_2__5_) );
  ADDFX2M S2_2_4 ( .A(ab_2__4_), .B(n5), .CI(SUMB_1__5_), .CO(CARRYB_2__4_), 
        .S(SUMB_2__4_) );
  ADDFX2M S2_2_3 ( .A(ab_2__3_), .B(n4), .CI(SUMB_1__4_), .CO(CARRYB_2__3_), 
        .S(SUMB_2__3_) );
  ADDFX2M S4_0 ( .A(ab_15__0_), .B(CARRYB_14__0_), .CI(SUMB_14__1_), .CO(
        CARRYB_15__0_), .S(SUMB_15__0_) );
  ADDFX2M S4_1 ( .A(ab_15__1_), .B(CARRYB_14__1_), .CI(SUMB_14__2_), .CO(
        CARRYB_15__1_), .S(SUMB_15__1_) );
  ADDFX2M S4_6 ( .A(ab_15__6_), .B(CARRYB_14__6_), .CI(SUMB_14__7_), .CO(
        CARRYB_15__6_), .S(SUMB_15__6_) );
  ADDFX2M S4_5 ( .A(ab_15__5_), .B(CARRYB_14__5_), .CI(SUMB_14__6_), .CO(
        CARRYB_15__5_), .S(SUMB_15__5_) );
  ADDFX2M S4_4 ( .A(ab_15__4_), .B(CARRYB_14__4_), .CI(SUMB_14__5_), .CO(
        CARRYB_15__4_), .S(SUMB_15__4_) );
  ADDFX2M S4_3 ( .A(ab_15__3_), .B(CARRYB_14__3_), .CI(SUMB_14__4_), .CO(
        CARRYB_15__3_), .S(SUMB_15__3_) );
  ADDFX2M S4_2 ( .A(ab_15__2_), .B(CARRYB_14__2_), .CI(SUMB_14__3_), .CO(
        CARRYB_15__2_), .S(SUMB_15__2_) );
  ADDFX2M S2_2_2 ( .A(ab_2__2_), .B(n3), .CI(SUMB_1__3_), .CO(CARRYB_2__2_), 
        .S(SUMB_2__2_) );
  AND2X2M U2 ( .A(ab_0__3_), .B(ab_1__2_), .Y(n3) );
  AND2X2M U3 ( .A(ab_0__4_), .B(ab_1__3_), .Y(n4) );
  AND2X2M U4 ( .A(ab_0__5_), .B(ab_1__4_), .Y(n5) );
  AND2X2M U5 ( .A(ab_0__6_), .B(ab_1__5_), .Y(n6) );
  AND2X2M U6 ( .A(ab_0__2_), .B(ab_1__1_), .Y(n7) );
  AND2X2M U7 ( .A(ab_0__1_), .B(ab_1__0_), .Y(n8) );
  AND2X2M U8 ( .A(ab_0__7_), .B(ab_1__6_), .Y(n9) );
  AND2X2M U9 ( .A(ab_0__8_), .B(ab_1__7_), .Y(n10) );
  AND2X2M U10 ( .A(ab_0__9_), .B(ab_1__8_), .Y(n11) );
  AND2X2M U11 ( .A(ab_0__10_), .B(ab_1__9_), .Y(n12) );
  AND2X2M U12 ( .A(ab_0__11_), .B(ab_1__10_), .Y(n13) );
  AND2X2M U13 ( .A(ab_0__14_), .B(ab_1__13_), .Y(n14) );
  AND2X2M U14 ( .A(ab_0__12_), .B(ab_1__11_), .Y(n15) );
  AND2X2M U15 ( .A(ab_0__13_), .B(ab_1__12_), .Y(n16) );
  AND2X2M U16 ( .A(ab_0__15_), .B(ab_1__14_), .Y(n17) );
  AND2X2M U17 ( .A(CARRYB_15__14_), .B(ab_15__15_), .Y(n18) );
  CLKXOR2X2M U18 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(A1_17_) );
  CLKXOR2X2M U19 ( .A(CARRYB_15__5_), .B(SUMB_15__6_), .Y(A1_19_) );
  CLKXOR2X2M U20 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(A1_15_) );
  CLKXOR2X2M U21 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(A1_16_) );
  CLKXOR2X2M U22 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(A1_18_) );
  INVX2M U23 ( .A(ab_0__4_), .Y(n37) );
  INVX2M U24 ( .A(ab_0__5_), .Y(n38) );
  INVX2M U25 ( .A(ab_0__6_), .Y(n39) );
  INVX2M U26 ( .A(ab_0__7_), .Y(n40) );
  INVX2M U27 ( .A(ab_0__8_), .Y(n41) );
  INVX2M U28 ( .A(ab_0__10_), .Y(n43) );
  INVX2M U29 ( .A(ab_0__11_), .Y(n44) );
  INVX2M U30 ( .A(ab_0__9_), .Y(n42) );
  INVX2M U31 ( .A(ab_0__12_), .Y(n45) );
  INVX2M U32 ( .A(ab_0__13_), .Y(n46) );
  INVX2M U33 ( .A(ab_0__14_), .Y(n47) );
  INVX2M U34 ( .A(ab_0__15_), .Y(n48) );
  INVX2M U35 ( .A(ab_0__3_), .Y(n36) );
  INVX2M U36 ( .A(ab_0__2_), .Y(n35) );
  AND2X2M U37 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(n19) );
  AND2X2M U38 ( .A(CARRYB_15__0_), .B(SUMB_15__1_), .Y(n20) );
  AND2X2M U39 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(n21) );
  AND2X2M U40 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(n22) );
  CLKXOR2X2M U41 ( .A(CARRYB_15__7_), .B(SUMB_15__8_), .Y(A1_21_) );
  CLKXOR2X2M U42 ( .A(CARRYB_15__9_), .B(SUMB_15__10_), .Y(A1_23_) );
  CLKXOR2X2M U43 ( .A(CARRYB_15__8_), .B(SUMB_15__9_), .Y(A1_22_) );
  CLKXOR2X2M U44 ( .A(CARRYB_15__10_), .B(SUMB_15__11_), .Y(A1_24_) );
  CLKXOR2X2M U45 ( .A(CARRYB_15__6_), .B(SUMB_15__7_), .Y(A1_20_) );
  AND2X2M U46 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(n23) );
  AND2X2M U47 ( .A(CARRYB_15__6_), .B(SUMB_15__7_), .Y(n24) );
  AND2X2M U48 ( .A(CARRYB_15__8_), .B(SUMB_15__9_), .Y(n25) );
  AND2X2M U49 ( .A(CARRYB_15__5_), .B(SUMB_15__6_), .Y(n26) );
  AND2X2M U50 ( .A(CARRYB_15__7_), .B(SUMB_15__8_), .Y(n27) );
  AND2X2M U51 ( .A(CARRYB_15__9_), .B(SUMB_15__10_), .Y(n28) );
  CLKXOR2X2M U52 ( .A(CARRYB_15__11_), .B(SUMB_15__12_), .Y(A1_25_) );
  CLKXOR2X2M U53 ( .A(CARRYB_15__13_), .B(SUMB_15__14_), .Y(A1_27_) );
  CLKXOR2X2M U54 ( .A(CARRYB_15__12_), .B(SUMB_15__13_), .Y(A1_26_) );
  INVX2M U55 ( .A(SUMB_15__1_), .Y(n33) );
  AND2X2M U56 ( .A(CARRYB_15__10_), .B(SUMB_15__11_), .Y(n29) );
  AND2X2M U57 ( .A(CARRYB_15__12_), .B(SUMB_15__13_), .Y(n30) );
  AND2X2M U58 ( .A(CARRYB_15__13_), .B(SUMB_15__14_), .Y(n31) );
  AND2X2M U59 ( .A(CARRYB_15__11_), .B(SUMB_15__12_), .Y(n32) );
  CLKXOR2X2M U60 ( .A(CARRYB_15__14_), .B(ab_15__15_), .Y(A1_28_) );
  INVX2M U61 ( .A(ab_0__1_), .Y(n34) );
  XNOR2X2M U62 ( .A(ab_1__0_), .B(n34), .Y(PRODUCT[1]) );
  XNOR2X2M U63 ( .A(ab_1__3_), .B(n37), .Y(SUMB_1__3_) );
  XNOR2X2M U64 ( .A(ab_1__4_), .B(n38), .Y(SUMB_1__4_) );
  XNOR2X2M U65 ( .A(ab_1__5_), .B(n39), .Y(SUMB_1__5_) );
  XNOR2X2M U66 ( .A(ab_1__6_), .B(n40), .Y(SUMB_1__6_) );
  XNOR2X2M U67 ( .A(ab_1__7_), .B(n41), .Y(SUMB_1__7_) );
  XNOR2X2M U68 ( .A(ab_1__8_), .B(n42), .Y(SUMB_1__8_) );
  XNOR2X2M U69 ( .A(ab_1__9_), .B(n43), .Y(SUMB_1__9_) );
  XNOR2X2M U70 ( .A(ab_1__10_), .B(n44), .Y(SUMB_1__10_) );
  XNOR2X2M U71 ( .A(ab_1__11_), .B(n45), .Y(SUMB_1__11_) );
  XNOR2X2M U72 ( .A(ab_1__12_), .B(n46), .Y(SUMB_1__12_) );
  XNOR2X2M U73 ( .A(ab_1__13_), .B(n47), .Y(SUMB_1__13_) );
  XNOR2X2M U74 ( .A(ab_1__14_), .B(n48), .Y(SUMB_1__14_) );
  XNOR2X2M U75 ( .A(ab_1__2_), .B(n36), .Y(SUMB_1__2_) );
  XNOR2X2M U76 ( .A(ab_1__1_), .B(n35), .Y(SUMB_1__1_) );
  XNOR2X2M U77 ( .A(CARRYB_15__0_), .B(n33), .Y(A1_14_) );
  INVX2M U78 ( .A(B[7]), .Y(n73) );
  INVX2M U79 ( .A(B[14]), .Y(n66) );
  INVX2M U80 ( .A(B[4]), .Y(n76) );
  INVX2M U81 ( .A(B[5]), .Y(n75) );
  INVX2M U82 ( .A(B[10]), .Y(n70) );
  INVX2M U83 ( .A(B[11]), .Y(n69) );
  INVX2M U84 ( .A(B[2]), .Y(n78) );
  INVX2M U85 ( .A(B[6]), .Y(n74) );
  INVX2M U86 ( .A(B[13]), .Y(n67) );
  INVX2M U87 ( .A(B[3]), .Y(n77) );
  INVX2M U88 ( .A(B[8]), .Y(n72) );
  INVX2M U89 ( .A(B[1]), .Y(n79) );
  INVX2M U90 ( .A(B[12]), .Y(n68) );
  INVX2M U91 ( .A(B[15]), .Y(n65) );
  INVX2M U92 ( .A(B[9]), .Y(n71) );
  INVX2M U93 ( .A(A[1]), .Y(n63) );
  INVX2M U94 ( .A(A[0]), .Y(n64) );
  INVX2M U95 ( .A(A[2]), .Y(n62) );
  INVX2M U96 ( .A(A[3]), .Y(n61) );
  INVX2M U97 ( .A(B[0]), .Y(n80) );
  INVX2M U98 ( .A(A[4]), .Y(n60) );
  INVX2M U99 ( .A(A[5]), .Y(n59) );
  INVX2M U100 ( .A(A[6]), .Y(n58) );
  INVX2M U101 ( .A(A[9]), .Y(n55) );
  INVX2M U102 ( .A(A[7]), .Y(n57) );
  INVX2M U103 ( .A(A[8]), .Y(n56) );
  INVX2M U104 ( .A(A[10]), .Y(n54) );
  INVX2M U105 ( .A(A[11]), .Y(n53) );
  INVX2M U106 ( .A(A[12]), .Y(n52) );
  INVX2M U107 ( .A(A[14]), .Y(n50) );
  INVX2M U108 ( .A(A[15]), .Y(n49) );
  INVX2M U109 ( .A(A[13]), .Y(n51) );
  NOR2X1M U111 ( .A(n55), .B(n71), .Y(ab_9__9_) );
  NOR2X1M U112 ( .A(n55), .B(n72), .Y(ab_9__8_) );
  NOR2X1M U113 ( .A(n55), .B(n73), .Y(ab_9__7_) );
  NOR2X1M U114 ( .A(n55), .B(n74), .Y(ab_9__6_) );
  NOR2X1M U115 ( .A(n55), .B(n75), .Y(ab_9__5_) );
  NOR2X1M U116 ( .A(n55), .B(n76), .Y(ab_9__4_) );
  NOR2X1M U117 ( .A(n55), .B(n77), .Y(ab_9__3_) );
  NOR2X1M U118 ( .A(n55), .B(n78), .Y(ab_9__2_) );
  NOR2X1M U119 ( .A(n55), .B(n79), .Y(ab_9__1_) );
  NOR2X1M U120 ( .A(n55), .B(n65), .Y(ab_9__15_) );
  NOR2X1M U121 ( .A(n55), .B(n66), .Y(ab_9__14_) );
  NOR2X1M U122 ( .A(n55), .B(n67), .Y(ab_9__13_) );
  NOR2X1M U123 ( .A(n55), .B(n68), .Y(ab_9__12_) );
  NOR2X1M U124 ( .A(n55), .B(n69), .Y(ab_9__11_) );
  NOR2X1M U125 ( .A(n55), .B(n70), .Y(ab_9__10_) );
  NOR2X1M U126 ( .A(n55), .B(n80), .Y(ab_9__0_) );
  NOR2X1M U127 ( .A(n71), .B(n56), .Y(ab_8__9_) );
  NOR2X1M U128 ( .A(n72), .B(n56), .Y(ab_8__8_) );
  NOR2X1M U129 ( .A(n73), .B(n56), .Y(ab_8__7_) );
  NOR2X1M U130 ( .A(n74), .B(n56), .Y(ab_8__6_) );
  NOR2X1M U131 ( .A(n75), .B(n56), .Y(ab_8__5_) );
  NOR2X1M U132 ( .A(n76), .B(n56), .Y(ab_8__4_) );
  NOR2X1M U133 ( .A(n77), .B(n56), .Y(ab_8__3_) );
  NOR2X1M U134 ( .A(n78), .B(n56), .Y(ab_8__2_) );
  NOR2X1M U135 ( .A(n79), .B(n56), .Y(ab_8__1_) );
  NOR2X1M U136 ( .A(n65), .B(n56), .Y(ab_8__15_) );
  NOR2X1M U137 ( .A(n66), .B(n56), .Y(ab_8__14_) );
  NOR2X1M U138 ( .A(n67), .B(n56), .Y(ab_8__13_) );
  NOR2X1M U139 ( .A(n68), .B(n56), .Y(ab_8__12_) );
  NOR2X1M U140 ( .A(n69), .B(n56), .Y(ab_8__11_) );
  NOR2X1M U141 ( .A(n70), .B(n56), .Y(ab_8__10_) );
  NOR2X1M U142 ( .A(n80), .B(n56), .Y(ab_8__0_) );
  NOR2X1M U143 ( .A(n71), .B(n57), .Y(ab_7__9_) );
  NOR2X1M U144 ( .A(n72), .B(n57), .Y(ab_7__8_) );
  NOR2X1M U145 ( .A(n73), .B(n57), .Y(ab_7__7_) );
  NOR2X1M U146 ( .A(n74), .B(n57), .Y(ab_7__6_) );
  NOR2X1M U147 ( .A(n75), .B(n57), .Y(ab_7__5_) );
  NOR2X1M U148 ( .A(n76), .B(n57), .Y(ab_7__4_) );
  NOR2X1M U149 ( .A(n77), .B(n57), .Y(ab_7__3_) );
  NOR2X1M U150 ( .A(n78), .B(n57), .Y(ab_7__2_) );
  NOR2X1M U151 ( .A(n79), .B(n57), .Y(ab_7__1_) );
  NOR2X1M U152 ( .A(n65), .B(n57), .Y(ab_7__15_) );
  NOR2X1M U153 ( .A(n66), .B(n57), .Y(ab_7__14_) );
  NOR2X1M U154 ( .A(n67), .B(n57), .Y(ab_7__13_) );
  NOR2X1M U155 ( .A(n68), .B(n57), .Y(ab_7__12_) );
  NOR2X1M U156 ( .A(n69), .B(n57), .Y(ab_7__11_) );
  NOR2X1M U157 ( .A(n70), .B(n57), .Y(ab_7__10_) );
  NOR2X1M U158 ( .A(n80), .B(n57), .Y(ab_7__0_) );
  NOR2X1M U159 ( .A(n71), .B(n58), .Y(ab_6__9_) );
  NOR2X1M U160 ( .A(n72), .B(n58), .Y(ab_6__8_) );
  NOR2X1M U161 ( .A(n73), .B(n58), .Y(ab_6__7_) );
  NOR2X1M U162 ( .A(n74), .B(n58), .Y(ab_6__6_) );
  NOR2X1M U163 ( .A(n75), .B(n58), .Y(ab_6__5_) );
  NOR2X1M U164 ( .A(n76), .B(n58), .Y(ab_6__4_) );
  NOR2X1M U165 ( .A(n77), .B(n58), .Y(ab_6__3_) );
  NOR2X1M U166 ( .A(n78), .B(n58), .Y(ab_6__2_) );
  NOR2X1M U167 ( .A(n79), .B(n58), .Y(ab_6__1_) );
  NOR2X1M U168 ( .A(n65), .B(n58), .Y(ab_6__15_) );
  NOR2X1M U169 ( .A(n66), .B(n58), .Y(ab_6__14_) );
  NOR2X1M U170 ( .A(n67), .B(n58), .Y(ab_6__13_) );
  NOR2X1M U171 ( .A(n68), .B(n58), .Y(ab_6__12_) );
  NOR2X1M U172 ( .A(n69), .B(n58), .Y(ab_6__11_) );
  NOR2X1M U173 ( .A(n70), .B(n58), .Y(ab_6__10_) );
  NOR2X1M U174 ( .A(n80), .B(n58), .Y(ab_6__0_) );
  NOR2X1M U175 ( .A(n71), .B(n59), .Y(ab_5__9_) );
  NOR2X1M U176 ( .A(n72), .B(n59), .Y(ab_5__8_) );
  NOR2X1M U177 ( .A(n73), .B(n59), .Y(ab_5__7_) );
  NOR2X1M U178 ( .A(n74), .B(n59), .Y(ab_5__6_) );
  NOR2X1M U179 ( .A(n75), .B(n59), .Y(ab_5__5_) );
  NOR2X1M U180 ( .A(n76), .B(n59), .Y(ab_5__4_) );
  NOR2X1M U181 ( .A(n77), .B(n59), .Y(ab_5__3_) );
  NOR2X1M U182 ( .A(n78), .B(n59), .Y(ab_5__2_) );
  NOR2X1M U183 ( .A(n79), .B(n59), .Y(ab_5__1_) );
  NOR2X1M U184 ( .A(n65), .B(n59), .Y(ab_5__15_) );
  NOR2X1M U185 ( .A(n66), .B(n59), .Y(ab_5__14_) );
  NOR2X1M U186 ( .A(n67), .B(n59), .Y(ab_5__13_) );
  NOR2X1M U187 ( .A(n68), .B(n59), .Y(ab_5__12_) );
  NOR2X1M U188 ( .A(n69), .B(n59), .Y(ab_5__11_) );
  NOR2X1M U189 ( .A(n70), .B(n59), .Y(ab_5__10_) );
  NOR2X1M U190 ( .A(n80), .B(n59), .Y(ab_5__0_) );
  NOR2X1M U191 ( .A(n71), .B(n60), .Y(ab_4__9_) );
  NOR2X1M U192 ( .A(n72), .B(n60), .Y(ab_4__8_) );
  NOR2X1M U193 ( .A(n73), .B(n60), .Y(ab_4__7_) );
  NOR2X1M U194 ( .A(n74), .B(n60), .Y(ab_4__6_) );
  NOR2X1M U195 ( .A(n75), .B(n60), .Y(ab_4__5_) );
  NOR2X1M U196 ( .A(n76), .B(n60), .Y(ab_4__4_) );
  NOR2X1M U197 ( .A(n77), .B(n60), .Y(ab_4__3_) );
  NOR2X1M U198 ( .A(n78), .B(n60), .Y(ab_4__2_) );
  NOR2X1M U199 ( .A(n79), .B(n60), .Y(ab_4__1_) );
  NOR2X1M U200 ( .A(n65), .B(n60), .Y(ab_4__15_) );
  NOR2X1M U201 ( .A(n66), .B(n60), .Y(ab_4__14_) );
  NOR2X1M U202 ( .A(n67), .B(n60), .Y(ab_4__13_) );
  NOR2X1M U203 ( .A(n68), .B(n60), .Y(ab_4__12_) );
  NOR2X1M U204 ( .A(n69), .B(n60), .Y(ab_4__11_) );
  NOR2X1M U205 ( .A(n70), .B(n60), .Y(ab_4__10_) );
  NOR2X1M U206 ( .A(n80), .B(n60), .Y(ab_4__0_) );
  NOR2X1M U207 ( .A(n71), .B(n61), .Y(ab_3__9_) );
  NOR2X1M U208 ( .A(n72), .B(n61), .Y(ab_3__8_) );
  NOR2X1M U209 ( .A(n73), .B(n61), .Y(ab_3__7_) );
  NOR2X1M U210 ( .A(n74), .B(n61), .Y(ab_3__6_) );
  NOR2X1M U211 ( .A(n75), .B(n61), .Y(ab_3__5_) );
  NOR2X1M U212 ( .A(n76), .B(n61), .Y(ab_3__4_) );
  NOR2X1M U213 ( .A(n77), .B(n61), .Y(ab_3__3_) );
  NOR2X1M U214 ( .A(n78), .B(n61), .Y(ab_3__2_) );
  NOR2X1M U215 ( .A(n79), .B(n61), .Y(ab_3__1_) );
  NOR2X1M U216 ( .A(n65), .B(n61), .Y(ab_3__15_) );
  NOR2X1M U217 ( .A(n66), .B(n61), .Y(ab_3__14_) );
  NOR2X1M U218 ( .A(n67), .B(n61), .Y(ab_3__13_) );
  NOR2X1M U219 ( .A(n68), .B(n61), .Y(ab_3__12_) );
  NOR2X1M U220 ( .A(n69), .B(n61), .Y(ab_3__11_) );
  NOR2X1M U221 ( .A(n70), .B(n61), .Y(ab_3__10_) );
  NOR2X1M U222 ( .A(n80), .B(n61), .Y(ab_3__0_) );
  NOR2X1M U223 ( .A(n71), .B(n62), .Y(ab_2__9_) );
  NOR2X1M U224 ( .A(n72), .B(n62), .Y(ab_2__8_) );
  NOR2X1M U225 ( .A(n73), .B(n62), .Y(ab_2__7_) );
  NOR2X1M U226 ( .A(n74), .B(n62), .Y(ab_2__6_) );
  NOR2X1M U227 ( .A(n75), .B(n62), .Y(ab_2__5_) );
  NOR2X1M U228 ( .A(n76), .B(n62), .Y(ab_2__4_) );
  NOR2X1M U229 ( .A(n77), .B(n62), .Y(ab_2__3_) );
  NOR2X1M U230 ( .A(n78), .B(n62), .Y(ab_2__2_) );
  NOR2X1M U231 ( .A(n79), .B(n62), .Y(ab_2__1_) );
  NOR2X1M U232 ( .A(n65), .B(n62), .Y(ab_2__15_) );
  NOR2X1M U233 ( .A(n66), .B(n62), .Y(ab_2__14_) );
  NOR2X1M U234 ( .A(n67), .B(n62), .Y(ab_2__13_) );
  NOR2X1M U235 ( .A(n68), .B(n62), .Y(ab_2__12_) );
  NOR2X1M U236 ( .A(n69), .B(n62), .Y(ab_2__11_) );
  NOR2X1M U237 ( .A(n70), .B(n62), .Y(ab_2__10_) );
  NOR2X1M U238 ( .A(n80), .B(n62), .Y(ab_2__0_) );
  NOR2X1M U239 ( .A(n71), .B(n63), .Y(ab_1__9_) );
  NOR2X1M U240 ( .A(n72), .B(n63), .Y(ab_1__8_) );
  NOR2X1M U241 ( .A(n73), .B(n63), .Y(ab_1__7_) );
  NOR2X1M U242 ( .A(n74), .B(n63), .Y(ab_1__6_) );
  NOR2X1M U243 ( .A(n75), .B(n63), .Y(ab_1__5_) );
  NOR2X1M U244 ( .A(n76), .B(n63), .Y(ab_1__4_) );
  NOR2X1M U245 ( .A(n77), .B(n63), .Y(ab_1__3_) );
  NOR2X1M U246 ( .A(n78), .B(n63), .Y(ab_1__2_) );
  NOR2X1M U247 ( .A(n79), .B(n63), .Y(ab_1__1_) );
  NOR2X1M U248 ( .A(n65), .B(n63), .Y(ab_1__15_) );
  NOR2X1M U249 ( .A(n66), .B(n63), .Y(ab_1__14_) );
  NOR2X1M U250 ( .A(n67), .B(n63), .Y(ab_1__13_) );
  NOR2X1M U251 ( .A(n68), .B(n63), .Y(ab_1__12_) );
  NOR2X1M U252 ( .A(n69), .B(n63), .Y(ab_1__11_) );
  NOR2X1M U253 ( .A(n70), .B(n63), .Y(ab_1__10_) );
  NOR2X1M U254 ( .A(n80), .B(n63), .Y(ab_1__0_) );
  NOR2X1M U255 ( .A(n71), .B(n49), .Y(ab_15__9_) );
  NOR2X1M U256 ( .A(n72), .B(n49), .Y(ab_15__8_) );
  NOR2X1M U257 ( .A(n73), .B(n49), .Y(ab_15__7_) );
  NOR2X1M U258 ( .A(n74), .B(n49), .Y(ab_15__6_) );
  NOR2X1M U259 ( .A(n75), .B(n49), .Y(ab_15__5_) );
  NOR2X1M U260 ( .A(n76), .B(n49), .Y(ab_15__4_) );
  NOR2X1M U261 ( .A(n77), .B(n49), .Y(ab_15__3_) );
  NOR2X1M U262 ( .A(n78), .B(n49), .Y(ab_15__2_) );
  NOR2X1M U263 ( .A(n79), .B(n49), .Y(ab_15__1_) );
  NOR2X1M U264 ( .A(n65), .B(n49), .Y(ab_15__15_) );
  NOR2X1M U265 ( .A(n66), .B(n49), .Y(ab_15__14_) );
  NOR2X1M U266 ( .A(n67), .B(n49), .Y(ab_15__13_) );
  NOR2X1M U267 ( .A(n68), .B(n49), .Y(ab_15__12_) );
  NOR2X1M U268 ( .A(n69), .B(n49), .Y(ab_15__11_) );
  NOR2X1M U269 ( .A(n70), .B(n49), .Y(ab_15__10_) );
  NOR2X1M U270 ( .A(n80), .B(n49), .Y(ab_15__0_) );
  NOR2X1M U271 ( .A(n71), .B(n50), .Y(ab_14__9_) );
  NOR2X1M U272 ( .A(n72), .B(n50), .Y(ab_14__8_) );
  NOR2X1M U273 ( .A(n73), .B(n50), .Y(ab_14__7_) );
  NOR2X1M U274 ( .A(n74), .B(n50), .Y(ab_14__6_) );
  NOR2X1M U275 ( .A(n75), .B(n50), .Y(ab_14__5_) );
  NOR2X1M U276 ( .A(n76), .B(n50), .Y(ab_14__4_) );
  NOR2X1M U277 ( .A(n77), .B(n50), .Y(ab_14__3_) );
  NOR2X1M U278 ( .A(n78), .B(n50), .Y(ab_14__2_) );
  NOR2X1M U279 ( .A(n79), .B(n50), .Y(ab_14__1_) );
  NOR2X1M U280 ( .A(n65), .B(n50), .Y(ab_14__15_) );
  NOR2X1M U281 ( .A(n66), .B(n50), .Y(ab_14__14_) );
  NOR2X1M U282 ( .A(n67), .B(n50), .Y(ab_14__13_) );
  NOR2X1M U283 ( .A(n68), .B(n50), .Y(ab_14__12_) );
  NOR2X1M U284 ( .A(n69), .B(n50), .Y(ab_14__11_) );
  NOR2X1M U285 ( .A(n70), .B(n50), .Y(ab_14__10_) );
  NOR2X1M U286 ( .A(n80), .B(n50), .Y(ab_14__0_) );
  NOR2X1M U287 ( .A(n71), .B(n51), .Y(ab_13__9_) );
  NOR2X1M U288 ( .A(n72), .B(n51), .Y(ab_13__8_) );
  NOR2X1M U289 ( .A(n73), .B(n51), .Y(ab_13__7_) );
  NOR2X1M U290 ( .A(n74), .B(n51), .Y(ab_13__6_) );
  NOR2X1M U291 ( .A(n75), .B(n51), .Y(ab_13__5_) );
  NOR2X1M U292 ( .A(n76), .B(n51), .Y(ab_13__4_) );
  NOR2X1M U293 ( .A(n77), .B(n51), .Y(ab_13__3_) );
  NOR2X1M U294 ( .A(n78), .B(n51), .Y(ab_13__2_) );
  NOR2X1M U295 ( .A(n79), .B(n51), .Y(ab_13__1_) );
  NOR2X1M U296 ( .A(n65), .B(n51), .Y(ab_13__15_) );
  NOR2X1M U297 ( .A(n66), .B(n51), .Y(ab_13__14_) );
  NOR2X1M U298 ( .A(n67), .B(n51), .Y(ab_13__13_) );
  NOR2X1M U299 ( .A(n68), .B(n51), .Y(ab_13__12_) );
  NOR2X1M U300 ( .A(n69), .B(n51), .Y(ab_13__11_) );
  NOR2X1M U301 ( .A(n70), .B(n51), .Y(ab_13__10_) );
  NOR2X1M U302 ( .A(n80), .B(n51), .Y(ab_13__0_) );
  NOR2X1M U303 ( .A(n71), .B(n52), .Y(ab_12__9_) );
  NOR2X1M U304 ( .A(n72), .B(n52), .Y(ab_12__8_) );
  NOR2X1M U305 ( .A(n73), .B(n52), .Y(ab_12__7_) );
  NOR2X1M U306 ( .A(n74), .B(n52), .Y(ab_12__6_) );
  NOR2X1M U307 ( .A(n75), .B(n52), .Y(ab_12__5_) );
  NOR2X1M U308 ( .A(n76), .B(n52), .Y(ab_12__4_) );
  NOR2X1M U309 ( .A(n77), .B(n52), .Y(ab_12__3_) );
  NOR2X1M U310 ( .A(n78), .B(n52), .Y(ab_12__2_) );
  NOR2X1M U311 ( .A(n79), .B(n52), .Y(ab_12__1_) );
  NOR2X1M U312 ( .A(n65), .B(n52), .Y(ab_12__15_) );
  NOR2X1M U313 ( .A(n66), .B(n52), .Y(ab_12__14_) );
  NOR2X1M U314 ( .A(n67), .B(n52), .Y(ab_12__13_) );
  NOR2X1M U315 ( .A(n68), .B(n52), .Y(ab_12__12_) );
  NOR2X1M U316 ( .A(n69), .B(n52), .Y(ab_12__11_) );
  NOR2X1M U317 ( .A(n70), .B(n52), .Y(ab_12__10_) );
  NOR2X1M U318 ( .A(n80), .B(n52), .Y(ab_12__0_) );
  NOR2X1M U319 ( .A(n71), .B(n53), .Y(ab_11__9_) );
  NOR2X1M U320 ( .A(n72), .B(n53), .Y(ab_11__8_) );
  NOR2X1M U321 ( .A(n73), .B(n53), .Y(ab_11__7_) );
  NOR2X1M U322 ( .A(n74), .B(n53), .Y(ab_11__6_) );
  NOR2X1M U323 ( .A(n75), .B(n53), .Y(ab_11__5_) );
  NOR2X1M U324 ( .A(n76), .B(n53), .Y(ab_11__4_) );
  NOR2X1M U325 ( .A(n77), .B(n53), .Y(ab_11__3_) );
  NOR2X1M U326 ( .A(n78), .B(n53), .Y(ab_11__2_) );
  NOR2X1M U327 ( .A(n79), .B(n53), .Y(ab_11__1_) );
  NOR2X1M U328 ( .A(n65), .B(n53), .Y(ab_11__15_) );
  NOR2X1M U329 ( .A(n66), .B(n53), .Y(ab_11__14_) );
  NOR2X1M U330 ( .A(n67), .B(n53), .Y(ab_11__13_) );
  NOR2X1M U331 ( .A(n68), .B(n53), .Y(ab_11__12_) );
  NOR2X1M U332 ( .A(n69), .B(n53), .Y(ab_11__11_) );
  NOR2X1M U333 ( .A(n70), .B(n53), .Y(ab_11__10_) );
  NOR2X1M U334 ( .A(n80), .B(n53), .Y(ab_11__0_) );
  NOR2X1M U335 ( .A(n71), .B(n54), .Y(ab_10__9_) );
  NOR2X1M U336 ( .A(n72), .B(n54), .Y(ab_10__8_) );
  NOR2X1M U337 ( .A(n73), .B(n54), .Y(ab_10__7_) );
  NOR2X1M U338 ( .A(n74), .B(n54), .Y(ab_10__6_) );
  NOR2X1M U339 ( .A(n75), .B(n54), .Y(ab_10__5_) );
  NOR2X1M U340 ( .A(n76), .B(n54), .Y(ab_10__4_) );
  NOR2X1M U341 ( .A(n77), .B(n54), .Y(ab_10__3_) );
  NOR2X1M U342 ( .A(n78), .B(n54), .Y(ab_10__2_) );
  NOR2X1M U343 ( .A(n79), .B(n54), .Y(ab_10__1_) );
  NOR2X1M U344 ( .A(n65), .B(n54), .Y(ab_10__15_) );
  NOR2X1M U345 ( .A(n66), .B(n54), .Y(ab_10__14_) );
  NOR2X1M U346 ( .A(n67), .B(n54), .Y(ab_10__13_) );
  NOR2X1M U347 ( .A(n68), .B(n54), .Y(ab_10__12_) );
  NOR2X1M U348 ( .A(n69), .B(n54), .Y(ab_10__11_) );
  NOR2X1M U349 ( .A(n70), .B(n54), .Y(ab_10__10_) );
  NOR2X1M U350 ( .A(n80), .B(n54), .Y(ab_10__0_) );
  NOR2X1M U351 ( .A(n71), .B(n64), .Y(ab_0__9_) );
  NOR2X1M U352 ( .A(n72), .B(n64), .Y(ab_0__8_) );
  NOR2X1M U353 ( .A(n73), .B(n64), .Y(ab_0__7_) );
  NOR2X1M U354 ( .A(n74), .B(n64), .Y(ab_0__6_) );
  NOR2X1M U355 ( .A(n75), .B(n64), .Y(ab_0__5_) );
  NOR2X1M U356 ( .A(n76), .B(n64), .Y(ab_0__4_) );
  NOR2X1M U357 ( .A(n77), .B(n64), .Y(ab_0__3_) );
  NOR2X1M U358 ( .A(n78), .B(n64), .Y(ab_0__2_) );
  NOR2X1M U359 ( .A(n79), .B(n64), .Y(ab_0__1_) );
  NOR2X1M U360 ( .A(n65), .B(n64), .Y(ab_0__15_) );
  NOR2X1M U361 ( .A(n66), .B(n64), .Y(ab_0__14_) );
  NOR2X1M U362 ( .A(n67), .B(n64), .Y(ab_0__13_) );
  NOR2X1M U363 ( .A(n68), .B(n64), .Y(ab_0__12_) );
  NOR2X1M U364 ( .A(n69), .B(n64), .Y(ab_0__11_) );
  NOR2X1M U365 ( .A(n70), .B(n64), .Y(ab_0__10_) );
  NOR2X1M U366 ( .A(n80), .B(n64), .Y(PRODUCT[0]) );
endmodule


module ARITHMETIC_UNIT ( A, B, ALU_FUNC, CLK, Arith_enable, Carry_OUT, 
        Arith_OUT, Arith_Flag );
  input [15:0] A;
  input [15:0] B;
  input [1:0] ALU_FUNC;
  output [31:0] Arith_OUT;
  input CLK, Arith_enable;
  output Carry_OUT, Arith_Flag;
  wire   n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28,
         N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42,
         N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56,
         N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70,
         N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84,
         N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n3, n5, n7, n47, n49,
         n51, n53, n55, n57, n59, n61, n63, n65, n67, n69, n71, n73, n75, n77,
         n79, n81, n83, n85, n87, n89, n91, n93, n95, n97, n99, n101, n103,
         n105, n107, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16;
  wire   [31:0] Arith_OUT_comb;

  ARITHMETIC_UNIT_DW_div_uns_0 div_52 ( .a(A), .b(B), .quotient({N97, N96, N95, 
        N94, N93, N92, N91, N90, N89, N88, N87, N86, N85, N84, N83, N82}), 
        .remainder({SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, 
        SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, 
        SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8, 
        SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10, 
        SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12, 
        SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14, 
        SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16}) );
  ARITHMETIC_UNIT_DW01_sub_0 sub_44 ( .A({1'b0, A}), .B({1'b0, B}), .CI(1'b0), 
        .DIFF({N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, 
        N36, N35, N34, N33}) );
  ARITHMETIC_UNIT_DW01_add_0 add_40 ( .A({1'b0, A}), .B({1'b0, B}), .CI(1'b0), 
        .SUM({N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, 
        N19, N18, N17, N16}) );
  ARITHMETIC_UNIT_DW02_mult_0 mult_48 ( .A(A), .B(B), .TC(1'b0), .PRODUCT({N81, 
        N80, N79, N78, N77, N76, N75, N74, N73, N72, N71, N70, N69, N68, N67, 
        N66, N65, N64, N63, N62, N61, N60, N59, N58, N57, N56, N55, N54, N53, 
        N52, N51, N50}) );
  DFFQX2M Arith_Flag_reg ( .D(Arith_enable), .CK(CLK), .Q(n152) );
  DFFQX2M Arith_OUT_reg_12_ ( .D(Arith_OUT_comb[12]), .CK(CLK), .Q(n139) );
  DFFQX2M Arith_OUT_reg_13_ ( .D(Arith_OUT_comb[13]), .CK(CLK), .Q(n138) );
  DFFQX2M Arith_OUT_reg_11_ ( .D(Arith_OUT_comb[11]), .CK(CLK), .Q(n140) );
  DFFQX2M Arith_OUT_reg_14_ ( .D(Arith_OUT_comb[14]), .CK(CLK), .Q(n137) );
  DFFQX2M Arith_OUT_reg_15_ ( .D(Arith_OUT_comb[15]), .CK(CLK), .Q(n136) );
  DFFQX2M Carry_OUT_reg ( .D(n115), .CK(CLK), .Q(n119) );
  DFFQX2M Arith_OUT_reg_16_ ( .D(n115), .CK(CLK), .Q(n135) );
  DFFQX2M Arith_OUT_reg_17_ ( .D(Arith_OUT_comb[17]), .CK(CLK), .Q(n134) );
  DFFQX2M Arith_OUT_reg_18_ ( .D(Arith_OUT_comb[18]), .CK(CLK), .Q(n133) );
  DFFQX2M Arith_OUT_reg_19_ ( .D(Arith_OUT_comb[19]), .CK(CLK), .Q(n132) );
  DFFQX2M Arith_OUT_reg_20_ ( .D(Arith_OUT_comb[20]), .CK(CLK), .Q(n131) );
  DFFQX2M Arith_OUT_reg_21_ ( .D(Arith_OUT_comb[21]), .CK(CLK), .Q(n130) );
  DFFQX2M Arith_OUT_reg_22_ ( .D(Arith_OUT_comb[22]), .CK(CLK), .Q(n129) );
  DFFQX2M Arith_OUT_reg_23_ ( .D(Arith_OUT_comb[23]), .CK(CLK), .Q(n128) );
  DFFQX2M Arith_OUT_reg_10_ ( .D(Arith_OUT_comb[10]), .CK(CLK), .Q(n141) );
  DFFQX2M Arith_OUT_reg_24_ ( .D(Arith_OUT_comb[24]), .CK(CLK), .Q(n127) );
  DFFQX2M Arith_OUT_reg_25_ ( .D(Arith_OUT_comb[25]), .CK(CLK), .Q(n126) );
  DFFQX2M Arith_OUT_reg_26_ ( .D(Arith_OUT_comb[26]), .CK(CLK), .Q(n125) );
  DFFQX2M Arith_OUT_reg_27_ ( .D(Arith_OUT_comb[27]), .CK(CLK), .Q(n124) );
  DFFQX2M Arith_OUT_reg_28_ ( .D(Arith_OUT_comb[28]), .CK(CLK), .Q(n123) );
  DFFQX2M Arith_OUT_reg_29_ ( .D(Arith_OUT_comb[29]), .CK(CLK), .Q(n122) );
  DFFQX2M Arith_OUT_reg_30_ ( .D(Arith_OUT_comb[30]), .CK(CLK), .Q(n121) );
  DFFQX2M Arith_OUT_reg_31_ ( .D(Arith_OUT_comb[31]), .CK(CLK), .Q(n120) );
  DFFQX2M Arith_OUT_reg_9_ ( .D(Arith_OUT_comb[9]), .CK(CLK), .Q(n142) );
  DFFQX2M Arith_OUT_reg_8_ ( .D(Arith_OUT_comb[8]), .CK(CLK), .Q(n143) );
  DFFQX2M Arith_OUT_reg_7_ ( .D(Arith_OUT_comb[7]), .CK(CLK), .Q(n144) );
  DFFQX2M Arith_OUT_reg_6_ ( .D(Arith_OUT_comb[6]), .CK(CLK), .Q(n145) );
  DFFQX2M Arith_OUT_reg_5_ ( .D(Arith_OUT_comb[5]), .CK(CLK), .Q(n146) );
  DFFQX2M Arith_OUT_reg_4_ ( .D(Arith_OUT_comb[4]), .CK(CLK), .Q(n147) );
  DFFQX2M Arith_OUT_reg_3_ ( .D(Arith_OUT_comb[3]), .CK(CLK), .Q(n148) );
  DFFQX2M Arith_OUT_reg_2_ ( .D(Arith_OUT_comb[2]), .CK(CLK), .Q(n149) );
  DFFQX2M Arith_OUT_reg_1_ ( .D(Arith_OUT_comb[1]), .CK(CLK), .Q(n150) );
  DFFQX2M Arith_OUT_reg_0_ ( .D(Arith_OUT_comb[0]), .CK(CLK), .Q(n151) );
  INVXLM U3 ( .A(n151), .Y(n3) );
  INVX8M U4 ( .A(n3), .Y(Arith_OUT[0]) );
  INVXLM U7 ( .A(n150), .Y(n5) );
  INVX8M U8 ( .A(n5), .Y(Arith_OUT[1]) );
  INVXLM U9 ( .A(n149), .Y(n7) );
  INVX8M U10 ( .A(n7), .Y(Arith_OUT[2]) );
  INVXLM U11 ( .A(n148), .Y(n47) );
  INVX8M U12 ( .A(n47), .Y(Arith_OUT[3]) );
  INVXLM U13 ( .A(n147), .Y(n49) );
  INVX8M U14 ( .A(n49), .Y(Arith_OUT[4]) );
  INVXLM U15 ( .A(n146), .Y(n51) );
  INVX8M U16 ( .A(n51), .Y(Arith_OUT[5]) );
  INVXLM U17 ( .A(n145), .Y(n53) );
  INVX8M U18 ( .A(n53), .Y(Arith_OUT[6]) );
  INVXLM U19 ( .A(n144), .Y(n55) );
  INVX8M U20 ( .A(n55), .Y(Arith_OUT[7]) );
  INVXLM U21 ( .A(n143), .Y(n57) );
  INVX8M U22 ( .A(n57), .Y(Arith_OUT[8]) );
  INVXLM U23 ( .A(n142), .Y(n59) );
  INVX8M U24 ( .A(n59), .Y(Arith_OUT[9]) );
  INVXLM U25 ( .A(n120), .Y(n61) );
  INVX8M U26 ( .A(n61), .Y(Arith_OUT[31]) );
  INVXLM U27 ( .A(n121), .Y(n63) );
  INVX8M U28 ( .A(n63), .Y(Arith_OUT[30]) );
  INVXLM U29 ( .A(n122), .Y(n65) );
  INVX8M U30 ( .A(n65), .Y(Arith_OUT[29]) );
  INVXLM U31 ( .A(n123), .Y(n67) );
  INVX8M U32 ( .A(n67), .Y(Arith_OUT[28]) );
  INVXLM U33 ( .A(n124), .Y(n69) );
  INVX8M U34 ( .A(n69), .Y(Arith_OUT[27]) );
  INVXLM U35 ( .A(n125), .Y(n71) );
  INVX8M U36 ( .A(n71), .Y(Arith_OUT[26]) );
  INVXLM U37 ( .A(n126), .Y(n73) );
  INVX8M U38 ( .A(n73), .Y(Arith_OUT[25]) );
  INVXLM U39 ( .A(n127), .Y(n75) );
  INVX8M U40 ( .A(n75), .Y(Arith_OUT[24]) );
  INVXLM U41 ( .A(n141), .Y(n77) );
  INVX8M U42 ( .A(n77), .Y(Arith_OUT[10]) );
  INVXLM U43 ( .A(n128), .Y(n79) );
  INVX8M U44 ( .A(n79), .Y(Arith_OUT[23]) );
  INVXLM U45 ( .A(n129), .Y(n81) );
  INVX8M U46 ( .A(n81), .Y(Arith_OUT[22]) );
  INVXLM U47 ( .A(n130), .Y(n83) );
  INVX8M U48 ( .A(n83), .Y(Arith_OUT[21]) );
  INVXLM U49 ( .A(n131), .Y(n85) );
  INVX8M U50 ( .A(n85), .Y(Arith_OUT[20]) );
  INVXLM U51 ( .A(n132), .Y(n87) );
  INVX8M U52 ( .A(n87), .Y(Arith_OUT[19]) );
  INVXLM U53 ( .A(n133), .Y(n89) );
  INVX8M U54 ( .A(n89), .Y(Arith_OUT[18]) );
  INVXLM U55 ( .A(n134), .Y(n91) );
  INVX8M U56 ( .A(n91), .Y(Arith_OUT[17]) );
  INVXLM U57 ( .A(n135), .Y(n93) );
  INVX8M U58 ( .A(n93), .Y(Arith_OUT[16]) );
  INVXLM U59 ( .A(n119), .Y(n95) );
  INVX8M U60 ( .A(n95), .Y(Carry_OUT) );
  INVXLM U61 ( .A(n136), .Y(n97) );
  INVX8M U62 ( .A(n97), .Y(Arith_OUT[15]) );
  INVXLM U63 ( .A(n137), .Y(n99) );
  INVX8M U64 ( .A(n99), .Y(Arith_OUT[14]) );
  INVXLM U65 ( .A(n140), .Y(n101) );
  INVX8M U66 ( .A(n101), .Y(Arith_OUT[11]) );
  INVXLM U67 ( .A(n138), .Y(n103) );
  INVX8M U68 ( .A(n103), .Y(Arith_OUT[13]) );
  INVXLM U69 ( .A(n139), .Y(n105) );
  INVX8M U70 ( .A(n105), .Y(Arith_OUT[12]) );
  INVXLM U71 ( .A(n152), .Y(n107) );
  INVX8M U72 ( .A(n107), .Y(Arith_Flag) );
  AO21XLM U73 ( .A0(N78), .A1(n112), .B0(n27), .Y(Arith_OUT_comb[28]) );
  AO21XLM U74 ( .A0(N79), .A1(n112), .B0(n27), .Y(Arith_OUT_comb[29]) );
  AO21XLM U75 ( .A0(N80), .A1(n112), .B0(n27), .Y(Arith_OUT_comb[30]) );
  AO21XLM U76 ( .A0(N81), .A1(n112), .B0(n27), .Y(Arith_OUT_comb[31]) );
  AO21XLM U77 ( .A0(N77), .A1(n112), .B0(n27), .Y(Arith_OUT_comb[27]) );
  AO21XLM U78 ( .A0(N73), .A1(n13), .B0(n27), .Y(Arith_OUT_comb[23]) );
  AO21XLM U79 ( .A0(N74), .A1(n13), .B0(n27), .Y(Arith_OUT_comb[24]) );
  AO21XLM U80 ( .A0(N75), .A1(n13), .B0(n27), .Y(Arith_OUT_comb[25]) );
  AO21XLM U81 ( .A0(N76), .A1(n13), .B0(n27), .Y(Arith_OUT_comb[26]) );
  AO21XLM U82 ( .A0(N67), .A1(n13), .B0(n27), .Y(Arith_OUT_comb[17]) );
  AO21XLM U83 ( .A0(N68), .A1(n13), .B0(n27), .Y(Arith_OUT_comb[18]) );
  AO21XLM U84 ( .A0(N69), .A1(n13), .B0(n27), .Y(Arith_OUT_comb[19]) );
  AO21XLM U85 ( .A0(N70), .A1(n13), .B0(n27), .Y(Arith_OUT_comb[20]) );
  AO21XLM U86 ( .A0(N71), .A1(n13), .B0(n27), .Y(Arith_OUT_comb[21]) );
  AO21XLM U87 ( .A0(N72), .A1(n13), .B0(n27), .Y(Arith_OUT_comb[22]) );
  INVX2M U88 ( .A(n113), .Y(n112) );
  NAND2X2M U89 ( .A(n45), .B(n46), .Y(Arith_OUT_comb[0]) );
  AOI22X1M U90 ( .A0(N50), .A1(n112), .B0(N33), .B1(n109), .Y(n45) );
  AOI22X1M U91 ( .A0(N82), .A1(n110), .B0(N16), .B1(n111), .Y(n46) );
  NAND2X2M U92 ( .A(n30), .B(n31), .Y(Arith_OUT_comb[1]) );
  AOI22X1M U93 ( .A0(N51), .A1(n112), .B0(N34), .B1(n109), .Y(n30) );
  AOI22X1M U94 ( .A0(N83), .A1(n110), .B0(N17), .B1(n111), .Y(n31) );
  NAND2X2M U95 ( .A(n28), .B(n29), .Y(Arith_OUT_comb[2]) );
  AOI22X1M U96 ( .A0(N52), .A1(n112), .B0(N35), .B1(n109), .Y(n28) );
  AOI22X1M U97 ( .A0(N84), .A1(n110), .B0(N18), .B1(n111), .Y(n29) );
  NAND2X2M U98 ( .A(n25), .B(n26), .Y(Arith_OUT_comb[3]) );
  AOI22X1M U99 ( .A0(N53), .A1(n112), .B0(N36), .B1(n109), .Y(n25) );
  AOI22X1M U100 ( .A0(N85), .A1(n110), .B0(N19), .B1(n111), .Y(n26) );
  NAND2X2M U101 ( .A(n23), .B(n24), .Y(Arith_OUT_comb[4]) );
  AOI22X1M U102 ( .A0(N54), .A1(n112), .B0(N37), .B1(n109), .Y(n23) );
  AOI22X1M U103 ( .A0(N86), .A1(n110), .B0(N20), .B1(n111), .Y(n24) );
  NAND2X2M U104 ( .A(n21), .B(n22), .Y(Arith_OUT_comb[5]) );
  AOI22X1M U105 ( .A0(N55), .A1(n112), .B0(N38), .B1(n109), .Y(n21) );
  AOI22X1M U106 ( .A0(N87), .A1(n110), .B0(N21), .B1(n111), .Y(n22) );
  NAND2X2M U107 ( .A(n19), .B(n20), .Y(Arith_OUT_comb[6]) );
  AOI22X1M U108 ( .A0(N56), .A1(n112), .B0(N39), .B1(n109), .Y(n19) );
  AOI22X1M U109 ( .A0(N88), .A1(n110), .B0(N22), .B1(n111), .Y(n20) );
  NAND2X2M U110 ( .A(n17), .B(n18), .Y(Arith_OUT_comb[7]) );
  AOI22X1M U111 ( .A0(N57), .A1(n112), .B0(N40), .B1(n109), .Y(n17) );
  AOI22X1M U112 ( .A0(N89), .A1(n110), .B0(N23), .B1(n111), .Y(n18) );
  NAND2X2M U113 ( .A(n15), .B(n16), .Y(Arith_OUT_comb[8]) );
  AOI22X1M U114 ( .A0(N58), .A1(n112), .B0(N41), .B1(n109), .Y(n15) );
  AOI22X1M U115 ( .A0(N90), .A1(n110), .B0(N24), .B1(n111), .Y(n16) );
  NAND2X2M U116 ( .A(n9), .B(n10), .Y(Arith_OUT_comb[9]) );
  AOI22X1M U117 ( .A0(N59), .A1(n112), .B0(N42), .B1(n109), .Y(n9) );
  AOI22X1M U118 ( .A0(N91), .A1(n110), .B0(N25), .B1(n111), .Y(n10) );
  NAND2X2M U119 ( .A(n43), .B(n44), .Y(Arith_OUT_comb[10]) );
  AOI22X1M U120 ( .A0(N60), .A1(n112), .B0(N43), .B1(n109), .Y(n43) );
  AOI22X1M U121 ( .A0(N92), .A1(n110), .B0(N26), .B1(n111), .Y(n44) );
  NAND2X2M U122 ( .A(n41), .B(n42), .Y(Arith_OUT_comb[11]) );
  AOI22X1M U123 ( .A0(N61), .A1(n112), .B0(N44), .B1(n109), .Y(n41) );
  AOI22X1M U124 ( .A0(N93), .A1(n110), .B0(N27), .B1(n111), .Y(n42) );
  NAND2X2M U125 ( .A(n39), .B(n40), .Y(Arith_OUT_comb[12]) );
  AOI22X1M U126 ( .A0(N62), .A1(n112), .B0(N45), .B1(n109), .Y(n39) );
  AOI22X1M U127 ( .A0(N94), .A1(n110), .B0(N28), .B1(n111), .Y(n40) );
  INVX2M U128 ( .A(n32), .Y(n115) );
  AOI221XLM U129 ( .A0(N66), .A1(n13), .B0(N32), .B1(n111), .C0(n27), .Y(n32)
         );
  NAND2X2M U130 ( .A(n35), .B(n36), .Y(Arith_OUT_comb[14]) );
  AOI22X1M U131 ( .A0(N96), .A1(n110), .B0(N30), .B1(n111), .Y(n36) );
  AOI22X1M U132 ( .A0(N64), .A1(n112), .B0(N47), .B1(n109), .Y(n35) );
  NAND2X2M U133 ( .A(n37), .B(n38), .Y(Arith_OUT_comb[13]) );
  AOI22X1M U134 ( .A0(N95), .A1(n110), .B0(N29), .B1(n111), .Y(n38) );
  AOI22X1M U135 ( .A0(N63), .A1(n13), .B0(N46), .B1(n109), .Y(n37) );
  NAND2X2M U136 ( .A(n33), .B(n34), .Y(Arith_OUT_comb[15]) );
  AOI22X1M U137 ( .A0(N97), .A1(n110), .B0(N31), .B1(n111), .Y(n34) );
  AOI22X1M U138 ( .A0(N65), .A1(n13), .B0(N48), .B1(n109), .Y(n33) );
  AND2X2M U139 ( .A(N49), .B(n109), .Y(n27) );
  BUFX2M U140 ( .A(n11), .Y(n110) );
  NOR3BX2M U141 ( .AN(Arith_enable), .B(n116), .C(n117), .Y(n11) );
  BUFX2M U142 ( .A(n114), .Y(n113) );
  INVX2M U143 ( .A(n13), .Y(n114) );
  NOR3BX2M U144 ( .AN(Arith_enable), .B(n116), .C(ALU_FUNC[0]), .Y(n13) );
  BUFX2M U145 ( .A(n14), .Y(n109) );
  NOR3BX2M U146 ( .AN(Arith_enable), .B(n117), .C(ALU_FUNC[1]), .Y(n14) );
  BUFX2M U147 ( .A(n12), .Y(n111) );
  NOR3BX2M U148 ( .AN(Arith_enable), .B(ALU_FUNC[0]), .C(ALU_FUNC[1]), .Y(n12)
         );
  INVX2M U149 ( .A(ALU_FUNC[1]), .Y(n116) );
  INVX2M U150 ( .A(ALU_FUNC[0]), .Y(n117) );
endmodule


module LOGIC_UNIT ( A, B, ALU_FUNC, CLK, Logic_enable, Logic_OUT, Logic_Flag
 );
  input [15:0] A;
  input [15:0] B;
  input [1:0] ALU_FUNC;
  output [15:0] Logic_OUT;
  input CLK, Logic_enable;
  output Logic_Flag;
  wire   n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n32, n33, n34, n35, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n1, n2, n4, n6, n8, n10, n12, n14, n16, n18, n20, n22, n24,
         n26, n28, n30, n36, n85, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118;
  wire   [15:0] Logic_OUT_comb;

  DFFQX2M Logic_Flag_reg ( .D(Logic_enable), .CK(CLK), .Q(n135) );
  DFFQX2M Logic_OUT_reg_9_ ( .D(Logic_OUT_comb[9]), .CK(CLK), .Q(n125) );
  DFFQX2M Logic_OUT_reg_15_ ( .D(Logic_OUT_comb[15]), .CK(CLK), .Q(n119) );
  DFFQX2M Logic_OUT_reg_14_ ( .D(Logic_OUT_comb[14]), .CK(CLK), .Q(n120) );
  DFFQX2M Logic_OUT_reg_13_ ( .D(Logic_OUT_comb[13]), .CK(CLK), .Q(n121) );
  DFFQX2M Logic_OUT_reg_12_ ( .D(Logic_OUT_comb[12]), .CK(CLK), .Q(n122) );
  DFFQX2M Logic_OUT_reg_11_ ( .D(Logic_OUT_comb[11]), .CK(CLK), .Q(n123) );
  DFFQX2M Logic_OUT_reg_10_ ( .D(Logic_OUT_comb[10]), .CK(CLK), .Q(n124) );
  DFFQX2M Logic_OUT_reg_5_ ( .D(Logic_OUT_comb[5]), .CK(CLK), .Q(n129) );
  DFFQX2M Logic_OUT_reg_4_ ( .D(Logic_OUT_comb[4]), .CK(CLK), .Q(n130) );
  DFFQX2M Logic_OUT_reg_3_ ( .D(Logic_OUT_comb[3]), .CK(CLK), .Q(n131) );
  DFFQX2M Logic_OUT_reg_2_ ( .D(Logic_OUT_comb[2]), .CK(CLK), .Q(n132) );
  DFFQX2M Logic_OUT_reg_1_ ( .D(Logic_OUT_comb[1]), .CK(CLK), .Q(n133) );
  DFFQX2M Logic_OUT_reg_0_ ( .D(Logic_OUT_comb[0]), .CK(CLK), .Q(n134) );
  DFFQX2M Logic_OUT_reg_8_ ( .D(Logic_OUT_comb[8]), .CK(CLK), .Q(n126) );
  DFFQX2M Logic_OUT_reg_7_ ( .D(Logic_OUT_comb[7]), .CK(CLK), .Q(n127) );
  DFFQX2M Logic_OUT_reg_6_ ( .D(Logic_OUT_comb[6]), .CK(CLK), .Q(n128) );
  NAND3X2M U3 ( .A(ALU_FUNC[0]), .B(n118), .C(Logic_enable), .Y(n1) );
  INVXLM U4 ( .A(n128), .Y(n2) );
  INVX8M U5 ( .A(n2), .Y(Logic_OUT[6]) );
  INVXLM U6 ( .A(n127), .Y(n4) );
  INVX8M U7 ( .A(n4), .Y(Logic_OUT[7]) );
  INVXLM U8 ( .A(n126), .Y(n6) );
  INVX8M U9 ( .A(n6), .Y(Logic_OUT[8]) );
  INVXLM U10 ( .A(n134), .Y(n8) );
  INVX8M U11 ( .A(n8), .Y(Logic_OUT[0]) );
  INVXLM U12 ( .A(n133), .Y(n10) );
  INVX8M U13 ( .A(n10), .Y(Logic_OUT[1]) );
  INVXLM U14 ( .A(n132), .Y(n12) );
  INVX8M U15 ( .A(n12), .Y(Logic_OUT[2]) );
  INVXLM U16 ( .A(n131), .Y(n14) );
  INVX8M U17 ( .A(n14), .Y(Logic_OUT[3]) );
  INVXLM U18 ( .A(n130), .Y(n16) );
  INVX8M U19 ( .A(n16), .Y(Logic_OUT[4]) );
  INVXLM U20 ( .A(n129), .Y(n18) );
  INVX8M U21 ( .A(n18), .Y(Logic_OUT[5]) );
  INVXLM U22 ( .A(n124), .Y(n20) );
  INVX8M U23 ( .A(n20), .Y(Logic_OUT[10]) );
  INVXLM U24 ( .A(n123), .Y(n22) );
  INVX8M U25 ( .A(n22), .Y(Logic_OUT[11]) );
  INVXLM U26 ( .A(n122), .Y(n24) );
  INVX8M U27 ( .A(n24), .Y(Logic_OUT[12]) );
  INVXLM U28 ( .A(n121), .Y(n26) );
  INVX8M U29 ( .A(n26), .Y(Logic_OUT[13]) );
  INVXLM U30 ( .A(n120), .Y(n28) );
  INVX8M U31 ( .A(n28), .Y(Logic_OUT[14]) );
  INVXLM U32 ( .A(n119), .Y(n30) );
  INVX8M U33 ( .A(n30), .Y(Logic_OUT[15]) );
  INVXLM U34 ( .A(n125), .Y(n36) );
  INVX8M U35 ( .A(n36), .Y(Logic_OUT[9]) );
  INVXLM U36 ( .A(n135), .Y(n85) );
  INVX8M U37 ( .A(n85), .Y(Logic_Flag) );
  BUFX2M U38 ( .A(n41), .Y(n87) );
  NAND2X2M U39 ( .A(Logic_enable), .B(n118), .Y(n40) );
  OAI221X1M U40 ( .A0(A[0]), .A1(n35), .B0(n1), .B1(n102), .C0(n81), .Y(
        Logic_OUT_comb[0]) );
  AOI22X1M U41 ( .A0(n82), .A1(n117), .B0(B[0]), .B1(n83), .Y(n81) );
  INVX2M U42 ( .A(B[0]), .Y(n117) );
  OAI21X2M U43 ( .A0(n40), .A1(n102), .B0(n1), .Y(n83) );
  OAI221X1M U44 ( .A0(A[1]), .A1(n35), .B0(n1), .B1(n101), .C0(n60), .Y(
        Logic_OUT_comb[1]) );
  AOI22X1M U45 ( .A0(n61), .A1(n116), .B0(B[1]), .B1(n62), .Y(n60) );
  INVX2M U46 ( .A(B[1]), .Y(n116) );
  OAI21X2M U47 ( .A0(n40), .A1(n101), .B0(n1), .Y(n62) );
  OAI221X1M U48 ( .A0(A[2]), .A1(n35), .B0(n1), .B1(n100), .C0(n57), .Y(
        Logic_OUT_comb[2]) );
  AOI22X1M U49 ( .A0(n58), .A1(n115), .B0(B[2]), .B1(n59), .Y(n57) );
  INVX2M U50 ( .A(B[2]), .Y(n115) );
  OAI21X2M U51 ( .A0(n40), .A1(n100), .B0(n1), .Y(n59) );
  OAI221X1M U52 ( .A0(A[3]), .A1(n35), .B0(n1), .B1(n99), .C0(n54), .Y(
        Logic_OUT_comb[3]) );
  AOI22X1M U53 ( .A0(n55), .A1(n114), .B0(B[3]), .B1(n56), .Y(n54) );
  INVX2M U54 ( .A(B[3]), .Y(n114) );
  OAI21X2M U55 ( .A0(n40), .A1(n99), .B0(n1), .Y(n56) );
  OAI221X1M U56 ( .A0(A[4]), .A1(n35), .B0(n1), .B1(n98), .C0(n51), .Y(
        Logic_OUT_comb[4]) );
  AOI22X1M U57 ( .A0(n52), .A1(n113), .B0(B[4]), .B1(n53), .Y(n51) );
  INVX2M U58 ( .A(B[4]), .Y(n113) );
  OAI21X2M U59 ( .A0(n40), .A1(n98), .B0(n1), .Y(n53) );
  OAI221X1M U60 ( .A0(A[5]), .A1(n35), .B0(n1), .B1(n97), .C0(n48), .Y(
        Logic_OUT_comb[5]) );
  AOI22X1M U61 ( .A0(n49), .A1(n112), .B0(B[5]), .B1(n50), .Y(n48) );
  INVX2M U62 ( .A(B[5]), .Y(n112) );
  OAI21X2M U63 ( .A0(n40), .A1(n97), .B0(n1), .Y(n50) );
  OAI221X1M U64 ( .A0(A[6]), .A1(n35), .B0(n1), .B1(n96), .C0(n45), .Y(
        Logic_OUT_comb[6]) );
  AOI22X1M U65 ( .A0(n46), .A1(n111), .B0(B[6]), .B1(n47), .Y(n45) );
  INVX2M U66 ( .A(B[6]), .Y(n111) );
  OAI21X2M U67 ( .A0(n40), .A1(n96), .B0(n1), .Y(n47) );
  OAI221X1M U68 ( .A0(A[7]), .A1(n35), .B0(n1), .B1(n95), .C0(n42), .Y(
        Logic_OUT_comb[7]) );
  AOI22X1M U69 ( .A0(n43), .A1(n110), .B0(B[7]), .B1(n44), .Y(n42) );
  INVX2M U70 ( .A(B[7]), .Y(n110) );
  OAI21X2M U71 ( .A0(n40), .A1(n95), .B0(n1), .Y(n44) );
  OAI221X1M U72 ( .A0(A[8]), .A1(n35), .B0(n94), .B1(n1), .C0(n37), .Y(
        Logic_OUT_comb[8]) );
  AOI22X1M U73 ( .A0(n38), .A1(n109), .B0(B[8]), .B1(n39), .Y(n37) );
  INVX2M U74 ( .A(B[8]), .Y(n109) );
  OAI21X2M U75 ( .A0(n40), .A1(n94), .B0(n1), .Y(n39) );
  OAI221X1M U76 ( .A0(A[10]), .A1(n35), .B0(n1), .B1(n93), .C0(n78), .Y(
        Logic_OUT_comb[10]) );
  AOI22X1M U77 ( .A0(n79), .A1(n108), .B0(B[10]), .B1(n80), .Y(n78) );
  INVX2M U78 ( .A(B[10]), .Y(n108) );
  OAI21X2M U79 ( .A0(n40), .A1(n93), .B0(n1), .Y(n80) );
  OAI221X1M U80 ( .A0(A[11]), .A1(n35), .B0(n1), .B1(n92), .C0(n75), .Y(
        Logic_OUT_comb[11]) );
  AOI22X1M U81 ( .A0(n76), .A1(n107), .B0(B[11]), .B1(n77), .Y(n75) );
  INVX2M U82 ( .A(B[11]), .Y(n107) );
  OAI21X2M U83 ( .A0(n40), .A1(n92), .B0(n1), .Y(n77) );
  OAI221X1M U84 ( .A0(A[12]), .A1(n35), .B0(n1), .B1(n91), .C0(n72), .Y(
        Logic_OUT_comb[12]) );
  AOI22X1M U85 ( .A0(n73), .A1(n106), .B0(B[12]), .B1(n74), .Y(n72) );
  INVX2M U86 ( .A(B[12]), .Y(n106) );
  OAI21X2M U87 ( .A0(n40), .A1(n91), .B0(n1), .Y(n74) );
  OAI221X1M U88 ( .A0(A[13]), .A1(n35), .B0(n1), .B1(n90), .C0(n69), .Y(
        Logic_OUT_comb[13]) );
  AOI22X1M U89 ( .A0(n70), .A1(n105), .B0(B[13]), .B1(n71), .Y(n69) );
  INVX2M U90 ( .A(B[13]), .Y(n105) );
  OAI21X2M U91 ( .A0(n40), .A1(n90), .B0(n1), .Y(n71) );
  OAI221X1M U92 ( .A0(A[14]), .A1(n35), .B0(n1), .B1(n89), .C0(n66), .Y(
        Logic_OUT_comb[14]) );
  AOI22X1M U93 ( .A0(n67), .A1(n104), .B0(B[14]), .B1(n68), .Y(n66) );
  INVX2M U94 ( .A(B[14]), .Y(n104) );
  OAI21X2M U95 ( .A0(n40), .A1(n89), .B0(n1), .Y(n68) );
  OAI221X1M U96 ( .A0(A[15]), .A1(n35), .B0(n1), .B1(n88), .C0(n63), .Y(
        Logic_OUT_comb[15]) );
  AOI22X1M U97 ( .A0(n64), .A1(n103), .B0(B[15]), .B1(n65), .Y(n63) );
  INVX2M U98 ( .A(B[15]), .Y(n103) );
  OAI21X2M U99 ( .A0(n40), .A1(n88), .B0(n1), .Y(n65) );
  OAI21X2M U100 ( .A0(A[14]), .A1(n87), .B0(n35), .Y(n67) );
  OAI21X2M U101 ( .A0(A[15]), .A1(n87), .B0(n35), .Y(n64) );
  OAI21X2M U102 ( .A0(A[1]), .A1(n87), .B0(n35), .Y(n61) );
  OAI21X2M U103 ( .A0(A[0]), .A1(n87), .B0(n35), .Y(n82) );
  OAI21X2M U104 ( .A0(A[2]), .A1(n87), .B0(n35), .Y(n58) );
  OAI21X2M U105 ( .A0(A[3]), .A1(n87), .B0(n35), .Y(n55) );
  OAI21X2M U106 ( .A0(A[4]), .A1(n87), .B0(n35), .Y(n52) );
  OAI21X2M U107 ( .A0(A[5]), .A1(n87), .B0(n35), .Y(n49) );
  OAI21X2M U108 ( .A0(A[6]), .A1(n87), .B0(n35), .Y(n46) );
  OAI21X2M U109 ( .A0(A[7]), .A1(n87), .B0(n35), .Y(n43) );
  OAI21X2M U110 ( .A0(A[8]), .A1(n87), .B0(n35), .Y(n38) );
  OAI21X2M U111 ( .A0(A[10]), .A1(n87), .B0(n35), .Y(n79) );
  OAI21X2M U112 ( .A0(A[11]), .A1(n87), .B0(n35), .Y(n76) );
  OAI21X2M U113 ( .A0(A[12]), .A1(n87), .B0(n35), .Y(n73) );
  OAI21X2M U114 ( .A0(A[13]), .A1(n87), .B0(n35), .Y(n70) );
  NAND2X2M U115 ( .A(Logic_enable), .B(ALU_FUNC[1]), .Y(n41) );
  NAND3BX2M U116 ( .AN(ALU_FUNC[0]), .B(ALU_FUNC[1]), .C(Logic_enable), .Y(n35) );
  NOR2BX2M U117 ( .AN(Logic_enable), .B(n32), .Y(Logic_OUT_comb[9]) );
  XNOR2X2M U118 ( .A(ALU_FUNC[1]), .B(n33), .Y(n32) );
  OAI2BB1X2M U119 ( .A0N(ALU_FUNC[0]), .A1N(A[9]), .B0(n34), .Y(n33) );
  OAI21X2M U120 ( .A0(ALU_FUNC[0]), .A1(A[9]), .B0(B[9]), .Y(n34) );
  INVX2M U121 ( .A(ALU_FUNC[1]), .Y(n118) );
  INVX2M U122 ( .A(A[14]), .Y(n89) );
  INVX2M U123 ( .A(A[15]), .Y(n88) );
  INVX2M U124 ( .A(A[1]), .Y(n101) );
  INVX2M U125 ( .A(A[8]), .Y(n94) );
  INVX2M U126 ( .A(A[4]), .Y(n98) );
  INVX2M U127 ( .A(A[5]), .Y(n97) );
  INVX2M U128 ( .A(A[7]), .Y(n95) );
  INVX2M U129 ( .A(A[10]), .Y(n93) );
  INVX2M U130 ( .A(A[11]), .Y(n92) );
  INVX2M U131 ( .A(A[0]), .Y(n102) );
  INVX2M U132 ( .A(A[6]), .Y(n96) );
  INVX2M U133 ( .A(A[12]), .Y(n91) );
  INVX2M U134 ( .A(A[13]), .Y(n90) );
  INVX2M U135 ( .A(A[2]), .Y(n100) );
  INVX2M U136 ( .A(A[3]), .Y(n99) );
endmodule


module SHIFT_UNIT ( A, B, ALU_FUNC, CLK, Shift_enable, Shift_OUT, Shift_Flag
 );
  input [15:0] A;
  input [15:0] B;
  input [1:0] ALU_FUNC;
  output [15:0] Shift_OUT;
  input CLK, Shift_enable;
  output Shift_Flag;
  wire   n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n1, n3, n5, n7, n9, n11,
         n13, n15, n17, n39, n41, n43, n45, n47, n49, n51, n53, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75;
  wire   [15:0] Shift_OUT_comb;

  DFFQX2M Shift_Flag_reg ( .D(Shift_enable), .CK(CLK), .Q(n92) );
  DFFQX2M Shift_OUT_reg_0_ ( .D(Shift_OUT_comb[0]), .CK(CLK), .Q(n91) );
  DFFQX2M Shift_OUT_reg_15_ ( .D(Shift_OUT_comb[15]), .CK(CLK), .Q(n76) );
  DFFQX2M Shift_OUT_reg_14_ ( .D(Shift_OUT_comb[14]), .CK(CLK), .Q(n77) );
  DFFQX2M Shift_OUT_reg_1_ ( .D(Shift_OUT_comb[1]), .CK(CLK), .Q(n90) );
  DFFQX2M Shift_OUT_reg_8_ ( .D(Shift_OUT_comb[8]), .CK(CLK), .Q(n83) );
  DFFQX2M Shift_OUT_reg_2_ ( .D(Shift_OUT_comb[2]), .CK(CLK), .Q(n89) );
  DFFQX2M Shift_OUT_reg_12_ ( .D(Shift_OUT_comb[12]), .CK(CLK), .Q(n79) );
  DFFQX2M Shift_OUT_reg_11_ ( .D(Shift_OUT_comb[11]), .CK(CLK), .Q(n80) );
  DFFQX2M Shift_OUT_reg_5_ ( .D(Shift_OUT_comb[5]), .CK(CLK), .Q(n86) );
  DFFQX2M Shift_OUT_reg_13_ ( .D(Shift_OUT_comb[13]), .CK(CLK), .Q(n78) );
  DFFQX2M Shift_OUT_reg_10_ ( .D(Shift_OUT_comb[10]), .CK(CLK), .Q(n81) );
  DFFQX2M Shift_OUT_reg_9_ ( .D(Shift_OUT_comb[9]), .CK(CLK), .Q(n82) );
  DFFQX2M Shift_OUT_reg_6_ ( .D(Shift_OUT_comb[6]), .CK(CLK), .Q(n85) );
  DFFQX2M Shift_OUT_reg_4_ ( .D(Shift_OUT_comb[4]), .CK(CLK), .Q(n87) );
  DFFQX2M Shift_OUT_reg_3_ ( .D(Shift_OUT_comb[3]), .CK(CLK), .Q(n88) );
  DFFQX2M Shift_OUT_reg_7_ ( .D(Shift_OUT_comb[7]), .CK(CLK), .Q(n84) );
  INVXLM U3 ( .A(n84), .Y(n1) );
  INVX8M U4 ( .A(n1), .Y(Shift_OUT[7]) );
  INVXLM U5 ( .A(n88), .Y(n3) );
  INVX8M U6 ( .A(n3), .Y(Shift_OUT[3]) );
  INVXLM U7 ( .A(n87), .Y(n5) );
  INVX8M U8 ( .A(n5), .Y(Shift_OUT[4]) );
  INVXLM U9 ( .A(n85), .Y(n7) );
  INVX8M U10 ( .A(n7), .Y(Shift_OUT[6]) );
  INVXLM U11 ( .A(n82), .Y(n9) );
  INVX8M U12 ( .A(n9), .Y(Shift_OUT[9]) );
  INVXLM U13 ( .A(n81), .Y(n11) );
  INVX8M U14 ( .A(n11), .Y(Shift_OUT[10]) );
  INVXLM U15 ( .A(n78), .Y(n13) );
  INVX8M U16 ( .A(n13), .Y(Shift_OUT[13]) );
  INVXLM U17 ( .A(n86), .Y(n15) );
  INVX8M U18 ( .A(n15), .Y(Shift_OUT[5]) );
  INVXLM U19 ( .A(n80), .Y(n17) );
  INVX8M U20 ( .A(n17), .Y(Shift_OUT[11]) );
  INVXLM U21 ( .A(n79), .Y(n39) );
  INVX8M U22 ( .A(n39), .Y(Shift_OUT[12]) );
  INVXLM U23 ( .A(n89), .Y(n41) );
  INVX8M U24 ( .A(n41), .Y(Shift_OUT[2]) );
  INVXLM U25 ( .A(n83), .Y(n43) );
  INVX8M U26 ( .A(n43), .Y(Shift_OUT[8]) );
  INVXLM U27 ( .A(n90), .Y(n45) );
  INVX8M U28 ( .A(n45), .Y(Shift_OUT[1]) );
  INVXLM U29 ( .A(n77), .Y(n47) );
  INVX8M U30 ( .A(n47), .Y(Shift_OUT[14]) );
  INVXLM U31 ( .A(n76), .Y(n49) );
  INVX8M U32 ( .A(n49), .Y(Shift_OUT[15]) );
  INVXLM U33 ( .A(n91), .Y(n51) );
  INVX8M U34 ( .A(n51), .Y(Shift_OUT[0]) );
  INVXLM U35 ( .A(n92), .Y(n53) );
  INVX8M U36 ( .A(n53), .Y(Shift_Flag) );
  INVX2M U37 ( .A(n57), .Y(n74) );
  INVX2M U38 ( .A(n55), .Y(n73) );
  OAI221X1M U39 ( .A0(n57), .A1(n67), .B0(n65), .B1(n55), .C0(n24), .Y(
        Shift_OUT_comb[7]) );
  AOI22X1M U40 ( .A0(A[6]), .A1(n58), .B0(n56), .B1(A[8]), .Y(n24) );
  OAI221X1M U41 ( .A0(n57), .A1(n72), .B0(n55), .B1(n70), .C0(n29), .Y(
        Shift_OUT_comb[2]) );
  AOI22X1M U42 ( .A0(A[1]), .A1(n58), .B0(A[3]), .B1(n56), .Y(n29) );
  OAI221X1M U43 ( .A0(n57), .A1(n71), .B0(n55), .B1(n69), .C0(n28), .Y(
        Shift_OUT_comb[3]) );
  INVX2M U44 ( .A(B[2]), .Y(n71) );
  AOI22X1M U45 ( .A0(A[2]), .A1(n58), .B0(A[4]), .B1(n56), .Y(n28) );
  OAI221X1M U46 ( .A0(n57), .A1(n70), .B0(n55), .B1(n68), .C0(n27), .Y(
        Shift_OUT_comb[4]) );
  AOI22X1M U47 ( .A0(A[3]), .A1(n58), .B0(A[5]), .B1(n56), .Y(n27) );
  OAI221X1M U48 ( .A0(n57), .A1(n69), .B0(n55), .B1(n67), .C0(n26), .Y(
        Shift_OUT_comb[5]) );
  AOI22X1M U49 ( .A0(A[4]), .A1(n58), .B0(A[6]), .B1(n56), .Y(n26) );
  OAI221X1M U50 ( .A0(n57), .A1(n68), .B0(n55), .B1(n66), .C0(n25), .Y(
        Shift_OUT_comb[6]) );
  AOI22X1M U51 ( .A0(A[5]), .A1(n58), .B0(A[7]), .B1(n56), .Y(n25) );
  OAI221X1M U52 ( .A0(n57), .A1(n66), .B0(n55), .B1(n64), .C0(n23), .Y(
        Shift_OUT_comb[8]) );
  AOI22X1M U53 ( .A0(A[7]), .A1(n58), .B0(A[9]), .B1(n56), .Y(n23) );
  OAI221X1M U54 ( .A0(n57), .A1(n65), .B0(n55), .B1(n63), .C0(n20), .Y(
        Shift_OUT_comb[9]) );
  AOI22X1M U55 ( .A0(A[8]), .A1(n58), .B0(A[10]), .B1(n56), .Y(n20) );
  OAI221X1M U56 ( .A0(n57), .A1(n64), .B0(n55), .B1(n62), .C0(n37), .Y(
        Shift_OUT_comb[10]) );
  AOI22X1M U57 ( .A0(A[9]), .A1(n58), .B0(A[11]), .B1(n56), .Y(n37) );
  OAI221X1M U58 ( .A0(n57), .A1(n63), .B0(n55), .B1(n61), .C0(n36), .Y(
        Shift_OUT_comb[11]) );
  AOI22X1M U59 ( .A0(A[10]), .A1(n58), .B0(A[12]), .B1(n56), .Y(n36) );
  OAI221X1M U60 ( .A0(n57), .A1(n62), .B0(n55), .B1(n60), .C0(n35), .Y(
        Shift_OUT_comb[12]) );
  INVX2M U61 ( .A(B[13]), .Y(n60) );
  AOI22X1M U62 ( .A0(A[11]), .A1(n58), .B0(A[13]), .B1(n56), .Y(n35) );
  OAI221X1M U63 ( .A0(n57), .A1(n61), .B0(n55), .B1(n59), .C0(n34), .Y(
        Shift_OUT_comb[13]) );
  AOI22X1M U64 ( .A0(A[12]), .A1(n58), .B0(A[14]), .B1(n56), .Y(n34) );
  OAI2BB2X1M U65 ( .B0(n57), .B1(n59), .A0N(n58), .A1N(A[14]), .Y(
        Shift_OUT_comb[15]) );
  OAI2BB2X1M U66 ( .B0(n55), .B1(n72), .A0N(n56), .A1N(A[1]), .Y(
        Shift_OUT_comb[0]) );
  NAND2X2M U67 ( .A(n30), .B(n31), .Y(Shift_OUT_comb[1]) );
  AOI22X1M U68 ( .A0(B[0]), .A1(n74), .B0(B[2]), .B1(n73), .Y(n31) );
  AOI22X1M U69 ( .A0(A[0]), .A1(n58), .B0(A[2]), .B1(n56), .Y(n30) );
  NAND2X2M U70 ( .A(n32), .B(n33), .Y(Shift_OUT_comb[14]) );
  AOI22X1M U71 ( .A0(B[13]), .A1(n74), .B0(B[15]), .B1(n73), .Y(n33) );
  AOI22X1M U72 ( .A0(A[13]), .A1(n58), .B0(A[15]), .B1(n56), .Y(n32) );
  BUFX2M U73 ( .A(n18), .Y(n57) );
  NAND3X2M U74 ( .A(ALU_FUNC[1]), .B(ALU_FUNC[0]), .C(Shift_enable), .Y(n18)
         );
  BUFX2M U75 ( .A(n19), .Y(n55) );
  NAND3X2M U76 ( .A(ALU_FUNC[1]), .B(n75), .C(Shift_enable), .Y(n19) );
  BUFX2M U77 ( .A(n22), .Y(n56) );
  NOR3BX2M U78 ( .AN(Shift_enable), .B(ALU_FUNC[0]), .C(ALU_FUNC[1]), .Y(n22)
         );
  BUFX2M U79 ( .A(n21), .Y(n58) );
  NOR3BX2M U80 ( .AN(Shift_enable), .B(n75), .C(ALU_FUNC[1]), .Y(n21) );
  INVX2M U81 ( .A(ALU_FUNC[0]), .Y(n75) );
  INVX2M U82 ( .A(B[14]), .Y(n59) );
  INVX2M U83 ( .A(B[1]), .Y(n72) );
  INVX2M U84 ( .A(B[7]), .Y(n66) );
  INVX2M U85 ( .A(B[4]), .Y(n69) );
  INVX2M U86 ( .A(B[5]), .Y(n68) );
  INVX2M U87 ( .A(B[10]), .Y(n63) );
  INVX2M U88 ( .A(B[11]), .Y(n62) );
  INVX2M U89 ( .A(B[6]), .Y(n67) );
  INVX2M U90 ( .A(B[8]), .Y(n65) );
  INVX2M U91 ( .A(B[3]), .Y(n70) );
  INVX2M U92 ( .A(B[12]), .Y(n61) );
  INVX2M U93 ( .A(B[9]), .Y(n64) );
endmodule


module CMP_UNIT_DW01_cmp6_0 ( A, B, TC, LT, GT, EQ, LE, GE, NE );
  input [15:0] A;
  input [15:0] B;
  input TC;
  output LT, GT, EQ, LE, GE, NE;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70;

  INVX2M U1 ( .A(n27), .Y(n4) );
  INVX2M U2 ( .A(n41), .Y(n6) );
  INVX2M U3 ( .A(n38), .Y(n5) );
  INVX2M U4 ( .A(n49), .Y(n7) );
  INVX2M U5 ( .A(n16), .Y(n1) );
  INVX2M U6 ( .A(B[14]), .Y(n8) );
  INVX2M U7 ( .A(B[7]), .Y(n11) );
  INVX2M U8 ( .A(B[4]), .Y(n13) );
  INVX2M U9 ( .A(B[5]), .Y(n12) );
  INVX2M U10 ( .A(B[10]), .Y(n10) );
  INVX2M U11 ( .A(B[11]), .Y(n9) );
  INVX2M U12 ( .A(A[14]), .Y(n3) );
  INVX2M U13 ( .A(A[15]), .Y(n2) );
  NOR2X1M U14 ( .A(LT), .B(GT), .Y(EQ) );
  OAI21BX1M U15 ( .A0(n14), .A1(n1), .B0N(n15), .Y(GT) );
  AOI32X1M U16 ( .A0(n17), .A1(n18), .A2(n19), .B0(A[14]), .B1(n8), .Y(n14) );
  OAI2B11X1M U17 ( .A1N(n20), .A0(n21), .B0(n22), .C0(n23), .Y(n17) );
  AOI31X1M U18 ( .A0(n4), .A1(n24), .A2(n25), .B0(n26), .Y(n20) );
  NOR3BX1M U19 ( .AN(n28), .B(n29), .C(n30), .Y(n27) );
  AOI211X1M U20 ( .A0(n31), .A1(n32), .B0(n33), .C0(n34), .Y(n30) );
  AOI31X1M U21 ( .A0(n35), .A1(n36), .A2(n37), .B0(n38), .Y(n31) );
  NAND3BX1M U22 ( .AN(n39), .B(n40), .C(n6), .Y(n37) );
  OAI211X1M U23 ( .A0(n42), .A1(n43), .B0(n44), .C0(n45), .Y(n40) );
  OAI31X1M U24 ( .A0(n7), .A1(n46), .A2(n47), .B0(n48), .Y(n43) );
  OAI211X1M U25 ( .A0(n50), .A1(A[1]), .B0(n51), .C0(n52), .Y(n49) );
  OAI2BB1X1M U26 ( .A0N(n50), .A1N(A[1]), .B0(B[1]), .Y(n52) );
  NOR2BX1M U27 ( .AN(A[0]), .B(B[0]), .Y(n50) );
  OAI21X1M U28 ( .A0(n15), .A1(n53), .B0(n16), .Y(LT) );
  CLKNAND2X2M U29 ( .A(B[15]), .B(n2), .Y(n16) );
  AOI32X1M U30 ( .A0(n54), .A1(n22), .A2(n19), .B0(B[14]), .B1(n3), .Y(n53) );
  CLKXOR2X2M U31 ( .A(n3), .B(B[14]), .Y(n19) );
  NAND2BX1M U32 ( .AN(B[13]), .B(A[13]), .Y(n22) );
  OAI211X1M U33 ( .A0(n21), .A1(n55), .B0(n56), .C0(n18), .Y(n54) );
  NAND2BX1M U34 ( .AN(A[13]), .B(B[13]), .Y(n18) );
  OAI31X1M U35 ( .A0(n26), .A1(n57), .A2(n58), .B0(n25), .Y(n55) );
  CLKNAND2X2M U36 ( .A(A[11]), .B(n9), .Y(n25) );
  AOI211X1M U37 ( .A0(n59), .A1(n28), .B0(n29), .C0(n34), .Y(n58) );
  NOR2BX1M U38 ( .AN(A[9]), .B(B[9]), .Y(n34) );
  NAND2BX1M U39 ( .AN(n57), .B(n24), .Y(n29) );
  CLKNAND2X2M U40 ( .A(A[10]), .B(n10), .Y(n24) );
  NAND2BX1M U41 ( .AN(A[9]), .B(B[9]), .Y(n28) );
  AOI31X1M U42 ( .A0(n60), .A1(n35), .A2(n32), .B0(n61), .Y(n59) );
  NOR2X1M U43 ( .A(n33), .B(n61), .Y(n32) );
  NOR2BX1M U44 ( .AN(B[8]), .B(A[8]), .Y(n61) );
  NOR2BX1M U45 ( .AN(A[8]), .B(B[8]), .Y(n33) );
  CLKNAND2X2M U46 ( .A(A[7]), .B(n11), .Y(n35) );
  OAI211X1M U47 ( .A0(n41), .A1(n62), .B0(n63), .C0(n5), .Y(n60) );
  NOR2X1M U48 ( .A(n11), .B(A[7]), .Y(n38) );
  OAI31X1M U49 ( .A0(n39), .A1(n64), .A2(n65), .B0(n44), .Y(n62) );
  CLKNAND2X2M U50 ( .A(A[5]), .B(n12), .Y(n44) );
  AOI211X1M U51 ( .A0(n66), .A1(n48), .B0(n42), .C0(n47), .Y(n65) );
  NOR2BX1M U52 ( .AN(A[3]), .B(B[3]), .Y(n47) );
  NAND2BX1M U53 ( .AN(n64), .B(n45), .Y(n42) );
  CLKNAND2X2M U54 ( .A(A[4]), .B(n13), .Y(n45) );
  NAND2BX1M U55 ( .AN(A[3]), .B(B[3]), .Y(n48) );
  AOI31X1M U56 ( .A0(n67), .A1(n68), .A2(n51), .B0(n69), .Y(n66) );
  NOR2X1M U57 ( .A(n46), .B(n69), .Y(n51) );
  NOR2BX1M U58 ( .AN(B[2]), .B(A[2]), .Y(n69) );
  NOR2BX1M U59 ( .AN(A[2]), .B(B[2]), .Y(n46) );
  OAI21BX1M U60 ( .A0(A[1]), .A1(n70), .B0N(B[1]), .Y(n68) );
  CLKNAND2X2M U61 ( .A(A[1]), .B(n70), .Y(n67) );
  NAND2BX1M U62 ( .AN(A[0]), .B(B[0]), .Y(n70) );
  NOR2X1M U63 ( .A(n13), .B(A[4]), .Y(n64) );
  NOR2X1M U64 ( .A(n12), .B(A[5]), .Y(n39) );
  CLKNAND2X2M U65 ( .A(n36), .B(n63), .Y(n41) );
  NAND2BX1M U66 ( .AN(A[6]), .B(B[6]), .Y(n63) );
  NAND2BX1M U67 ( .AN(B[6]), .B(A[6]), .Y(n36) );
  NOR2X1M U68 ( .A(n10), .B(A[10]), .Y(n57) );
  NOR2X1M U69 ( .A(n9), .B(A[11]), .Y(n26) );
  CLKNAND2X2M U70 ( .A(n23), .B(n56), .Y(n21) );
  NAND2BX1M U71 ( .AN(A[12]), .B(B[12]), .Y(n56) );
  NAND2BX1M U72 ( .AN(B[12]), .B(A[12]), .Y(n23) );
  NOR2X1M U73 ( .A(n2), .B(B[15]), .Y(n15) );
endmodule


module CMP_UNIT ( A, B, ALU_FUNC, CLK, CMP_enable, CMP_OUT, CMP_Flag );
  input [15:0] A;
  input [15:0] B;
  input [1:0] ALU_FUNC;
  output [2:0] CMP_OUT;
  input CLK, CMP_enable;
  output CMP_Flag;
  wire   n16, n17, n18, N16, N17, N18, n8, n9, n4, n6, n10, n12, n13, n14;
  wire   [1:0] CMP_OUT_comb;

  CMP_UNIT_DW01_cmp6_0 r57 ( .A(A), .B(B), .TC(1'b0), .LT(N18), .GT(N17), .EQ(
        N16) );
  DFFQX2M CMP_Flag_reg ( .D(CMP_enable), .CK(CLK), .Q(n18) );
  DFFQX2M CMP_OUT_reg_1_ ( .D(CMP_OUT_comb[1]), .CK(CLK), .Q(n16) );
  DFFQX2M CMP_OUT_reg_0_ ( .D(CMP_OUT_comb[0]), .CK(CLK), .Q(n17) );
  INVX2M U4 ( .A(1'b1), .Y(CMP_OUT[2]) );
  INVXLM U7 ( .A(n17), .Y(n4) );
  INVX8M U8 ( .A(n4), .Y(CMP_OUT[0]) );
  INVXLM U9 ( .A(n16), .Y(n6) );
  INVX8M U10 ( .A(n6), .Y(CMP_OUT[1]) );
  INVXLM U11 ( .A(n18), .Y(n10) );
  INVX8M U12 ( .A(n10), .Y(CMP_Flag) );
  INVX2M U13 ( .A(CMP_enable), .Y(n12) );
  NOR3X2M U14 ( .A(n12), .B(n8), .C(n13), .Y(CMP_OUT_comb[1]) );
  AOI22X1M U15 ( .A0(N17), .A1(n14), .B0(N18), .B1(ALU_FUNC[0]), .Y(n8) );
  NOR3X2M U16 ( .A(n12), .B(n9), .C(n14), .Y(CMP_OUT_comb[0]) );
  AOI22X1M U17 ( .A0(N16), .A1(n13), .B0(ALU_FUNC[1]), .B1(N18), .Y(n9) );
  INVX2M U18 ( .A(ALU_FUNC[1]), .Y(n13) );
  INVX2M U19 ( .A(ALU_FUNC[0]), .Y(n14) );
endmodule


module ALU_TOP ( A, B, ALU_FUNC, CLK, Arith_OUT, Carry_OUT, Arith_Flag, 
        Logic_OUT, Logic_Flag, Shift_OUT, Shift_Flag, CMP_OUT, CMP_Flag );
  input [15:0] A;
  input [15:0] B;
  input [3:0] ALU_FUNC;
  output [31:0] Arith_OUT;
  output [15:0] Logic_OUT;
  output [15:0] Shift_OUT;
  output [2:0] CMP_OUT;
  input CLK;
  output Carry_OUT, Arith_Flag, Logic_Flag, Shift_Flag, CMP_Flag;
  wire   Shift_enable, CMP_enable, Logic_enable, Arith_enable, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, SYNOPSYS_UNCONNECTED_1;

  Decoder U0 ( .IN({n6, n5}), .OUT({Shift_enable, CMP_enable, Logic_enable, 
        Arith_enable}) );
  ARITHMETIC_UNIT U0_ARITHMETIC_UNIT ( .A({n38, n37, n36, n35, n34, n33, n32, 
        n31, n30, n29, n28, n27, n26, n25, n24, n23}), .B({n22, n21, n20, n19, 
        n18, n17, n16, n15, n14, n13, n12, n11, n10, n9, n8, n7}), .ALU_FUNC({
        n4, n3}), .CLK(CLK), .Arith_enable(Arith_enable), .Carry_OUT(Carry_OUT), .Arith_OUT(Arith_OUT), .Arith_Flag(Arith_Flag) );
  LOGIC_UNIT U0_LOGIC_UNIT ( .A({n38, n37, n36, n35, n34, n33, n32, n31, n30, 
        n29, n28, n27, n26, n25, n24, n23}), .B({n22, n21, n20, n19, n18, n17, 
        n16, n15, n14, n13, n12, n11, n10, n9, n8, n7}), .ALU_FUNC({n4, n3}), 
        .CLK(CLK), .Logic_enable(Logic_enable), .Logic_OUT(Logic_OUT), 
        .Logic_Flag(Logic_Flag) );
  SHIFT_UNIT U0_SHIFT_UNIT ( .A({n38, n37, n36, n35, n34, n33, n32, n31, n30, 
        n29, n28, n27, n26, n25, n24, n23}), .B({n22, n21, n20, n19, n18, n17, 
        n16, n15, n14, n13, n12, n11, n10, n9, n8, n7}), .ALU_FUNC({n4, n3}), 
        .CLK(CLK), .Shift_enable(Shift_enable), .Shift_OUT(Shift_OUT), 
        .Shift_Flag(Shift_Flag) );
  CMP_UNIT U0_CMP_UNIT ( .A({n38, n37, n36, n35, n34, n33, n32, n31, n30, n29, 
        n28, n27, n26, n25, n24, n23}), .B({n22, n21, n20, n19, n18, n17, n16, 
        n15, n14, n13, n12, n11, n10, n9, n8, n7}), .ALU_FUNC({n4, n3}), .CLK(
        CLK), .CMP_enable(CMP_enable), .CMP_OUT({SYNOPSYS_UNCONNECTED_1, 
        CMP_OUT[1:0]}), .CMP_Flag(CMP_Flag) );
  INVX8M U1 ( .A(1'b1), .Y(CMP_OUT[2]) );
  BUFX2M U3 ( .A(B[14]), .Y(n21) );
  BUFX2M U4 ( .A(B[7]), .Y(n14) );
  BUFX2M U5 ( .A(A[15]), .Y(n38) );
  BUFX2M U6 ( .A(B[4]), .Y(n11) );
  BUFX2M U7 ( .A(B[5]), .Y(n12) );
  BUFX2M U8 ( .A(A[14]), .Y(n37) );
  BUFX2M U9 ( .A(A[13]), .Y(n36) );
  BUFX2M U10 ( .A(A[12]), .Y(n35) );
  BUFX2M U11 ( .A(A[11]), .Y(n34) );
  BUFX2M U12 ( .A(A[10]), .Y(n33) );
  BUFX2M U13 ( .A(A[8]), .Y(n31) );
  BUFX2M U14 ( .A(A[7]), .Y(n30) );
  BUFX2M U15 ( .A(A[6]), .Y(n29) );
  BUFX2M U16 ( .A(A[5]), .Y(n28) );
  BUFX2M U17 ( .A(A[4]), .Y(n27) );
  BUFX2M U18 ( .A(A[3]), .Y(n26) );
  BUFX2M U19 ( .A(A[2]), .Y(n25) );
  BUFX2M U20 ( .A(A[1]), .Y(n24) );
  BUFX2M U21 ( .A(A[0]), .Y(n23) );
  BUFX2M U22 ( .A(ALU_FUNC[1]), .Y(n4) );
  BUFX2M U23 ( .A(B[13]), .Y(n20) );
  BUFX2M U24 ( .A(B[12]), .Y(n19) );
  BUFX2M U25 ( .A(B[15]), .Y(n22) );
  BUFX2M U26 ( .A(B[10]), .Y(n17) );
  BUFX2M U27 ( .A(B[11]), .Y(n18) );
  BUFX2M U28 ( .A(B[6]), .Y(n13) );
  BUFX2M U29 ( .A(B[8]), .Y(n15) );
  BUFX2M U30 ( .A(B[9]), .Y(n16) );
  BUFX2M U31 ( .A(B[2]), .Y(n9) );
  BUFX2M U32 ( .A(B[0]), .Y(n7) );
  BUFX2M U33 ( .A(B[3]), .Y(n10) );
  BUFX2M U34 ( .A(B[1]), .Y(n8) );
  BUFX2M U35 ( .A(A[9]), .Y(n32) );
  BUFX2M U36 ( .A(ALU_FUNC[0]), .Y(n3) );
  BUFX2M U37 ( .A(ALU_FUNC[3]), .Y(n6) );
  BUFX2M U38 ( .A(ALU_FUNC[2]), .Y(n5) );
endmodule

