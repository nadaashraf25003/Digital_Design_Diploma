/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Mon Aug  3 07:18:49 2026
/////////////////////////////////////////////////////////////


module ClkDiv ( i_ref_clk, i_rst, o_div_clk );
  input i_ref_clk, i_rst;
  output o_div_clk;
  wire   n1;

  DFFRX1M o_div_clk_reg ( .D(n1), .CK(i_ref_clk), .RN(i_rst), .Q(o_div_clk), 
        .QN(n1) );
endmodule


module ALU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n3), .CI(
        \u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n5), .CI(
        \u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n4), .CI(
        \u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n6), .CI(
        \u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n7), .CI(
        \u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n1), .CI(
        \u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n3), .CI(
        \u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n2), .CI(
        \u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n5), .CI(
        \u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n4), .CI(
        \u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n3), .CI(
        \u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n4), .CI(
        \u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n4), .CI(
        \u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n5), .CI(
        \u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n5), .CI(
        \u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n5), .CI(
        \u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n7), .CI(
        \u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n6), .CI(
        \u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n6), .CI(
        \u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n6), .CI(
        \u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n6), .CI(
        \u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n6), .CI(
        \u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n7), .CI(
        \u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n7), .CI(
        \u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n7), .CI(
        \u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n7), .CI(
        \u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n7), .CI(
        \u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n2), .CI(
        \u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX8M U1 ( .A(b[0]), .Y(n8) );
  NOR2X4M U2 ( .A(b[6]), .B(b[7]), .Y(n11) );
  AND3X4M U3 ( .A(n11), .B(n3), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  CLKAND2X4M U4 ( .A(\u_div/CryTmp[1][7] ), .B(n1), .Y(quotient[1]) );
  CLKAND2X4M U5 ( .A(\u_div/CryTmp[4][4] ), .B(n10), .Y(quotient[4]) );
  CLKAND2X4M U6 ( .A(\u_div/CryTmp[2][6] ), .B(n11), .Y(quotient[2]) );
  AND2X2M U7 ( .A(\u_div/CryTmp[5][3] ), .B(n9), .Y(quotient[5]) );
  MX2X1M U8 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  MX2X1M U9 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  MX2X1M U10 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  MX2X1M U11 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  MX2X1M U12 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  MX2X1M U13 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  MX2X1M U14 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  MX2X1M U15 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  MX2X1M U16 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  MX2X1M U17 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  MX2X1M U18 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  MX2X1M U19 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  MX2X1M U20 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  MX2X1M U21 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  AND3X2M U22 ( .A(n9), .B(n6), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X2M U23 ( .A(n10), .B(n5), .Y(n9) );
  INVX4M U24 ( .A(b[1]), .Y(n7) );
  INVX4M U25 ( .A(b[2]), .Y(n6) );
  OR2X2M U26 ( .A(a[7]), .B(n8), .Y(\u_div/CryTmp[7][1] ) );
  XNOR2X2M U27 ( .A(n8), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X2M U28 ( .A(n8), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U29 ( .A(n8), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U30 ( .A(n8), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U31 ( .A(n8), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U32 ( .A(n8), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U33 ( .A(n8), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  OR2X2M U34 ( .A(a[5]), .B(n8), .Y(\u_div/CryTmp[5][1] ) );
  OR2X2M U35 ( .A(a[4]), .B(n8), .Y(\u_div/CryTmp[4][1] ) );
  OR2X2M U36 ( .A(a[3]), .B(n8), .Y(\u_div/CryTmp[3][1] ) );
  OR2X2M U37 ( .A(a[2]), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  OR2X2M U38 ( .A(a[1]), .B(n8), .Y(\u_div/CryTmp[1][1] ) );
  NAND2BX2M U39 ( .AN(a[0]), .B(b[0]), .Y(\u_div/CryTmp[0][1] ) );
  OR2X2M U40 ( .A(a[6]), .B(n8), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U41 ( .A(b[6]), .Y(n2) );
  INVX4M U42 ( .A(b[3]), .Y(n5) );
  INVX4M U43 ( .A(b[4]), .Y(n4) );
  INVX4M U44 ( .A(b[5]), .Y(n3) );
  INVX2M U45 ( .A(b[7]), .Y(n1) );
  CLKMX2X2M U46 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U48 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U50 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U51 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U52 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U54 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U55 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U56 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U58 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U59 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U60 ( .A(\u_div/CryTmp[7][1] ), .B(n9), .C(n7), .D(n6), .Y(
        quotient[7]) );
  AND3X1M U61 ( .A(n11), .B(n4), .C(n3), .Y(n10) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2M U2 ( .A(B[6]), .Y(n3) );
  XNOR2X2M U3 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U4 ( .A(B[0]), .Y(n9) );
  INVX2M U5 ( .A(B[1]), .Y(n8) );
  OR2X2M U6 ( .A(A[0]), .B(n9), .Y(carry[1]) );
  INVX2M U7 ( .A(B[2]), .Y(n7) );
  INVX2M U8 ( .A(B[3]), .Y(n6) );
  INVX2M U9 ( .A(B[4]), .Y(n5) );
  INVX2M U10 ( .A(B[5]), .Y(n4) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19;
  assign SUM[6] = A[6];
  assign SUM[5] = \A[5] ;
  assign \A[5]  = A[5];
  assign SUM[4] = \A[4] ;
  assign \A[4]  = A[4];
  assign SUM[3] = \A[3] ;
  assign \A[3]  = A[3];
  assign SUM[2] = \A[2] ;
  assign \A[2]  = A[2];
  assign SUM[1] = \A[1] ;
  assign \A[1]  = A[1];
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  OAI21BX4M U2 ( .A0(n12), .A1(n13), .B0N(n14), .Y(n10) );
  AOI2BB1X2M U3 ( .A0N(n1), .A1N(n4), .B0(n3), .Y(n17) );
  NOR2X2M U4 ( .A(B[8]), .B(A[8]), .Y(n7) );
  NOR2X2M U5 ( .A(B[9]), .B(A[9]), .Y(n4) );
  NOR2X2M U6 ( .A(B[11]), .B(A[11]), .Y(n12) );
  NOR2X2M U7 ( .A(B[10]), .B(A[10]), .Y(n16) );
  NAND2X2M U8 ( .A(A[7]), .B(B[7]), .Y(n6) );
  CLKXOR2X2M U9 ( .A(A[7]), .B(B[7]), .Y(SUM[7]) );
  CLKXOR2X2M U10 ( .A(B[13]), .B(n9), .Y(SUM[13]) );
  XNOR2X1M U11 ( .A(n1), .B(n2), .Y(SUM[9]) );
  NOR2X1M U12 ( .A(n3), .B(n4), .Y(n2) );
  CLKXOR2X2M U13 ( .A(n5), .B(n6), .Y(SUM[8]) );
  NAND2BX1M U14 ( .AN(n7), .B(n8), .Y(n5) );
  OAI2BB1X1M U15 ( .A0N(n10), .A1N(A[12]), .B0(n11), .Y(n9) );
  OAI21X1M U16 ( .A0(A[12]), .A1(n10), .B0(B[12]), .Y(n11) );
  XOR3XLM U17 ( .A(B[12]), .B(A[12]), .C(n10), .Y(SUM[12]) );
  XNOR2X1M U18 ( .A(n13), .B(n15), .Y(SUM[11]) );
  NOR2X1M U19 ( .A(n14), .B(n12), .Y(n15) );
  AND2X1M U20 ( .A(B[11]), .B(A[11]), .Y(n14) );
  OA21X1M U21 ( .A0(n16), .A1(n17), .B0(n18), .Y(n13) );
  CLKXOR2X2M U22 ( .A(n19), .B(n17), .Y(SUM[10]) );
  AND2X1M U23 ( .A(B[9]), .B(A[9]), .Y(n3) );
  OA21X1M U24 ( .A0(n6), .A1(n7), .B0(n8), .Y(n1) );
  CLKNAND2X2M U25 ( .A(B[8]), .B(A[8]), .Y(n8) );
  NAND2BX1M U26 ( .AN(n16), .B(n18), .Y(n19) );
  CLKNAND2X2M U27 ( .A(B[10]), .B(A[10]), .Y(n18) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32;

  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n15, n14, n13, n11, n12, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n8), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n7), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n6), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n5), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n4), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n3), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  AND2X2M U2 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  NOR2X2M U10 ( .A(n26), .B(n24), .Y(\ab[0][6] ) );
  NOR2X2M U11 ( .A(n26), .B(n23), .Y(\ab[1][6] ) );
  NOR2X2M U12 ( .A(n27), .B(n24), .Y(\ab[0][5] ) );
  NOR2X2M U13 ( .A(n28), .B(n24), .Y(\ab[0][4] ) );
  NOR2X2M U14 ( .A(n29), .B(n24), .Y(\ab[0][3] ) );
  NOR2X2M U15 ( .A(n30), .B(n24), .Y(\ab[0][2] ) );
  NOR2X2M U16 ( .A(n31), .B(n24), .Y(\ab[0][1] ) );
  NOR2X2M U17 ( .A(n28), .B(n23), .Y(\ab[1][4] ) );
  NOR2X2M U18 ( .A(n29), .B(n23), .Y(\ab[1][3] ) );
  NOR2X2M U19 ( .A(n30), .B(n23), .Y(\ab[1][2] ) );
  CLKXOR2X2M U20 ( .A(\ab[1][5] ), .B(\ab[0][6] ), .Y(\SUMB[1][5] ) );
  CLKXOR2X2M U21 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Y(\SUMB[1][1] ) );
  NOR2X2M U22 ( .A(n25), .B(n24), .Y(\ab[0][7] ) );
  NOR2X2M U23 ( .A(n27), .B(n23), .Y(\ab[1][5] ) );
  NOR2X2M U24 ( .A(n31), .B(n23), .Y(\ab[1][1] ) );
  NOR2X2M U25 ( .A(n32), .B(n23), .Y(\ab[1][0] ) );
  NOR2X2M U26 ( .A(n17), .B(n25), .Y(\ab[7][7] ) );
  XOR2X1M U27 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  CLKXOR2X2M U28 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX4M U29 ( .A(A[1]), .Y(n23) );
  INVX4M U30 ( .A(A[0]), .Y(n24) );
  AND2X2M U31 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  CLKXOR2X2M U32 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U33 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  INVX4M U34 ( .A(A[2]), .Y(n22) );
  AND2X2M U35 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  AND2X2M U36 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  CLKXOR2X2M U37 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  INVX4M U38 ( .A(A[3]), .Y(n21) );
  INVX4M U39 ( .A(A[4]), .Y(n20) );
  INVX4M U40 ( .A(A[5]), .Y(n19) );
  AND2X2M U41 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U42 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U43 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX4M U44 ( .A(A[7]), .Y(n17) );
  INVX4M U45 ( .A(A[6]), .Y(n18) );
  CLKXOR2X2M U46 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U47 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U48 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(\A1[6] ) );
  INVX4M U49 ( .A(B[6]), .Y(n26) );
  XOR2X1M U50 ( .A(\ab[1][6] ), .B(\ab[0][7] ), .Y(\SUMB[1][6] ) );
  XOR2X1M U51 ( .A(\ab[1][4] ), .B(\ab[0][5] ), .Y(\SUMB[1][4] ) );
  XOR2X1M U52 ( .A(\ab[1][3] ), .B(\ab[0][4] ), .Y(\SUMB[1][3] ) );
  XOR2X1M U53 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Y(\SUMB[1][2] ) );
  INVX4M U54 ( .A(B[7]), .Y(n25) );
  INVX4M U55 ( .A(B[4]), .Y(n28) );
  INVX4M U56 ( .A(B[5]), .Y(n27) );
  INVX4M U57 ( .A(B[2]), .Y(n30) );
  INVX4M U58 ( .A(B[3]), .Y(n29) );
  INVX4M U59 ( .A(B[0]), .Y(n32) );
  INVX4M U60 ( .A(B[1]), .Y(n31) );
  NOR2X1M U62 ( .A(n17), .B(n26), .Y(\ab[7][6] ) );
  NOR2X1M U63 ( .A(n17), .B(n27), .Y(\ab[7][5] ) );
  NOR2X1M U64 ( .A(n17), .B(n28), .Y(\ab[7][4] ) );
  NOR2X1M U65 ( .A(n17), .B(n29), .Y(\ab[7][3] ) );
  NOR2X1M U66 ( .A(n17), .B(n30), .Y(\ab[7][2] ) );
  NOR2X1M U67 ( .A(n17), .B(n31), .Y(\ab[7][1] ) );
  NOR2X1M U68 ( .A(n17), .B(n32), .Y(\ab[7][0] ) );
  NOR2X1M U69 ( .A(n25), .B(n18), .Y(\ab[6][7] ) );
  NOR2X1M U70 ( .A(n26), .B(n18), .Y(\ab[6][6] ) );
  NOR2X1M U71 ( .A(n27), .B(n18), .Y(\ab[6][5] ) );
  NOR2X1M U72 ( .A(n28), .B(n18), .Y(\ab[6][4] ) );
  NOR2X1M U73 ( .A(n29), .B(n18), .Y(\ab[6][3] ) );
  NOR2X1M U74 ( .A(n30), .B(n18), .Y(\ab[6][2] ) );
  NOR2X1M U75 ( .A(n31), .B(n18), .Y(\ab[6][1] ) );
  NOR2X1M U76 ( .A(n32), .B(n18), .Y(\ab[6][0] ) );
  NOR2X1M U77 ( .A(n25), .B(n19), .Y(\ab[5][7] ) );
  NOR2X1M U78 ( .A(n26), .B(n19), .Y(\ab[5][6] ) );
  NOR2X1M U79 ( .A(n27), .B(n19), .Y(\ab[5][5] ) );
  NOR2X1M U80 ( .A(n28), .B(n19), .Y(\ab[5][4] ) );
  NOR2X1M U81 ( .A(n29), .B(n19), .Y(\ab[5][3] ) );
  NOR2X1M U82 ( .A(n30), .B(n19), .Y(\ab[5][2] ) );
  NOR2X1M U83 ( .A(n31), .B(n19), .Y(\ab[5][1] ) );
  NOR2X1M U84 ( .A(n32), .B(n19), .Y(\ab[5][0] ) );
  NOR2X1M U85 ( .A(n25), .B(n20), .Y(\ab[4][7] ) );
  NOR2X1M U86 ( .A(n26), .B(n20), .Y(\ab[4][6] ) );
  NOR2X1M U87 ( .A(n27), .B(n20), .Y(\ab[4][5] ) );
  NOR2X1M U88 ( .A(n28), .B(n20), .Y(\ab[4][4] ) );
  NOR2X1M U89 ( .A(n29), .B(n20), .Y(\ab[4][3] ) );
  NOR2X1M U90 ( .A(n30), .B(n20), .Y(\ab[4][2] ) );
  NOR2X1M U91 ( .A(n31), .B(n20), .Y(\ab[4][1] ) );
  NOR2X1M U92 ( .A(n32), .B(n20), .Y(\ab[4][0] ) );
  NOR2X1M U93 ( .A(n25), .B(n21), .Y(\ab[3][7] ) );
  NOR2X1M U94 ( .A(n26), .B(n21), .Y(\ab[3][6] ) );
  NOR2X1M U95 ( .A(n27), .B(n21), .Y(\ab[3][5] ) );
  NOR2X1M U96 ( .A(n28), .B(n21), .Y(\ab[3][4] ) );
  NOR2X1M U97 ( .A(n29), .B(n21), .Y(\ab[3][3] ) );
  NOR2X1M U98 ( .A(n30), .B(n21), .Y(\ab[3][2] ) );
  NOR2X1M U99 ( .A(n31), .B(n21), .Y(\ab[3][1] ) );
  NOR2X1M U100 ( .A(n32), .B(n21), .Y(\ab[3][0] ) );
  NOR2X1M U101 ( .A(n25), .B(n22), .Y(\ab[2][7] ) );
  NOR2X1M U102 ( .A(n26), .B(n22), .Y(\ab[2][6] ) );
  NOR2X1M U103 ( .A(n27), .B(n22), .Y(\ab[2][5] ) );
  NOR2X1M U104 ( .A(n28), .B(n22), .Y(\ab[2][4] ) );
  NOR2X1M U105 ( .A(n29), .B(n22), .Y(\ab[2][3] ) );
  NOR2X1M U106 ( .A(n30), .B(n22), .Y(\ab[2][2] ) );
  NOR2X1M U107 ( .A(n31), .B(n22), .Y(\ab[2][1] ) );
  NOR2X1M U108 ( .A(n32), .B(n22), .Y(\ab[2][0] ) );
  NOR2X1M U109 ( .A(n25), .B(n23), .Y(\ab[1][7] ) );
  NOR2X1M U110 ( .A(n32), .B(n24), .Y(PRODUCT[0]) );
endmodule


module ALU ( A, B, ALU_FUN, CLK, RST, Enable, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, RST, Enable;
  output OUT_VALID;
  wire   n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, OUT_VALID_reg, N89, N90, N91, N92,
         N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103, N104, N105,
         N106, N107, N108, N109, N110, N111, N112, N113, N114, N115, N116,
         N117, N118, N119, N120, N121, N122, N123, N124, N125, N126, N127,
         N128, N129, N130, N155, N156, N157, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n3, n5, n7, n9, n11, n13, n15,
         n17, n19, n21, n23, n25, n27, n29, n31, n33, n105, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189;
  wire   [7:0] A_reg;
  wire   [7:0] B_reg;
  wire   [15:0] ALU_OUT_reg;
  wire   [15:0] ALU_OUT_Comb;

  OAI2BB1X4M U73 ( .A0N(n91), .A1N(n100), .B0(n101), .Y(n46) );
  OAI2BB1X4M U78 ( .A0N(n104), .A1N(n99), .B0(n101), .Y(n47) );
  ALU_DW_div_uns_0 div_66 ( .a({n132, n129, n126, n123, n120, n117, n114, n111}), .b({B_reg[7], n109, B_reg[5:0]}), .quotient({N130, N129, N128, N127, N126, 
        N125, N124, N123}) );
  ALU_DW01_sub_0 sub_60 ( .A({1'b0, n132, n129, n126, n123, n120, n117, n114, 
        n111}), .B({1'b0, B_reg[7], n109, B_reg[5:0]}), .CI(1'b0), .DIFF({N106, 
        N105, N104, N103, N102, N101, N100, N99, N98}) );
  ALU_DW01_add_0 add_57 ( .A({1'b0, n133, n129, n126, n123, n120, n117, n115, 
        n111}), .B({1'b0, B_reg[7], n109, B_reg[5:0]}), .CI(1'b0), .SUM({N97, 
        N96, N95, N94, N93, N92, N91, N90, N89}) );
  ALU_DW02_mult_0 mult_63 ( .A({n133, n129, n126, n123, n120, n117, n115, n111}), .B({B_reg[7], n109, B_reg[5:0]}), .TC(1'b0), .PRODUCT({N122, N121, N120, 
        N119, N118, N117, N116, N115, N114, N113, N112, N111, N110, N109, N108, 
        N107}) );
  DFFRQX1M \A_reg_reg[2]  ( .D(A[2]), .CK(CLK), .RN(RST), .Q(A_reg[2]) );
  DFFRQX1M \A_reg_reg[1]  ( .D(A[1]), .CK(CLK), .RN(RST), .Q(A_reg[1]) );
  DFFRQX1M \A_reg_reg[0]  ( .D(A[0]), .CK(CLK), .RN(RST), .Q(A_reg[0]) );
  DFFRQX1M \A_reg_reg[3]  ( .D(A[3]), .CK(CLK), .RN(RST), .Q(A_reg[3]) );
  DFFRQX1M \A_reg_reg[4]  ( .D(A[4]), .CK(CLK), .RN(RST), .Q(A_reg[4]) );
  DFFRQX1M \A_reg_reg[5]  ( .D(A[5]), .CK(CLK), .RN(RST), .Q(A_reg[5]) );
  DFFRQX1M \A_reg_reg[6]  ( .D(A[6]), .CK(CLK), .RN(RST), .Q(A_reg[6]) );
  DFFRQX1M \A_reg_reg[7]  ( .D(A[7]), .CK(CLK), .RN(RST), .Q(A_reg[7]) );
  DFFRQX1M \B_reg_reg[6]  ( .D(B[6]), .CK(CLK), .RN(RST), .Q(B_reg[6]) );
  DFFRQX1M \ALU_OUT_reg_reg[15]  ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(RST), 
        .Q(ALU_OUT_reg[15]) );
  DFFRQX1M \ALU_OUT_reg_reg[14]  ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(RST), 
        .Q(ALU_OUT_reg[14]) );
  DFFRQX1M \ALU_OUT_reg_reg[13]  ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(RST), 
        .Q(ALU_OUT_reg[13]) );
  DFFRQX1M \ALU_OUT_reg_reg[12]  ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(RST), 
        .Q(ALU_OUT_reg[12]) );
  DFFRQX1M \ALU_OUT_reg_reg[11]  ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(RST), 
        .Q(ALU_OUT_reg[11]) );
  DFFRQX1M \ALU_OUT_reg_reg[10]  ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(RST), 
        .Q(ALU_OUT_reg[10]) );
  DFFRQX1M \ALU_OUT_reg_reg[9]  ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_reg[9]) );
  DFFRQX1M \ALU_OUT_reg_reg[8]  ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_reg[8]) );
  DFFRQX1M \ALU_OUT_reg_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_reg[7]) );
  DFFRQX1M \ALU_OUT_reg_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_reg[6]) );
  DFFRQX1M \ALU_OUT_reg_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_reg[5]) );
  DFFRQX1M \ALU_OUT_reg_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_reg[4]) );
  DFFRQX1M \ALU_OUT_reg_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_reg[3]) );
  DFFRQX1M \ALU_OUT_reg_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_reg[2]) );
  DFFRQX1M \ALU_OUT_reg_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_reg[1]) );
  DFFRQX1M \ALU_OUT_reg_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_reg[0]) );
  DFFRQX1M OUT_VALID_reg_reg ( .D(1'b1), .CK(CLK), .RN(RST), .Q(OUT_VALID_reg)
         );
  DFFRX4M \B_reg_reg[7]  ( .D(B[7]), .CK(CLK), .RN(RST), .Q(B_reg[7]), .QN(
        n175) );
  DFFRX4M \B_reg_reg[0]  ( .D(B[0]), .CK(CLK), .RN(RST), .Q(B_reg[0]), .QN(
        n162) );
  DFFRX4M \B_reg_reg[1]  ( .D(B[1]), .CK(CLK), .RN(RST), .Q(B_reg[1]), .QN(
        n180) );
  DFFRX4M \B_reg_reg[5]  ( .D(B[5]), .CK(CLK), .RN(RST), .Q(B_reg[5]), .QN(
        n176) );
  DFFRX4M \B_reg_reg[4]  ( .D(B[4]), .CK(CLK), .RN(RST), .Q(B_reg[4]), .QN(
        n177) );
  DFFRX4M \B_reg_reg[3]  ( .D(B[3]), .CK(CLK), .RN(RST), .Q(B_reg[3]), .QN(
        n178) );
  DFFRX4M \B_reg_reg[2]  ( .D(B[2]), .CK(CLK), .RN(RST), .Q(B_reg[2]), .QN(
        n179) );
  AND2X2M U3 ( .A(ALU_OUT_reg[0]), .B(n134), .Y(n206) );
  AND2X2M U4 ( .A(ALU_OUT_reg[1]), .B(n134), .Y(n205) );
  AND2X2M U7 ( .A(ALU_OUT_reg[2]), .B(n134), .Y(n204) );
  AND2X2M U8 ( .A(ALU_OUT_reg[3]), .B(n134), .Y(n203) );
  AND2X2M U9 ( .A(ALU_OUT_reg[4]), .B(n134), .Y(n202) );
  AND2X2M U10 ( .A(ALU_OUT_reg[5]), .B(n134), .Y(n201) );
  AND2X2M U11 ( .A(ALU_OUT_reg[6]), .B(n134), .Y(n200) );
  AND2X2M U12 ( .A(ALU_OUT_reg[7]), .B(n134), .Y(n199) );
  AND2X2M U13 ( .A(ALU_OUT_reg[8]), .B(n134), .Y(n198) );
  AND2X2M U14 ( .A(ALU_OUT_reg[9]), .B(n134), .Y(n197) );
  AND2X2M U15 ( .A(ALU_OUT_reg[10]), .B(n134), .Y(n196) );
  AND2X2M U16 ( .A(ALU_OUT_reg[11]), .B(n134), .Y(n195) );
  AND2X2M U17 ( .A(ALU_OUT_reg[12]), .B(n134), .Y(n194) );
  AND2X2M U18 ( .A(ALU_OUT_reg[13]), .B(n134), .Y(n193) );
  AND2X2M U19 ( .A(ALU_OUT_reg[14]), .B(n134), .Y(n192) );
  AND2X2M U20 ( .A(ALU_OUT_reg[15]), .B(n134), .Y(n191) );
  AND2X2M U21 ( .A(OUT_VALID_reg), .B(n134), .Y(n207) );
  INVX2M U22 ( .A(n131), .Y(n133) );
  CLKINVX1M U23 ( .A(n206), .Y(n3) );
  CLKINVX40M U24 ( .A(n3), .Y(ALU_OUT[0]) );
  CLKINVX1M U25 ( .A(n196), .Y(n5) );
  CLKINVX40M U26 ( .A(n5), .Y(ALU_OUT[10]) );
  CLKINVX1M U27 ( .A(n195), .Y(n7) );
  CLKINVX40M U28 ( .A(n7), .Y(ALU_OUT[11]) );
  CLKINVX1M U29 ( .A(n194), .Y(n9) );
  CLKINVX40M U30 ( .A(n9), .Y(ALU_OUT[12]) );
  CLKINVX1M U31 ( .A(n193), .Y(n11) );
  CLKINVX40M U32 ( .A(n11), .Y(ALU_OUT[13]) );
  CLKINVX1M U33 ( .A(n192), .Y(n13) );
  CLKINVX40M U34 ( .A(n13), .Y(ALU_OUT[14]) );
  CLKINVX1M U35 ( .A(n191), .Y(n15) );
  CLKINVX40M U36 ( .A(n15), .Y(ALU_OUT[15]) );
  CLKINVX1M U37 ( .A(n205), .Y(n17) );
  CLKINVX40M U38 ( .A(n17), .Y(ALU_OUT[1]) );
  CLKINVX1M U39 ( .A(n204), .Y(n19) );
  CLKINVX40M U40 ( .A(n19), .Y(ALU_OUT[2]) );
  CLKINVX1M U41 ( .A(n203), .Y(n21) );
  CLKINVX40M U42 ( .A(n21), .Y(ALU_OUT[3]) );
  CLKINVX1M U43 ( .A(n202), .Y(n23) );
  CLKINVX40M U44 ( .A(n23), .Y(ALU_OUT[4]) );
  CLKINVX1M U45 ( .A(n201), .Y(n25) );
  CLKINVX40M U46 ( .A(n25), .Y(ALU_OUT[5]) );
  CLKINVX1M U47 ( .A(n200), .Y(n27) );
  CLKINVX40M U48 ( .A(n27), .Y(ALU_OUT[6]) );
  CLKINVX1M U49 ( .A(n199), .Y(n29) );
  CLKINVX40M U50 ( .A(n29), .Y(ALU_OUT[7]) );
  CLKINVX1M U51 ( .A(n198), .Y(n31) );
  CLKINVX40M U52 ( .A(n31), .Y(ALU_OUT[8]) );
  CLKINVX1M U53 ( .A(n197), .Y(n33) );
  CLKINVX40M U54 ( .A(n33), .Y(ALU_OUT[9]) );
  CLKINVX1M U55 ( .A(n207), .Y(n105) );
  CLKINVX40M U56 ( .A(n105), .Y(OUT_VALID) );
  XNOR2X4M U57 ( .A(n130), .B(n109), .Y(n155) );
  OAI31X2M U58 ( .A0(n148), .A1(n139), .A2(n138), .B0(n149), .Y(n141) );
  AOI211X2M U59 ( .A0(n114), .A1(n164), .B0(n145), .C0(n137), .Y(n138) );
  AOI211X2M U60 ( .A0(n146), .A1(n165), .B0(n145), .C0(n144), .Y(n147) );
  NAND2BX2M U61 ( .AN(n139), .B(n150), .Y(n145) );
  OAI21X2M U62 ( .A0(n158), .A1(n143), .B0(n159), .Y(N157) );
  BUFX4M U63 ( .A(n48), .Y(n107) );
  AOI222X2M U64 ( .A0(N109), .A1(n135), .B0(n118), .B1(n181), .C0(N125), .C1(
        n107), .Y(n76) );
  AOI222X2M U65 ( .A0(N110), .A1(n135), .B0(n121), .B1(n181), .C0(N126), .C1(
        n107), .Y(n70) );
  AOI222X2M U66 ( .A0(N111), .A1(n135), .B0(n124), .B1(n181), .C0(N127), .C1(
        n107), .Y(n64) );
  AOI222X2M U67 ( .A0(N112), .A1(n135), .B0(n127), .B1(n181), .C0(N128), .C1(
        n107), .Y(n58) );
  AOI222X2M U68 ( .A0(N108), .A1(n135), .B0(n115), .B1(n181), .C0(N124), .C1(
        n107), .Y(n83) );
  NOR3BX2M U69 ( .AN(n100), .B(n188), .C(ALU_FUN[2]), .Y(n48) );
  BUFX4M U70 ( .A(n36), .Y(n108) );
  AOI211X2M U71 ( .A0(N106), .A1(n49), .B0(n184), .C0(n46), .Y(n36) );
  NOR2X2M U72 ( .A(n179), .B(n118), .Y(n139) );
  NOR2X2M U74 ( .A(n162), .B(n112), .Y(n136) );
  NOR2X2M U75 ( .A(n178), .B(n121), .Y(n148) );
  NOR2X2M U76 ( .A(n168), .B(B_reg[7]), .Y(n158) );
  INVX8M U77 ( .A(n90), .Y(n181) );
  NAND2X2M U79 ( .A(n99), .B(n100), .Y(n90) );
  NOR2X4M U80 ( .A(n189), .B(ALU_FUN[3]), .Y(n100) );
  NOR2X4M U81 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n103) );
  NOR2X4M U82 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .Y(n104) );
  NAND3XLM U83 ( .A(n75), .B(n76), .C(n77), .Y(ALU_OUT_Comb[2]) );
  NAND3XLM U84 ( .A(n69), .B(n70), .C(n71), .Y(ALU_OUT_Comb[3]) );
  NAND3XLM U85 ( .A(n63), .B(n64), .C(n65), .Y(ALU_OUT_Comb[4]) );
  NAND3XLM U86 ( .A(n57), .B(n58), .C(n59), .Y(ALU_OUT_Comb[5]) );
  NOR2BX4M U87 ( .AN(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n99) );
  CLKBUFX8M U88 ( .A(n35), .Y(n135) );
  CLKBUFX6M U89 ( .A(B_reg[6]), .Y(n109) );
  NAND4X1M U90 ( .A(n82), .B(n83), .C(n84), .D(n85), .Y(ALU_OUT_Comb[1]) );
  INVX8M U91 ( .A(n89), .Y(n184) );
  INVX2M U92 ( .A(n46), .Y(n182) );
  INVX2M U93 ( .A(n47), .Y(n185) );
  INVX4M U94 ( .A(n37), .Y(n183) );
  OAI2BB1XLM U95 ( .A0N(N116), .A1N(n135), .B0(n108), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1XLM U96 ( .A0N(N117), .A1N(n135), .B0(n108), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1XLM U97 ( .A0N(N118), .A1N(n135), .B0(n108), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1XLM U98 ( .A0N(N119), .A1N(n135), .B0(n108), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1XLM U99 ( .A0N(N120), .A1N(n135), .B0(n108), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1XLM U100 ( .A0N(N121), .A1N(n135), .B0(n108), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1XLM U101 ( .A0N(N122), .A1N(n135), .B0(n108), .Y(ALU_OUT_Comb[15]) );
  CLKAND2X6M U102 ( .A(n103), .B(n100), .Y(n49) );
  NAND2X2M U103 ( .A(n104), .B(n91), .Y(n89) );
  NAND3X2M U104 ( .A(n50), .B(n51), .C(n52), .Y(ALU_OUT_Comb[6]) );
  AOI22X1M U105 ( .A0(N104), .A1(n49), .B0(N95), .B1(n183), .Y(n50) );
  AOI221X2M U106 ( .A0(n53), .A1(n132), .B0(n184), .B1(n128), .C0(n54), .Y(n52) );
  AOI222X2M U107 ( .A0(N113), .A1(n135), .B0(n181), .B1(n130), .C0(N129), .C1(
        n107), .Y(n51) );
  OAI221X1M U108 ( .A0(n185), .A1(n173), .B0(n115), .B1(n81), .C0(n90), .Y(n86) );
  OAI221X1M U109 ( .A0(n114), .A1(n182), .B0(n81), .B1(n173), .C0(n89), .Y(n87) );
  OAI221X1M U110 ( .A0(n185), .A1(n174), .B0(n112), .B1(n81), .C0(n90), .Y(
        n102) );
  OAI221X1M U111 ( .A0(n112), .A1(n182), .B0(n81), .B1(n174), .C0(n89), .Y(n96) );
  INVX6M U112 ( .A(n81), .Y(n186) );
  NAND2X2M U113 ( .A(n103), .B(n104), .Y(n37) );
  INVX2M U114 ( .A(n45), .Y(n187) );
  INVX2M U115 ( .A(n114), .Y(n165) );
  INVX2M U116 ( .A(n132), .Y(n168) );
  INVX2M U117 ( .A(n118), .Y(n172) );
  INVX2M U118 ( .A(n121), .Y(n171) );
  INVX2M U119 ( .A(n124), .Y(n170) );
  INVX2M U120 ( .A(n127), .Y(n169) );
  INVX2M U121 ( .A(n115), .Y(n173) );
  INVX2M U122 ( .A(n111), .Y(n174) );
  AOI222X2M U123 ( .A0(N107), .A1(n135), .B0(n112), .B1(n181), .C0(N123), .C1(
        n107), .Y(n93) );
  OAI2B11X1M U124 ( .A1N(N97), .A0(n37), .B0(n108), .C0(n38), .Y(
        ALU_OUT_Comb[8]) );
  AOI22X1M U125 ( .A0(n132), .A1(n187), .B0(N115), .B1(n135), .Y(n38) );
  INVX4M U126 ( .A(ALU_FUN[0]), .Y(n189) );
  INVX4M U127 ( .A(n131), .Y(n132) );
  NAND3X2M U128 ( .A(n103), .B(ALU_FUN[0]), .C(ALU_FUN[3]), .Y(n101) );
  AOI22X1M U129 ( .A0(N100), .A1(n49), .B0(N91), .B1(n183), .Y(n75) );
  AOI221X2M U130 ( .A0(n121), .A1(n53), .B0(n184), .B1(n172), .C0(n78), .Y(n77) );
  AOI22X1M U131 ( .A0(N101), .A1(n49), .B0(N92), .B1(n183), .Y(n69) );
  AOI221X2M U132 ( .A0(n124), .A1(n53), .B0(n184), .B1(n171), .C0(n72), .Y(n71) );
  AOI22X1M U133 ( .A0(N102), .A1(n49), .B0(N93), .B1(n183), .Y(n63) );
  AOI221X2M U134 ( .A0(n53), .A1(n127), .B0(n184), .B1(n170), .C0(n66), .Y(n65) );
  AOI22X1M U135 ( .A0(N103), .A1(n49), .B0(N94), .B1(n183), .Y(n57) );
  AOI221X2M U136 ( .A0(n53), .A1(n130), .B0(n184), .B1(n169), .C0(n60), .Y(n59) );
  NAND3X2M U137 ( .A(n39), .B(n40), .C(n41), .Y(ALU_OUT_Comb[7]) );
  AOI22X1M U138 ( .A0(N105), .A1(n49), .B0(N96), .B1(n183), .Y(n39) );
  AOI221X2M U139 ( .A0(n184), .A1(n131), .B0(n181), .B1(n133), .C0(n42), .Y(
        n41) );
  AOI22X1M U140 ( .A0(N130), .A1(n107), .B0(N114), .B1(n135), .Y(n40) );
  AND2X2M U141 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n91) );
  INVX4M U142 ( .A(n128), .Y(n129) );
  OAI222X1M U143 ( .A0(n55), .A1(n163), .B0(n109), .B1(n56), .C0(n45), .C1(
        n169), .Y(n54) );
  AOI221X2M U144 ( .A0(n186), .A1(n167), .B0(n130), .B1(n47), .C0(n181), .Y(
        n55) );
  AOI221X2M U145 ( .A0(n130), .A1(n186), .B0(n46), .B1(n167), .C0(n184), .Y(
        n56) );
  INVX2M U146 ( .A(ALU_FUN[1]), .Y(n188) );
  NAND3X4M U147 ( .A(n103), .B(n189), .C(ALU_FUN[3]), .Y(n81) );
  AND3X4M U148 ( .A(n99), .B(ALU_FUN[3]), .C(ALU_FUN[0]), .Y(n53) );
  NOR4BX2M U149 ( .AN(ALU_FUN[3]), .B(ALU_FUN[2]), .C(n98), .D(n188), .Y(n97)
         );
  AOI22X1M U150 ( .A0(N155), .A1(n189), .B0(N156), .B1(ALU_FUN[0]), .Y(n98) );
  INVX2M U151 ( .A(n161), .Y(N156) );
  NAND3X4M U152 ( .A(n91), .B(n189), .C(ALU_FUN[3]), .Y(n45) );
  NOR3BX2M U153 ( .AN(n104), .B(n188), .C(ALU_FUN[2]), .Y(n35) );
  AND4X1M U154 ( .A(N157), .B(n99), .C(ALU_FUN[3]), .D(n189), .Y(n88) );
  INVX4M U155 ( .A(n125), .Y(n126) );
  INVX4M U156 ( .A(n122), .Y(n123) );
  INVX4M U157 ( .A(n119), .Y(n120) );
  INVX4M U158 ( .A(n110), .Y(n111) );
  INVX4M U159 ( .A(n116), .Y(n117) );
  INVX4M U160 ( .A(n113), .Y(n115) );
  INVX2M U161 ( .A(n129), .Y(n167) );
  INVX4M U162 ( .A(n110), .Y(n112) );
  INVX2M U163 ( .A(n109), .Y(n163) );
  INVX4M U164 ( .A(n116), .Y(n118) );
  INVX4M U165 ( .A(n113), .Y(n114) );
  INVX4M U166 ( .A(n119), .Y(n121) );
  INVX4M U167 ( .A(n122), .Y(n124) );
  INVX4M U168 ( .A(n128), .Y(n130) );
  INVX4M U169 ( .A(n125), .Y(n127) );
  BUFX10M U170 ( .A(Enable), .Y(n134) );
  NAND4X2M U171 ( .A(n92), .B(n93), .C(n94), .D(n95), .Y(ALU_OUT_Comb[0]) );
  AOI22X1M U172 ( .A0(N98), .A1(n49), .B0(N89), .B1(n183), .Y(n92) );
  AOI222X2M U173 ( .A0(n184), .A1(n174), .B0(B_reg[0]), .B1(n102), .C0(n114), 
        .C1(n53), .Y(n94) );
  AOI211X2M U174 ( .A0(n96), .A1(n162), .B0(n88), .C0(n97), .Y(n95) );
  AOI22X1M U175 ( .A0(N99), .A1(n49), .B0(N90), .B1(n183), .Y(n82) );
  AOI222X2M U176 ( .A0(n184), .A1(n173), .B0(n112), .B1(n187), .C0(n118), .C1(
        n53), .Y(n84) );
  AOI221X2M U177 ( .A0(B_reg[1]), .A1(n86), .B0(n87), .B1(n180), .C0(n88), .Y(
        n85) );
  INVX2M U178 ( .A(A_reg[7]), .Y(n131) );
  INVX2M U179 ( .A(A_reg[6]), .Y(n128) );
  OAI222X1M U180 ( .A0(n79), .A1(n179), .B0(B_reg[2]), .B1(n80), .C0(n45), 
        .C1(n173), .Y(n78) );
  AOI221X2M U181 ( .A0(n186), .A1(n172), .B0(n118), .B1(n47), .C0(n181), .Y(
        n79) );
  AOI221X2M U182 ( .A0(n118), .A1(n186), .B0(n46), .B1(n172), .C0(n184), .Y(
        n80) );
  OAI222X1M U183 ( .A0(n73), .A1(n178), .B0(B_reg[3]), .B1(n74), .C0(n45), 
        .C1(n172), .Y(n72) );
  AOI221X2M U184 ( .A0(n186), .A1(n171), .B0(n121), .B1(n47), .C0(n181), .Y(
        n73) );
  AOI221X2M U185 ( .A0(n121), .A1(n186), .B0(n46), .B1(n171), .C0(n184), .Y(
        n74) );
  OAI222X1M U186 ( .A0(n67), .A1(n177), .B0(B_reg[4]), .B1(n68), .C0(n45), 
        .C1(n171), .Y(n66) );
  AOI221X2M U187 ( .A0(n186), .A1(n170), .B0(n124), .B1(n47), .C0(n181), .Y(
        n67) );
  AOI221X2M U188 ( .A0(n124), .A1(n186), .B0(n46), .B1(n170), .C0(n184), .Y(
        n68) );
  OAI222X1M U189 ( .A0(n61), .A1(n176), .B0(B_reg[5]), .B1(n62), .C0(n45), 
        .C1(n170), .Y(n60) );
  AOI221X2M U190 ( .A0(n186), .A1(n169), .B0(n127), .B1(n47), .C0(n181), .Y(
        n61) );
  AOI221X2M U191 ( .A0(n127), .A1(n186), .B0(n46), .B1(n169), .C0(n184), .Y(
        n62) );
  OAI222X1M U192 ( .A0(n43), .A1(n175), .B0(B_reg[7]), .B1(n44), .C0(n45), 
        .C1(n167), .Y(n42) );
  AOI221X2M U193 ( .A0(n186), .A1(n168), .B0(n132), .B1(n47), .C0(n181), .Y(
        n43) );
  AOI221X2M U194 ( .A0(n186), .A1(n133), .B0(n46), .B1(n168), .C0(n184), .Y(
        n44) );
  INVX2M U195 ( .A(A_reg[5]), .Y(n125) );
  INVX2M U196 ( .A(A_reg[4]), .Y(n122) );
  INVX2M U197 ( .A(A_reg[3]), .Y(n119) );
  INVX2M U198 ( .A(A_reg[2]), .Y(n116) );
  INVX2M U199 ( .A(A_reg[0]), .Y(n110) );
  INVX2M U200 ( .A(A_reg[1]), .Y(n113) );
  INVXLM U201 ( .A(n136), .Y(n164) );
  INVXLM U202 ( .A(n147), .Y(n166) );
  NAND2BX1M U203 ( .AN(B_reg[4]), .B(n124), .Y(n151) );
  NAND2BX1M U204 ( .AN(n124), .B(B_reg[4]), .Y(n140) );
  CLKNAND2X2M U205 ( .A(n151), .B(n140), .Y(n153) );
  CLKNAND2X2M U206 ( .A(n118), .B(n179), .Y(n150) );
  AOI21X1M U207 ( .A0(n136), .A1(n165), .B0(B_reg[1]), .Y(n137) );
  CLKNAND2X2M U208 ( .A(n121), .B(n178), .Y(n149) );
  NAND2BX1M U209 ( .AN(n127), .B(B_reg[5]), .Y(n156) );
  OAI211X1M U210 ( .A0(n153), .A1(n141), .B0(n140), .C0(n156), .Y(n142) );
  NAND2BX1M U211 ( .AN(B_reg[5]), .B(n127), .Y(n152) );
  AOI32X1M U212 ( .A0(n142), .A1(n152), .A2(n155), .B0(n109), .B1(n167), .Y(
        n143) );
  CLKNAND2X2M U213 ( .A(B_reg[7]), .B(n168), .Y(n159) );
  CLKNAND2X2M U214 ( .A(n112), .B(n162), .Y(n146) );
  OA21X1M U215 ( .A0(n146), .A1(n165), .B0(B_reg[1]), .Y(n144) );
  AOI31X1M U216 ( .A0(n166), .A1(n150), .A2(n149), .B0(n148), .Y(n154) );
  OAI2B11X1M U217 ( .A1N(n154), .A0(n153), .B0(n152), .C0(n151), .Y(n157) );
  AOI32X1M U218 ( .A0(n157), .A1(n156), .A2(n155), .B0(n130), .B1(n163), .Y(
        n160) );
  AOI2B1X1M U219 ( .A1N(n160), .A0(n159), .B0(n158), .Y(n161) );
  NOR2X1M U220 ( .A(N157), .B(N156), .Y(N155) );
endmodule


module ALU_TOP ( CLK, RST, ALU_Enable, ALU_FUN, ALU_A, ALU_B, ALU_VLD, ALU_OUT
 );
  input [3:0] ALU_FUN;
  input [7:0] ALU_A;
  input [7:0] ALU_B;
  output [15:0] ALU_OUT;
  input CLK, RST, ALU_Enable;
  output ALU_VLD;
  wire   ALU_CLK, n1, n2, n3;

  ClkDiv U0_ClkDiv ( .i_ref_clk(CLK), .i_rst(RST), .o_div_clk(ALU_CLK) );
  ALU U0_ALU ( .A(ALU_A), .B(ALU_B), .ALU_FUN({n3, n2, ALU_FUN[1], n1}), .CLK(
        ALU_CLK), .RST(RST), .Enable(ALU_Enable), .ALU_OUT(ALU_OUT), 
        .OUT_VALID(ALU_VLD) );
  BUFX4M U1 ( .A(ALU_FUN[3]), .Y(n3) );
  BUFX4M U2 ( .A(ALU_FUN[0]), .Y(n1) );
  BUFX4M U3 ( .A(ALU_FUN[2]), .Y(n2) );
endmodule

