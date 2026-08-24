/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Aug 20 20:37:13 2026
/////////////////////////////////////////////////////////////


module RegFile ( CLK, RST, WrEn, RdEn, Address, WrData, RdData, REG0, REG1, 
        REG2 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  input CLK, RST, WrEn, RdEn;
  output REG2;
  wire   N27, N28, N29, N30, N31, N32, N33, N34, n1, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n128, n129, n144, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n254, n255, n256, n257, n258, n259, n260,
         n261, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;

  INVX2M U100 ( .A(n24), .Y(n1) );
  NAND3X2M U101 ( .A(RST), .B(n189), .C(RdEn), .Y(n24) );
  DFFSX1M \regArr_reg[2][2]  ( .D(n43), .CK(CLK), .SN(RST), .QN(n133) );
  DFFRX1M \regArr_reg[3][7]  ( .D(n56), .CK(CLK), .RN(RST), .QN(n134) );
  DFFRX1M \regArr_reg[3][6]  ( .D(n55), .CK(CLK), .RN(RST), .QN(n135) );
  DFFRX1M \regArr_reg[3][5]  ( .D(n54), .CK(CLK), .RN(RST), .QN(n136) );
  DFFRX1M \regArr_reg[3][4]  ( .D(n53), .CK(CLK), .RN(RST), .QN(n137) );
  DFFRX1M \regArr_reg[3][3]  ( .D(n52), .CK(CLK), .RN(RST), .QN(n138) );
  DFFRX1M \regArr_reg[3][2]  ( .D(n51), .CK(CLK), .RN(RST), .QN(n139) );
  DFFRX1M \regArr_reg[3][1]  ( .D(n50), .CK(CLK), .RN(RST), .QN(n140) );
  DFFRX1M \regArr_reg[3][0]  ( .D(n49), .CK(CLK), .RN(RST), .QN(n141) );
  DFFRX1M \regArr_reg[2][7]  ( .D(n48), .CK(CLK), .RN(RST), .QN(n142) );
  DFFRX1M \regArr_reg[2][6]  ( .D(n47), .CK(CLK), .RN(RST), .QN(n143) );
  DFFRX1M \regArr_reg[2][5]  ( .D(n46), .CK(CLK), .RN(RST), .QN(n145) );
  DFFRX1M \regArr_reg[2][4]  ( .D(n45), .CK(CLK), .RN(RST), .QN(n146) );
  DFFRX1M \regArr_reg[2][3]  ( .D(n44), .CK(CLK), .RN(RST), .QN(n147) );
  DFFRX1M \regArr_reg[2][1]  ( .D(n42), .CK(CLK), .RN(RST), .QN(n148) );
  DFFSX1M \regArr_reg[0][1]  ( .D(n26), .CK(CLK), .SN(RST), .Q(REG0[1]), .QN(
        n128) );
  DFFSX1M \regArr_reg[1][3]  ( .D(n36), .CK(CLK), .SN(RST), .Q(REG1[3]), .QN(
        n129) );
  DFFRX1M \regArr_reg[5][7]  ( .D(n72), .CK(CLK), .RN(RST), .Q(n149), .QN(n300) );
  DFFRX1M \regArr_reg[5][6]  ( .D(n71), .CK(CLK), .RN(RST), .Q(n150), .QN(n299) );
  DFFRX1M \regArr_reg[5][5]  ( .D(n70), .CK(CLK), .RN(RST), .Q(n151), .QN(n298) );
  DFFRX1M \regArr_reg[5][4]  ( .D(n69), .CK(CLK), .RN(RST), .Q(n152), .QN(n297) );
  DFFRX1M \regArr_reg[5][3]  ( .D(n68), .CK(CLK), .RN(RST), .Q(n153), .QN(n296) );
  DFFRX1M \regArr_reg[5][2]  ( .D(n67), .CK(CLK), .RN(RST), .Q(n154), .QN(n295) );
  DFFRX1M \regArr_reg[5][1]  ( .D(n66), .CK(CLK), .RN(RST), .Q(n155), .QN(n294) );
  DFFRX1M \regArr_reg[5][0]  ( .D(n65), .CK(CLK), .RN(RST), .Q(n156), .QN(n293) );
  DFFRX1M \regArr_reg[7][7]  ( .D(n88), .CK(CLK), .RN(RST), .Q(n157), .QN(n308) );
  DFFRX1M \regArr_reg[7][6]  ( .D(n87), .CK(CLK), .RN(RST), .Q(n158), .QN(n307) );
  DFFRX1M \regArr_reg[7][5]  ( .D(n86), .CK(CLK), .RN(RST), .Q(n159), .QN(n306) );
  DFFRX1M \regArr_reg[7][4]  ( .D(n85), .CK(CLK), .RN(RST), .Q(n160), .QN(n305) );
  DFFRX1M \regArr_reg[7][3]  ( .D(n84), .CK(CLK), .RN(RST), .Q(n161), .QN(n304) );
  DFFRX1M \regArr_reg[7][2]  ( .D(n83), .CK(CLK), .RN(RST), .Q(n162), .QN(n303) );
  DFFRX1M \regArr_reg[7][1]  ( .D(n82), .CK(CLK), .RN(RST), .Q(n163), .QN(n302) );
  DFFRX1M \regArr_reg[7][0]  ( .D(n81), .CK(CLK), .RN(RST), .Q(n164), .QN(n301) );
  DFFRX1M \regArr_reg[4][7]  ( .D(n64), .CK(CLK), .RN(RST), .Q(n165), .QN(n284) );
  DFFRX1M \regArr_reg[4][6]  ( .D(n63), .CK(CLK), .RN(RST), .Q(n166), .QN(n283) );
  DFFRX1M \regArr_reg[4][5]  ( .D(n62), .CK(CLK), .RN(RST), .Q(n167), .QN(n282) );
  DFFRX1M \regArr_reg[4][4]  ( .D(n61), .CK(CLK), .RN(RST), .Q(n168), .QN(n281) );
  DFFRX1M \regArr_reg[4][3]  ( .D(n60), .CK(CLK), .RN(RST), .Q(n169), .QN(n280) );
  DFFRX1M \regArr_reg[4][2]  ( .D(n59), .CK(CLK), .RN(RST), .Q(n170), .QN(n279) );
  DFFRX1M \regArr_reg[4][1]  ( .D(n58), .CK(CLK), .RN(RST), .Q(n171), .QN(n278) );
  DFFRX1M \regArr_reg[4][0]  ( .D(n57), .CK(CLK), .RN(RST), .Q(n172), .QN(n277) );
  DFFRX1M \regArr_reg[6][7]  ( .D(n80), .CK(CLK), .RN(RST), .Q(n173), .QN(n292) );
  DFFRX1M \regArr_reg[6][6]  ( .D(n79), .CK(CLK), .RN(RST), .Q(n174), .QN(n291) );
  DFFRX1M \regArr_reg[6][5]  ( .D(n78), .CK(CLK), .RN(RST), .Q(n175), .QN(n290) );
  DFFRX1M \regArr_reg[6][4]  ( .D(n77), .CK(CLK), .RN(RST), .Q(n176), .QN(n289) );
  DFFRX1M \regArr_reg[6][3]  ( .D(n76), .CK(CLK), .RN(RST), .Q(n177), .QN(n288) );
  DFFRX1M \regArr_reg[6][2]  ( .D(n75), .CK(CLK), .RN(RST), .Q(n178), .QN(n287) );
  DFFRX1M \regArr_reg[6][1]  ( .D(n74), .CK(CLK), .RN(RST), .Q(n179), .QN(n286) );
  DFFRX1M \regArr_reg[6][0]  ( .D(n73), .CK(CLK), .RN(RST), .Q(n180), .QN(n285) );
  DFFRX1M \regArr_reg[1][4]  ( .D(n37), .CK(CLK), .RN(RST), .Q(REG1[4]), .QN(
        n250) );
  DFFRX1M \regArr_reg[1][2]  ( .D(n35), .CK(CLK), .RN(RST), .Q(REG1[2]), .QN(
        n247) );
  DFFRX1M \regArr_reg[1][1]  ( .D(n34), .CK(CLK), .RN(RST), .Q(REG1[1]), .QN(
        n249) );
  DFFRX1M \regArr_reg[1][0]  ( .D(n33), .CK(CLK), .RN(RST), .Q(REG1[0]), .QN(
        n144) );
  DFFRX1M \regArr_reg[1][7]  ( .D(n40), .CK(CLK), .RN(RST), .Q(REG1[7]), .QN(
        n248) );
  DFFRX1M \regArr_reg[1][6]  ( .D(n39), .CK(CLK), .RN(RST), .Q(REG1[6]), .QN(
        n252) );
  DFFRX1M \regArr_reg[1][5]  ( .D(n38), .CK(CLK), .RN(RST), .Q(REG1[5]), .QN(
        n251) );
  DFFRX1M \regArr_reg[0][7]  ( .D(n32), .CK(CLK), .RN(RST), .Q(REG0[7]), .QN(
        n241) );
  DFFRX1M \regArr_reg[0][6]  ( .D(n31), .CK(CLK), .RN(RST), .Q(REG0[6]), .QN(
        n240) );
  DFFRX1M \regArr_reg[0][5]  ( .D(n30), .CK(CLK), .RN(RST), .Q(REG0[5]), .QN(
        n242) );
  DFFRX1M \regArr_reg[0][4]  ( .D(n29), .CK(CLK), .RN(RST), .Q(REG0[4]), .QN(
        n243) );
  DFFRX1M \regArr_reg[0][3]  ( .D(n28), .CK(CLK), .RN(RST), .Q(REG0[3]), .QN(
        n244) );
  DFFRX1M \regArr_reg[0][2]  ( .D(n27), .CK(CLK), .RN(RST), .Q(REG0[2]), .QN(
        n245) );
  DFFRX1M \regArr_reg[0][0]  ( .D(n25), .CK(CLK), .RN(RST), .Q(REG0[0]), .QN(
        n246) );
  DFFRX1M \regArr_reg[2][0]  ( .D(n41), .CK(CLK), .RN(RST), .Q(REG2), .QN(n253) );
  EDFFHQX8M \RdData_reg[7]  ( .D(N27), .E(n1), .CK(CLK), .Q(RdData[7]) );
  EDFFHQX8M \RdData_reg[6]  ( .D(N28), .E(n1), .CK(CLK), .Q(RdData[6]) );
  EDFFHQX8M \RdData_reg[5]  ( .D(N29), .E(n1), .CK(CLK), .Q(RdData[5]) );
  EDFFHQX8M \RdData_reg[4]  ( .D(N30), .E(n1), .CK(CLK), .Q(RdData[4]) );
  EDFFHQX8M \RdData_reg[3]  ( .D(N31), .E(n1), .CK(CLK), .Q(RdData[3]) );
  EDFFHQX8M \RdData_reg[2]  ( .D(N32), .E(n1), .CK(CLK), .Q(RdData[2]) );
  EDFFHQX8M \RdData_reg[1]  ( .D(N33), .E(n1), .CK(CLK), .Q(RdData[1]) );
  EDFFHQX8M \RdData_reg[0]  ( .D(N34), .E(n1), .CK(CLK), .Q(RdData[0]) );
  BUFX2M U189 ( .A(Address[0]), .Y(n2) );
  INVX2M U190 ( .A(n211), .Y(n181) );
  NAND3X2M U191 ( .A(n192), .B(n191), .C(n208), .Y(n211) );
  INVX2M U192 ( .A(n205), .Y(n185) );
  INVX2M U193 ( .A(n9), .Y(n184) );
  INVX2M U194 ( .A(n8), .Y(n183) );
  INVX2M U195 ( .A(n11), .Y(n187) );
  INVX2M U196 ( .A(n12), .Y(n188) );
  INVX2M U197 ( .A(n10), .Y(n186) );
  INVX2M U198 ( .A(n7), .Y(n182) );
  BUFX2M U199 ( .A(n217), .Y(n5) );
  BUFX2M U200 ( .A(n217), .Y(n4) );
  NOR2X2M U201 ( .A(n190), .B(Address[1]), .Y(n214) );
  NAND3X2M U202 ( .A(n192), .B(n191), .C(n202), .Y(n205) );
  OAI22X1M U203 ( .A0(n183), .A1(n133), .B0(n198), .B1(n8), .Y(n43) );
  OAI22X1M U204 ( .A0(n183), .A1(n148), .B0(n199), .B1(n8), .Y(n42) );
  OAI22X1M U205 ( .A0(n183), .A1(n147), .B0(n197), .B1(n8), .Y(n44) );
  OAI22X1M U206 ( .A0(n183), .A1(n146), .B0(n196), .B1(n8), .Y(n45) );
  OAI22X1M U207 ( .A0(n183), .A1(n145), .B0(n195), .B1(n8), .Y(n46) );
  OAI22X1M U208 ( .A0(n183), .A1(n143), .B0(n194), .B1(n8), .Y(n47) );
  OAI22X1M U209 ( .A0(n183), .A1(n142), .B0(n193), .B1(n8), .Y(n48) );
  OAI22X1M U210 ( .A0(n184), .A1(n141), .B0(n200), .B1(n9), .Y(n49) );
  OAI22X1M U211 ( .A0(n184), .A1(n140), .B0(n199), .B1(n9), .Y(n50) );
  OAI22X1M U212 ( .A0(n184), .A1(n139), .B0(n198), .B1(n9), .Y(n51) );
  OAI22X1M U213 ( .A0(n184), .A1(n138), .B0(n197), .B1(n9), .Y(n52) );
  OAI22X1M U214 ( .A0(n184), .A1(n137), .B0(n196), .B1(n9), .Y(n53) );
  OAI22X1M U215 ( .A0(n184), .A1(n136), .B0(n195), .B1(n9), .Y(n54) );
  OAI22X1M U216 ( .A0(n184), .A1(n135), .B0(n194), .B1(n9), .Y(n55) );
  OAI22X1M U217 ( .A0(n184), .A1(n134), .B0(n193), .B1(n9), .Y(n56) );
  INVX2M U218 ( .A(Address[1]), .Y(n191) );
  BUFX2M U219 ( .A(n218), .Y(n6) );
  NAND2X2M U220 ( .A(Address[1]), .B(n190), .Y(n218) );
  INVX2M U221 ( .A(n2), .Y(n192) );
  AND2X2M U222 ( .A(n206), .B(n190), .Y(n208) );
  BUFX2M U223 ( .A(n201), .Y(n12) );
  NAND3X2M U224 ( .A(n2), .B(n202), .C(Address[1]), .Y(n201) );
  BUFX2M U225 ( .A(n204), .Y(n10) );
  NAND3X2M U226 ( .A(n202), .B(n191), .C(n2), .Y(n204) );
  BUFX2M U227 ( .A(n203), .Y(n11) );
  NAND3X2M U228 ( .A(n202), .B(n192), .C(Address[1]), .Y(n203) );
  BUFX2M U229 ( .A(n210), .Y(n7) );
  NAND3X2M U230 ( .A(n2), .B(n191), .C(n208), .Y(n210) );
  BUFX2M U231 ( .A(n207), .Y(n9) );
  NAND3X2M U232 ( .A(Address[1]), .B(n2), .C(n208), .Y(n207) );
  BUFX2M U233 ( .A(n209), .Y(n8) );
  NAND3X2M U234 ( .A(Address[1]), .B(n192), .C(n208), .Y(n209) );
  NAND2X2M U235 ( .A(n190), .B(n191), .Y(n217) );
  BUFX2M U236 ( .A(n215), .Y(n3) );
  NOR2X2M U237 ( .A(n191), .B(n190), .Y(n215) );
  NOR3X2M U238 ( .A(RdEn), .B(Address[3]), .C(n189), .Y(n206) );
  OAI22X1M U239 ( .A0(n144), .A1(n4), .B0(n141), .B1(n6), .Y(n219) );
  OAI22X1M U240 ( .A0(n128), .A1(n5), .B0(n148), .B1(n6), .Y(n222) );
  OAI22X1M U241 ( .A0(n249), .A1(n4), .B0(n140), .B1(n6), .Y(n223) );
  OAI22X1M U242 ( .A0(n245), .A1(n5), .B0(n133), .B1(n6), .Y(n226) );
  OAI22X1M U243 ( .A0(n247), .A1(n4), .B0(n139), .B1(n6), .Y(n227) );
  OAI22X1M U244 ( .A0(n244), .A1(n5), .B0(n147), .B1(n6), .Y(n230) );
  OAI22X1M U245 ( .A0(n129), .A1(n4), .B0(n138), .B1(n6), .Y(n231) );
  OAI22X1M U246 ( .A0(n243), .A1(n5), .B0(n146), .B1(n6), .Y(n234) );
  OAI22X1M U247 ( .A0(n250), .A1(n4), .B0(n137), .B1(n6), .Y(n235) );
  OAI22X1M U248 ( .A0(n242), .A1(n5), .B0(n145), .B1(n6), .Y(n238) );
  OAI22X1M U249 ( .A0(n251), .A1(n4), .B0(n136), .B1(n6), .Y(n239) );
  OAI22X1M U250 ( .A0(n240), .A1(n5), .B0(n143), .B1(n6), .Y(n256) );
  OAI22X1M U251 ( .A0(n252), .A1(n4), .B0(n135), .B1(n6), .Y(n257) );
  OAI22X1M U252 ( .A0(n241), .A1(n5), .B0(n142), .B1(n6), .Y(n260) );
  OAI22X1M U253 ( .A0(n248), .A1(n4), .B0(n134), .B1(n6), .Y(n261) );
  OAI22X1M U254 ( .A0(n246), .A1(n5), .B0(n253), .B1(n6), .Y(n216) );
  OAI22X1M U255 ( .A0(n128), .A1(n181), .B0(n199), .B1(n211), .Y(n26) );
  OAI22X1M U256 ( .A0(n212), .A1(n192), .B0(n2), .B1(n213), .Y(N34) );
  AOI221XLM U257 ( .A0(n214), .A1(n156), .B0(n3), .B1(n164), .C0(n219), .Y(
        n212) );
  AOI221XLM U258 ( .A0(n214), .A1(n172), .B0(n3), .B1(n180), .C0(n216), .Y(
        n213) );
  OAI22X1M U259 ( .A0(n220), .A1(n192), .B0(n2), .B1(n221), .Y(N33) );
  AOI221XLM U260 ( .A0(n214), .A1(n155), .B0(n3), .B1(n163), .C0(n223), .Y(
        n220) );
  AOI221XLM U261 ( .A0(n214), .A1(n171), .B0(n3), .B1(n179), .C0(n222), .Y(
        n221) );
  OAI22X1M U262 ( .A0(n224), .A1(n192), .B0(n2), .B1(n225), .Y(N32) );
  AOI221XLM U263 ( .A0(n214), .A1(n154), .B0(n3), .B1(n162), .C0(n227), .Y(
        n224) );
  AOI221XLM U264 ( .A0(n214), .A1(n170), .B0(n3), .B1(n178), .C0(n226), .Y(
        n225) );
  OAI22X1M U265 ( .A0(n228), .A1(n192), .B0(n2), .B1(n229), .Y(N31) );
  AOI221XLM U266 ( .A0(n214), .A1(n153), .B0(n3), .B1(n161), .C0(n231), .Y(
        n228) );
  AOI221XLM U267 ( .A0(n214), .A1(n169), .B0(n3), .B1(n177), .C0(n230), .Y(
        n229) );
  OAI22X1M U268 ( .A0(n232), .A1(n192), .B0(n2), .B1(n233), .Y(N30) );
  AOI221XLM U269 ( .A0(n214), .A1(n152), .B0(n3), .B1(n160), .C0(n235), .Y(
        n232) );
  AOI221XLM U270 ( .A0(n214), .A1(n168), .B0(n3), .B1(n176), .C0(n234), .Y(
        n233) );
  OAI22X1M U271 ( .A0(n236), .A1(n192), .B0(n2), .B1(n237), .Y(N29) );
  AOI221XLM U272 ( .A0(n214), .A1(n151), .B0(n3), .B1(n159), .C0(n239), .Y(
        n236) );
  AOI221XLM U273 ( .A0(n214), .A1(n167), .B0(n3), .B1(n175), .C0(n238), .Y(
        n237) );
  OAI22X1M U274 ( .A0(n254), .A1(n192), .B0(n2), .B1(n255), .Y(N28) );
  AOI221XLM U275 ( .A0(n214), .A1(n150), .B0(n3), .B1(n158), .C0(n257), .Y(
        n254) );
  AOI221XLM U276 ( .A0(n214), .A1(n166), .B0(n3), .B1(n174), .C0(n256), .Y(
        n255) );
  OAI22X1M U277 ( .A0(n258), .A1(n192), .B0(n2), .B1(n259), .Y(N27) );
  AOI221XLM U278 ( .A0(n214), .A1(n149), .B0(n3), .B1(n157), .C0(n261), .Y(
        n258) );
  AOI221XLM U279 ( .A0(n214), .A1(n165), .B0(n3), .B1(n173), .C0(n260), .Y(
        n259) );
  OAI22X1M U280 ( .A0(n246), .A1(n181), .B0(n200), .B1(n211), .Y(n25) );
  OAI22X1M U281 ( .A0(n245), .A1(n181), .B0(n198), .B1(n211), .Y(n27) );
  OAI22X1M U282 ( .A0(n244), .A1(n181), .B0(n197), .B1(n211), .Y(n28) );
  OAI22X1M U283 ( .A0(n243), .A1(n181), .B0(n196), .B1(n211), .Y(n29) );
  OAI22X1M U284 ( .A0(n242), .A1(n181), .B0(n195), .B1(n211), .Y(n30) );
  OAI22X1M U285 ( .A0(n240), .A1(n181), .B0(n194), .B1(n211), .Y(n31) );
  OAI22X1M U286 ( .A0(n241), .A1(n181), .B0(n193), .B1(n211), .Y(n32) );
  OAI22X1M U287 ( .A0(n277), .A1(n185), .B0(n200), .B1(n205), .Y(n57) );
  OAI22X1M U288 ( .A0(n278), .A1(n185), .B0(n199), .B1(n205), .Y(n58) );
  OAI22X1M U289 ( .A0(n279), .A1(n185), .B0(n198), .B1(n205), .Y(n59) );
  OAI22X1M U290 ( .A0(n280), .A1(n185), .B0(n197), .B1(n205), .Y(n60) );
  OAI22X1M U291 ( .A0(n281), .A1(n185), .B0(n196), .B1(n205), .Y(n61) );
  OAI22X1M U292 ( .A0(n282), .A1(n185), .B0(n195), .B1(n205), .Y(n62) );
  OAI22X1M U293 ( .A0(n283), .A1(n185), .B0(n194), .B1(n205), .Y(n63) );
  OAI22X1M U294 ( .A0(n284), .A1(n185), .B0(n193), .B1(n205), .Y(n64) );
  OAI22X1M U295 ( .A0(n129), .A1(n182), .B0(n197), .B1(n7), .Y(n36) );
  OAI22X1M U296 ( .A0(n253), .A1(n183), .B0(n200), .B1(n8), .Y(n41) );
  OAI22X1M U297 ( .A0(n251), .A1(n182), .B0(n195), .B1(n7), .Y(n38) );
  OAI22X1M U298 ( .A0(n252), .A1(n182), .B0(n194), .B1(n7), .Y(n39) );
  OAI22X1M U299 ( .A0(n248), .A1(n182), .B0(n193), .B1(n7), .Y(n40) );
  OAI22X1M U300 ( .A0(n144), .A1(n182), .B0(n200), .B1(n7), .Y(n33) );
  OAI22X1M U301 ( .A0(n249), .A1(n182), .B0(n199), .B1(n7), .Y(n34) );
  OAI22X1M U302 ( .A0(n247), .A1(n182), .B0(n198), .B1(n7), .Y(n35) );
  OAI22X1M U303 ( .A0(n250), .A1(n182), .B0(n196), .B1(n7), .Y(n37) );
  OAI22X1M U304 ( .A0(n285), .A1(n187), .B0(n200), .B1(n11), .Y(n73) );
  OAI22X1M U305 ( .A0(n286), .A1(n187), .B0(n199), .B1(n11), .Y(n74) );
  OAI22X1M U306 ( .A0(n287), .A1(n187), .B0(n198), .B1(n11), .Y(n75) );
  OAI22X1M U307 ( .A0(n288), .A1(n187), .B0(n197), .B1(n11), .Y(n76) );
  OAI22X1M U308 ( .A0(n289), .A1(n187), .B0(n196), .B1(n11), .Y(n77) );
  OAI22X1M U309 ( .A0(n290), .A1(n187), .B0(n195), .B1(n11), .Y(n78) );
  OAI22X1M U310 ( .A0(n291), .A1(n187), .B0(n194), .B1(n11), .Y(n79) );
  OAI22X1M U311 ( .A0(n292), .A1(n187), .B0(n193), .B1(n11), .Y(n80) );
  OAI22X1M U312 ( .A0(n293), .A1(n186), .B0(n200), .B1(n10), .Y(n65) );
  OAI22X1M U313 ( .A0(n294), .A1(n186), .B0(n199), .B1(n10), .Y(n66) );
  OAI22X1M U314 ( .A0(n295), .A1(n186), .B0(n198), .B1(n10), .Y(n67) );
  OAI22X1M U315 ( .A0(n296), .A1(n186), .B0(n197), .B1(n10), .Y(n68) );
  OAI22X1M U316 ( .A0(n297), .A1(n186), .B0(n196), .B1(n10), .Y(n69) );
  OAI22X1M U317 ( .A0(n298), .A1(n186), .B0(n195), .B1(n10), .Y(n70) );
  OAI22X1M U318 ( .A0(n299), .A1(n186), .B0(n194), .B1(n10), .Y(n71) );
  OAI22X1M U319 ( .A0(n300), .A1(n186), .B0(n193), .B1(n10), .Y(n72) );
  OAI22X1M U320 ( .A0(n301), .A1(n188), .B0(n12), .B1(n200), .Y(n81) );
  OAI22X1M U321 ( .A0(n302), .A1(n188), .B0(n12), .B1(n199), .Y(n82) );
  OAI22X1M U322 ( .A0(n303), .A1(n188), .B0(n12), .B1(n198), .Y(n83) );
  OAI22X1M U323 ( .A0(n304), .A1(n188), .B0(n12), .B1(n197), .Y(n84) );
  OAI22X1M U324 ( .A0(n305), .A1(n188), .B0(n12), .B1(n196), .Y(n85) );
  OAI22X1M U325 ( .A0(n306), .A1(n188), .B0(n12), .B1(n195), .Y(n86) );
  OAI22X1M U326 ( .A0(n307), .A1(n188), .B0(n12), .B1(n194), .Y(n87) );
  OAI22X1M U327 ( .A0(n308), .A1(n188), .B0(n12), .B1(n193), .Y(n88) );
  INVX2M U328 ( .A(Address[2]), .Y(n190) );
  AND2X2M U329 ( .A(n206), .B(Address[2]), .Y(n202) );
  INVX2M U330 ( .A(WrEn), .Y(n189) );
  INVX2M U331 ( .A(WrData[0]), .Y(n200) );
  INVX2M U332 ( .A(WrData[1]), .Y(n199) );
  INVX2M U333 ( .A(WrData[3]), .Y(n197) );
  INVX2M U334 ( .A(WrData[4]), .Y(n196) );
  INVX2M U335 ( .A(WrData[5]), .Y(n195) );
  INVX2M U336 ( .A(WrData[6]), .Y(n194) );
  INVX2M U337 ( .A(WrData[7]), .Y(n193) );
  INVX2M U338 ( .A(WrData[2]), .Y(n198) );
endmodule


module ALU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   n1, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n3;

  OAI31X1M U142 ( .A0(n117), .A1(n118), .A2(n89), .B0(n119), .Y(quotient[4])
         );
  INVX2M U143 ( .A(b[0]), .Y(n13) );
  AND2X2M U144 ( .A(n30), .B(n29), .Y(n31) );
  NOR3X2M U145 ( .A(quotient[3]), .B(quotient[4]), .C(n89), .Y(n16) );
  INVX2M U146 ( .A(n110), .Y(n6) );
  INVX2M U147 ( .A(n97), .Y(n7) );
  INVX2M U148 ( .A(n67), .Y(n8) );
  INVX2M U149 ( .A(n38), .Y(n9) );
  NAND2X2M U150 ( .A(n82), .B(n10), .Y(n117) );
  OAI2BB1X2M U151 ( .A0N(n118), .A1N(n89), .B0(n120), .Y(n119) );
  OAI21X2M U152 ( .A0(n115), .A1(n124), .B0(n125), .Y(n118) );
  OAI31X1M U153 ( .A0(n123), .A1(n129), .A2(n13), .B0(n131), .Y(n112) );
  AO21XLM U154 ( .A0(n129), .A1(quotient[5]), .B0(a[5]), .Y(n131) );
  OAI31X1M U155 ( .A0(n96), .A1(n97), .A2(n13), .B0(n98), .Y(n63) );
  AO21XLM U156 ( .A0(n97), .A1(quotient[3]), .B0(a[3]), .Y(n98) );
  XNOR2X2M U157 ( .A(n92), .B(n93), .Y(n69) );
  NAND2X2M U158 ( .A(quotient[3]), .B(n94), .Y(n92) );
  CLKXOR2X2M U159 ( .A(n12), .B(n7), .Y(n94) );
  XNOR2X2M U160 ( .A(n68), .B(n69), .Y(n45) );
  NAND2X2M U161 ( .A(n70), .B(quotient[2]), .Y(n68) );
  CLKXOR2X2M U162 ( .A(n11), .B(n71), .Y(n70) );
  OAI21X2M U163 ( .A0(n13), .A1(n122), .B0(a[6]), .Y(n127) );
  OAI21X2M U164 ( .A0(n67), .A1(n63), .B0(n95), .Y(n71) );
  OAI2BB1X2M U165 ( .A0N(n63), .A1N(n67), .B0(n12), .Y(n95) );
  OAI2BB1X2M U166 ( .A0N(n7), .A1N(n93), .B0(n108), .Y(n102) );
  OAI21X2M U167 ( .A0(n93), .A1(n7), .B0(n12), .Y(n108) );
  CLKXOR2X2M U168 ( .A(n111), .B(n112), .Y(n100) );
  NAND2X2M U169 ( .A(n113), .B(quotient[4]), .Y(n111) );
  CLKXOR2X2M U170 ( .A(n12), .B(n6), .Y(n113) );
  OAI2BB1X2M U171 ( .A0N(n71), .A1N(n69), .B0(n91), .Y(n75) );
  OAI21X2M U172 ( .A0(n69), .A1(n71), .B0(n11), .Y(n91) );
  OAI2BB1X2M U173 ( .A0N(n9), .A1N(n33), .B0(n65), .Y(n43) );
  OAI21X2M U174 ( .A0(n33), .A1(n9), .B0(n12), .Y(n65) );
  AOI2BB2XLM U175 ( .B0(quotient[1]), .B1(n9), .A0N(n12), .A1N(a[0]), .Y(n39)
         );
  OAI2BB1X2M U176 ( .A0N(n43), .A1N(n41), .B0(n61), .Y(n47) );
  OAI21X2M U177 ( .A0(n41), .A1(n43), .B0(n11), .Y(n61) );
  OAI21X2M U178 ( .A0(n1), .A1(n8), .B0(n66), .Y(n33) );
  OAI21X2M U179 ( .A0(n1), .A1(n13), .B0(a[2]), .Y(n66) );
  INVX2M U180 ( .A(n96), .Y(quotient[3]) );
  NOR2X2M U181 ( .A(n77), .B(n84), .Y(n83) );
  INVX2M U182 ( .A(quotient[2]), .Y(n1) );
  INVX2M U183 ( .A(n123), .Y(quotient[5]) );
  INVX2M U184 ( .A(n122), .Y(quotient[6]) );
  OA21X2M U185 ( .A0(n35), .A1(n36), .B0(n37), .Y(n29) );
  OAI21X2M U186 ( .A0(a[0]), .A1(n13), .B0(n12), .Y(n37) );
  NOR2X2M U187 ( .A(n39), .B(n13), .Y(n35) );
  AOI21X2M U188 ( .A0(quotient[1]), .A1(n38), .B0(a[1]), .Y(n36) );
  INVX2M U189 ( .A(n121), .Y(quotient[7]) );
  CLKXOR2X2M U190 ( .A(n62), .B(n63), .Y(n41) );
  NAND2X2M U191 ( .A(n64), .B(quotient[2]), .Y(n62) );
  CLKXOR2X2M U192 ( .A(n12), .B(n8), .Y(n64) );
  CLKXOR2X2M U193 ( .A(n32), .B(n33), .Y(n30) );
  NAND2X2M U194 ( .A(quotient[1]), .B(n34), .Y(n32) );
  CLKXOR2X2M U195 ( .A(n12), .B(n9), .Y(n34) );
  AO21XLM U196 ( .A0(n124), .A1(n115), .B0(n11), .Y(n125) );
  XNOR2X2M U197 ( .A(n99), .B(n100), .Y(n73) );
  NAND2X2M U198 ( .A(quotient[3]), .B(n101), .Y(n99) );
  CLKXOR2X2M U199 ( .A(n11), .B(n102), .Y(n101) );
  XNOR2X2M U200 ( .A(n76), .B(n77), .Y(n53) );
  NAND2X2M U201 ( .A(n78), .B(quotient[2]), .Y(n76) );
  CLKXOR2X2M U202 ( .A(n10), .B(n84), .Y(n78) );
  XNOR2X2M U203 ( .A(n114), .B(n115), .Y(n86) );
  NAND2X2M U204 ( .A(n116), .B(quotient[4]), .Y(n114) );
  CLKXOR2X2M U205 ( .A(n11), .B(n124), .Y(n116) );
  NOR2X2M U206 ( .A(n13), .B(a[5]), .Y(n129) );
  NAND4X2M U207 ( .A(a[7]), .B(n121), .C(n122), .D(n123), .Y(n89) );
  NAND2X2M U208 ( .A(quotient[1]), .B(n42), .Y(n40) );
  CLKXOR2X2M U209 ( .A(n11), .B(n43), .Y(n42) );
  NOR2X2M U210 ( .A(n13), .B(a[4]), .Y(n110) );
  NOR2X2M U211 ( .A(n13), .B(a[3]), .Y(n97) );
  NOR2X2M U212 ( .A(n13), .B(a[2]), .Y(n67) );
  NOR2X2M U213 ( .A(n13), .B(a[1]), .Y(n38) );
  NOR3BX2M U214 ( .AN(n82), .B(b[3]), .C(b[4]), .Y(n120) );
  NOR3X2M U215 ( .A(b[6]), .B(b[7]), .C(b[5]), .Y(n82) );
  OAI211X2M U216 ( .A0(a[7]), .A1(n12), .B0(n120), .C0(n137), .Y(n122) );
  AOI2B1X1M U217 ( .A1N(a[6]), .A0(b[0]), .B0(b[2]), .Y(n137) );
  OAI22X1M U218 ( .A0(n110), .A1(n112), .B0(b[1]), .B1(n130), .Y(n124) );
  AND2X2M U219 ( .A(n112), .B(n110), .Y(n130) );
  OAI211X2M U220 ( .A0(a[7]), .A1(n13), .B0(n120), .C0(n136), .Y(n121) );
  NOR2X2M U221 ( .A(b[2]), .B(b[1]), .Y(n136) );
  OAI2BB2X1M U222 ( .B0(b[3]), .B1(n90), .A0N(n75), .A1N(n73), .Y(n84) );
  NOR2X2M U223 ( .A(n73), .B(n75), .Y(n90) );
  OAI21X2M U224 ( .A0(n26), .A1(n27), .B0(n28), .Y(n24) );
  OAI2BB1X2M U225 ( .A0N(n27), .A1N(n26), .B0(b[3]), .Y(n28) );
  OAI22X1M U226 ( .A0(n29), .A1(n30), .B0(b[2]), .B1(n31), .Y(n27) );
  XNOR2X2M U227 ( .A(n40), .B(n41), .Y(n26) );
  OAI21X2M U228 ( .A0(n45), .A1(n47), .B0(n60), .Y(n51) );
  OAI2BB1X2M U229 ( .A0N(n47), .A1N(n45), .B0(b[3]), .Y(n60) );
  INVX2M U230 ( .A(b[1]), .Y(n12) );
  AOI31X1M U231 ( .A0(b[0]), .A1(n6), .A2(quotient[4]), .B0(n109), .Y(n93) );
  AOI21XLM U232 ( .A0(quotient[4]), .A1(n110), .B0(a[4]), .Y(n109) );
  OAI21X2M U233 ( .A0(n49), .A1(n51), .B0(n59), .Y(n55) );
  AO21XLM U234 ( .A0(n51), .A1(n49), .B0(b[4]), .Y(n59) );
  NAND2X2M U235 ( .A(n120), .B(n132), .Y(n123) );
  OAI32X1M U236 ( .A0(n133), .A1(quotient[6]), .A2(quotient[7]), .B0(b[2]), 
        .B1(n134), .Y(n132) );
  OAI2BB1X2M U237 ( .A0N(n134), .A1N(b[2]), .B0(a[7]), .Y(n133) );
  OAI2BB1X2M U238 ( .A0N(n127), .A1N(n129), .B0(n135), .Y(n134) );
  OAI21X2M U239 ( .A0(n103), .A1(n104), .B0(n82), .Y(n96) );
  NOR2X2M U240 ( .A(b[4]), .B(n105), .Y(n104) );
  AOI211XLM U241 ( .A0(b[4]), .A1(n105), .B0(n89), .C0(quotient[4]), .Y(n103)
         );
  OAI21X2M U242 ( .A0(n86), .A1(n88), .B0(n106), .Y(n105) );
  NAND2X2M U243 ( .A(n79), .B(n80), .Y(quotient[2]) );
  NAND4BBX1M U244 ( .AN(b[6]), .BN(b[7]), .C(n16), .D(n81), .Y(n80) );
  OAI21X2M U245 ( .A0(n16), .A1(n81), .B0(n82), .Y(n79) );
  OAI2BB2X1M U246 ( .B0(b[4]), .B1(n83), .A0N(n84), .A1N(n77), .Y(n81) );
  OAI2BB2X1M U247 ( .B0(b[5]), .B1(n20), .A0N(n21), .A1N(n22), .Y(n18) );
  NOR2X2M U248 ( .A(n22), .B(n21), .Y(n20) );
  OAI21X2M U249 ( .A0(n23), .A1(n24), .B0(n25), .Y(n21) );
  CLKXOR2X2M U250 ( .A(n48), .B(n49), .Y(n22) );
  OAI21X2M U251 ( .A0(n129), .A1(n127), .B0(b[1]), .Y(n135) );
  OAI2BB1X2M U252 ( .A0N(n88), .A1N(n86), .B0(b[3]), .Y(n106) );
  OAI2BB1X2M U253 ( .A0N(n55), .A1N(n53), .B0(b[5]), .Y(n58) );
  OAI2BB2X1M U254 ( .B0(b[2]), .B1(n107), .A0N(n102), .A1N(n100), .Y(n88) );
  NOR2X2M U255 ( .A(n100), .B(n102), .Y(n107) );
  OAI32X1M U256 ( .A0(n14), .A1(quotient[2]), .A2(quotient[1]), .B0(b[7]), 
        .B1(n15), .Y(quotient[0]) );
  OAI2BB1X2M U257 ( .A0N(n15), .A1N(b[7]), .B0(n16), .Y(n14) );
  OAI21X2M U258 ( .A0(n17), .A1(n18), .B0(n19), .Y(n15) );
  OAI2BB1X2M U259 ( .A0N(n18), .A1N(n17), .B0(b[6]), .Y(n19) );
  BUFX2M U260 ( .A(n3), .Y(quotient[1]) );
  AOI211X2M U261 ( .A0(n56), .A1(b[6]), .B0(n57), .C0(b[7]), .Y(n3) );
  AOI2BB2XLM U262 ( .B0(n1), .B1(n16), .A0N(b[6]), .A1N(n56), .Y(n57) );
  OAI21X2M U263 ( .A0(n53), .A1(n55), .B0(n58), .Y(n56) );
  CLKXOR2X2M U264 ( .A(n126), .B(n127), .Y(n115) );
  NAND2X2M U265 ( .A(quotient[5]), .B(n128), .Y(n126) );
  CLKXOR2X2M U266 ( .A(b[1]), .B(n129), .Y(n128) );
  AO21XLM U267 ( .A0(n24), .A1(n23), .B0(b[4]), .Y(n25) );
  XNOR2X2M U268 ( .A(n85), .B(n86), .Y(n77) );
  NAND2X2M U269 ( .A(quotient[3]), .B(n87), .Y(n85) );
  XNOR2X2M U270 ( .A(b[3]), .B(n88), .Y(n87) );
  XNOR2X2M U271 ( .A(n52), .B(n53), .Y(n17) );
  NAND2X2M U272 ( .A(quotient[1]), .B(n54), .Y(n52) );
  XNOR2X2M U273 ( .A(b[5]), .B(n55), .Y(n54) );
  CLKXOR2X2M U274 ( .A(n72), .B(n73), .Y(n49) );
  NAND2X2M U275 ( .A(n74), .B(quotient[2]), .Y(n72) );
  XNOR2X2M U276 ( .A(b[3]), .B(n75), .Y(n74) );
  NAND2X2M U277 ( .A(n50), .B(quotient[1]), .Y(n48) );
  CLKXOR2X2M U278 ( .A(n51), .B(b[4]), .Y(n50) );
  CLKXOR2X2M U279 ( .A(n44), .B(n45), .Y(n23) );
  NAND2X2M U280 ( .A(quotient[1]), .B(n46), .Y(n44) );
  XNOR2X2M U281 ( .A(b[3]), .B(n47), .Y(n46) );
  INVX2M U282 ( .A(b[2]), .Y(n11) );
  INVX2M U283 ( .A(b[4]), .Y(n10) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
;

  INVX2M U25 ( .A(A[0]), .Y(n3) );
  INVX2M U26 ( .A(A[2]), .Y(n1) );
  NAND2X2M U27 ( .A(B[0]), .B(n3), .Y(n16) );
  OAI2BB2X1M U28 ( .B0(B[1]), .B1(n15), .A0N(n16), .A1N(A[1]), .Y(n14) );
  NOR2X2M U29 ( .A(A[1]), .B(n16), .Y(n15) );
  OAI2BB2X1M U30 ( .B0(B[4]), .B1(n9), .A0N(n10), .A1N(A[4]), .Y(n8) );
  NOR2X2M U31 ( .A(A[4]), .B(n10), .Y(n9) );
  OAI2BB2X1M U32 ( .B0(B[3]), .B1(n11), .A0N(n12), .A1N(A[3]), .Y(n10) );
  NOR2X2M U33 ( .A(A[3]), .B(n12), .Y(n11) );
  OAI21X2M U34 ( .A0(n2), .A1(n1), .B0(n13), .Y(n12) );
  AO21XLM U35 ( .A0(n1), .A1(n2), .B0(B[2]), .Y(n13) );
  INVX2M U36 ( .A(n14), .Y(n2) );
  OAI2BB2X1M U37 ( .B0(B[5]), .B1(n7), .A0N(n8), .A1N(A[5]), .Y(n5) );
  NOR2X2M U38 ( .A(A[5]), .B(n8), .Y(n7) );
  XOR3XLM U39 ( .A(B[7]), .B(A[7]), .C(n4), .Y(DIFF[7]) );
  OAI21X2M U40 ( .A0(A[6]), .A1(n5), .B0(n6), .Y(n4) );
  OAI2BB1X2M U41 ( .A0N(n5), .A1N(A[6]), .B0(B[6]), .Y(n6) );
  XNOR3X2M U42 ( .A(B[4]), .B(A[4]), .C(n10), .Y(DIFF[4]) );
  XNOR3X2M U43 ( .A(B[3]), .B(A[3]), .C(n12), .Y(DIFF[3]) );
  XNOR3X2M U44 ( .A(B[5]), .B(A[5]), .C(n8), .Y(DIFF[5]) );
  XNOR3X2M U45 ( .A(B[6]), .B(A[6]), .C(n5), .Y(DIFF[6]) );
  OAI21X2M U46 ( .A0(B[0]), .A1(n3), .B0(n16), .Y(DIFF[0]) );
  XOR3XLM U47 ( .A(B[2]), .B(n1), .C(n14), .Y(DIFF[2]) );
  XNOR3X2M U48 ( .A(B[1]), .B(A[1]), .C(n16), .Y(DIFF[1]) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;

  OAI2BB1X2M U22 ( .A0N(n10), .A1N(A[2]), .B0(n11), .Y(n8) );
  OAI21X2M U23 ( .A0(A[2]), .A1(n10), .B0(B[2]), .Y(n11) );
  OAI2BB1X2M U24 ( .A0N(n12), .A1N(A[1]), .B0(n13), .Y(n10) );
  OAI21X2M U25 ( .A0(n12), .A1(A[1]), .B0(B[1]), .Y(n13) );
  XOR3XLM U26 ( .A(B[6]), .B(A[6]), .C(n2), .Y(SUM[6]) );
  OAI2BB1X2M U27 ( .A0N(n4), .A1N(A[5]), .B0(n5), .Y(n2) );
  OAI21X2M U28 ( .A0(A[5]), .A1(n4), .B0(B[5]), .Y(n5) );
  AO22X1M U29 ( .A0(n8), .A1(A[3]), .B0(n9), .B1(B[3]), .Y(n6) );
  OR2X2M U30 ( .A(A[3]), .B(n8), .Y(n9) );
  AND2X2M U31 ( .A(B[0]), .B(A[0]), .Y(n12) );
  AO22X1M U32 ( .A0(n6), .A1(A[4]), .B0(n7), .B1(B[4]), .Y(n4) );
  OR2X2M U33 ( .A(A[4]), .B(n6), .Y(n7) );
  XOR3XLM U34 ( .A(B[7]), .B(A[7]), .C(n1), .Y(SUM[7]) );
  AO2B2X2M U35 ( .B0(n2), .B1(A[6]), .A0(B[6]), .A1N(n3), .Y(n1) );
  NOR2X2M U36 ( .A(A[6]), .B(n2), .Y(n3) );
  XOR3XLM U37 ( .A(B[4]), .B(A[4]), .C(n6), .Y(SUM[4]) );
  XOR3XLM U38 ( .A(B[3]), .B(A[3]), .C(n8), .Y(SUM[3]) );
  XOR3XLM U39 ( .A(B[5]), .B(A[5]), .C(n4), .Y(SUM[5]) );
  XOR3XLM U40 ( .A(B[1]), .B(A[1]), .C(n12), .Y(SUM[1]) );
  XOR3XLM U41 ( .A(B[2]), .B(A[2]), .C(n10), .Y(SUM[2]) );
  XOR2XLM U42 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97;

  XNOR2X2M U106 ( .A(n52), .B(n53), .Y(n48) );
  XOR3XLM U107 ( .A(n51), .B(n48), .C(n49), .Y(n58) );
  XNOR3X2M U108 ( .A(n57), .B(n58), .C(n56), .Y(n60) );
  XNOR3X2M U109 ( .A(n18), .B(n16), .C(n19), .Y(n46) );
  XOR3XLM U110 ( .A(n8), .B(n9), .C(n10), .Y(PRODUCT[7]) );
  XOR3XLM U111 ( .A(n38), .B(n39), .C(n40), .Y(n9) );
  CLKXOR2X2M U112 ( .A(n11), .B(n12), .Y(n10) );
  AOI22X1M U113 ( .A0(n44), .A1(n45), .B0(n46), .B1(n47), .Y(n8) );
  AOI21BX2M U114 ( .A0(n59), .A1(n60), .B0N(n61), .Y(n16) );
  OAI21X2M U115 ( .A0(n59), .A1(n60), .B0(n62), .Y(n61) );
  OR2X2M U116 ( .A(n46), .B(n47), .Y(n45) );
  XNOR2X2M U117 ( .A(n70), .B(n71), .Y(n67) );
  OAI22X1M U118 ( .A0(n67), .A1(n68), .B0(n69), .B1(n41), .Y(n56) );
  AND2X2M U119 ( .A(n68), .B(n67), .Y(n69) );
  OAI22X1M U120 ( .A0(n81), .A1(n82), .B0(n83), .B1(n84), .Y(n75) );
  NOR2BX2M U121 ( .AN(n82), .B(n4), .Y(n83) );
  OAI2BB2X1M U122 ( .B0(n55), .B1(n56), .A0N(n57), .A1N(n58), .Y(n35) );
  NOR2X2M U123 ( .A(n58), .B(n57), .Y(n55) );
  OAI2BB2X1M U124 ( .B0(n89), .B1(n90), .A0N(n91), .A1N(n3), .Y(n85) );
  NOR2X2M U125 ( .A(n3), .B(n91), .Y(n89) );
  INVX2M U126 ( .A(n92), .Y(n3) );
  OAI2BB2X1M U127 ( .B0(n76), .B1(n77), .A0N(n78), .A1N(n79), .Y(n64) );
  NOR2X2M U128 ( .A(n79), .B(n78), .Y(n76) );
  XOR3XLM U129 ( .A(n37), .B(n35), .C(n34), .Y(n19) );
  XNOR3X2M U130 ( .A(n75), .B(n73), .C(n72), .Y(n79) );
  XOR3XLM U131 ( .A(n33), .B(n30), .C(n31), .Y(n34) );
  XOR3XLM U132 ( .A(n25), .B(n22), .C(n23), .Y(n30) );
  XOR3XLM U133 ( .A(n62), .B(n59), .C(n60), .Y(n63) );
  XOR3XLM U134 ( .A(n84), .B(n4), .C(n82), .Y(n86) );
  AOI21X2M U135 ( .A0(n34), .A1(n35), .B0(n37), .Y(n36) );
  XOR3XLM U136 ( .A(n41), .B(n67), .C(n68), .Y(n72) );
  XNOR3X2M U137 ( .A(n44), .B(n47), .C(n46), .Y(PRODUCT[6]) );
  XNOR3X2M U138 ( .A(n66), .B(n64), .C(n63), .Y(PRODUCT[5]) );
  INVX2M U139 ( .A(A[1]), .Y(n5) );
  OAI2BB1X2M U140 ( .A0N(n85), .A1N(n86), .B0(n87), .Y(n77) );
  OAI21X2M U141 ( .A0(n86), .A1(n85), .B0(n88), .Y(n87) );
  NOR2X2M U142 ( .A(n18), .B(n19), .Y(n17) );
  NAND2X2M U143 ( .A(n71), .B(n80), .Y(n68) );
  NAND2X2M U144 ( .A(n80), .B(n93), .Y(n82) );
  NAND2X2M U145 ( .A(PRODUCT[0]), .B(n93), .Y(n92) );
  OA22X2M U146 ( .A0(n48), .A1(n49), .B0(n50), .B1(n51), .Y(n31) );
  AND2X2M U147 ( .A(n49), .B(n48), .Y(n50) );
  NAND2X2M U148 ( .A(n70), .B(n71), .Y(n49) );
  NAND2X2M U149 ( .A(n52), .B(n53), .Y(n23) );
  CLKXOR2X2M U150 ( .A(n80), .B(n93), .Y(n91) );
  OA22X2M U151 ( .A0(n63), .A1(n64), .B0(n65), .B1(n66), .Y(n44) );
  AND2X2M U152 ( .A(n64), .B(n63), .Y(n65) );
  OA21X2M U153 ( .A0(n72), .A1(n73), .B0(n74), .Y(n62) );
  OAI2BB1X2M U154 ( .A0N(n73), .A1N(n72), .B0(n75), .Y(n74) );
  CLKXOR2X2M U155 ( .A(n26), .B(n54), .Y(n22) );
  NOR2X2M U156 ( .A(n6), .B(n5), .Y(n54) );
  INVX2M U157 ( .A(n81), .Y(n4) );
  OAI22X1M U158 ( .A0(n22), .A1(n23), .B0(n24), .B1(n25), .Y(n21) );
  AND2X2M U159 ( .A(n23), .B(n22), .Y(n24) );
  AOI21X2M U160 ( .A0(n30), .A1(n31), .B0(n33), .Y(n32) );
  XOR3XLM U161 ( .A(n78), .B(n77), .C(n79), .Y(PRODUCT[4]) );
  XOR3XLM U162 ( .A(n90), .B(n92), .C(n91), .Y(PRODUCT[2]) );
  XOR3XLM U163 ( .A(n88), .B(n86), .C(n85), .Y(PRODUCT[3]) );
  NOR2BX2M U164 ( .AN(B[4]), .B(n5), .Y(n53) );
  NOR2BX2M U165 ( .AN(B[1]), .B(n5), .Y(n93) );
  NAND2X2M U166 ( .A(B[0]), .B(A[2]), .Y(n90) );
  NOR2BX2M U167 ( .AN(B[3]), .B(n5), .Y(n71) );
  NAND2X2M U168 ( .A(B[2]), .B(A[3]), .Y(n57) );
  NAND2X2M U169 ( .A(B[2]), .B(A[2]), .Y(n41) );
  NAND2X2M U170 ( .A(A[2]), .B(B[1]), .Y(n84) );
  NAND2X2M U171 ( .A(A[3]), .B(B[1]), .Y(n73) );
  INVX2M U172 ( .A(B[2]), .Y(n7) );
  NAND2X2M U173 ( .A(B[6]), .B(A[0]), .Y(n26) );
  NAND2X2M U174 ( .A(A[2]), .B(B[4]), .Y(n25) );
  XOR3XLM U175 ( .A(n13), .B(n14), .C(n15), .Y(n12) );
  NAND2X2M U176 ( .A(A[7]), .B(B[0]), .Y(n14) );
  CLKXOR2X2M U177 ( .A(n20), .B(n21), .Y(n13) );
  OAI2BB2X1M U178 ( .B0(n16), .B1(n17), .A0N(n18), .A1N(n19), .Y(n15) );
  INVX2M U179 ( .A(B[5]), .Y(n6) );
  NAND2X2M U180 ( .A(A[2]), .B(B[3]), .Y(n51) );
  AND2X2M U181 ( .A(A[0]), .B(B[2]), .Y(n80) );
  AND2X2M U182 ( .A(A[0]), .B(B[0]), .Y(PRODUCT[0]) );
  AND2X2M U183 ( .A(A[0]), .B(B[4]), .Y(n70) );
  XOR3XLM U184 ( .A(n27), .B(n28), .C(n29), .Y(n11) );
  NAND2X2M U185 ( .A(B[7]), .B(A[0]), .Y(n29) );
  AOI2BB1X2M U186 ( .A0N(n30), .A1N(n31), .B0(n32), .Y(n28) );
  AOI2BB1X2M U187 ( .A0N(n34), .A1N(n35), .B0(n36), .Y(n27) );
  AND2X2M U188 ( .A(A[0]), .B(B[5]), .Y(n52) );
  CLKXOR2X2M U189 ( .A(n94), .B(n95), .Y(n81) );
  NAND2X2M U190 ( .A(A[0]), .B(B[3]), .Y(n94) );
  NOR2X2M U191 ( .A(n7), .B(n5), .Y(n95) );
  NAND2X2M U192 ( .A(B[0]), .B(A[4]), .Y(n78) );
  OAI31X1M U193 ( .A0(n6), .A1(n41), .A2(n1), .B0(n42), .Y(n40) );
  OAI2BB2X1M U194 ( .B0(n7), .B1(n1), .A0N(A[2]), .A1N(B[5]), .Y(n42) );
  INVX2M U195 ( .A(A[5]), .Y(n1) );
  NAND2X2M U196 ( .A(B[0]), .B(A[6]), .Y(n47) );
  NAND2X2M U197 ( .A(A[5]), .B(B[1]), .Y(n18) );
  OAI211X2M U198 ( .A0(n6), .A1(n26), .B0(A[1]), .C0(B[6]), .Y(n20) );
  NAND2X2M U199 ( .A(B[0]), .B(A[5]), .Y(n66) );
  NAND2X2M U200 ( .A(B[3]), .B(A[3]), .Y(n33) );
  NAND2X2M U201 ( .A(A[4]), .B(B[1]), .Y(n59) );
  NAND2X2M U202 ( .A(B[2]), .B(A[4]), .Y(n37) );
  NAND2X2M U203 ( .A(B[1]), .B(A[6]), .Y(n39) );
  AOI31X2M U204 ( .A0(A[4]), .A1(n2), .A2(B[4]), .B0(n43), .Y(n38) );
  INVX2M U205 ( .A(n33), .Y(n2) );
  AOI22X1M U206 ( .A0(B[4]), .A1(A[3]), .B0(A[4]), .B1(B[3]), .Y(n43) );
  AND2X2M U207 ( .A(B[0]), .B(A[3]), .Y(n88) );
  CLKXOR2X2M U208 ( .A(n96), .B(n97), .Y(PRODUCT[1]) );
  NAND2X2M U209 ( .A(A[0]), .B(B[1]), .Y(n97) );
  NAND2XLM U210 ( .A(A[1]), .B(B[0]), .Y(n96) );
endmodule


module ALU ( A, B, ALU_FUN, CLK, RST, Enable, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [7:0] ALU_OUT;
  input CLK, RST, Enable;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134;
  wire   [7:0] ALU_OUT_Comb;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  ALU_DW_div_uns_0 div_51 ( .a({n133, n132, n131, n130, n129, n128, n127, n126}), .b(B), .quotient({N122, N121, N120, N119, N118, N117, N116, N115}) );
  ALU_DW01_sub_0 sub_45 ( .A({n133, n132, n131, n130, n129, n128, n127, n126}), 
        .B(B), .CI(1'b0), .DIFF({N106, N105, N104, N103, N102, N101, N100, N99}) );
  ALU_DW01_add_0 add_42 ( .A({n133, n132, n131, n130, n129, n128, n127, n126}), 
        .B(B), .CI(1'b0), .SUM({N98, N97, N96, N95, N94, N93, N92, N91}) );
  ALU_DW02_mult_0 mult_48 ( .A({n133, n132, n131, n130, n129, n128, n127, n126}), .B(B), .TC(1'b0), .PRODUCT({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N114, N113, N112, N111, N110, N109, N108, 
        N107}) );
  DFFRHQX8M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRHQX8M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRHQX8M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRHQX8M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRHQX8M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRHQX8M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRHQX8M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRHQX8M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRHQX8M OUT_VALID_reg ( .D(Enable), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  INVX2M U134 ( .A(n55), .Y(n23) );
  INVX2M U135 ( .A(n100), .Y(n26) );
  NOR3BX2M U136 ( .AN(n125), .B(n28), .C(n27), .Y(n42) );
  OAI22X1M U137 ( .A0(n98), .A1(n24), .B0(n99), .B1(n27), .Y(n38) );
  OAI22X1M U138 ( .A0(n98), .A1(n24), .B0(n99), .B1(n100), .Y(n39) );
  NOR2BX2M U139 ( .AN(n125), .B(n100), .Y(n43) );
  OAI22X1M U140 ( .A0(n54), .A1(n9), .B0(n37), .B1(n11), .Y(n87) );
  NAND2X2M U141 ( .A(n88), .B(n24), .Y(n55) );
  NAND2X2M U142 ( .A(n28), .B(n27), .Y(n100) );
  INVX2M U143 ( .A(n53), .Y(n22) );
  INVX2M U144 ( .A(n54), .Y(n21) );
  INVX2M U145 ( .A(n37), .Y(n20) );
  INVX2M U146 ( .A(n82), .Y(n8) );
  INVX2M U147 ( .A(n117), .Y(n6) );
  INVX2M U148 ( .A(n105), .Y(n1) );
  NOR3BX2M U149 ( .AN(n125), .B(n27), .C(ALU_FUN[0]), .Y(n41) );
  OAI222X1M U150 ( .A0(n6), .A1(n53), .B0(n4), .B1(n54), .C0(n130), .C1(n55), 
        .Y(n65) );
  OAI222X1M U151 ( .A0(n52), .A1(n53), .B0(n2), .B1(n54), .C0(n132), .C1(n55), 
        .Y(n48) );
  OAI222X1M U152 ( .A0(n82), .A1(n53), .B0(n54), .B1(n7), .C0(n128), .C1(n55), 
        .Y(n78) );
  NOR3X2M U153 ( .A(n25), .B(ALU_FUN[0]), .C(n27), .Y(n88) );
  AOI31X2M U154 ( .A0(n30), .A1(n31), .A2(n32), .B0(n29), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U155 ( .A0(N98), .A1(n43), .B0(N106), .B1(n44), .Y(n30) );
  AOI222X1M U156 ( .A0(N114), .A1(n41), .B0(N122), .B1(n42), .C0(n134), .C1(
        n133), .Y(n31) );
  AOI221XLM U157 ( .A0(n33), .A1(n22), .B0(n23), .B1(n2), .C0(n34), .Y(n32) );
  AOI31X2M U158 ( .A0(n56), .A1(n57), .A2(n58), .B0(n29), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U159 ( .A0(N96), .A1(n43), .B0(N104), .B1(n44), .Y(n56) );
  AOI222X1M U160 ( .A0(N112), .A1(n41), .B0(N120), .B1(n42), .C0(n131), .C1(
        n134), .Y(n57) );
  AOI221XLM U161 ( .A0(n21), .A1(n132), .B0(n23), .B1(n4), .C0(n59), .Y(n58)
         );
  AOI31X2M U162 ( .A0(n92), .A1(n93), .A2(n94), .B0(n29), .Y(ALU_OUT_Comb[0])
         );
  AOI22X1M U163 ( .A0(N91), .A1(n43), .B0(N99), .B1(n44), .Y(n92) );
  AOI222X1M U164 ( .A0(N107), .A1(n41), .B0(N115), .B1(n42), .C0(n126), .C1(
        n134), .Y(n93) );
  AOI211X2M U165 ( .A0(n23), .A1(n11), .B0(n95), .C0(n96), .Y(n94) );
  AOI31X2M U166 ( .A0(n45), .A1(n46), .A2(n47), .B0(n29), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U167 ( .A0(N97), .A1(n43), .B0(N105), .B1(n44), .Y(n45) );
  AOI222X1M U168 ( .A0(N113), .A1(n41), .B0(N121), .B1(n42), .C0(n134), .C1(
        n132), .Y(n46) );
  AOI211X2M U169 ( .A0(n131), .A1(n20), .B0(n48), .C0(n49), .Y(n47) );
  NOR2X2M U170 ( .A(n98), .B(ALU_FUN[3]), .Y(n44) );
  OAI22X1M U171 ( .A0(n54), .A1(n10), .B0(n97), .B1(n19), .Y(n96) );
  AOI221XLM U172 ( .A0(n22), .A1(n11), .B0(n126), .B1(n39), .C0(n134), .Y(n97)
         );
  NAND4X2M U173 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .C(ALU_FUN[2]), .D(n27), .Y(
        n54) );
  NAND2X2M U174 ( .A(n88), .B(ALU_FUN[3]), .Y(n37) );
  AOI31X2M U175 ( .A0(n69), .A1(n70), .A2(n71), .B0(n29), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U176 ( .A0(N94), .A1(n43), .B0(N102), .B1(n44), .Y(n69) );
  AOI222X1M U177 ( .A0(N110), .A1(n41), .B0(N118), .B1(n42), .C0(n129), .C1(
        n134), .Y(n70) );
  AOI221XLM U178 ( .A0(n130), .A1(n21), .B0(n23), .B1(n7), .C0(n72), .Y(n71)
         );
  AOI31X2M U179 ( .A0(n83), .A1(n84), .A2(n85), .B0(n29), .Y(ALU_OUT_Comb[1])
         );
  AOI22X1M U180 ( .A0(N92), .A1(n43), .B0(N100), .B1(n44), .Y(n83) );
  AOI222X1M U181 ( .A0(N108), .A1(n41), .B0(N116), .B1(n42), .C0(n127), .C1(
        n134), .Y(n84) );
  AOI211X2M U182 ( .A0(n23), .A1(n10), .B0(n86), .C0(n87), .Y(n85) );
  AOI31X2M U183 ( .A0(n75), .A1(n76), .A2(n77), .B0(n29), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U184 ( .A0(N93), .A1(n43), .B0(N101), .B1(n44), .Y(n75) );
  AOI222X1M U185 ( .A0(N109), .A1(n41), .B0(N117), .B1(n42), .C0(n128), .C1(
        n134), .Y(n76) );
  AOI211X2M U186 ( .A0(n127), .A1(n20), .B0(n78), .C0(n79), .Y(n77) );
  AOI31X2M U187 ( .A0(n62), .A1(n63), .A2(n64), .B0(n29), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U188 ( .A0(N95), .A1(n43), .B0(N103), .B1(n44), .Y(n62) );
  AOI222X1M U189 ( .A0(N111), .A1(n41), .B0(N119), .B1(n42), .C0(n130), .C1(
        n134), .Y(n63) );
  AOI211X2M U190 ( .A0(n129), .A1(n20), .B0(n65), .C0(n66), .Y(n64) );
  NAND3X2M U191 ( .A(n27), .B(n25), .C(ALU_FUN[0]), .Y(n98) );
  NAND3X2M U192 ( .A(ALU_FUN[3]), .B(n25), .C(n26), .Y(n53) );
  INVX2M U193 ( .A(ALU_FUN[1]), .Y(n27) );
  NAND4X2M U194 ( .A(n26), .B(ALU_FUN[3]), .C(ALU_FUN[2]), .D(n103), .Y(n91)
         );
  NAND2X2M U195 ( .A(ALU_FUN[2]), .B(n24), .Y(n99) );
  NOR2X2M U196 ( .A(ALU_FUN[2]), .B(ALU_FUN[3]), .Y(n125) );
  INVX2M U197 ( .A(ALU_FUN[2]), .Y(n25) );
  BUFX2M U198 ( .A(n40), .Y(n134) );
  NOR3X2M U199 ( .A(n99), .B(ALU_FUN[1]), .C(n28), .Y(n40) );
  INVX2M U200 ( .A(ALU_FUN[3]), .Y(n24) );
  INVX2M U201 ( .A(ALU_FUN[0]), .Y(n28) );
  XNOR2X2M U202 ( .A(n17), .B(n9), .Y(n82) );
  OAI21BX1M U203 ( .A0(n106), .A1(n107), .B0N(n33), .Y(n105) );
  NOR2X2M U204 ( .A(n133), .B(n12), .Y(n107) );
  AOI22X1M U205 ( .A0(n52), .A1(n108), .B0(n132), .B1(n13), .Y(n106) );
  OAI21X2M U206 ( .A0(n109), .A1(n110), .B0(n111), .Y(n108) );
  AOI31X2M U207 ( .A0(n127), .A1(n19), .A2(n126), .B0(n18), .Y(n115) );
  AOI2B1X1M U208 ( .A1N(n121), .A0(n129), .B0(n16), .Y(n122) );
  AOI21X2M U209 ( .A0(n126), .A1(n19), .B0(n127), .Y(n116) );
  XNOR2X2M U210 ( .A(n15), .B(n130), .Y(n117) );
  NOR2X2M U211 ( .A(n131), .B(n14), .Y(n110) );
  INVX2M U212 ( .A(n126), .Y(n11) );
  INVX2M U213 ( .A(n128), .Y(n9) );
  INVX2M U214 ( .A(n127), .Y(n10) );
  NAND2X2M U215 ( .A(n131), .B(n14), .Y(n111) );
  INVX2M U216 ( .A(n133), .Y(n2) );
  INVX2M U217 ( .A(n129), .Y(n7) );
  CLKXOR2X2M U218 ( .A(n13), .B(n132), .Y(n52) );
  INVX2M U219 ( .A(n131), .Y(n4) );
  INVX2M U220 ( .A(n132), .Y(n3) );
  INVX2M U221 ( .A(n130), .Y(n5) );
  OAI222X1M U222 ( .A0(n60), .A1(n14), .B0(B[5]), .B1(n61), .C0(n37), .C1(n5), 
        .Y(n59) );
  AOI221XLM U223 ( .A0(n22), .A1(n4), .B0(n131), .B1(n39), .C0(n134), .Y(n60)
         );
  AOI221XLM U224 ( .A0(n131), .A1(n22), .B0(n38), .B1(n4), .C0(n23), .Y(n61)
         );
  OAI222X1M U225 ( .A0(n35), .A1(n12), .B0(B[7]), .B1(n36), .C0(n37), .C1(n3), 
        .Y(n34) );
  AOI221XLM U226 ( .A0(n22), .A1(n2), .B0(n133), .B1(n39), .C0(n134), .Y(n35)
         );
  AOI21X2M U227 ( .A0(n38), .A1(n2), .B0(n23), .Y(n36) );
  OAI221X1M U228 ( .A0(B[1]), .A1(n89), .B0(n90), .B1(n18), .C0(n91), .Y(n86)
         );
  AOI221XLM U229 ( .A0(n22), .A1(n10), .B0(n127), .B1(n39), .C0(n134), .Y(n90)
         );
  AOI221XLM U230 ( .A0(n127), .A1(n22), .B0(n38), .B1(n10), .C0(n23), .Y(n89)
         );
  OAI222X1M U231 ( .A0(n73), .A1(n16), .B0(B[3]), .B1(n74), .C0(n37), .C1(n9), 
        .Y(n72) );
  AOI221XLM U232 ( .A0(n22), .A1(n7), .B0(n129), .B1(n39), .C0(n134), .Y(n73)
         );
  AOI221XLM U233 ( .A0(n129), .A1(n22), .B0(n38), .B1(n7), .C0(n23), .Y(n74)
         );
  OAI22X1M U234 ( .A0(n80), .A1(n17), .B0(B[2]), .B1(n81), .Y(n79) );
  AOI21X2M U235 ( .A0(n128), .A1(n39), .B0(n134), .Y(n80) );
  AOI21X2M U236 ( .A0(n38), .A1(n9), .B0(n23), .Y(n81) );
  OAI22X1M U237 ( .A0(n67), .A1(n15), .B0(B[4]), .B1(n68), .Y(n66) );
  AOI21X2M U238 ( .A0(n130), .A1(n39), .B0(n134), .Y(n67) );
  AOI21X2M U239 ( .A0(n38), .A1(n5), .B0(n23), .Y(n68) );
  OAI211X2M U240 ( .A0(B[0]), .A1(n101), .B0(n102), .C0(n91), .Y(n95) );
  NAND4X2M U241 ( .A(ALU_FUN[3]), .B(ALU_FUN[1]), .C(n104), .D(n25), .Y(n102)
         );
  AOI221XLM U242 ( .A0(n126), .A1(n22), .B0(n38), .B1(n11), .C0(n23), .Y(n101)
         );
  OAI32X1M U243 ( .A0(n103), .A1(ALU_FUN[0]), .A2(n105), .B0(n1), .B1(n28), 
        .Y(n104) );
  OAI22X1M U244 ( .A0(n50), .A1(n13), .B0(B[6]), .B1(n51), .Y(n49) );
  AOI21X2M U245 ( .A0(n132), .A1(n39), .B0(n134), .Y(n50) );
  AOI21X2M U246 ( .A0(n38), .A1(n3), .B0(n23), .Y(n51) );
  INVX2M U247 ( .A(Enable), .Y(n29) );
  BUFX2M U248 ( .A(A[5]), .Y(n131) );
  BUFX2M U249 ( .A(A[6]), .Y(n132) );
  BUFX2M U250 ( .A(A[7]), .Y(n133) );
  BUFX2M U251 ( .A(A[4]), .Y(n130) );
  BUFX2M U252 ( .A(A[3]), .Y(n129) );
  BUFX2M U253 ( .A(A[2]), .Y(n128) );
  BUFX2M U254 ( .A(A[1]), .Y(n127) );
  OAI32X1M U255 ( .A0(n8), .A1(n123), .A2(n124), .B0(n128), .B1(n17), .Y(n121)
         );
  AOI21X2M U256 ( .A0(B[0]), .A1(n11), .B0(n10), .Y(n124) );
  AOI31X2M U257 ( .A0(n11), .A1(n10), .A2(B[0]), .B0(B[1]), .Y(n123) );
  OAI22X1M U258 ( .A0(n133), .A1(n12), .B0(n33), .B1(n118), .Y(n103) );
  AOI32X1M U259 ( .A0(n111), .A1(n119), .A2(n52), .B0(B[6]), .B1(n3), .Y(n118)
         );
  OAI222X1M U260 ( .A0(n130), .A1(n15), .B0(n120), .B1(n117), .C0(n131), .C1(
        n14), .Y(n119) );
  AOI21X2M U261 ( .A0(n121), .A1(n7), .B0(n122), .Y(n120) );
  INVX2M U262 ( .A(B[0]), .Y(n19) );
  INVX2M U263 ( .A(B[2]), .Y(n17) );
  INVX2M U264 ( .A(B[1]), .Y(n18) );
  BUFX2M U265 ( .A(A[0]), .Y(n126) );
  AOI22X1M U266 ( .A0(n6), .A1(n112), .B0(n130), .B1(n15), .Y(n109) );
  OAI2BB1X2M U267 ( .A0N(n113), .A1N(n129), .B0(n114), .Y(n112) );
  OAI21X2M U268 ( .A0(n129), .A1(n113), .B0(n16), .Y(n114) );
  OAI32X1M U269 ( .A0(n8), .A1(n115), .A2(n116), .B0(B[2]), .B1(n9), .Y(n113)
         );
  INVX2M U270 ( .A(B[4]), .Y(n15) );
  INVX2M U271 ( .A(B[5]), .Y(n14) );
  INVX2M U272 ( .A(B[3]), .Y(n16) );
  NOR2X2M U273 ( .A(n2), .B(B[7]), .Y(n33) );
  INVX2M U274 ( .A(B[6]), .Y(n13) );
  INVX2M U275 ( .A(B[7]), .Y(n12) );
endmodule


module ClkDiv ( i_ref_clk, i_rst, i_clk_en, o_div_clk );
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   i_clk_en_reg, div_clk, n1;

  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk), .S0(i_clk_en_reg), .Y(o_div_clk) );
  DFFRQX2M i_clk_en_reg_reg ( .D(i_clk_en), .CK(i_ref_clk), .RN(i_rst), .Q(
        i_clk_en_reg) );
  DFFRX1M div_clk_reg ( .D(n1), .CK(i_ref_clk), .RN(i_rst), .Q(div_clk), .QN(
        n1) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX4M U0 ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module System_Top ( CLKG_EN, CLK, RST, ALU_FUN, ALU_Enable, WrEn, RdEn, 
        Address, WrData, RdData, ALU_VLD, ALU_OUT );
  input [3:0] ALU_FUN;
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] ALU_OUT;
  input CLKG_EN, CLK, RST, ALU_Enable, WrEn, RdEn;
  output ALU_VLD;
  wire   REG_CLK, CLKDIV_EN, ALU_CLK;
  wire   [7:0] ALU_A;
  wire   [7:0] ALU_B;

  RegFile U0_RegFile ( .CLK(REG_CLK), .RST(RST), .WrEn(WrEn), .RdEn(RdEn), 
        .Address(Address), .WrData(WrData), .RdData(RdData), .REG0(ALU_A), 
        .REG1(ALU_B), .REG2(CLKDIV_EN) );
  ALU U0_ALU ( .A(ALU_A), .B(ALU_B), .ALU_FUN(ALU_FUN), .CLK(ALU_CLK), .RST(
        RST), .Enable(ALU_Enable), .ALU_OUT(ALU_OUT), .OUT_VALID(ALU_VLD) );
  ClkDiv U0_ClkDiv ( .i_ref_clk(CLK), .i_rst(RST), .i_clk_en(CLKDIV_EN), 
        .o_div_clk(REG_CLK) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(CLKG_EN), .CLK(CLK), .GATED_CLK(ALU_CLK) );
endmodule

