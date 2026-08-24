/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Fri Aug 21 02:27:20 2026
/////////////////////////////////////////////////////////////


module ALU_DW01_addsub_0 ( A, B, CI, ADD_SUB, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI, ADD_SUB;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46;

  XOR3XLM U1 ( .A(n1), .B(A[9]), .C(n2), .Y(SUM[9]) );
  XOR3XLM U2 ( .A(A[8]), .B(n3), .C(n4), .Y(SUM[8]) );
  XOR3XLM U3 ( .A(A[7]), .B(n5), .C(n6), .Y(SUM[7]) );
  XOR3XLM U4 ( .A(A[6]), .B(n7), .C(n8), .Y(SUM[6]) );
  XOR3XLM U5 ( .A(A[5]), .B(n9), .C(n10), .Y(SUM[5]) );
  XOR3XLM U6 ( .A(A[4]), .B(n11), .C(n12), .Y(SUM[4]) );
  XOR3XLM U7 ( .A(A[3]), .B(n13), .C(n14), .Y(SUM[3]) );
  XOR3XLM U8 ( .A(A[2]), .B(n15), .C(n16), .Y(SUM[2]) );
  XOR3XLM U9 ( .A(A[1]), .B(n17), .C(n18), .Y(SUM[1]) );
  XOR3XLM U10 ( .A(ADD_SUB), .B(n19), .C(n20), .Y(SUM[15]) );
  AO2B2X1M U11 ( .B0(n21), .B1(n22), .A0(A[14]), .A1N(n23), .Y(n20) );
  NOR2X1M U12 ( .A(n22), .B(n21), .Y(n23) );
  CLKXOR2X2M U13 ( .A(B[15]), .B(A[15]), .Y(n19) );
  XOR3XLM U14 ( .A(A[14]), .B(n22), .C(n21), .Y(SUM[14]) );
  AO22X1M U15 ( .A0(n24), .A1(n25), .B0(n26), .B1(A[13]), .Y(n21) );
  OR2X1M U16 ( .A(n25), .B(n24), .Y(n26) );
  CLKXOR2X2M U17 ( .A(ADD_SUB), .B(B[14]), .Y(n22) );
  XOR3XLM U18 ( .A(A[13]), .B(n25), .C(n24), .Y(SUM[13]) );
  AO22X1M U19 ( .A0(n27), .A1(n28), .B0(n29), .B1(A[12]), .Y(n24) );
  OR2X1M U20 ( .A(n28), .B(n27), .Y(n29) );
  CLKXOR2X2M U21 ( .A(ADD_SUB), .B(B[13]), .Y(n25) );
  XOR3XLM U22 ( .A(A[12]), .B(n28), .C(n27), .Y(SUM[12]) );
  OAI2BB1X1M U23 ( .A0N(n30), .A1N(n31), .B0(n32), .Y(n27) );
  OAI21X1M U24 ( .A0(n31), .A1(n30), .B0(A[11]), .Y(n32) );
  CLKXOR2X2M U25 ( .A(ADD_SUB), .B(B[12]), .Y(n28) );
  XOR3XLM U26 ( .A(A[11]), .B(n31), .C(n30), .Y(SUM[11]) );
  AO22X1M U27 ( .A0(n33), .A1(n34), .B0(n35), .B1(A[10]), .Y(n30) );
  OR2X1M U28 ( .A(n34), .B(n33), .Y(n35) );
  CLKXOR2X2M U29 ( .A(ADD_SUB), .B(B[11]), .Y(n31) );
  XOR3XLM U30 ( .A(A[10]), .B(n34), .C(n33), .Y(SUM[10]) );
  OAI2B2X1M U31 ( .A1N(A[9]), .A0(n36), .B0(n1), .B1(n2), .Y(n33) );
  AND2X1M U32 ( .A(n2), .B(n1), .Y(n36) );
  XNOR2X1M U33 ( .A(ADD_SUB), .B(B[9]), .Y(n1) );
  OAI21X1M U34 ( .A0(n3), .A1(n4), .B0(n37), .Y(n2) );
  AO21XLM U35 ( .A0(n4), .A1(n3), .B0(A[8]), .Y(n37) );
  OAI2BB1X1M U36 ( .A0N(n6), .A1N(n5), .B0(n38), .Y(n4) );
  OAI21X1M U37 ( .A0(n5), .A1(n6), .B0(A[7]), .Y(n38) );
  CLKXOR2X2M U38 ( .A(ADD_SUB), .B(B[7]), .Y(n5) );
  AO22X1M U39 ( .A0(n8), .A1(n7), .B0(n39), .B1(A[6]), .Y(n6) );
  OR2X1M U40 ( .A(n7), .B(n8), .Y(n39) );
  CLKXOR2X2M U41 ( .A(ADD_SUB), .B(B[6]), .Y(n7) );
  AO22X1M U42 ( .A0(n10), .A1(n9), .B0(n40), .B1(A[5]), .Y(n8) );
  OR2X1M U43 ( .A(n9), .B(n10), .Y(n40) );
  CLKXOR2X2M U44 ( .A(ADD_SUB), .B(B[5]), .Y(n9) );
  OAI2BB1X1M U45 ( .A0N(n12), .A1N(n11), .B0(n41), .Y(n10) );
  OAI21X1M U46 ( .A0(n11), .A1(n12), .B0(A[4]), .Y(n41) );
  CLKXOR2X2M U47 ( .A(ADD_SUB), .B(B[4]), .Y(n11) );
  AO22X1M U48 ( .A0(n14), .A1(n13), .B0(n42), .B1(A[3]), .Y(n12) );
  OR2X1M U49 ( .A(n13), .B(n14), .Y(n42) );
  CLKXOR2X2M U50 ( .A(ADD_SUB), .B(B[3]), .Y(n13) );
  OAI2BB1X1M U51 ( .A0N(n16), .A1N(n15), .B0(n43), .Y(n14) );
  OAI21X1M U52 ( .A0(n15), .A1(n16), .B0(A[2]), .Y(n43) );
  CLKXOR2X2M U53 ( .A(ADD_SUB), .B(B[2]), .Y(n15) );
  OAI2BB1X1M U54 ( .A0N(n18), .A1N(n17), .B0(n44), .Y(n16) );
  OAI21X1M U55 ( .A0(n17), .A1(n18), .B0(A[1]), .Y(n44) );
  CLKXOR2X2M U56 ( .A(ADD_SUB), .B(B[1]), .Y(n17) );
  AO22X1M U57 ( .A0(n45), .A1(ADD_SUB), .B0(n46), .B1(A[0]), .Y(n18) );
  OR2X1M U58 ( .A(ADD_SUB), .B(n45), .Y(n46) );
  CLKXOR2X2M U59 ( .A(ADD_SUB), .B(B[8]), .Y(n3) );
  CLKXOR2X2M U60 ( .A(ADD_SUB), .B(B[10]), .Y(n34) );
  XOR3XLM U61 ( .A(A[0]), .B(ADD_SUB), .C(n45), .Y(SUM[0]) );
  CLKXOR2X2M U62 ( .A(ADD_SUB), .B(B[0]), .Y(n45) );
endmodule


module ALU_DW01_cmp6_0 ( A, B, TC, LT, GT, EQ, LE, GE, NE );
  input [15:0] A;
  input [15:0] B;
  input TC;
  output LT, GT, EQ, LE, GE, NE;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68;

  NOR2X1M U1 ( .A(LT), .B(GT), .Y(EQ) );
  OAI2BB1X1M U2 ( .A0N(n1), .A1N(A[15]), .B0(n2), .Y(GT) );
  OAI21BX1M U3 ( .A0(A[15]), .A1(n1), .B0N(B[15]), .Y(n2) );
  OAI32X1M U4 ( .A0(n3), .A1(n4), .A2(n5), .B0(B[14]), .B1(n6), .Y(n1) );
  AOI221XLM U5 ( .A0(A[12]), .A1(n7), .B0(n8), .B1(n9), .C0(n10), .Y(n5) );
  CLKINVX1M U6 ( .A(n11), .Y(n9) );
  AOI2B1X1M U7 ( .A1N(n12), .A0(n13), .B0(n14), .Y(n11) );
  AOI32X1M U8 ( .A0(n15), .A1(n16), .A2(n17), .B0(A[10]), .B1(n18), .Y(n12) );
  OAI21X1M U9 ( .A0(B[9]), .A1(n19), .B0(n20), .Y(n15) );
  AOI32X1M U10 ( .A0(n21), .A1(n22), .A2(n23), .B0(A[8]), .B1(n24), .Y(n20) );
  CLKINVX1M U11 ( .A(B[8]), .Y(n24) );
  OAI21X1M U12 ( .A0(B[7]), .A1(n25), .B0(n26), .Y(n23) );
  AOI32X1M U13 ( .A0(n27), .A1(n28), .A2(n29), .B0(A[6]), .B1(n30), .Y(n26) );
  OAI222X1M U14 ( .A0(B[4]), .A1(n31), .B0(n32), .B1(n33), .C0(B[5]), .C1(n34), 
        .Y(n27) );
  AOI21X1M U15 ( .A0(n35), .A1(n36), .B0(n37), .Y(n32) );
  OAI31X1M U16 ( .A0(n38), .A1(n39), .A2(n40), .B0(n41), .Y(n35) );
  AOI31X1M U17 ( .A0(A[1]), .A1(n42), .A2(A[0]), .B0(n43), .Y(n40) );
  CLKINVX1M U18 ( .A(B[1]), .Y(n43) );
  AOI21X1M U19 ( .A0(A[0]), .A1(n42), .B0(A[1]), .Y(n38) );
  CLKINVX1M U20 ( .A(B[12]), .Y(n7) );
  OAI2BB1X1M U21 ( .A0N(n44), .A1N(n45), .B0(n46), .Y(LT) );
  OAI21X1M U22 ( .A0(n45), .A1(n44), .B0(B[15]), .Y(n46) );
  OAI32X1M U23 ( .A0(n3), .A1(n10), .A2(n47), .B0(A[14]), .B1(n48), .Y(n45) );
  CLKINVX1M U24 ( .A(B[14]), .Y(n48) );
  AOI221XLM U25 ( .A0(B[12]), .A1(n49), .B0(n8), .B1(n50), .C0(n4), .Y(n47) );
  NOR2BX1M U26 ( .AN(B[13]), .B(A[13]), .Y(n4) );
  OAI21X1M U27 ( .A0(n14), .A1(n51), .B0(n13), .Y(n50) );
  CLKNAND2X2M U28 ( .A(B[11]), .B(n52), .Y(n13) );
  AOI21X1M U29 ( .A0(n53), .A1(n17), .B0(n54), .Y(n51) );
  AOI21X1M U30 ( .A0(n18), .A1(A[10]), .B0(n54), .Y(n17) );
  NOR2X1M U31 ( .A(n18), .B(A[10]), .Y(n54) );
  CLKINVX1M U32 ( .A(B[10]), .Y(n18) );
  AOI32X1M U33 ( .A0(n22), .A1(n16), .A2(n55), .B0(A[9]), .B1(n56), .Y(n53) );
  CLKINVX1M U34 ( .A(B[9]), .Y(n56) );
  OAI221X1M U35 ( .A0(B[7]), .A1(n25), .B0(B[8]), .B1(n57), .C0(n58), .Y(n55)
         );
  OAI211X1M U36 ( .A0(A[6]), .A1(n30), .B0(n59), .C0(n21), .Y(n58) );
  CLKNAND2X2M U37 ( .A(B[7]), .B(n25), .Y(n21) );
  OAI2B1X1M U38 ( .A1N(n28), .A0(n60), .B0(n29), .Y(n59) );
  XNOR2X1M U39 ( .A(A[6]), .B(B[6]), .Y(n29) );
  AOI2B1X1M U40 ( .A1N(B[5]), .A0(A[5]), .B0(n61), .Y(n60) );
  AOI32X1M U41 ( .A0(n62), .A1(n63), .A2(n64), .B0(B[4]), .B1(n31), .Y(n61) );
  CLKINVX1M U42 ( .A(A[4]), .Y(n31) );
  CLKINVX1M U43 ( .A(n33), .Y(n64) );
  CLKXOR2X2M U44 ( .A(A[4]), .B(B[4]), .Y(n33) );
  NAND3BX1M U45 ( .AN(n39), .B(n65), .C(n36), .Y(n63) );
  CLKNAND2X2M U46 ( .A(B[3]), .B(n66), .Y(n36) );
  OAI211X1M U47 ( .A0(B[1]), .A1(n67), .B0(n41), .C0(n68), .Y(n65) );
  OAI21X1M U48 ( .A0(A[0]), .A1(n42), .B0(A[1]), .Y(n68) );
  NAND2BX1M U49 ( .AN(B[2]), .B(A[2]), .Y(n41) );
  NOR3X1M U50 ( .A(n42), .B(A[1]), .C(A[0]), .Y(n67) );
  CLKINVX1M U51 ( .A(B[0]), .Y(n42) );
  NOR2BX1M U52 ( .AN(B[2]), .B(A[2]), .Y(n39) );
  CLKINVX1M U53 ( .A(n37), .Y(n62) );
  NOR2X1M U54 ( .A(n66), .B(B[3]), .Y(n37) );
  CLKINVX1M U55 ( .A(A[3]), .Y(n66) );
  CLKNAND2X2M U56 ( .A(B[5]), .B(n34), .Y(n28) );
  CLKINVX1M U57 ( .A(A[5]), .Y(n34) );
  CLKINVX1M U58 ( .A(B[6]), .Y(n30) );
  CLKINVX1M U59 ( .A(A[7]), .Y(n25) );
  CLKNAND2X2M U60 ( .A(B[9]), .B(n19), .Y(n16) );
  CLKINVX1M U61 ( .A(A[9]), .Y(n19) );
  CLKNAND2X2M U62 ( .A(B[8]), .B(n57), .Y(n22) );
  CLKINVX1M U63 ( .A(A[8]), .Y(n57) );
  NOR2X1M U64 ( .A(n52), .B(B[11]), .Y(n14) );
  CLKINVX1M U65 ( .A(A[11]), .Y(n52) );
  XNOR2X1M U66 ( .A(A[12]), .B(B[12]), .Y(n8) );
  CLKINVX1M U67 ( .A(A[12]), .Y(n49) );
  NOR2BX1M U68 ( .AN(A[13]), .B(B[13]), .Y(n10) );
  XNOR2X1M U69 ( .A(n6), .B(B[14]), .Y(n3) );
  CLKINVX1M U70 ( .A(A[14]), .Y(n6) );
  CLKINVX1M U71 ( .A(A[15]), .Y(n44) );
endmodule


module ALU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [15:0] a;
  input [15:0] b;
  output [15:0] quotient;
  output [15:0] remainder;
  output divide_by_0;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507,
         n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540,
         n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, n551,
         n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630, n631, n632, n633, n634, n635, n636, n637, n638, n639,
         n640, n641, n642, n643, n644, n645, n646, n647, n648;

  CLKINVX1M U1 ( .A(n1), .Y(quotient[9]) );
  CLKINVX1M U2 ( .A(n2), .Y(quotient[6]) );
  CLKINVX1M U3 ( .A(n3), .Y(quotient[4]) );
  CLKINVX1M U4 ( .A(n4), .Y(quotient[15]) );
  OAI21X1M U5 ( .A0(b[15]), .A1(n5), .B0(n6), .Y(quotient[0]) );
  OAI2BB1X1M U6 ( .A0N(n5), .A1N(b[15]), .B0(n7), .Y(n6) );
  XNOR2X1M U7 ( .A(n8), .B(n9), .Y(n7) );
  CLKNAND2X2M U8 ( .A(quotient[1]), .B(n10), .Y(n8) );
  CLKXOR2X2M U9 ( .A(n11), .B(n12), .Y(n10) );
  OAI21X1M U10 ( .A0(n13), .A1(n11), .B0(n14), .Y(n5) );
  OAI2BB1X1M U11 ( .A0N(n13), .A1N(n11), .B0(n15), .Y(n14) );
  CLKXOR2X2M U12 ( .A(n16), .B(n17), .Y(n15) );
  CLKNAND2X2M U13 ( .A(quotient[1]), .B(n18), .Y(n16) );
  CLKXOR2X2M U14 ( .A(n19), .B(n20), .Y(n18) );
  OAI2BB1X1M U15 ( .A0N(n19), .A1N(n21), .B0(n22), .Y(n13) );
  OAI21X1M U16 ( .A0(n19), .A1(n21), .B0(n23), .Y(n22) );
  CLKXOR2X2M U17 ( .A(n24), .B(n25), .Y(n23) );
  CLKNAND2X2M U18 ( .A(quotient[1]), .B(n26), .Y(n24) );
  CLKXOR2X2M U19 ( .A(b[12]), .B(n27), .Y(n26) );
  OAI21X1M U20 ( .A0(n28), .A1(n29), .B0(n30), .Y(n21) );
  AO21XLM U21 ( .A0(n29), .A1(n28), .B0(b[12]), .Y(n30) );
  OAI2BB1X1M U22 ( .A0N(n31), .A1N(b[11]), .B0(n32), .Y(n29) );
  OAI21X1M U23 ( .A0(b[11]), .A1(n31), .B0(n33), .Y(n32) );
  CLKXOR2X2M U24 ( .A(n34), .B(n35), .Y(n33) );
  CLKNAND2X2M U25 ( .A(quotient[1]), .B(n36), .Y(n34) );
  CLKXOR2X2M U26 ( .A(n37), .B(n38), .Y(n36) );
  OAI22X1M U27 ( .A0(n37), .A1(n39), .B0(n40), .B1(n41), .Y(n31) );
  CLKXOR2X2M U28 ( .A(n42), .B(n43), .Y(n41) );
  CLKNAND2X2M U29 ( .A(quotient[1]), .B(n44), .Y(n42) );
  CLKXOR2X2M U30 ( .A(b[9]), .B(n45), .Y(n44) );
  NOR2BX1M U31 ( .AN(n39), .B(b[10]), .Y(n40) );
  OAI21X1M U32 ( .A0(n46), .A1(n47), .B0(n48), .Y(n39) );
  AO21XLM U33 ( .A0(n47), .A1(n46), .B0(b[9]), .Y(n48) );
  OAI2BB2X1M U34 ( .B0(n49), .B1(n50), .A0N(n51), .A1N(b[8]), .Y(n47) );
  CLKXOR2X2M U35 ( .A(n52), .B(n53), .Y(n50) );
  CLKNAND2X2M U36 ( .A(quotient[1]), .B(n54), .Y(n52) );
  CLKXOR2X2M U37 ( .A(n55), .B(n56), .Y(n54) );
  NOR2X1M U38 ( .A(b[8]), .B(n51), .Y(n49) );
  OAI21X1M U39 ( .A0(n55), .A1(n57), .B0(n58), .Y(n51) );
  OAI2BB1X1M U40 ( .A0N(n57), .A1N(n55), .B0(n59), .Y(n58) );
  CLKXOR2X2M U41 ( .A(n60), .B(n61), .Y(n59) );
  CLKNAND2X2M U42 ( .A(quotient[1]), .B(n62), .Y(n60) );
  CLKXOR2X2M U43 ( .A(b[6]), .B(n63), .Y(n62) );
  OAI21X1M U44 ( .A0(n64), .A1(n65), .B0(n66), .Y(n57) );
  AO21XLM U45 ( .A0(n65), .A1(n64), .B0(b[6]), .Y(n66) );
  OAI2BB1X1M U46 ( .A0N(n67), .A1N(b[5]), .B0(n68), .Y(n65) );
  OAI21X1M U47 ( .A0(b[5]), .A1(n67), .B0(n69), .Y(n68) );
  CLKXOR2X2M U48 ( .A(n70), .B(n71), .Y(n69) );
  CLKNAND2X2M U49 ( .A(quotient[1]), .B(n72), .Y(n70) );
  CLKXOR2X2M U50 ( .A(n73), .B(n74), .Y(n72) );
  OAI21X1M U51 ( .A0(n73), .A1(n75), .B0(n76), .Y(n67) );
  OAI2BB1X1M U52 ( .A0N(n75), .A1N(n73), .B0(n77), .Y(n76) );
  CLKXOR2X2M U53 ( .A(n78), .B(n79), .Y(n77) );
  CLKNAND2X2M U54 ( .A(quotient[1]), .B(n80), .Y(n78) );
  CLKXOR2X2M U55 ( .A(b[3]), .B(n81), .Y(n80) );
  OAI22X1M U56 ( .A0(n82), .A1(n83), .B0(n84), .B1(b[3]), .Y(n75) );
  AND2X1M U57 ( .A(n83), .B(n82), .Y(n84) );
  OAI2BB1X1M U58 ( .A0N(n85), .A1N(b[2]), .B0(n86), .Y(n83) );
  OAI21X1M U59 ( .A0(b[2]), .A1(n85), .B0(n87), .Y(n86) );
  CLKXOR2X2M U60 ( .A(n88), .B(n89), .Y(n87) );
  CLKNAND2X2M U61 ( .A(quotient[1]), .B(n90), .Y(n89) );
  CLKXOR2X2M U62 ( .A(n91), .B(n92), .Y(n90) );
  OAI32X1M U63 ( .A0(n93), .A1(a[0]), .A2(n94), .B0(n95), .B1(n91), .Y(n85) );
  CLKINVX1M U64 ( .A(n96), .Y(n95) );
  NOR2X1M U65 ( .A(b[1]), .B(n96), .Y(n94) );
  OAI31X1M U66 ( .A0(n97), .A1(n98), .A2(n93), .B0(n99), .Y(n96) );
  AO21XLM U67 ( .A0(n98), .A1(quotient[1]), .B0(a[1]), .Y(n99) );
  XNOR2X1M U68 ( .A(n100), .B(n101), .Y(n82) );
  CLKNAND2X2M U69 ( .A(quotient[1]), .B(n102), .Y(n100) );
  CLKXOR2X2M U70 ( .A(n103), .B(n104), .Y(n102) );
  XNOR2X1M U71 ( .A(n105), .B(n106), .Y(n64) );
  CLKNAND2X2M U72 ( .A(quotient[1]), .B(n107), .Y(n105) );
  CLKXOR2X2M U73 ( .A(b[5]), .B(n108), .Y(n107) );
  CLKXOR2X2M U74 ( .A(n109), .B(n110), .Y(n46) );
  CLKNAND2X2M U75 ( .A(quotient[1]), .B(n111), .Y(n109) );
  CLKXOR2X2M U76 ( .A(n112), .B(n113), .Y(n111) );
  XNOR2X1M U77 ( .A(n114), .B(n115), .Y(n28) );
  CLKNAND2X2M U78 ( .A(quotient[1]), .B(n116), .Y(n114) );
  CLKXOR2X2M U79 ( .A(b[11]), .B(n117), .Y(n116) );
  CLKINVX1M U80 ( .A(n97), .Y(quotient[1]) );
  CLKNAND2X2M U81 ( .A(n118), .B(n119), .Y(n97) );
  OAI2BB2X1M U82 ( .B0(b[14]), .B1(n120), .A0N(n12), .A1N(n9), .Y(n118) );
  NOR2X1M U83 ( .A(n9), .B(n12), .Y(n120) );
  OAI2BB2X1M U84 ( .B0(b[13]), .B1(n121), .A0N(n20), .A1N(n17), .Y(n12) );
  NOR2X1M U85 ( .A(n17), .B(n20), .Y(n121) );
  OAI21X1M U86 ( .A0(n27), .A1(n25), .B0(n122), .Y(n20) );
  OAI21X1M U87 ( .A0(n123), .A1(n124), .B0(n125), .Y(n122) );
  CLKINVX1M U88 ( .A(n25), .Y(n123) );
  CLKXOR2X2M U89 ( .A(n126), .B(n127), .Y(n25) );
  CLKNAND2X2M U90 ( .A(n128), .B(quotient[2]), .Y(n126) );
  CLKXOR2X2M U91 ( .A(n129), .B(n130), .Y(n128) );
  CLKINVX1M U92 ( .A(n124), .Y(n27) );
  OAI22X1M U93 ( .A0(n117), .A1(n115), .B0(b[11]), .B1(n131), .Y(n124) );
  AND2X1M U94 ( .A(n115), .B(n117), .Y(n131) );
  XNOR2X1M U95 ( .A(n132), .B(n133), .Y(n115) );
  CLKNAND2X2M U96 ( .A(n134), .B(quotient[2]), .Y(n132) );
  CLKXOR2X2M U97 ( .A(b[10]), .B(n135), .Y(n134) );
  AOI2BB2XLM U98 ( .B0(n38), .B1(n35), .A0N(b[10]), .A1N(n136), .Y(n117) );
  NOR2X1M U99 ( .A(n35), .B(n38), .Y(n136) );
  CLKXOR2X2M U100 ( .A(n137), .B(n138), .Y(n35) );
  CLKNAND2X2M U101 ( .A(n139), .B(quotient[2]), .Y(n137) );
  CLKXOR2X2M U102 ( .A(b[9]), .B(n140), .Y(n139) );
  OAI21X1M U103 ( .A0(n45), .A1(n43), .B0(n141), .Y(n38) );
  AO21XLM U104 ( .A0(n43), .A1(n45), .B0(b[9]), .Y(n141) );
  XNOR2X1M U105 ( .A(n142), .B(n143), .Y(n43) );
  CLKNAND2X2M U106 ( .A(n144), .B(quotient[2]), .Y(n142) );
  CLKXOR2X2M U107 ( .A(b[8]), .B(n145), .Y(n144) );
  AOI2BB2XLM U108 ( .B0(n113), .B1(n110), .A0N(b[8]), .A1N(n146), .Y(n45) );
  NOR2X1M U109 ( .A(n110), .B(n113), .Y(n146) );
  CLKXOR2X2M U110 ( .A(n147), .B(n148), .Y(n110) );
  CLKNAND2X2M U111 ( .A(n149), .B(quotient[2]), .Y(n147) );
  CLKXOR2X2M U112 ( .A(b[7]), .B(n150), .Y(n149) );
  OAI2B2X1M U113 ( .A1N(n56), .A0(n53), .B0(b[7]), .B1(n151), .Y(n113) );
  NOR2BX1M U114 ( .AN(n53), .B(n56), .Y(n151) );
  XNOR2X1M U115 ( .A(n152), .B(n153), .Y(n53) );
  CLKNAND2X2M U116 ( .A(n154), .B(quotient[2]), .Y(n152) );
  CLKXOR2X2M U117 ( .A(b[6]), .B(n155), .Y(n154) );
  OAI21X1M U118 ( .A0(n63), .A1(n156), .B0(n157), .Y(n56) );
  OAI21X1M U119 ( .A0(n61), .A1(n158), .B0(n159), .Y(n157) );
  CLKINVX1M U120 ( .A(n61), .Y(n156) );
  CLKXOR2X2M U121 ( .A(n160), .B(n161), .Y(n61) );
  CLKNAND2X2M U122 ( .A(n162), .B(quotient[2]), .Y(n160) );
  CLKXOR2X2M U123 ( .A(b[5]), .B(n163), .Y(n162) );
  CLKINVX1M U124 ( .A(n158), .Y(n63) );
  OAI22X1M U125 ( .A0(n108), .A1(n106), .B0(b[5]), .B1(n164), .Y(n158) );
  AND2X1M U126 ( .A(n106), .B(n108), .Y(n164) );
  XNOR2X1M U127 ( .A(n165), .B(n166), .Y(n106) );
  CLKNAND2X2M U128 ( .A(n167), .B(quotient[2]), .Y(n165) );
  CLKXOR2X2M U129 ( .A(b[4]), .B(n168), .Y(n167) );
  AOI2BB2XLM U130 ( .B0(n74), .B1(n71), .A0N(b[4]), .A1N(n169), .Y(n108) );
  NOR2X1M U131 ( .A(n71), .B(n74), .Y(n169) );
  CLKXOR2X2M U132 ( .A(n170), .B(n171), .Y(n71) );
  CLKNAND2X2M U133 ( .A(n172), .B(quotient[2]), .Y(n170) );
  CLKXOR2X2M U134 ( .A(b[3]), .B(n173), .Y(n172) );
  OAI21X1M U135 ( .A0(n81), .A1(n174), .B0(n175), .Y(n74) );
  OAI21X1M U136 ( .A0(n79), .A1(n176), .B0(n177), .Y(n175) );
  CLKINVX1M U137 ( .A(n79), .Y(n174) );
  CLKXOR2X2M U138 ( .A(n178), .B(n179), .Y(n79) );
  CLKNAND2X2M U139 ( .A(n180), .B(quotient[2]), .Y(n178) );
  CLKXOR2X2M U140 ( .A(b[2]), .B(n181), .Y(n180) );
  CLKINVX1M U141 ( .A(n176), .Y(n81) );
  OAI2B2X1M U142 ( .A1N(n104), .A0(n101), .B0(b[2]), .B1(n182), .Y(n176) );
  NOR2BX1M U143 ( .AN(n101), .B(n104), .Y(n182) );
  CLKXOR2X2M U144 ( .A(n183), .B(n184), .Y(n101) );
  CLKNAND2X2M U145 ( .A(n185), .B(quotient[2]), .Y(n183) );
  CLKXOR2X2M U146 ( .A(n91), .B(n186), .Y(n185) );
  OAI2BB1X1M U147 ( .A0N(n92), .A1N(n88), .B0(n187), .Y(n104) );
  OAI21X1M U148 ( .A0(n88), .A1(n92), .B0(n91), .Y(n187) );
  OAI21X1M U149 ( .A0(n188), .A1(n186), .B0(n189), .Y(n88) );
  OAI21X1M U150 ( .A0(n188), .A1(n93), .B0(a[2]), .Y(n189) );
  CLKINVX1M U151 ( .A(quotient[2]), .Y(n188) );
  CLKINVX1M U152 ( .A(n98), .Y(n92) );
  NOR2X1M U153 ( .A(n93), .B(a[1]), .Y(n98) );
  XNOR2X1M U154 ( .A(n190), .B(n191), .Y(n17) );
  CLKNAND2X2M U155 ( .A(n192), .B(quotient[2]), .Y(n190) );
  CLKXOR2X2M U156 ( .A(n125), .B(n193), .Y(n192) );
  XNOR2X1M U157 ( .A(n194), .B(n195), .Y(n9) );
  CLKNAND2X2M U158 ( .A(n196), .B(quotient[2]), .Y(n194) );
  CLKNAND2X2M U159 ( .A(n197), .B(n198), .Y(quotient[2]) );
  NAND4X1M U160 ( .A(n199), .B(n195), .C(n11), .D(n119), .Y(n198) );
  CLKINVX1M U161 ( .A(b[15]), .Y(n119) );
  CLKINVX1M U162 ( .A(b[14]), .Y(n11) );
  OAI21X1M U163 ( .A0(n199), .A1(n195), .B0(n200), .Y(n197) );
  XNOR2X1M U164 ( .A(n201), .B(n202), .Y(n195) );
  CLKNAND2X2M U165 ( .A(n203), .B(quotient[3]), .Y(n201) );
  CLKXOR2X2M U166 ( .A(n125), .B(n204), .Y(n203) );
  CLKXOR2X2M U167 ( .A(n199), .B(n19), .Y(n196) );
  OA21X1M U168 ( .A0(n191), .A1(n193), .B0(n205), .Y(n199) );
  AO21XLM U169 ( .A0(n193), .A1(n191), .B0(n125), .Y(n205) );
  CLKINVX1M U170 ( .A(b[12]), .Y(n125) );
  OAI2BB1X1M U171 ( .A0N(n130), .A1N(n127), .B0(n206), .Y(n193) );
  OAI21X1M U172 ( .A0(n127), .A1(n130), .B0(n129), .Y(n206) );
  XNOR2X1M U173 ( .A(n207), .B(n208), .Y(n127) );
  CLKNAND2X2M U174 ( .A(n209), .B(quotient[3]), .Y(n207) );
  CLKXOR2X2M U175 ( .A(n37), .B(n210), .Y(n209) );
  OAI22X1M U176 ( .A0(n135), .A1(n133), .B0(b[10]), .B1(n211), .Y(n130) );
  AND2X1M U177 ( .A(n133), .B(n135), .Y(n211) );
  XNOR2X1M U178 ( .A(n212), .B(n213), .Y(n133) );
  CLKNAND2X2M U179 ( .A(n214), .B(quotient[3]), .Y(n212) );
  CLKXOR2X2M U180 ( .A(n215), .B(n216), .Y(n214) );
  OA22X1M U181 ( .A0(n140), .A1(n138), .B0(b[9]), .B1(n217), .Y(n135) );
  AND2X1M U182 ( .A(n138), .B(n140), .Y(n217) );
  XNOR2X1M U183 ( .A(n218), .B(n219), .Y(n138) );
  CLKNAND2X2M U184 ( .A(n220), .B(quotient[3]), .Y(n218) );
  CLKXOR2X2M U185 ( .A(n112), .B(n221), .Y(n220) );
  OA21X1M U186 ( .A0(n145), .A1(n143), .B0(n222), .Y(n140) );
  AO21XLM U187 ( .A0(n143), .A1(n145), .B0(b[8]), .Y(n222) );
  XNOR2X1M U188 ( .A(n223), .B(n224), .Y(n143) );
  CLKNAND2X2M U189 ( .A(n225), .B(quotient[3]), .Y(n223) );
  CLKXOR2X2M U190 ( .A(n55), .B(n226), .Y(n225) );
  OA22X1M U191 ( .A0(n150), .A1(n148), .B0(b[7]), .B1(n227), .Y(n145) );
  AND2X1M U192 ( .A(n148), .B(n150), .Y(n227) );
  XNOR2X1M U193 ( .A(n228), .B(n229), .Y(n148) );
  CLKNAND2X2M U194 ( .A(n230), .B(quotient[3]), .Y(n228) );
  CLKXOR2X2M U195 ( .A(n159), .B(n231), .Y(n230) );
  OA22X1M U196 ( .A0(n155), .A1(n153), .B0(b[6]), .B1(n232), .Y(n150) );
  AND2X1M U197 ( .A(n153), .B(n155), .Y(n232) );
  XNOR2X1M U198 ( .A(n233), .B(n234), .Y(n153) );
  CLKNAND2X2M U199 ( .A(n235), .B(quotient[3]), .Y(n233) );
  CLKXOR2X2M U200 ( .A(n236), .B(n237), .Y(n235) );
  OA21X1M U201 ( .A0(n163), .A1(n161), .B0(n238), .Y(n155) );
  AO21XLM U202 ( .A0(n161), .A1(n163), .B0(b[5]), .Y(n238) );
  XNOR2X1M U203 ( .A(n239), .B(n240), .Y(n161) );
  CLKNAND2X2M U204 ( .A(n241), .B(quotient[3]), .Y(n239) );
  CLKXOR2X2M U205 ( .A(n73), .B(n242), .Y(n241) );
  OA22X1M U206 ( .A0(n168), .A1(n166), .B0(b[4]), .B1(n243), .Y(n163) );
  AND2X1M U207 ( .A(n166), .B(n168), .Y(n243) );
  XNOR2X1M U208 ( .A(n244), .B(n245), .Y(n166) );
  CLKNAND2X2M U209 ( .A(n246), .B(quotient[3]), .Y(n244) );
  CLKXOR2X2M U210 ( .A(n177), .B(n247), .Y(n246) );
  OA22X1M U211 ( .A0(n173), .A1(n171), .B0(b[3]), .B1(n248), .Y(n168) );
  AND2X1M U212 ( .A(n171), .B(n173), .Y(n248) );
  XNOR2X1M U213 ( .A(n249), .B(n250), .Y(n171) );
  CLKNAND2X2M U214 ( .A(n251), .B(quotient[3]), .Y(n249) );
  CLKXOR2X2M U215 ( .A(n103), .B(n252), .Y(n251) );
  OA21X1M U216 ( .A0(n181), .A1(n179), .B0(n253), .Y(n173) );
  AO21XLM U217 ( .A0(n179), .A1(n181), .B0(b[2]), .Y(n253) );
  CLKXOR2X2M U218 ( .A(n254), .B(n255), .Y(n179) );
  CLKNAND2X2M U219 ( .A(n256), .B(quotient[3]), .Y(n254) );
  CLKXOR2X2M U220 ( .A(n91), .B(n257), .Y(n256) );
  AOI21BX1M U221 ( .A0(n184), .A1(n186), .B0N(n258), .Y(n181) );
  OAI21X1M U222 ( .A0(n186), .A1(n184), .B0(n91), .Y(n258) );
  OR2X1M U223 ( .A(a[2]), .B(n93), .Y(n186) );
  OAI21X1M U224 ( .A0(n259), .A1(n257), .B0(n260), .Y(n184) );
  OAI21X1M U225 ( .A0(n259), .A1(n93), .B0(a[3]), .Y(n260) );
  XNOR2X1M U226 ( .A(n261), .B(n262), .Y(n191) );
  CLKNAND2X2M U227 ( .A(n263), .B(quotient[3]), .Y(n261) );
  CLKINVX1M U228 ( .A(n259), .Y(quotient[3]) );
  AOI31X1M U229 ( .A0(n202), .A1(n204), .A2(n200), .B0(n264), .Y(n259) );
  OA21X1M U230 ( .A0(n202), .A1(n204), .B0(n265), .Y(n264) );
  OAI2BB2X1M U231 ( .B0(b[11]), .B1(n266), .A0N(n267), .A1N(n262), .Y(n204) );
  NOR2X1M U232 ( .A(n262), .B(n267), .Y(n266) );
  XNOR2X1M U233 ( .A(n268), .B(n269), .Y(n262) );
  NOR2X1M U234 ( .A(n270), .B(n3), .Y(n269) );
  CLKXOR2X2M U235 ( .A(n271), .B(b[10]), .Y(n270) );
  OA21X1M U236 ( .A0(n272), .A1(n3), .B0(n273), .Y(n202) );
  CLKXOR2X2M U237 ( .A(n129), .B(n267), .Y(n263) );
  OAI2BB1X1M U238 ( .A0N(n210), .A1N(n208), .B0(n274), .Y(n267) );
  OAI21X1M U239 ( .A0(n208), .A1(n210), .B0(n37), .Y(n274) );
  CLKXOR2X2M U240 ( .A(n275), .B(n276), .Y(n208) );
  NOR2X1M U241 ( .A(n277), .B(n3), .Y(n276) );
  CLKXOR2X2M U242 ( .A(n278), .B(b[9]), .Y(n277) );
  OAI2B2X1M U243 ( .A1N(n216), .A0(n213), .B0(b[9]), .B1(n279), .Y(n210) );
  NOR2BX1M U244 ( .AN(n213), .B(n216), .Y(n279) );
  XNOR2X1M U245 ( .A(n280), .B(n281), .Y(n213) );
  NOR2X1M U246 ( .A(n282), .B(n3), .Y(n281) );
  CLKXOR2X2M U247 ( .A(n112), .B(n283), .Y(n282) );
  OAI2B2X1M U248 ( .A1N(n221), .A0(n219), .B0(b[8]), .B1(n284), .Y(n216) );
  NOR2BX1M U249 ( .AN(n219), .B(n221), .Y(n284) );
  XNOR2X1M U250 ( .A(n285), .B(n286), .Y(n219) );
  NOR2X1M U251 ( .A(n287), .B(n3), .Y(n286) );
  CLKXOR2X2M U252 ( .A(n288), .B(b[7]), .Y(n287) );
  OAI21X1M U253 ( .A0(n289), .A1(n224), .B0(n290), .Y(n221) );
  AO21XLM U254 ( .A0(n224), .A1(n289), .B0(b[7]), .Y(n290) );
  XNOR2X1M U255 ( .A(n291), .B(n292), .Y(n224) );
  NOR2X1M U256 ( .A(n293), .B(n3), .Y(n292) );
  CLKXOR2X2M U257 ( .A(n294), .B(b[6]), .Y(n293) );
  CLKINVX1M U258 ( .A(n226), .Y(n289) );
  OAI2B2X1M U259 ( .A1N(n231), .A0(n229), .B0(b[6]), .B1(n295), .Y(n226) );
  NOR2BX1M U260 ( .AN(n229), .B(n231), .Y(n295) );
  XNOR2X1M U261 ( .A(n296), .B(n297), .Y(n229) );
  NOR2X1M U262 ( .A(n298), .B(n3), .Y(n297) );
  CLKXOR2X2M U263 ( .A(n236), .B(n299), .Y(n298) );
  OAI2B2X1M U264 ( .A1N(n237), .A0(n234), .B0(b[5]), .B1(n300), .Y(n231) );
  NOR2BX1M U265 ( .AN(n234), .B(n237), .Y(n300) );
  XNOR2X1M U266 ( .A(n301), .B(n302), .Y(n234) );
  NOR2X1M U267 ( .A(n303), .B(n3), .Y(n302) );
  CLKXOR2X2M U268 ( .A(n304), .B(b[4]), .Y(n303) );
  OAI2B2X1M U269 ( .A1N(n242), .A0(n240), .B0(b[4]), .B1(n305), .Y(n237) );
  NOR2BX1M U270 ( .AN(n240), .B(n242), .Y(n305) );
  XNOR2X1M U271 ( .A(n306), .B(n307), .Y(n240) );
  NOR2X1M U272 ( .A(n308), .B(n3), .Y(n307) );
  CLKXOR2X2M U273 ( .A(n309), .B(b[3]), .Y(n308) );
  OAI2B2X1M U274 ( .A1N(n247), .A0(n245), .B0(b[3]), .B1(n310), .Y(n242) );
  NOR2BX1M U275 ( .AN(n245), .B(n247), .Y(n310) );
  XNOR2X1M U276 ( .A(n311), .B(n312), .Y(n245) );
  NOR2X1M U277 ( .A(n313), .B(n3), .Y(n312) );
  CLKXOR2X2M U278 ( .A(n103), .B(n314), .Y(n313) );
  OAI21X1M U279 ( .A0(n315), .A1(n250), .B0(n316), .Y(n247) );
  AO21XLM U280 ( .A0(n250), .A1(n315), .B0(b[2]), .Y(n316) );
  XNOR2X1M U281 ( .A(n317), .B(n318), .Y(n250) );
  NOR2X1M U282 ( .A(n319), .B(n3), .Y(n318) );
  CLKXOR2X2M U283 ( .A(n320), .B(b[1]), .Y(n319) );
  CLKINVX1M U284 ( .A(n252), .Y(n315) );
  OAI2BB1X1M U285 ( .A0N(n255), .A1N(n257), .B0(n321), .Y(n252) );
  OAI21X1M U286 ( .A0(n257), .A1(n255), .B0(n91), .Y(n321) );
  OR2X1M U287 ( .A(a[3]), .B(n93), .Y(n257) );
  OAI21X1M U288 ( .A0(n320), .A1(n3), .B0(n322), .Y(n255) );
  OAI21X1M U289 ( .A0(n93), .A1(n3), .B0(a[4]), .Y(n322) );
  OAI221X1M U290 ( .A0(n273), .A1(n272), .B0(n323), .B1(n129), .C0(n265), .Y(
        n3) );
  NOR2BX1M U291 ( .AN(n323), .B(b[11]), .Y(n272) );
  OAI22X1M U292 ( .A0(n324), .A1(n268), .B0(b[10]), .B1(n325), .Y(n323) );
  NOR2X1M U293 ( .A(n326), .B(n271), .Y(n325) );
  CLKINVX1M U294 ( .A(n268), .Y(n326) );
  CLKXOR2X2M U295 ( .A(n327), .B(n328), .Y(n268) );
  CLKNAND2X2M U296 ( .A(n329), .B(quotient[5]), .Y(n327) );
  CLKXOR2X2M U297 ( .A(n215), .B(n330), .Y(n329) );
  CLKINVX1M U298 ( .A(n271), .Y(n324) );
  OAI2BB2X1M U299 ( .B0(b[9]), .B1(n331), .A0N(n278), .A1N(n275), .Y(n271) );
  NOR2X1M U300 ( .A(n275), .B(n278), .Y(n331) );
  OAI21X1M U301 ( .A0(n283), .A1(n332), .B0(n333), .Y(n278) );
  OAI21X1M U302 ( .A0(n280), .A1(n334), .B0(n112), .Y(n333) );
  CLKINVX1M U303 ( .A(n280), .Y(n332) );
  CLKXOR2X2M U304 ( .A(n335), .B(n336), .Y(n280) );
  CLKNAND2X2M U305 ( .A(n337), .B(quotient[5]), .Y(n335) );
  CLKXOR2X2M U306 ( .A(n55), .B(n338), .Y(n337) );
  CLKINVX1M U307 ( .A(n334), .Y(n283) );
  OAI22X1M U308 ( .A0(n339), .A1(n340), .B0(b[7]), .B1(n341), .Y(n334) );
  NOR2X1M U309 ( .A(n285), .B(n288), .Y(n341) );
  CLKINVX1M U310 ( .A(n285), .Y(n340) );
  CLKXOR2X2M U311 ( .A(n342), .B(n343), .Y(n285) );
  CLKNAND2X2M U312 ( .A(n344), .B(quotient[5]), .Y(n342) );
  CLKXOR2X2M U313 ( .A(n159), .B(n345), .Y(n344) );
  CLKINVX1M U314 ( .A(n288), .Y(n339) );
  OAI2BB2X1M U315 ( .B0(b[6]), .B1(n346), .A0N(n294), .A1N(n291), .Y(n288) );
  NOR2X1M U316 ( .A(n291), .B(n294), .Y(n346) );
  OAI21X1M U317 ( .A0(n299), .A1(n347), .B0(n348), .Y(n294) );
  OAI21X1M U318 ( .A0(n296), .A1(n349), .B0(n236), .Y(n348) );
  CLKINVX1M U319 ( .A(n296), .Y(n347) );
  CLKXOR2X2M U320 ( .A(n350), .B(n351), .Y(n296) );
  CLKNAND2X2M U321 ( .A(n352), .B(quotient[5]), .Y(n350) );
  CLKXOR2X2M U322 ( .A(n73), .B(n353), .Y(n352) );
  CLKINVX1M U323 ( .A(n349), .Y(n299) );
  OAI22X1M U324 ( .A0(n354), .A1(n355), .B0(b[4]), .B1(n356), .Y(n349) );
  NOR2X1M U325 ( .A(n301), .B(n304), .Y(n356) );
  CLKINVX1M U326 ( .A(n301), .Y(n355) );
  CLKXOR2X2M U327 ( .A(n357), .B(n358), .Y(n301) );
  CLKNAND2X2M U328 ( .A(n359), .B(quotient[5]), .Y(n357) );
  CLKXOR2X2M U329 ( .A(n177), .B(n360), .Y(n359) );
  CLKINVX1M U330 ( .A(n304), .Y(n354) );
  OAI2BB2X1M U331 ( .B0(b[3]), .B1(n361), .A0N(n309), .A1N(n306), .Y(n304) );
  NOR2X1M U332 ( .A(n306), .B(n309), .Y(n361) );
  OAI21X1M U333 ( .A0(n314), .A1(n362), .B0(n363), .Y(n309) );
  OAI21X1M U334 ( .A0(n311), .A1(n364), .B0(n103), .Y(n363) );
  CLKINVX1M U335 ( .A(n311), .Y(n362) );
  XNOR2X1M U336 ( .A(n365), .B(n366), .Y(n311) );
  CLKNAND2X2M U337 ( .A(n367), .B(quotient[5]), .Y(n365) );
  CLKXOR2X2M U338 ( .A(n91), .B(n368), .Y(n367) );
  CLKINVX1M U339 ( .A(n364), .Y(n314) );
  OAI2BB1X1M U340 ( .A0N(n317), .A1N(n320), .B0(n369), .Y(n364) );
  OAI21X1M U341 ( .A0(n320), .A1(n317), .B0(n91), .Y(n369) );
  OAI21X1M U342 ( .A0(n370), .A1(n368), .B0(n371), .Y(n317) );
  OAI21X1M U343 ( .A0(n370), .A1(n93), .B0(a[5]), .Y(n371) );
  CLKINVX1M U344 ( .A(quotient[5]), .Y(n370) );
  CLKXOR2X2M U345 ( .A(n372), .B(n373), .Y(n306) );
  CLKNAND2X2M U346 ( .A(n374), .B(quotient[5]), .Y(n372) );
  CLKXOR2X2M U347 ( .A(n103), .B(n375), .Y(n374) );
  CLKXOR2X2M U348 ( .A(n376), .B(n377), .Y(n291) );
  CLKNAND2X2M U349 ( .A(n378), .B(quotient[5]), .Y(n376) );
  CLKXOR2X2M U350 ( .A(n236), .B(n379), .Y(n378) );
  XNOR2X1M U351 ( .A(n380), .B(n381), .Y(n275) );
  CLKNAND2X2M U352 ( .A(n382), .B(quotient[5]), .Y(n380) );
  CLKXOR2X2M U353 ( .A(n112), .B(n383), .Y(n382) );
  AND2X1M U354 ( .A(n384), .B(n385), .Y(n273) );
  OAI2BB1X1M U355 ( .A0N(n37), .A1N(n386), .B0(quotient[5]), .Y(n385) );
  CLKNAND2X2M U356 ( .A(n387), .B(n388), .Y(quotient[5]) );
  NAND4X1M U357 ( .A(n384), .B(n265), .C(n386), .D(n129), .Y(n388) );
  OAI21X1M U358 ( .A0(n384), .A1(n386), .B0(n389), .Y(n387) );
  OAI2BB2X1M U359 ( .B0(b[9]), .B1(n390), .A0N(n330), .A1N(n328), .Y(n386) );
  NOR2X1M U360 ( .A(n328), .B(n330), .Y(n390) );
  OAI2BB2X1M U361 ( .B0(b[8]), .B1(n391), .A0N(n383), .A1N(n381), .Y(n330) );
  NOR2X1M U362 ( .A(n381), .B(n383), .Y(n391) );
  OAI21X1M U363 ( .A0(n392), .A1(n336), .B0(n393), .Y(n383) );
  AO21XLM U364 ( .A0(n336), .A1(n392), .B0(b[7]), .Y(n393) );
  CLKXOR2X2M U365 ( .A(n394), .B(n395), .Y(n336) );
  NOR2X1M U366 ( .A(n2), .B(n396), .Y(n395) );
  CLKXOR2X2M U367 ( .A(n159), .B(n397), .Y(n396) );
  CLKINVX1M U368 ( .A(n338), .Y(n392) );
  OAI2B2X1M U369 ( .A1N(n345), .A0(n343), .B0(b[6]), .B1(n398), .Y(n338) );
  NOR2BX1M U370 ( .AN(n343), .B(n345), .Y(n398) );
  CLKXOR2X2M U371 ( .A(n399), .B(n400), .Y(n343) );
  NOR2X1M U372 ( .A(n2), .B(n401), .Y(n400) );
  CLKXOR2X2M U373 ( .A(n236), .B(n402), .Y(n401) );
  OAI2B2X1M U374 ( .A1N(n379), .A0(n377), .B0(b[5]), .B1(n403), .Y(n345) );
  NOR2BX1M U375 ( .AN(n377), .B(n379), .Y(n403) );
  CLKXOR2X2M U376 ( .A(n404), .B(n405), .Y(n377) );
  NOR2X1M U377 ( .A(n2), .B(n406), .Y(n405) );
  CLKXOR2X2M U378 ( .A(n73), .B(n407), .Y(n406) );
  OAI2B2X1M U379 ( .A1N(n353), .A0(n351), .B0(b[4]), .B1(n408), .Y(n379) );
  NOR2BX1M U380 ( .AN(n351), .B(n353), .Y(n408) );
  CLKXOR2X2M U381 ( .A(n409), .B(n410), .Y(n351) );
  NOR2X1M U382 ( .A(n2), .B(n411), .Y(n410) );
  CLKXOR2X2M U383 ( .A(n177), .B(n412), .Y(n411) );
  OAI2B2X1M U384 ( .A1N(n360), .A0(n358), .B0(b[3]), .B1(n413), .Y(n353) );
  NOR2BX1M U385 ( .AN(n358), .B(n360), .Y(n413) );
  CLKXOR2X2M U386 ( .A(n414), .B(n415), .Y(n358) );
  NOR2X1M U387 ( .A(n2), .B(n416), .Y(n415) );
  CLKXOR2X2M U388 ( .A(n103), .B(n417), .Y(n416) );
  OAI21X1M U389 ( .A0(n418), .A1(n373), .B0(n419), .Y(n360) );
  AO21XLM U390 ( .A0(n373), .A1(n418), .B0(b[2]), .Y(n419) );
  XNOR2X1M U391 ( .A(n420), .B(n421), .Y(n373) );
  NOR2X1M U392 ( .A(n422), .B(n2), .Y(n421) );
  CLKXOR2X2M U393 ( .A(n423), .B(b[1]), .Y(n422) );
  CLKINVX1M U394 ( .A(n375), .Y(n418) );
  OAI2BB1X1M U395 ( .A0N(n366), .A1N(n368), .B0(n424), .Y(n375) );
  OAI21X1M U396 ( .A0(n368), .A1(n366), .B0(n91), .Y(n424) );
  OR2X1M U397 ( .A(a[5]), .B(n93), .Y(n368) );
  OAI2B2X1M U398 ( .A1N(a[6]), .A0(n425), .B0(n423), .B1(n2), .Y(n366) );
  NOR2X1M U399 ( .A(n93), .B(n2), .Y(n425) );
  XNOR2X1M U400 ( .A(n426), .B(n427), .Y(n381) );
  NOR2X1M U401 ( .A(n2), .B(n428), .Y(n427) );
  CLKXOR2X2M U402 ( .A(n55), .B(n429), .Y(n428) );
  XNOR2X1M U403 ( .A(n430), .B(n431), .Y(n328) );
  NOR2X1M U404 ( .A(n432), .B(n2), .Y(n431) );
  CLKXOR2X2M U405 ( .A(n112), .B(n433), .Y(n432) );
  CLKINVX1M U406 ( .A(b[10]), .Y(n37) );
  OA21X1M U407 ( .A0(n434), .A1(n2), .B0(n435), .Y(n384) );
  OAI221X1M U408 ( .A0(n435), .A1(n434), .B0(n436), .B1(n215), .C0(n389), .Y(
        n2) );
  AND2X1M U409 ( .A(n437), .B(n438), .Y(n435) );
  OAI2BB1X1M U410 ( .A0N(n439), .A1N(n112), .B0(quotient[7]), .Y(n438) );
  NOR2BX1M U411 ( .AN(n436), .B(b[9]), .Y(n434) );
  OAI21X1M U412 ( .A0(n433), .A1(n430), .B0(n440), .Y(n436) );
  OAI21X1M U413 ( .A0(n441), .A1(n442), .B0(n112), .Y(n440) );
  CLKINVX1M U414 ( .A(n430), .Y(n441) );
  CLKXOR2X2M U415 ( .A(n443), .B(n444), .Y(n430) );
  CLKNAND2X2M U416 ( .A(n445), .B(quotient[7]), .Y(n443) );
  CLKXOR2X2M U417 ( .A(n55), .B(n446), .Y(n445) );
  CLKINVX1M U418 ( .A(b[7]), .Y(n55) );
  CLKINVX1M U419 ( .A(n442), .Y(n433) );
  OAI21X1M U420 ( .A0(n426), .A1(n429), .B0(n447), .Y(n442) );
  AO21XLM U421 ( .A0(n429), .A1(n426), .B0(b[7]), .Y(n447) );
  OAI2BB1X1M U422 ( .A0N(n397), .A1N(n394), .B0(n448), .Y(n429) );
  OAI21X1M U423 ( .A0(n394), .A1(n397), .B0(b[6]), .Y(n448) );
  XNOR2X1M U424 ( .A(n449), .B(n450), .Y(n394) );
  CLKNAND2X2M U425 ( .A(n451), .B(quotient[7]), .Y(n449) );
  CLKXOR2X2M U426 ( .A(n236), .B(n452), .Y(n451) );
  OAI2BB2X1M U427 ( .B0(n453), .B1(n236), .A0N(n402), .A1N(n399), .Y(n397) );
  NOR2X1M U428 ( .A(n399), .B(n402), .Y(n453) );
  OAI2BB2X1M U429 ( .B0(n454), .B1(n73), .A0N(n407), .A1N(n404), .Y(n402) );
  NOR2X1M U430 ( .A(n404), .B(n407), .Y(n454) );
  OAI2BB1X1M U431 ( .A0N(n412), .A1N(n409), .B0(n455), .Y(n407) );
  OAI21X1M U432 ( .A0(n409), .A1(n412), .B0(b[3]), .Y(n455) );
  XNOR2X1M U433 ( .A(n456), .B(n457), .Y(n409) );
  CLKNAND2X2M U434 ( .A(n458), .B(quotient[7]), .Y(n456) );
  CLKXOR2X2M U435 ( .A(n103), .B(n459), .Y(n458) );
  OAI2BB2X1M U436 ( .B0(n460), .B1(n103), .A0N(n417), .A1N(n414), .Y(n412) );
  NOR2X1M U437 ( .A(n414), .B(n417), .Y(n460) );
  OAI21X1M U438 ( .A0(n423), .A1(n420), .B0(n461), .Y(n417) );
  AO21XLM U439 ( .A0(n423), .A1(n420), .B0(n91), .Y(n461) );
  OAI21X1M U440 ( .A0(n462), .A1(n463), .B0(n464), .Y(n420) );
  OAI21X1M U441 ( .A0(n462), .A1(n93), .B0(a[7]), .Y(n464) );
  CLKINVX1M U442 ( .A(quotient[7]), .Y(n462) );
  OR2X1M U443 ( .A(a[6]), .B(n93), .Y(n423) );
  CLKXOR2X2M U444 ( .A(n465), .B(n466), .Y(n414) );
  CLKNAND2X2M U445 ( .A(n467), .B(quotient[7]), .Y(n465) );
  CLKXOR2X2M U446 ( .A(n91), .B(n463), .Y(n467) );
  XNOR2X1M U447 ( .A(n468), .B(n469), .Y(n404) );
  CLKNAND2X2M U448 ( .A(n470), .B(quotient[7]), .Y(n468) );
  CLKXOR2X2M U449 ( .A(n177), .B(n471), .Y(n470) );
  XNOR2X1M U450 ( .A(n472), .B(n473), .Y(n399) );
  CLKNAND2X2M U451 ( .A(n474), .B(quotient[7]), .Y(n472) );
  CLKXOR2X2M U452 ( .A(n73), .B(n475), .Y(n474) );
  CLKXOR2X2M U453 ( .A(n476), .B(n477), .Y(n426) );
  CLKNAND2X2M U454 ( .A(n478), .B(quotient[7]), .Y(n476) );
  CLKNAND2X2M U455 ( .A(n479), .B(n480), .Y(quotient[7]) );
  NAND4X1M U456 ( .A(n437), .B(n389), .C(n439), .D(n215), .Y(n480) );
  OAI21BX1M U457 ( .A0(n437), .A1(n439), .B0N(n481), .Y(n479) );
  OAI2BB2X1M U458 ( .B0(b[7]), .B1(n482), .A0N(n446), .A1N(n444), .Y(n439) );
  NOR2X1M U459 ( .A(n444), .B(n446), .Y(n482) );
  OAI2BB2X1M U460 ( .B0(b[6]), .B1(n483), .A0N(n484), .A1N(n477), .Y(n446) );
  NOR2X1M U461 ( .A(n477), .B(n484), .Y(n483) );
  XNOR2X1M U462 ( .A(n485), .B(n486), .Y(n477) );
  CLKNAND2X2M U463 ( .A(n487), .B(quotient[8]), .Y(n485) );
  CLKXOR2X2M U464 ( .A(n236), .B(n488), .Y(n487) );
  XNOR2X1M U465 ( .A(n489), .B(n490), .Y(n444) );
  CLKNAND2X2M U466 ( .A(n491), .B(quotient[8]), .Y(n489) );
  CLKXOR2X2M U467 ( .A(n159), .B(n492), .Y(n491) );
  AOI2B1X1M U468 ( .A1N(n493), .A0(quotient[8]), .B0(n494), .Y(n437) );
  NOR2X1M U469 ( .A(b[7]), .B(n495), .Y(n493) );
  CLKXOR2X2M U470 ( .A(n159), .B(n484), .Y(n478) );
  OAI21X1M U471 ( .A0(n496), .A1(n450), .B0(n497), .Y(n484) );
  AO21XLM U472 ( .A0(n450), .A1(n496), .B0(b[5]), .Y(n497) );
  XNOR2X1M U473 ( .A(n498), .B(n499), .Y(n450) );
  CLKNAND2X2M U474 ( .A(n500), .B(quotient[8]), .Y(n498) );
  CLKXOR2X2M U475 ( .A(n73), .B(n501), .Y(n500) );
  CLKINVX1M U476 ( .A(n452), .Y(n496) );
  OAI2B2X1M U477 ( .A1N(n475), .A0(n473), .B0(b[4]), .B1(n502), .Y(n452) );
  NOR2BX1M U478 ( .AN(n473), .B(n475), .Y(n502) );
  XNOR2X1M U479 ( .A(n503), .B(n504), .Y(n473) );
  CLKNAND2X2M U480 ( .A(n505), .B(quotient[8]), .Y(n503) );
  CLKXOR2X2M U481 ( .A(n177), .B(n506), .Y(n505) );
  OAI2B2X1M U482 ( .A1N(n471), .A0(n469), .B0(b[3]), .B1(n507), .Y(n475) );
  NOR2BX1M U483 ( .AN(n469), .B(n471), .Y(n507) );
  XNOR2X1M U484 ( .A(n508), .B(n509), .Y(n469) );
  CLKNAND2X2M U485 ( .A(n510), .B(quotient[8]), .Y(n508) );
  CLKXOR2X2M U486 ( .A(n103), .B(n511), .Y(n510) );
  OAI21X1M U487 ( .A0(n512), .A1(n457), .B0(n513), .Y(n471) );
  AO21XLM U488 ( .A0(n457), .A1(n512), .B0(b[2]), .Y(n513) );
  CLKXOR2X2M U489 ( .A(n514), .B(n515), .Y(n457) );
  CLKNAND2X2M U490 ( .A(n516), .B(quotient[8]), .Y(n514) );
  CLKXOR2X2M U491 ( .A(n91), .B(n517), .Y(n516) );
  CLKINVX1M U492 ( .A(n459), .Y(n512) );
  OAI2BB1X1M U493 ( .A0N(n466), .A1N(n463), .B0(n518), .Y(n459) );
  OAI21X1M U494 ( .A0(n463), .A1(n466), .B0(n91), .Y(n518) );
  OR2X1M U495 ( .A(a[7]), .B(n93), .Y(n463) );
  OAI21X1M U496 ( .A0(n519), .A1(n517), .B0(n520), .Y(n466) );
  OAI21X1M U497 ( .A0(n519), .A1(n93), .B0(a[8]), .Y(n520) );
  CLKINVX1M U498 ( .A(quotient[8]), .Y(n519) );
  OAI32X1M U499 ( .A0(n494), .A1(n481), .A2(n495), .B0(n521), .B1(n522), .Y(
        quotient[8]) );
  CLKINVX1M U500 ( .A(n523), .Y(n522) );
  AND2X1M U501 ( .A(n495), .B(n494), .Y(n521) );
  OAI21X1M U502 ( .A0(n490), .A1(n492), .B0(n524), .Y(n495) );
  AO21XLM U503 ( .A0(n492), .A1(n490), .B0(n159), .Y(n524) );
  OAI2BB2X1M U504 ( .B0(b[5]), .B1(n525), .A0N(n488), .A1N(n486), .Y(n492) );
  NOR2X1M U505 ( .A(n486), .B(n488), .Y(n525) );
  OAI21X1M U506 ( .A0(n526), .A1(n499), .B0(n527), .Y(n488) );
  AO21XLM U507 ( .A0(n499), .A1(n526), .B0(b[4]), .Y(n527) );
  CLKXOR2X2M U508 ( .A(n528), .B(n529), .Y(n499) );
  NOR2X1M U509 ( .A(n1), .B(n530), .Y(n529) );
  CLKXOR2X2M U510 ( .A(n177), .B(n531), .Y(n530) );
  CLKINVX1M U511 ( .A(n501), .Y(n526) );
  OAI2B2X1M U512 ( .A1N(n506), .A0(n504), .B0(b[3]), .B1(n532), .Y(n501) );
  NOR2BX1M U513 ( .AN(n504), .B(n506), .Y(n532) );
  CLKXOR2X2M U514 ( .A(n533), .B(n534), .Y(n504) );
  NOR2X1M U515 ( .A(n1), .B(n535), .Y(n534) );
  CLKXOR2X2M U516 ( .A(n103), .B(n536), .Y(n535) );
  OAI2B2X1M U517 ( .A1N(n511), .A0(n509), .B0(b[2]), .B1(n537), .Y(n506) );
  NOR2BX1M U518 ( .AN(n509), .B(n511), .Y(n537) );
  XNOR2X1M U519 ( .A(n538), .B(n539), .Y(n509) );
  NOR2X1M U520 ( .A(n540), .B(n1), .Y(n539) );
  CLKXOR2X2M U521 ( .A(n541), .B(b[1]), .Y(n540) );
  OAI2BB1X1M U522 ( .A0N(n515), .A1N(n517), .B0(n542), .Y(n511) );
  OAI21X1M U523 ( .A0(n517), .A1(n515), .B0(n91), .Y(n542) );
  OR2X1M U524 ( .A(a[8]), .B(n93), .Y(n517) );
  OAI2B2X1M U525 ( .A1N(a[9]), .A0(n543), .B0(n541), .B1(n1), .Y(n515) );
  NOR2X1M U526 ( .A(n93), .B(n1), .Y(n543) );
  XNOR2X1M U527 ( .A(n544), .B(n545), .Y(n486) );
  NOR2X1M U528 ( .A(n1), .B(n546), .Y(n545) );
  CLKXOR2X2M U529 ( .A(n73), .B(n547), .Y(n546) );
  CLKXOR2X2M U530 ( .A(n548), .B(n549), .Y(n490) );
  NOR2X1M U531 ( .A(n550), .B(n1), .Y(n549) );
  CLKXOR2X2M U532 ( .A(n551), .B(b[5]), .Y(n550) );
  OAI21X1M U533 ( .A0(n552), .A1(n1), .B0(n553), .Y(n494) );
  OAI2B11X1M U534 ( .A1N(n554), .A0(n553), .B0(n555), .C0(n523), .Y(n1) );
  OAI21X1M U535 ( .A0(n556), .A1(n554), .B0(b[6]), .Y(n555) );
  CLKINVX1M U536 ( .A(n556), .Y(n553) );
  CLKNAND2X2M U537 ( .A(n557), .B(n558), .Y(n556) );
  OAI2BB1X1M U538 ( .A0N(n559), .A1N(n236), .B0(quotient[10]), .Y(n558) );
  NOR2X1M U539 ( .A(b[6]), .B(n554), .Y(n552) );
  OAI21X1M U540 ( .A0(n548), .A1(n551), .B0(n560), .Y(n554) );
  AO21XLM U541 ( .A0(n551), .A1(n548), .B0(n236), .Y(n560) );
  OAI21X1M U542 ( .A0(n544), .A1(n547), .B0(n561), .Y(n551) );
  OAI2BB1X1M U543 ( .A0N(n547), .A1N(n544), .B0(n73), .Y(n561) );
  OAI2BB2X1M U544 ( .B0(n562), .B1(n177), .A0N(n531), .A1N(n528), .Y(n547) );
  NOR2X1M U545 ( .A(n528), .B(n531), .Y(n562) );
  OAI2BB1X1M U546 ( .A0N(n536), .A1N(n533), .B0(n563), .Y(n531) );
  OAI21X1M U547 ( .A0(n533), .A1(n536), .B0(b[2]), .Y(n563) );
  CLKXOR2X2M U548 ( .A(n564), .B(n565), .Y(n533) );
  CLKNAND2X2M U549 ( .A(n566), .B(quotient[10]), .Y(n564) );
  CLKXOR2X2M U550 ( .A(n91), .B(n567), .Y(n566) );
  OAI22X1M U551 ( .A0(n541), .A1(n538), .B0(n568), .B1(n91), .Y(n536) );
  NOR2BX1M U552 ( .AN(n538), .B(n569), .Y(n568) );
  OAI21X1M U553 ( .A0(n570), .A1(n567), .B0(n571), .Y(n538) );
  OAI21X1M U554 ( .A0(n570), .A1(n93), .B0(a[10]), .Y(n571) );
  CLKINVX1M U555 ( .A(quotient[10]), .Y(n570) );
  CLKINVX1M U556 ( .A(n569), .Y(n541) );
  NOR2X1M U557 ( .A(n93), .B(a[9]), .Y(n569) );
  XNOR2X1M U558 ( .A(n572), .B(n573), .Y(n528) );
  CLKNAND2X2M U559 ( .A(n574), .B(quotient[10]), .Y(n572) );
  CLKXOR2X2M U560 ( .A(n103), .B(n575), .Y(n574) );
  CLKXOR2X2M U561 ( .A(n576), .B(n577), .Y(n544) );
  CLKNAND2X2M U562 ( .A(n578), .B(quotient[10]), .Y(n576) );
  CLKXOR2X2M U563 ( .A(n177), .B(n579), .Y(n578) );
  XNOR2X1M U564 ( .A(n580), .B(n581), .Y(n548) );
  CLKNAND2X2M U565 ( .A(n582), .B(quotient[10]), .Y(n580) );
  CLKNAND2X2M U566 ( .A(n583), .B(n584), .Y(quotient[10]) );
  NAND4X1M U567 ( .A(n557), .B(n523), .C(n559), .D(n159), .Y(n584) );
  OAI21BX1M U568 ( .A0(n557), .A1(n559), .B0N(n585), .Y(n583) );
  OAI2BB2X1M U569 ( .B0(b[4]), .B1(n586), .A0N(n587), .A1N(n581), .Y(n559) );
  NOR2X1M U570 ( .A(n581), .B(n587), .Y(n586) );
  XNOR2X1M U571 ( .A(n588), .B(n589), .Y(n581) );
  CLKNAND2X2M U572 ( .A(n590), .B(quotient[11]), .Y(n588) );
  CLKXOR2X2M U573 ( .A(n177), .B(n591), .Y(n590) );
  NOR2BX1M U574 ( .AN(n592), .B(n593), .Y(n557) );
  OAI21X1M U575 ( .A0(b[4]), .A1(n594), .B0(quotient[11]), .Y(n592) );
  CLKXOR2X2M U576 ( .A(n73), .B(n587), .Y(n582) );
  OAI2BB2X1M U577 ( .B0(b[3]), .B1(n595), .A0N(n579), .A1N(n577), .Y(n587) );
  NOR2X1M U578 ( .A(n577), .B(n579), .Y(n595) );
  OAI21X1M U579 ( .A0(n596), .A1(n573), .B0(n597), .Y(n579) );
  AO21XLM U580 ( .A0(n573), .A1(n596), .B0(b[2]), .Y(n597) );
  CLKXOR2X2M U581 ( .A(n598), .B(n599), .Y(n573) );
  CLKNAND2X2M U582 ( .A(n600), .B(quotient[11]), .Y(n598) );
  CLKXOR2X2M U583 ( .A(n91), .B(n601), .Y(n600) );
  CLKINVX1M U584 ( .A(n575), .Y(n596) );
  OAI2BB1X1M U585 ( .A0N(n565), .A1N(n567), .B0(n602), .Y(n575) );
  OAI21X1M U586 ( .A0(n567), .A1(n565), .B0(n91), .Y(n602) );
  OR2X1M U587 ( .A(a[10]), .B(n93), .Y(n567) );
  OAI21X1M U588 ( .A0(n603), .A1(n601), .B0(n604), .Y(n565) );
  OAI21X1M U589 ( .A0(n603), .A1(n93), .B0(a[11]), .Y(n604) );
  CLKINVX1M U590 ( .A(quotient[11]), .Y(n603) );
  XNOR2X1M U591 ( .A(n605), .B(n606), .Y(n577) );
  CLKNAND2X2M U592 ( .A(n607), .B(quotient[11]), .Y(n605) );
  OAI31X1M U593 ( .A0(n593), .A1(n585), .A2(n594), .B0(n608), .Y(quotient[11])
         );
  OAI2BB1X1M U594 ( .A0N(n594), .A1N(n593), .B0(n609), .Y(n608) );
  OAI21X1M U595 ( .A0(n589), .A1(n591), .B0(n610), .Y(n594) );
  AO21XLM U596 ( .A0(n591), .A1(n589), .B0(n177), .Y(n610) );
  OAI2BB1X1M U597 ( .A0N(n611), .A1N(n606), .B0(n612), .Y(n591) );
  OAI21X1M U598 ( .A0(n606), .A1(n611), .B0(n103), .Y(n612) );
  XNOR2X1M U599 ( .A(n613), .B(n614), .Y(n606) );
  NOR2X1M U600 ( .A(n615), .B(n616), .Y(n614) );
  CLKXOR2X2M U601 ( .A(n617), .B(n91), .Y(n615) );
  CLKXOR2X2M U602 ( .A(n618), .B(n619), .Y(n589) );
  NOR2X1M U603 ( .A(n620), .B(n616), .Y(n619) );
  CLKXOR2X2M U604 ( .A(n621), .B(b[2]), .Y(n620) );
  OAI21X1M U605 ( .A0(n622), .A1(n616), .B0(n623), .Y(n593) );
  NOR2X1M U606 ( .A(b[3]), .B(n624), .Y(n622) );
  CLKXOR2X2M U607 ( .A(n103), .B(n611), .Y(n607) );
  OAI2BB2X1M U608 ( .B0(b[1]), .B1(n625), .A0N(n599), .A1N(n601), .Y(n611) );
  NOR2X1M U609 ( .A(n601), .B(n599), .Y(n625) );
  OAI2BB1X1M U610 ( .A0N(n617), .A1N(quotient[12]), .B0(n626), .Y(n599) );
  OAI21X1M U611 ( .A0(n93), .A1(n616), .B0(a[12]), .Y(n626) );
  CLKINVX1M U612 ( .A(n616), .Y(quotient[12]) );
  OAI21X1M U613 ( .A0(n627), .A1(n628), .B0(n609), .Y(n616) );
  NOR2X1M U614 ( .A(n624), .B(n629), .Y(n628) );
  AOI21X1M U615 ( .A0(n624), .A1(n629), .B0(b[3]), .Y(n627) );
  CLKINVX1M U616 ( .A(n623), .Y(n629) );
  AOI211X1M U617 ( .A0(quotient[13]), .A1(n630), .B0(n631), .C0(n632), .Y(n623) );
  CLKNAND2X2M U618 ( .A(n633), .B(n103), .Y(n630) );
  OAI21X1M U619 ( .A0(n618), .A1(n621), .B0(n634), .Y(n624) );
  AO21XLM U620 ( .A0(n621), .A1(n618), .B0(n103), .Y(n634) );
  OAI21X1M U621 ( .A0(n617), .A1(n613), .B0(n635), .Y(n621) );
  AO21XLM U622 ( .A0(n613), .A1(n617), .B0(b[1]), .Y(n635) );
  OAI31X1M U623 ( .A0(n93), .A1(n636), .A2(n637), .B0(n638), .Y(n613) );
  AO21XLM U624 ( .A0(quotient[13]), .A1(n636), .B0(a[13]), .Y(n638) );
  CLKINVX1M U625 ( .A(quotient[13]), .Y(n637) );
  XNOR2X1M U626 ( .A(n639), .B(n640), .Y(n618) );
  CLKNAND2X2M U627 ( .A(n641), .B(quotient[13]), .Y(n639) );
  OAI32X1M U628 ( .A0(n632), .A1(n631), .A2(n642), .B0(n643), .B1(n644), .Y(
        quotient[13]) );
  CLKINVX1M U629 ( .A(n633), .Y(n643) );
  AOI31X1M U630 ( .A0(n633), .A1(n177), .A2(n609), .B0(n645), .Y(n642) );
  OAI2BB1X1M U631 ( .A0N(n646), .A1N(n640), .B0(n647), .Y(n633) );
  OAI21X1M U632 ( .A0(n640), .A1(n646), .B0(n91), .Y(n647) );
  AOI21X1M U633 ( .A0(b[0]), .A1(quotient[14]), .B0(n648), .Y(n640) );
  NOR2BX1M U634 ( .AN(quotient[14]), .B(n91), .Y(n631) );
  AOI221XLM U635 ( .A0(n632), .A1(b[1]), .B0(n648), .B1(b[0]), .C0(n644), .Y(
        quotient[14]) );
  CLKINVX1M U636 ( .A(a[14]), .Y(n648) );
  OAI21X1M U637 ( .A0(n93), .A1(n4), .B0(a[15]), .Y(n632) );
  OAI211X1M U638 ( .A0(a[15]), .A1(n93), .B0(n91), .C0(n645), .Y(n4) );
  CLKINVX1M U639 ( .A(n644), .Y(n645) );
  NAND3X1M U640 ( .A(n103), .B(n177), .C(n609), .Y(n644) );
  NOR2X1M U641 ( .A(n585), .B(b[4]), .Y(n609) );
  NAND3X1M U642 ( .A(n236), .B(n159), .C(n523), .Y(n585) );
  NOR2X1M U643 ( .A(n481), .B(b[7]), .Y(n523) );
  NAND3X1M U644 ( .A(n112), .B(n215), .C(n389), .Y(n481) );
  NOR3BX1M U645 ( .AN(n265), .B(b[10]), .C(b[11]), .Y(n389) );
  NOR2BX1M U646 ( .AN(n200), .B(b[12]), .Y(n265) );
  NOR3X1M U647 ( .A(b[14]), .B(b[15]), .C(b[13]), .Y(n200) );
  CLKINVX1M U648 ( .A(b[9]), .Y(n215) );
  CLKINVX1M U649 ( .A(b[8]), .Y(n112) );
  CLKINVX1M U650 ( .A(b[5]), .Y(n236) );
  CLKINVX1M U651 ( .A(b[3]), .Y(n177) );
  CLKXOR2X2M U652 ( .A(n91), .B(n646), .Y(n641) );
  CLKINVX1M U653 ( .A(n636), .Y(n646) );
  NOR2X1M U654 ( .A(n93), .B(a[13]), .Y(n636) );
  CLKINVX1M U655 ( .A(b[1]), .Y(n91) );
  NOR2X1M U656 ( .A(n93), .B(a[12]), .Y(n617) );
  OR2X1M U657 ( .A(a[11]), .B(n93), .Y(n601) );
  CLKINVX1M U658 ( .A(b[2]), .Y(n103) );
  CLKINVX1M U659 ( .A(b[4]), .Y(n73) );
  CLKINVX1M U660 ( .A(b[6]), .Y(n159) );
  OR2X1M U661 ( .A(a[4]), .B(n93), .Y(n320) );
  CLKINVX1M U662 ( .A(b[0]), .Y(n93) );
  CLKINVX1M U663 ( .A(b[11]), .Y(n129) );
  CLKINVX1M U664 ( .A(b[13]), .Y(n19) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [15:0] A;
  input [15:0] B;
  output [31:0] PRODUCT;
  input TC;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463;

  XOR3XLM U1 ( .A(n1), .B(n2), .C(n3), .Y(PRODUCT[9]) );
  XOR3XLM U2 ( .A(n4), .B(n5), .C(n6), .Y(PRODUCT[8]) );
  XOR3XLM U3 ( .A(n7), .B(n8), .C(n9), .Y(PRODUCT[7]) );
  XNOR3X1M U4 ( .A(n10), .B(n11), .C(n12), .Y(PRODUCT[6]) );
  XOR3XLM U5 ( .A(n13), .B(n14), .C(n15), .Y(PRODUCT[5]) );
  XOR3XLM U6 ( .A(n16), .B(n17), .C(n18), .Y(PRODUCT[4]) );
  XOR3XLM U7 ( .A(n19), .B(n20), .C(n21), .Y(PRODUCT[3]) );
  XOR3XLM U8 ( .A(n22), .B(n23), .C(n24), .Y(PRODUCT[2]) );
  CLKXOR2X2M U9 ( .A(n25), .B(n26), .Y(PRODUCT[1]) );
  CLKNAND2X2M U10 ( .A(B[0]), .B(A[1]), .Y(n26) );
  XOR3XLM U11 ( .A(n27), .B(n28), .C(n29), .Y(PRODUCT[15]) );
  XOR3XLM U12 ( .A(n30), .B(n31), .C(n32), .Y(n29) );
  CLKNAND2X2M U13 ( .A(A[15]), .B(B[0]), .Y(n32) );
  XOR3XLM U14 ( .A(n33), .B(n34), .C(n35), .Y(n31) );
  AOI2BB1X1M U15 ( .A0N(n36), .A1N(n37), .B0(n38), .Y(n35) );
  AOI21X1M U16 ( .A0(n37), .A1(n36), .B0(n39), .Y(n38) );
  NOR2X1M U17 ( .A(n40), .B(n41), .Y(n34) );
  NOR2X1M U18 ( .A(n42), .B(n43), .Y(n33) );
  XOR3XLM U19 ( .A(n44), .B(n45), .C(n46), .Y(n30) );
  XOR3XLM U20 ( .A(n47), .B(n48), .C(n49), .Y(n46) );
  OAI22X1M U21 ( .A0(n50), .A1(n51), .B0(n52), .B1(n53), .Y(n49) );
  AND2X1M U22 ( .A(n51), .B(n50), .Y(n52) );
  XOR3XLM U23 ( .A(n54), .B(n55), .C(n56), .Y(n48) );
  XOR3XLM U24 ( .A(n57), .B(n58), .C(n59), .Y(n56) );
  AOI2BB1X1M U25 ( .A0N(n60), .A1N(n61), .B0(n62), .Y(n59) );
  AOI21X1M U26 ( .A0(n60), .A1(n61), .B0(n63), .Y(n62) );
  XOR3XLM U27 ( .A(n64), .B(n65), .C(n66), .Y(n58) );
  OAI22X1M U28 ( .A0(n67), .A1(n68), .B0(n69), .B1(n70), .Y(n66) );
  AND2X1M U29 ( .A(n68), .B(n67), .Y(n69) );
  OAI22X1M U30 ( .A0(n71), .A1(n72), .B0(n73), .B1(n74), .Y(n65) );
  AND2X1M U31 ( .A(n72), .B(n71), .Y(n73) );
  CLKXOR2X2M U32 ( .A(n75), .B(n76), .Y(n64) );
  AOI2B1X1M U33 ( .A1N(n77), .A0(n78), .B0(n79), .Y(n76) );
  AOI2B1X1M U34 ( .A1N(n78), .A0(n77), .B0(n80), .Y(n79) );
  AOI2B1X1M U35 ( .A1N(n81), .A0(n82), .B0(n83), .Y(n75) );
  AOI2B1X1M U36 ( .A1N(n82), .A0(n81), .B0(n84), .Y(n83) );
  XOR3XLM U37 ( .A(n85), .B(n86), .C(n87), .Y(n57) );
  CLKXOR2X2M U38 ( .A(n88), .B(n89), .Y(n87) );
  CLKNAND2X2M U39 ( .A(B[15]), .B(A[0]), .Y(n89) );
  CLKNAND2X2M U40 ( .A(B[14]), .B(A[1]), .Y(n88) );
  AOI21X1M U41 ( .A0(n90), .A1(n91), .B0(n92), .Y(n86) );
  AOI2BB1X1M U42 ( .A0N(n91), .A1N(n90), .B0(n93), .Y(n92) );
  NOR2X1M U43 ( .A(n94), .B(n95), .Y(n85) );
  NOR2X1M U44 ( .A(n96), .B(n97), .Y(n55) );
  NOR2X1M U45 ( .A(n98), .B(n99), .Y(n54) );
  XOR3XLM U46 ( .A(n100), .B(n101), .C(n102), .Y(n47) );
  CLKXOR2X2M U47 ( .A(n103), .B(n104), .Y(n102) );
  NOR2X1M U48 ( .A(n105), .B(n106), .Y(n104) );
  AOI2BB1X1M U49 ( .A0N(n107), .A1N(n108), .B0(n109), .Y(n103) );
  AOI21X1M U50 ( .A0(n108), .A1(n107), .B0(n110), .Y(n109) );
  NOR2X1M U51 ( .A(n111), .B(n112), .Y(n101) );
  NOR2X1M U52 ( .A(n113), .B(n114), .Y(n100) );
  CLKXOR2X2M U53 ( .A(n115), .B(n116), .Y(n45) );
  AND2X1M U54 ( .A(A[12]), .B(B[3]), .Y(n116) );
  CLKNAND2X2M U55 ( .A(A[14]), .B(B[1]), .Y(n115) );
  XOR3XLM U56 ( .A(n117), .B(n118), .C(n119), .Y(n44) );
  CLKXOR2X2M U57 ( .A(n120), .B(n121), .Y(n119) );
  CLKNAND2X2M U58 ( .A(A[7]), .B(B[8]), .Y(n121) );
  CLKNAND2X2M U59 ( .A(A[8]), .B(B[7]), .Y(n120) );
  AOI2BB2XLM U60 ( .B0(n122), .B1(n123), .A0N(n124), .A1N(n125), .Y(n118) );
  CLKNAND2X2M U61 ( .A(n124), .B(n125), .Y(n122) );
  AOI22X1M U62 ( .A0(n126), .A1(n127), .B0(n128), .B1(n129), .Y(n117) );
  OR2X1M U63 ( .A(n129), .B(n128), .Y(n126) );
  XOR3XLM U64 ( .A(n130), .B(n131), .C(n132), .Y(n28) );
  OAI22X1M U65 ( .A0(n133), .A1(n134), .B0(n135), .B1(n136), .Y(n132) );
  AND2X1M U66 ( .A(n134), .B(n133), .Y(n136) );
  CLKNAND2X2M U67 ( .A(A[13]), .B(B[2]), .Y(n131) );
  AND2X1M U68 ( .A(A[11]), .B(B[4]), .Y(n130) );
  AOI2BB2XLM U69 ( .B0(n137), .B1(n138), .A0N(n139), .A1N(n140), .Y(n27) );
  CLKNAND2X2M U70 ( .A(n140), .B(n139), .Y(n138) );
  XNOR3X1M U71 ( .A(n53), .B(n51), .C(n50), .Y(PRODUCT[14]) );
  XOR3XLM U72 ( .A(n39), .B(n36), .C(n37), .Y(n50) );
  XNOR3X1M U73 ( .A(n135), .B(n133), .C(n134), .Y(n37) );
  XOR3XLM U74 ( .A(n63), .B(n61), .C(n60), .Y(n134) );
  XOR3XLM U75 ( .A(n137), .B(n139), .C(n140), .Y(n60) );
  XOR3XLM U76 ( .A(n127), .B(n128), .C(n129), .Y(n140) );
  XOR3XLM U77 ( .A(n123), .B(n125), .C(n124), .Y(n129) );
  XNOR3X1M U78 ( .A(n70), .B(n68), .C(n67), .Y(n124) );
  XOR3XLM U79 ( .A(n74), .B(n72), .C(n71), .Y(n67) );
  XNOR3X1M U80 ( .A(n110), .B(n108), .C(n107), .Y(n71) );
  XOR3XLM U81 ( .A(n80), .B(n77), .C(n78), .Y(n107) );
  XOR3XLM U82 ( .A(n84), .B(n81), .C(n82), .Y(n78) );
  XOR3XLM U83 ( .A(n91), .B(n90), .C(n93), .Y(n82) );
  NOR2X1M U84 ( .A(n99), .B(n96), .Y(n93) );
  XNOR2X1M U85 ( .A(n95), .B(n94), .Y(n90) );
  CLKNAND2X2M U86 ( .A(B[14]), .B(A[0]), .Y(n94) );
  CLKNAND2X2M U87 ( .A(B[13]), .B(A[1]), .Y(n95) );
  CLKNAND2X2M U88 ( .A(n141), .B(n142), .Y(n91) );
  OAI22X1M U89 ( .A0(n143), .A1(n144), .B0(n145), .B1(n146), .Y(n81) );
  AND2X1M U90 ( .A(n144), .B(n143), .Y(n146) );
  CLKNAND2X2M U91 ( .A(B[11]), .B(A[3]), .Y(n84) );
  OAI22X1M U92 ( .A0(n147), .A1(n148), .B0(n149), .B1(n150), .Y(n77) );
  AND2X1M U93 ( .A(n148), .B(n147), .Y(n150) );
  CLKNAND2X2M U94 ( .A(B[10]), .B(A[4]), .Y(n80) );
  OA21X1M U95 ( .A0(n151), .A1(n152), .B0(n153), .Y(n108) );
  OAI2BB1X1M U96 ( .A0N(n152), .A1N(n151), .B0(n154), .Y(n153) );
  CLKINVX1M U97 ( .A(n155), .Y(n151) );
  NOR2X1M U98 ( .A(n113), .B(n111), .Y(n110) );
  CLKNAND2X2M U99 ( .A(A[6]), .B(B[8]), .Y(n72) );
  OAI22X1M U100 ( .A0(n156), .A1(n157), .B0(n158), .B1(n159), .Y(n74) );
  AND2X1M U101 ( .A(n157), .B(n156), .Y(n159) );
  OAI22X1M U102 ( .A0(n160), .A1(n161), .B0(n162), .B1(n163), .Y(n68) );
  AND2X1M U103 ( .A(n161), .B(n160), .Y(n163) );
  CLKNAND2X2M U104 ( .A(A[7]), .B(B[7]), .Y(n70) );
  OAI22X1M U105 ( .A0(n164), .A1(n165), .B0(n166), .B1(n167), .Y(n125) );
  AND2X1M U106 ( .A(n165), .B(n164), .Y(n166) );
  CLKNAND2X2M U107 ( .A(A[8]), .B(B[6]), .Y(n123) );
  OA22X1M U108 ( .A0(n168), .A1(n169), .B0(n170), .B1(n171), .Y(n128) );
  AND2X1M U109 ( .A(n169), .B(n168), .Y(n170) );
  CLKNAND2X2M U110 ( .A(A[9]), .B(B[5]), .Y(n127) );
  OAI2B2X1M U111 ( .A1N(n172), .A0(n173), .B0(n174), .B1(n175), .Y(n139) );
  NOR2BX1M U112 ( .AN(n173), .B(n172), .Y(n175) );
  NOR2X1M U113 ( .A(n43), .B(n176), .Y(n137) );
  OAI22X1M U114 ( .A0(n177), .A1(n178), .B0(n179), .B1(n180), .Y(n61) );
  AND2X1M U115 ( .A(n178), .B(n177), .Y(n179) );
  AND2X1M U116 ( .A(A[11]), .B(B[3]), .Y(n63) );
  AOI2BB2XLM U117 ( .B0(n181), .B1(n182), .A0N(n183), .A1N(n184), .Y(n133) );
  NOR2X1M U118 ( .A(n182), .B(n181), .Y(n184) );
  AND2X1M U119 ( .A(A[12]), .B(B[2]), .Y(n135) );
  OAI22X1M U120 ( .A0(n185), .A1(n186), .B0(n187), .B1(n188), .Y(n36) );
  AND2X1M U121 ( .A(n186), .B(n185), .Y(n188) );
  CLKNAND2X2M U122 ( .A(A[13]), .B(B[1]), .Y(n39) );
  CLKNAND2X2M U123 ( .A(A[14]), .B(B[0]), .Y(n51) );
  OAI22X1M U124 ( .A0(n189), .A1(n190), .B0(n191), .B1(n192), .Y(n53) );
  AND2X1M U125 ( .A(n190), .B(n189), .Y(n192) );
  XOR3XLM U126 ( .A(n191), .B(n189), .C(n190), .Y(PRODUCT[13]) );
  XOR3XLM U127 ( .A(n187), .B(n185), .C(n186), .Y(n190) );
  XOR3XLM U128 ( .A(n183), .B(n181), .C(n182), .Y(n186) );
  XOR3XLM U129 ( .A(n180), .B(n178), .C(n177), .Y(n182) );
  XOR3XLM U130 ( .A(n174), .B(n173), .C(n172), .Y(n177) );
  XOR3XLM U131 ( .A(n171), .B(n169), .C(n168), .Y(n172) );
  XOR3XLM U132 ( .A(n167), .B(n165), .C(n164), .Y(n168) );
  XNOR3X1M U133 ( .A(n162), .B(n160), .C(n161), .Y(n164) );
  XOR3XLM U134 ( .A(n158), .B(n156), .C(n157), .Y(n161) );
  XOR3XLM U135 ( .A(n154), .B(n155), .C(n152), .Y(n157) );
  XOR3XLM U136 ( .A(n149), .B(n147), .C(n148), .Y(n152) );
  XOR3XLM U137 ( .A(n145), .B(n144), .C(n143), .Y(n148) );
  AND3X1M U138 ( .A(B[11]), .B(A[1]), .C(n193), .Y(n143) );
  CLKXOR2X2M U139 ( .A(n141), .B(n142), .Y(n144) );
  NOR2X1M U140 ( .A(n97), .B(n194), .Y(n142) );
  CLKINVX1M U141 ( .A(B[13]), .Y(n97) );
  NOR2BX1M U142 ( .AN(A[1]), .B(n99), .Y(n141) );
  NOR2X1M U143 ( .A(n106), .B(n96), .Y(n145) );
  OA22X1M U144 ( .A0(n195), .A1(n196), .B0(n197), .B1(n198), .Y(n147) );
  AND2X1M U145 ( .A(n196), .B(n195), .Y(n198) );
  NOR2X1M U146 ( .A(n114), .B(n98), .Y(n149) );
  OAI22X1M U147 ( .A0(n199), .A1(n200), .B0(n201), .B1(n202), .Y(n155) );
  AND2X1M U148 ( .A(n200), .B(n199), .Y(n202) );
  CLKNAND2X2M U149 ( .A(A[4]), .B(B[9]), .Y(n154) );
  OA21X1M U150 ( .A0(n203), .A1(n204), .B0(n205), .Y(n156) );
  OAI2BB1X1M U151 ( .A0N(n204), .A1N(n203), .B0(n206), .Y(n205) );
  CLKINVX1M U152 ( .A(n207), .Y(n203) );
  AND2X1M U153 ( .A(B[8]), .B(A[5]), .Y(n158) );
  NOR2BX1M U154 ( .AN(B[7]), .B(n112), .Y(n160) );
  OA22X1M U155 ( .A0(n208), .A1(n209), .B0(n210), .B1(n211), .Y(n162) );
  AND2X1M U156 ( .A(n209), .B(n208), .Y(n211) );
  OAI22X1M U157 ( .A0(n212), .A1(n213), .B0(n214), .B1(n215), .Y(n165) );
  AND2X1M U158 ( .A(n213), .B(n212), .Y(n215) );
  CLKNAND2X2M U159 ( .A(A[7]), .B(B[6]), .Y(n167) );
  OAI2B2X1M U160 ( .A1N(n216), .A0(n217), .B0(n218), .B1(n219), .Y(n169) );
  NOR2BX1M U161 ( .AN(n217), .B(n216), .Y(n219) );
  CLKNAND2X2M U162 ( .A(A[8]), .B(B[5]), .Y(n171) );
  AOI2BB2XLM U163 ( .B0(n220), .B1(n221), .A0N(n222), .A1N(n223), .Y(n173) );
  NOR2X1M U164 ( .A(n221), .B(n220), .Y(n223) );
  NOR2X1M U165 ( .A(n41), .B(n176), .Y(n174) );
  OAI22X1M U166 ( .A0(n224), .A1(n225), .B0(n226), .B1(n227), .Y(n178) );
  AND2X1M U167 ( .A(n225), .B(n224), .Y(n227) );
  CLKNAND2X2M U168 ( .A(A[10]), .B(B[3]), .Y(n180) );
  OAI2B2X1M U169 ( .A1N(n228), .A0(n229), .B0(n230), .B1(n231), .Y(n181) );
  NOR2BX1M U170 ( .AN(n229), .B(n228), .Y(n231) );
  AND2X1M U171 ( .A(A[11]), .B(B[2]), .Y(n183) );
  AOI2BB2XLM U172 ( .B0(n232), .B1(n233), .A0N(n234), .A1N(n235), .Y(n185) );
  NOR2X1M U173 ( .A(n233), .B(n232), .Y(n235) );
  AND2X1M U174 ( .A(A[12]), .B(B[1]), .Y(n187) );
  OA22X1M U175 ( .A0(n236), .A1(n237), .B0(n238), .B1(n239), .Y(n189) );
  AND2X1M U176 ( .A(n237), .B(n236), .Y(n239) );
  AND2X1M U177 ( .A(A[13]), .B(B[0]), .Y(n191) );
  XOR3XLM U178 ( .A(n238), .B(n236), .C(n237), .Y(PRODUCT[12]) );
  XOR3XLM U179 ( .A(n234), .B(n232), .C(n233), .Y(n237) );
  XOR3XLM U180 ( .A(n230), .B(n228), .C(n229), .Y(n233) );
  XOR3XLM U181 ( .A(n226), .B(n224), .C(n225), .Y(n229) );
  XOR3XLM U182 ( .A(n222), .B(n220), .C(n221), .Y(n225) );
  XOR3XLM U183 ( .A(n218), .B(n216), .C(n217), .Y(n221) );
  XOR3XLM U184 ( .A(n214), .B(n212), .C(n213), .Y(n217) );
  XOR3XLM U185 ( .A(n210), .B(n208), .C(n209), .Y(n213) );
  XOR3XLM U186 ( .A(n206), .B(n207), .C(n204), .Y(n209) );
  XOR3XLM U187 ( .A(n201), .B(n199), .C(n200), .Y(n204) );
  XOR3XLM U188 ( .A(n197), .B(n196), .C(n195), .Y(n200) );
  AND3X1M U189 ( .A(B[10]), .B(A[1]), .C(n240), .Y(n195) );
  XNOR2X1M U190 ( .A(n241), .B(n193), .Y(n196) );
  NOR2X1M U191 ( .A(n99), .B(n194), .Y(n193) );
  CLKINVX1M U192 ( .A(B[12]), .Y(n99) );
  CLKNAND2X2M U193 ( .A(B[11]), .B(A[1]), .Y(n241) );
  NOR2X1M U194 ( .A(n114), .B(n96), .Y(n197) );
  OA22X1M U195 ( .A0(n242), .A1(n243), .B0(n244), .B1(n245), .Y(n199) );
  AND2X1M U196 ( .A(n243), .B(n242), .Y(n245) );
  NOR2X1M U197 ( .A(n98), .B(n111), .Y(n201) );
  OAI22X1M U198 ( .A0(n246), .A1(n247), .B0(n248), .B1(n249), .Y(n207) );
  AND2X1M U199 ( .A(n247), .B(n246), .Y(n249) );
  CLKNAND2X2M U200 ( .A(A[4]), .B(B[8]), .Y(n206) );
  OA21X1M U201 ( .A0(n250), .A1(n251), .B0(n252), .Y(n208) );
  OAI2BB1X1M U202 ( .A0N(n251), .A1N(n250), .B0(n253), .Y(n252) );
  AND2X1M U203 ( .A(B[7]), .B(A[5]), .Y(n210) );
  NOR2X1M U204 ( .A(n112), .B(n40), .Y(n212) );
  AOI2BB2XLM U205 ( .B0(n254), .B1(n255), .A0N(n256), .A1N(n257), .Y(n214) );
  NOR2X1M U206 ( .A(n255), .B(n254), .Y(n257) );
  OAI22X1M U207 ( .A0(n258), .A1(n259), .B0(n260), .B1(n261), .Y(n216) );
  AND2X1M U208 ( .A(n259), .B(n258), .Y(n260) );
  AND2X1M U209 ( .A(A[7]), .B(B[5]), .Y(n218) );
  OAI21X1M U210 ( .A0(n262), .A1(n263), .B0(n264), .Y(n220) );
  OAI2BB1X1M U211 ( .A0N(n262), .A1N(n263), .B0(n265), .Y(n264) );
  AND2X1M U212 ( .A(A[8]), .B(B[4]), .Y(n222) );
  AOI2BB2XLM U213 ( .B0(n266), .B1(n267), .A0N(n268), .A1N(n269), .Y(n224) );
  NOR2X1M U214 ( .A(n266), .B(n267), .Y(n269) );
  NOR2X1M U215 ( .A(n41), .B(n270), .Y(n226) );
  CLKINVX1M U216 ( .A(A[9]), .Y(n41) );
  OAI2B2X1M U217 ( .A1N(n271), .A0(n272), .B0(n273), .B1(n274), .Y(n228) );
  NOR2BX1M U218 ( .AN(n272), .B(n271), .Y(n274) );
  AND2X1M U219 ( .A(B[2]), .B(A[10]), .Y(n230) );
  OAI2BB2X1M U220 ( .B0(n275), .B1(n276), .A0N(n277), .A1N(n278), .Y(n232) );
  NOR2X1M U221 ( .A(n278), .B(n277), .Y(n276) );
  AND2X1M U222 ( .A(A[11]), .B(B[1]), .Y(n234) );
  AND2X1M U223 ( .A(A[12]), .B(B[0]), .Y(n236) );
  AOI2BB2XLM U224 ( .B0(n279), .B1(n280), .A0N(n281), .A1N(n282), .Y(n238) );
  NOR2X1M U225 ( .A(n280), .B(n279), .Y(n282) );
  XOR3XLM U226 ( .A(n281), .B(n279), .C(n280), .Y(PRODUCT[11]) );
  XNOR3X1M U227 ( .A(n275), .B(n277), .C(n278), .Y(n280) );
  XOR3XLM U228 ( .A(n273), .B(n271), .C(n272), .Y(n278) );
  XOR3XLM U229 ( .A(n268), .B(n266), .C(n267), .Y(n272) );
  XOR3XLM U230 ( .A(n265), .B(n262), .C(n263), .Y(n267) );
  XOR3XLM U231 ( .A(n261), .B(n258), .C(n259), .Y(n263) );
  XOR3XLM U232 ( .A(n256), .B(n254), .C(n255), .Y(n259) );
  XOR3XLM U233 ( .A(n253), .B(n250), .C(n251), .Y(n255) );
  XOR3XLM U234 ( .A(n248), .B(n246), .C(n247), .Y(n251) );
  XOR3XLM U235 ( .A(n244), .B(n243), .C(n242), .Y(n247) );
  AND3X1M U236 ( .A(A[1]), .B(B[9]), .C(n283), .Y(n242) );
  XNOR2X1M U237 ( .A(n284), .B(n240), .Y(n243) );
  NOR2X1M U238 ( .A(n106), .B(n194), .Y(n240) );
  CLKINVX1M U239 ( .A(B[11]), .Y(n106) );
  CLKNAND2X2M U240 ( .A(B[10]), .B(A[1]), .Y(n284) );
  NOR2X1M U241 ( .A(n96), .B(n111), .Y(n244) );
  OA22X1M U242 ( .A0(n285), .A1(n286), .B0(n287), .B1(n288), .Y(n246) );
  AND2X1M U243 ( .A(n286), .B(n285), .Y(n288) );
  AND2X1M U244 ( .A(B[8]), .B(A[3]), .Y(n248) );
  AOI2BB2XLM U245 ( .B0(n289), .B1(n290), .A0N(n291), .A1N(n292), .Y(n250) );
  NOR2X1M U246 ( .A(n290), .B(n289), .Y(n292) );
  CLKNAND2X2M U247 ( .A(A[4]), .B(B[7]), .Y(n253) );
  OAI21X1M U248 ( .A0(n293), .A1(n294), .B0(n295), .Y(n254) );
  AO21XLM U249 ( .A0(n294), .A1(n293), .B0(n296), .Y(n295) );
  NOR2X1M U250 ( .A(n113), .B(n40), .Y(n256) );
  NOR2X1M U251 ( .A(n112), .B(n42), .Y(n258) );
  OAI2B2X1M U252 ( .A1N(n297), .A0(n298), .B0(n299), .B1(n300), .Y(n261) );
  AND2X1M U253 ( .A(n300), .B(n299), .Y(n298) );
  OA22X1M U254 ( .A0(n301), .A1(n302), .B0(n303), .B1(n304), .Y(n262) );
  AND2X1M U255 ( .A(n302), .B(n301), .Y(n304) );
  CLKNAND2X2M U256 ( .A(A[7]), .B(B[4]), .Y(n265) );
  OAI22X1M U257 ( .A0(n305), .A1(n306), .B0(n307), .B1(n308), .Y(n266) );
  AND2X1M U258 ( .A(n306), .B(n305), .Y(n308) );
  AND2X1M U259 ( .A(A[8]), .B(B[3]), .Y(n268) );
  OAI2B2X1M U260 ( .A1N(n309), .A0(n310), .B0(n311), .B1(n312), .Y(n271) );
  NOR2BX1M U261 ( .AN(n310), .B(n309), .Y(n312) );
  AND2X1M U262 ( .A(B[2]), .B(A[9]), .Y(n273) );
  OAI2BB2X1M U263 ( .B0(n313), .B1(n314), .A0N(n315), .A1N(n316), .Y(n277) );
  NOR2X1M U264 ( .A(n316), .B(n315), .Y(n314) );
  AND2X1M U265 ( .A(B[1]), .B(A[10]), .Y(n275) );
  OAI22X1M U266 ( .A0(n317), .A1(n318), .B0(n319), .B1(n320), .Y(n279) );
  AND2X1M U267 ( .A(n318), .B(n317), .Y(n320) );
  AND2X1M U268 ( .A(A[11]), .B(B[0]), .Y(n281) );
  XOR3XLM U269 ( .A(n319), .B(n317), .C(n318), .Y(PRODUCT[10]) );
  XOR3XLM U270 ( .A(n313), .B(n315), .C(n316), .Y(n318) );
  XOR3XLM U271 ( .A(n311), .B(n309), .C(n310), .Y(n316) );
  XOR3XLM U272 ( .A(n307), .B(n305), .C(n306), .Y(n310) );
  XOR3XLM U273 ( .A(n303), .B(n301), .C(n302), .Y(n306) );
  XOR3XLM U274 ( .A(n297), .B(n300), .C(n299), .Y(n302) );
  XNOR3X1M U275 ( .A(n296), .B(n293), .C(n294), .Y(n299) );
  XOR3XLM U276 ( .A(n291), .B(n289), .C(n290), .Y(n294) );
  XNOR3X1M U277 ( .A(n287), .B(n286), .C(n285), .Y(n290) );
  AND3X1M U278 ( .A(B[8]), .B(A[1]), .C(n321), .Y(n285) );
  XNOR2X1M U279 ( .A(n322), .B(n283), .Y(n286) );
  NOR2X1M U280 ( .A(n114), .B(n194), .Y(n283) );
  CLKINVX1M U281 ( .A(B[10]), .Y(n114) );
  CLKNAND2X2M U282 ( .A(A[1]), .B(B[9]), .Y(n322) );
  AND2X1M U283 ( .A(B[8]), .B(A[2]), .Y(n287) );
  OAI22X1M U284 ( .A0(n323), .A1(n324), .B0(n325), .B1(n326), .Y(n289) );
  AND2X1M U285 ( .A(n324), .B(n323), .Y(n326) );
  AND2X1M U286 ( .A(B[7]), .B(A[3]), .Y(n291) );
  OA22X1M U287 ( .A0(n327), .A1(n328), .B0(n329), .B1(n330), .Y(n293) );
  AND2X1M U288 ( .A(n328), .B(n327), .Y(n330) );
  NOR2X1M U289 ( .A(n105), .B(n40), .Y(n296) );
  CLKINVX1M U290 ( .A(A[4]), .Y(n105) );
  OAI21X1M U291 ( .A0(n331), .A1(n332), .B0(n333), .Y(n300) );
  OAI2BB1X1M U292 ( .A0N(n332), .A1N(n331), .B0(n334), .Y(n333) );
  CLKINVX1M U293 ( .A(n335), .Y(n331) );
  NOR2X1M U294 ( .A(n113), .B(n42), .Y(n297) );
  NOR2X1M U295 ( .A(n112), .B(n176), .Y(n301) );
  OA22X1M U296 ( .A0(n336), .A1(n337), .B0(n338), .B1(n339), .Y(n303) );
  AND2X1M U297 ( .A(n337), .B(n336), .Y(n339) );
  OA22X1M U298 ( .A0(n340), .A1(n341), .B0(n342), .B1(n343), .Y(n305) );
  AND2X1M U299 ( .A(n341), .B(n340), .Y(n343) );
  AND2X1M U300 ( .A(A[7]), .B(B[3]), .Y(n307) );
  OAI22X1M U301 ( .A0(n344), .A1(n345), .B0(n346), .B1(n347), .Y(n309) );
  AND2X1M U302 ( .A(n345), .B(n344), .Y(n347) );
  AND2X1M U303 ( .A(A[8]), .B(B[2]), .Y(n311) );
  OAI22X1M U304 ( .A0(n348), .A1(n349), .B0(n350), .B1(n351), .Y(n315) );
  AND2X1M U305 ( .A(n349), .B(n348), .Y(n351) );
  AND2X1M U306 ( .A(B[1]), .B(A[9]), .Y(n313) );
  NOR2BX1M U307 ( .AN(B[0]), .B(n43), .Y(n317) );
  CLKINVX1M U308 ( .A(A[10]), .Y(n43) );
  AOI2BB2XLM U309 ( .B0(n2), .B1(n3), .A0N(n352), .A1N(n1), .Y(n319) );
  OAI2BB2X1M U310 ( .B0(n353), .B1(n4), .A0N(n6), .A1N(n354), .Y(n1) );
  OAI22X1M U311 ( .A0(n9), .A1(n8), .B0(n7), .B1(n355), .Y(n4) );
  AND2X1M U312 ( .A(n8), .B(n9), .Y(n355) );
  AND2X1M U313 ( .A(B[0]), .B(A[7]), .Y(n7) );
  OAI22X1M U314 ( .A0(n12), .A1(n11), .B0(n10), .B1(n356), .Y(n8) );
  AND2X1M U315 ( .A(n11), .B(n12), .Y(n356) );
  AOI2BB2XLM U316 ( .B0(n15), .B1(n357), .A0N(n13), .A1N(n358), .Y(n10) );
  NOR2X1M U317 ( .A(n357), .B(n15), .Y(n358) );
  OA21X1M U318 ( .A0(n18), .A1(n17), .B0(n359), .Y(n13) );
  OAI2BB1X1M U319 ( .A0N(n17), .A1N(n18), .B0(n16), .Y(n359) );
  OAI2BB1X1M U320 ( .A0N(n20), .A1N(n19), .B0(n360), .Y(n16) );
  OAI21X1M U321 ( .A0(n19), .A1(n20), .B0(n21), .Y(n360) );
  OAI2BB2X1M U322 ( .B0(n361), .B1(n22), .A0N(n24), .A1N(n362), .Y(n21) );
  CLKNAND2X2M U323 ( .A(PRODUCT[0]), .B(n363), .Y(n22) );
  NOR2X1M U324 ( .A(n362), .B(n24), .Y(n361) );
  CLKXOR2X2M U325 ( .A(n363), .B(n364), .Y(n24) );
  AND2X1M U326 ( .A(B[1]), .B(A[1]), .Y(n363) );
  CLKINVX1M U327 ( .A(n23), .Y(n362) );
  CLKNAND2X2M U328 ( .A(B[0]), .B(A[2]), .Y(n23) );
  NOR2BX1M U329 ( .AN(B[0]), .B(n98), .Y(n19) );
  XOR3XLM U330 ( .A(n365), .B(n366), .C(n367), .Y(n20) );
  CLKNAND2X2M U331 ( .A(B[0]), .B(A[4]), .Y(n17) );
  XNOR3X1M U332 ( .A(n368), .B(n369), .C(n370), .Y(n18) );
  CLKINVX1M U333 ( .A(n14), .Y(n357) );
  CLKNAND2X2M U334 ( .A(B[0]), .B(A[5]), .Y(n14) );
  XOR3XLM U335 ( .A(n371), .B(n372), .C(n373), .Y(n15) );
  CLKNAND2X2M U336 ( .A(B[0]), .B(A[6]), .Y(n11) );
  XOR3XLM U337 ( .A(n374), .B(n375), .C(n376), .Y(n12) );
  XOR3XLM U338 ( .A(n377), .B(n378), .C(n379), .Y(n9) );
  NOR2X1M U339 ( .A(n354), .B(n6), .Y(n353) );
  XOR3XLM U340 ( .A(n380), .B(n381), .C(n382), .Y(n6) );
  CLKINVX1M U341 ( .A(n5), .Y(n354) );
  CLKNAND2X2M U342 ( .A(B[0]), .B(A[8]), .Y(n5) );
  NOR2X1M U343 ( .A(n3), .B(n2), .Y(n352) );
  XNOR3X1M U344 ( .A(n350), .B(n348), .C(n349), .Y(n3) );
  XOR3XLM U345 ( .A(n346), .B(n344), .C(n345), .Y(n349) );
  XOR3XLM U346 ( .A(n342), .B(n340), .C(n341), .Y(n345) );
  XOR3XLM U347 ( .A(n338), .B(n336), .C(n337), .Y(n341) );
  XOR3XLM U348 ( .A(n334), .B(n335), .C(n332), .Y(n337) );
  XOR3XLM U349 ( .A(n329), .B(n327), .C(n328), .Y(n332) );
  XOR3XLM U350 ( .A(n325), .B(n324), .C(n323), .Y(n328) );
  AND3X1M U351 ( .A(B[7]), .B(A[1]), .C(n383), .Y(n323) );
  XNOR2X1M U352 ( .A(n384), .B(n321), .Y(n324) );
  NOR2X1M U353 ( .A(n111), .B(n194), .Y(n321) );
  CLKINVX1M U354 ( .A(B[9]), .Y(n111) );
  CLKNAND2X2M U355 ( .A(B[8]), .B(A[1]), .Y(n384) );
  AND2X1M U356 ( .A(B[7]), .B(A[2]), .Y(n325) );
  OA22X1M U357 ( .A0(n385), .A1(n386), .B0(n387), .B1(n388), .Y(n327) );
  AND2X1M U358 ( .A(n386), .B(n385), .Y(n388) );
  NOR2X1M U359 ( .A(n40), .B(n98), .Y(n329) );
  OAI22X1M U360 ( .A0(n389), .A1(n390), .B0(n391), .B1(n392), .Y(n335) );
  AND2X1M U361 ( .A(n390), .B(n389), .Y(n392) );
  CLKNAND2X2M U362 ( .A(B[5]), .B(A[4]), .Y(n334) );
  OA21X1M U363 ( .A0(n393), .A1(n394), .B0(n395), .Y(n336) );
  OAI2BB1X1M U364 ( .A0N(n394), .A1N(n393), .B0(n396), .Y(n395) );
  CLKINVX1M U365 ( .A(n397), .Y(n393) );
  NOR2X1M U366 ( .A(n176), .B(n113), .Y(n338) );
  NOR2X1M U367 ( .A(n112), .B(n270), .Y(n340) );
  OA22X1M U368 ( .A0(n398), .A1(n399), .B0(n400), .B1(n401), .Y(n342) );
  AND2X1M U369 ( .A(n399), .B(n398), .Y(n401) );
  OA22X1M U370 ( .A0(n402), .A1(n403), .B0(n404), .B1(n405), .Y(n344) );
  AND2X1M U371 ( .A(n403), .B(n402), .Y(n405) );
  AND2X1M U372 ( .A(B[2]), .B(A[7]), .Y(n346) );
  OA22X1M U373 ( .A0(n381), .A1(n382), .B0(n380), .B1(n406), .Y(n348) );
  AND2X1M U374 ( .A(n382), .B(n381), .Y(n406) );
  AND2X1M U375 ( .A(B[1]), .B(A[7]), .Y(n380) );
  XOR3XLM U376 ( .A(n404), .B(n402), .C(n403), .Y(n382) );
  XOR3XLM U377 ( .A(n400), .B(n398), .C(n399), .Y(n403) );
  XOR3XLM U378 ( .A(n396), .B(n397), .C(n394), .Y(n399) );
  XOR3XLM U379 ( .A(n391), .B(n389), .C(n390), .Y(n394) );
  XOR3XLM U380 ( .A(n387), .B(n386), .C(n385), .Y(n390) );
  AND3X1M U381 ( .A(B[6]), .B(A[1]), .C(n407), .Y(n385) );
  XNOR2X1M U382 ( .A(n408), .B(n383), .Y(n386) );
  AND2X1M U383 ( .A(B[8]), .B(A[0]), .Y(n383) );
  CLKNAND2X2M U384 ( .A(B[7]), .B(A[1]), .Y(n408) );
  NOR2X1M U385 ( .A(n40), .B(n96), .Y(n387) );
  OA22X1M U386 ( .A0(n409), .A1(n410), .B0(n411), .B1(n412), .Y(n389) );
  AND2X1M U387 ( .A(n410), .B(n409), .Y(n412) );
  NOR2X1M U388 ( .A(n42), .B(n98), .Y(n391) );
  OAI22X1M U389 ( .A0(n413), .A1(n414), .B0(n415), .B1(n416), .Y(n397) );
  AND2X1M U390 ( .A(n414), .B(n413), .Y(n416) );
  CLKNAND2X2M U391 ( .A(B[4]), .B(A[4]), .Y(n396) );
  OA21X1M U392 ( .A0(n417), .A1(n418), .B0(n419), .Y(n398) );
  OAI2BB1X1M U393 ( .A0N(n418), .A1N(n417), .B0(n420), .Y(n419) );
  CLKINVX1M U394 ( .A(n421), .Y(n417) );
  NOR2X1M U395 ( .A(n270), .B(n113), .Y(n400) );
  CLKINVX1M U396 ( .A(A[5]), .Y(n113) );
  NOR2BX1M U397 ( .AN(B[2]), .B(n112), .Y(n402) );
  CLKINVX1M U398 ( .A(A[6]), .Y(n112) );
  OA22X1M U399 ( .A0(n422), .A1(n423), .B0(n424), .B1(n425), .Y(n404) );
  AND2X1M U400 ( .A(n423), .B(n422), .Y(n425) );
  AOI2BB2XLM U401 ( .B0(n378), .B1(n379), .A0N(n377), .A1N(n426), .Y(n381) );
  NOR2X1M U402 ( .A(n379), .B(n378), .Y(n426) );
  AOI21BX1M U403 ( .A0(n374), .A1(n375), .B0N(n427), .Y(n377) );
  OAI21X1M U404 ( .A0(n375), .A1(n374), .B0(n376), .Y(n427) );
  XOR3XLM U405 ( .A(n428), .B(n429), .C(n430), .Y(n376) );
  OAI2BB2X1M U406 ( .B0(n431), .B1(n373), .A0N(n371), .A1N(n372), .Y(n375) );
  XOR3XLM U407 ( .A(n432), .B(n433), .C(n434), .Y(n373) );
  NOR2X1M U408 ( .A(n372), .B(n371), .Y(n431) );
  CLKNAND2X2M U409 ( .A(B[1]), .B(A[4]), .Y(n371) );
  OAI2BB2X1M U410 ( .B0(n435), .B1(n370), .A0N(n368), .A1N(n369), .Y(n372) );
  XOR3XLM U411 ( .A(n436), .B(n437), .C(n438), .Y(n370) );
  NOR2X1M U412 ( .A(n369), .B(n368), .Y(n435) );
  CLKNAND2X2M U413 ( .A(B[1]), .B(A[3]), .Y(n368) );
  OAI22X1M U414 ( .A0(n365), .A1(n367), .B0(n439), .B1(n366), .Y(n369) );
  XNOR2X1M U415 ( .A(n440), .B(n441), .Y(n366) );
  NOR2X1M U416 ( .A(n194), .B(n270), .Y(n441) );
  AND2X1M U417 ( .A(n367), .B(n365), .Y(n439) );
  NOR2BX1M U418 ( .AN(B[1]), .B(n96), .Y(n367) );
  NOR2X1M U419 ( .A(n440), .B(n25), .Y(n365) );
  CLKNAND2X2M U420 ( .A(B[1]), .B(A[0]), .Y(n25) );
  CLKNAND2X2M U421 ( .A(B[2]), .B(A[1]), .Y(n440) );
  CLKNAND2X2M U422 ( .A(B[1]), .B(A[5]), .Y(n374) );
  XNOR3X1M U423 ( .A(n424), .B(n422), .C(n423), .Y(n379) );
  XOR3XLM U424 ( .A(n420), .B(n421), .C(n418), .Y(n423) );
  XOR3XLM U425 ( .A(n415), .B(n413), .C(n414), .Y(n418) );
  XOR3XLM U426 ( .A(n411), .B(n410), .C(n409), .Y(n414) );
  AND3X1M U427 ( .A(B[5]), .B(A[1]), .C(n442), .Y(n409) );
  XNOR2X1M U428 ( .A(n443), .B(n407), .Y(n410) );
  AND2X1M U429 ( .A(B[7]), .B(A[0]), .Y(n407) );
  CLKNAND2X2M U430 ( .A(B[6]), .B(A[1]), .Y(n443) );
  NOR2X1M U431 ( .A(n42), .B(n96), .Y(n411) );
  OA22X1M U432 ( .A0(n444), .A1(n445), .B0(n446), .B1(n447), .Y(n413) );
  AND2X1M U433 ( .A(n445), .B(n444), .Y(n447) );
  NOR2X1M U434 ( .A(n176), .B(n98), .Y(n415) );
  OAI22X1M U435 ( .A0(n448), .A1(n449), .B0(n450), .B1(n451), .Y(n421) );
  AND2X1M U436 ( .A(n449), .B(n448), .Y(n451) );
  CLKNAND2X2M U437 ( .A(B[3]), .B(A[4]), .Y(n420) );
  AOI21BX1M U438 ( .A0(n429), .A1(n430), .B0N(n452), .Y(n422) );
  OAI21X1M U439 ( .A0(n430), .A1(n429), .B0(n428), .Y(n452) );
  CLKNAND2X2M U440 ( .A(B[2]), .B(A[4]), .Y(n428) );
  XNOR3X1M U441 ( .A(n450), .B(n448), .C(n449), .Y(n430) );
  XOR3XLM U442 ( .A(n446), .B(n445), .C(n444), .Y(n449) );
  AND3X1M U443 ( .A(B[4]), .B(A[1]), .C(n453), .Y(n444) );
  XNOR2X1M U444 ( .A(n454), .B(n442), .Y(n445) );
  NOR2X1M U445 ( .A(n40), .B(n194), .Y(n442) );
  CLKINVX1M U446 ( .A(B[6]), .Y(n40) );
  CLKNAND2X2M U447 ( .A(B[5]), .B(A[1]), .Y(n454) );
  NOR2X1M U448 ( .A(n176), .B(n96), .Y(n446) );
  AOI2BB2XLM U449 ( .B0(n455), .B1(n456), .A0N(n457), .A1N(n458), .Y(n448) );
  NOR2X1M U450 ( .A(n456), .B(n455), .Y(n458) );
  NOR2X1M U451 ( .A(n270), .B(n98), .Y(n450) );
  OAI22X1M U452 ( .A0(n432), .A1(n433), .B0(n459), .B1(n434), .Y(n429) );
  XOR3XLM U453 ( .A(n455), .B(n456), .C(n457), .Y(n434) );
  NOR2X1M U454 ( .A(n270), .B(n96), .Y(n457) );
  CLKINVX1M U455 ( .A(A[2]), .Y(n96) );
  CLKINVX1M U456 ( .A(B[3]), .Y(n270) );
  CLKXOR2X2M U457 ( .A(n460), .B(n453), .Y(n456) );
  NOR2X1M U458 ( .A(n42), .B(n194), .Y(n453) );
  CLKINVX1M U459 ( .A(B[5]), .Y(n42) );
  CLKNAND2X2M U460 ( .A(B[4]), .B(A[1]), .Y(n460) );
  CLKNAND2X2M U461 ( .A(n461), .B(n462), .Y(n455) );
  AND2X1M U462 ( .A(n433), .B(n432), .Y(n459) );
  AOI2BB2XLM U463 ( .B0(n436), .B1(n438), .A0N(n463), .A1N(n437), .Y(n433) );
  CLKXOR2X2M U464 ( .A(n461), .B(n462), .Y(n437) );
  NOR2X1M U465 ( .A(n176), .B(n194), .Y(n462) );
  CLKINVX1M U466 ( .A(A[0]), .Y(n194) );
  CLKINVX1M U467 ( .A(B[4]), .Y(n176) );
  NOR2X1M U468 ( .A(n438), .B(n436), .Y(n463) );
  CLKNAND2X2M U469 ( .A(B[2]), .B(A[2]), .Y(n438) );
  CLKNAND2X2M U470 ( .A(n364), .B(n461), .Y(n436) );
  AND2X1M U471 ( .A(A[1]), .B(B[3]), .Y(n461) );
  AND2X1M U472 ( .A(B[2]), .B(A[0]), .Y(n364) );
  NOR2BX1M U473 ( .AN(B[2]), .B(n98), .Y(n432) );
  CLKINVX1M U474 ( .A(A[3]), .Y(n98) );
  AND2X1M U475 ( .A(B[2]), .B(A[5]), .Y(n424) );
  CLKNAND2X2M U476 ( .A(B[1]), .B(A[6]), .Y(n378) );
  AND2X1M U477 ( .A(B[1]), .B(A[8]), .Y(n350) );
  CLKNAND2X2M U478 ( .A(A[9]), .B(B[0]), .Y(n2) );
  AND2X1M U479 ( .A(B[0]), .B(A[0]), .Y(PRODUCT[0]) );
endmodule


module ALU ( A, B, ALU_FUN, CLK, RST, Arith_Flag, Logic_Flag, CMP_Flag, 
        Shift_Flag, ALU_OUT );
  input [15:0] A;
  input [15:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, RST;
  output Arith_Flag, Logic_Flag, CMP_Flag, Shift_Flag;
  wire   \U3/U1/Z_0 , N142, N141, N140, N139, N138, N137, N136, N135, N134,
         N133, N132, N131, N130, N129, N128, N127, N225, N224, N223, N174,
         N173, N172, N171, N170, N169, N168, N167, N166, N165, N164, N163,
         N162, N161, N160, N159, N158, N157, N156, N155, N154, N153, N152,
         N151, N150, N149, N148, N147, N146, N145, N144, N143, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338;
  wire   [15:0] ALU_OUT_Comb;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15;

  ALU_DW01_addsub_0 r92 ( .A(A), .B(B), .CI(1'b0), .ADD_SUB(\U3/U1/Z_0 ), 
        .SUM({N142, N141, N140, N139, N138, N137, N136, N135, N134, N133, N132, 
        N131, N130, N129, N128, N127}) );
  ALU_DW01_cmp6_0 r86 ( .A(A), .B(B), .TC(1'b0), .LT(N225), .GT(N224), .EQ(
        N223) );
  ALU_DW_div_uns_0 div_49 ( .a(A), .b(B), .quotient({N174, N173, N172, N171, 
        N170, N169, N168, N167, N166, N165, N164, N163, N162, N161, N160, N159}) );
  ALU_DW02_mult_0 mult_45 ( .A(A), .B(B), .TC(1'b0), .PRODUCT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, N158, N157, N156, 
        N155, N154, N153, N152, N151, N150, N149, N148, N147, N146, N145, N144, 
        N143}) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  NAND3X2M U183 ( .A(n330), .B(n329), .C(n323), .Y(n165) );
  NOR2X2M U184 ( .A(n161), .B(n162), .Y(\U3/U1/Z_0 ) );
  NAND3X2M U185 ( .A(n329), .B(n328), .C(n330), .Y(n161) );
  CLKNAND2X2M U186 ( .A(n163), .B(n164), .Y(Shift_Flag) );
  NAND3X1M U187 ( .A(n165), .B(n166), .C(n167), .Y(Logic_Flag) );
  OAI2BB2X1M U188 ( .B0(n168), .B1(n169), .A0N(ALU_FUN[3]), .A1N(n170), .Y(
        CMP_Flag) );
  NAND3X1M U189 ( .A(n171), .B(n161), .C(n172), .Y(Arith_Flag) );
  NAND3X1M U190 ( .A(n173), .B(n174), .C(n175), .Y(ALU_OUT_Comb[9]) );
  AOI211X1M U191 ( .A0(N152), .A1(n176), .B0(n177), .C0(n178), .Y(n175) );
  MXI2X1M U192 ( .A(n179), .B(n180), .S0(A[9]), .Y(n178) );
  MXI2X1M U193 ( .A(n181), .B(n182), .S0(B[9]), .Y(n177) );
  NOR2X1M U194 ( .A(n183), .B(n184), .Y(n182) );
  MXI2X1M U195 ( .A(n165), .B(n167), .S0(A[9]), .Y(n184) );
  NOR2X1M U196 ( .A(n185), .B(n186), .Y(n181) );
  MXI2X1M U197 ( .A(n187), .B(n165), .S0(A[9]), .Y(n186) );
  AOI22X1M U198 ( .A0(A[8]), .A1(n188), .B0(N136), .B1(n189), .Y(n174) );
  AOI22X1M U199 ( .A0(N168), .A1(n190), .B0(A[10]), .B1(n191), .Y(n173) );
  NAND3X1M U200 ( .A(n192), .B(n193), .C(n194), .Y(ALU_OUT_Comb[8]) );
  AOI211X1M U201 ( .A0(N151), .A1(n176), .B0(n195), .C0(n196), .Y(n194) );
  MXI2X1M U202 ( .A(n179), .B(n180), .S0(A[8]), .Y(n196) );
  MXI2X1M U203 ( .A(n197), .B(n198), .S0(B[8]), .Y(n195) );
  NOR2X1M U204 ( .A(n183), .B(n199), .Y(n198) );
  MXI2X1M U205 ( .A(n165), .B(n167), .S0(A[8]), .Y(n199) );
  NOR2X1M U206 ( .A(n185), .B(n200), .Y(n197) );
  MXI2X1M U207 ( .A(n187), .B(n165), .S0(A[8]), .Y(n200) );
  AOI22X1M U208 ( .A0(A[7]), .A1(n188), .B0(N135), .B1(n189), .Y(n193) );
  AOI22X1M U209 ( .A0(N167), .A1(n190), .B0(A[9]), .B1(n191), .Y(n192) );
  NAND3X1M U210 ( .A(n201), .B(n202), .C(n203), .Y(ALU_OUT_Comb[7]) );
  AOI211X1M U211 ( .A0(N150), .A1(n176), .B0(n204), .C0(n205), .Y(n203) );
  MXI2X1M U212 ( .A(n179), .B(n180), .S0(A[7]), .Y(n205) );
  MXI2X1M U213 ( .A(n206), .B(n207), .S0(B[7]), .Y(n204) );
  NOR2X1M U214 ( .A(n183), .B(n208), .Y(n207) );
  MXI2X1M U215 ( .A(n165), .B(n167), .S0(A[7]), .Y(n208) );
  NOR2X1M U216 ( .A(n185), .B(n209), .Y(n206) );
  MXI2X1M U217 ( .A(n187), .B(n165), .S0(A[7]), .Y(n209) );
  AOI22X1M U218 ( .A0(A[6]), .A1(n188), .B0(N134), .B1(n189), .Y(n202) );
  AOI22X1M U219 ( .A0(N166), .A1(n190), .B0(n191), .B1(A[8]), .Y(n201) );
  NAND3X1M U220 ( .A(n210), .B(n211), .C(n212), .Y(ALU_OUT_Comb[6]) );
  AOI211X1M U221 ( .A0(N149), .A1(n176), .B0(n213), .C0(n214), .Y(n212) );
  MXI2X1M U222 ( .A(n179), .B(n180), .S0(A[6]), .Y(n214) );
  MXI2X1M U223 ( .A(n215), .B(n216), .S0(B[6]), .Y(n213) );
  NOR2X1M U224 ( .A(n183), .B(n217), .Y(n216) );
  MXI2X1M U225 ( .A(n165), .B(n167), .S0(A[6]), .Y(n217) );
  NOR2X1M U226 ( .A(n185), .B(n218), .Y(n215) );
  MXI2X1M U227 ( .A(n187), .B(n165), .S0(A[6]), .Y(n218) );
  AOI22X1M U228 ( .A0(A[5]), .A1(n188), .B0(N133), .B1(n189), .Y(n211) );
  AOI22X1M U229 ( .A0(N165), .A1(n190), .B0(A[7]), .B1(n191), .Y(n210) );
  NAND3X1M U230 ( .A(n219), .B(n220), .C(n221), .Y(ALU_OUT_Comb[5]) );
  AOI211X1M U231 ( .A0(N148), .A1(n176), .B0(n222), .C0(n223), .Y(n221) );
  MXI2X1M U232 ( .A(n179), .B(n180), .S0(A[5]), .Y(n223) );
  MXI2X1M U233 ( .A(n224), .B(n225), .S0(B[5]), .Y(n222) );
  NOR2X1M U234 ( .A(n183), .B(n226), .Y(n225) );
  MXI2X1M U235 ( .A(n165), .B(n167), .S0(A[5]), .Y(n226) );
  NOR2X1M U236 ( .A(n185), .B(n227), .Y(n224) );
  MXI2X1M U237 ( .A(n187), .B(n165), .S0(A[5]), .Y(n227) );
  AOI22X1M U238 ( .A0(A[4]), .A1(n188), .B0(N132), .B1(n189), .Y(n220) );
  AOI22X1M U239 ( .A0(N164), .A1(n190), .B0(A[6]), .B1(n191), .Y(n219) );
  NAND3X1M U240 ( .A(n228), .B(n229), .C(n230), .Y(ALU_OUT_Comb[4]) );
  AOI211X1M U241 ( .A0(N147), .A1(n176), .B0(n231), .C0(n232), .Y(n230) );
  MXI2X1M U242 ( .A(n179), .B(n180), .S0(A[4]), .Y(n232) );
  MXI2X1M U243 ( .A(n233), .B(n234), .S0(B[4]), .Y(n231) );
  NOR2X1M U244 ( .A(n183), .B(n235), .Y(n234) );
  MXI2X1M U245 ( .A(n165), .B(n167), .S0(A[4]), .Y(n235) );
  NOR2X1M U246 ( .A(n185), .B(n236), .Y(n233) );
  MXI2X1M U247 ( .A(n187), .B(n165), .S0(A[4]), .Y(n236) );
  AOI22X1M U248 ( .A0(A[3]), .A1(n188), .B0(N131), .B1(n189), .Y(n229) );
  AOI22X1M U249 ( .A0(N163), .A1(n190), .B0(A[5]), .B1(n191), .Y(n228) );
  NAND3X1M U250 ( .A(n237), .B(n238), .C(n239), .Y(ALU_OUT_Comb[3]) );
  AOI211X1M U251 ( .A0(N146), .A1(n176), .B0(n240), .C0(n241), .Y(n239) );
  MXI2X1M U252 ( .A(n179), .B(n180), .S0(A[3]), .Y(n241) );
  MXI2X1M U253 ( .A(n242), .B(n243), .S0(B[3]), .Y(n240) );
  NOR2X1M U254 ( .A(n183), .B(n244), .Y(n243) );
  MXI2X1M U255 ( .A(n165), .B(n167), .S0(A[3]), .Y(n244) );
  NOR2X1M U256 ( .A(n185), .B(n245), .Y(n242) );
  MXI2X1M U257 ( .A(n187), .B(n165), .S0(A[3]), .Y(n245) );
  AOI22X1M U258 ( .A0(A[2]), .A1(n188), .B0(N130), .B1(n189), .Y(n238) );
  AOI22X1M U259 ( .A0(N162), .A1(n190), .B0(A[4]), .B1(n191), .Y(n237) );
  NAND3X1M U260 ( .A(n246), .B(n247), .C(n248), .Y(ALU_OUT_Comb[2]) );
  AOI211X1M U261 ( .A0(N145), .A1(n176), .B0(n249), .C0(n250), .Y(n248) );
  MXI2X1M U262 ( .A(n179), .B(n180), .S0(A[2]), .Y(n250) );
  MXI2X1M U263 ( .A(n251), .B(n252), .S0(B[2]), .Y(n249) );
  NOR2X1M U264 ( .A(n183), .B(n253), .Y(n252) );
  MXI2X1M U265 ( .A(n165), .B(n167), .S0(A[2]), .Y(n253) );
  NOR2X1M U266 ( .A(n185), .B(n254), .Y(n251) );
  MXI2X1M U267 ( .A(n187), .B(n165), .S0(A[2]), .Y(n254) );
  AOI22X1M U268 ( .A0(A[1]), .A1(n188), .B0(N129), .B1(n189), .Y(n247) );
  AOI22X1M U269 ( .A0(N161), .A1(n190), .B0(A[3]), .B1(n191), .Y(n246) );
  NAND4X1M U270 ( .A(n255), .B(n256), .C(n257), .D(n258), .Y(ALU_OUT_Comb[1])
         );
  AOI221XLM U271 ( .A0(N128), .A1(n189), .B0(N160), .B1(n190), .C0(n259), .Y(
        n258) );
  OAI2B11X1M U272 ( .A1N(A[0]), .A0(n164), .B0(n260), .C0(n261), .Y(n259) );
  CLKINVX1M U273 ( .A(n262), .Y(n261) );
  NAND4X1M U274 ( .A(N224), .B(n170), .C(ALU_FUN[3]), .D(ALU_FUN[0]), .Y(n260)
         );
  AOI22X1M U275 ( .A0(A[2]), .A1(n191), .B0(N144), .B1(n176), .Y(n257) );
  MXI2X1M U276 ( .A(n263), .B(n264), .S0(B[1]), .Y(n256) );
  CLKNAND2X2M U277 ( .A(n265), .B(n180), .Y(n264) );
  MXI2X1M U278 ( .A(n266), .B(n267), .S0(A[1]), .Y(n265) );
  CLKNAND2X2M U279 ( .A(n268), .B(n179), .Y(n263) );
  MXI2X1M U280 ( .A(n269), .B(n266), .S0(A[1]), .Y(n268) );
  CLKINVX1M U281 ( .A(n165), .Y(n266) );
  MXI2X1M U282 ( .A(n185), .B(n183), .S0(A[1]), .Y(n255) );
  CLKNAND2X2M U283 ( .A(n270), .B(n271), .Y(ALU_OUT_Comb[15]) );
  AOI222X1M U284 ( .A0(N174), .A1(n190), .B0(A[14]), .B1(n188), .C0(N142), 
        .C1(n189), .Y(n271) );
  AOI211X1M U285 ( .A0(N158), .A1(n176), .B0(n272), .C0(n273), .Y(n270) );
  MXI2X1M U286 ( .A(n179), .B(n180), .S0(A[15]), .Y(n273) );
  MXI2X1M U287 ( .A(n274), .B(n275), .S0(B[15]), .Y(n272) );
  NOR2X1M U288 ( .A(n183), .B(n276), .Y(n275) );
  MXI2X1M U289 ( .A(n165), .B(n167), .S0(A[15]), .Y(n276) );
  NOR2X1M U290 ( .A(n185), .B(n277), .Y(n274) );
  MXI2X1M U291 ( .A(n187), .B(n165), .S0(A[15]), .Y(n277) );
  NAND3X1M U292 ( .A(n278), .B(n279), .C(n280), .Y(ALU_OUT_Comb[14]) );
  AOI211X1M U293 ( .A0(N157), .A1(n176), .B0(n281), .C0(n282), .Y(n280) );
  MXI2X1M U294 ( .A(n179), .B(n180), .S0(A[14]), .Y(n282) );
  MXI2X1M U295 ( .A(n283), .B(n284), .S0(B[14]), .Y(n281) );
  NOR2X1M U296 ( .A(n183), .B(n285), .Y(n284) );
  MXI2X1M U297 ( .A(n165), .B(n167), .S0(A[14]), .Y(n285) );
  NOR2X1M U298 ( .A(n185), .B(n286), .Y(n283) );
  MXI2X1M U299 ( .A(n187), .B(n165), .S0(A[14]), .Y(n286) );
  AOI22X1M U300 ( .A0(A[13]), .A1(n188), .B0(N141), .B1(n189), .Y(n279) );
  AOI22X1M U301 ( .A0(N173), .A1(n190), .B0(A[15]), .B1(n191), .Y(n278) );
  NAND3X1M U302 ( .A(n287), .B(n288), .C(n289), .Y(ALU_OUT_Comb[13]) );
  AOI211X1M U303 ( .A0(N156), .A1(n176), .B0(n290), .C0(n291), .Y(n289) );
  MXI2X1M U304 ( .A(n179), .B(n180), .S0(A[13]), .Y(n291) );
  MXI2X1M U305 ( .A(n292), .B(n293), .S0(B[13]), .Y(n290) );
  NOR2X1M U306 ( .A(n183), .B(n294), .Y(n293) );
  MXI2X1M U307 ( .A(n165), .B(n167), .S0(A[13]), .Y(n294) );
  NOR2X1M U308 ( .A(n185), .B(n295), .Y(n292) );
  MXI2X1M U309 ( .A(n187), .B(n165), .S0(A[13]), .Y(n295) );
  AOI22X1M U310 ( .A0(A[12]), .A1(n188), .B0(N140), .B1(n189), .Y(n288) );
  AOI22X1M U311 ( .A0(N172), .A1(n190), .B0(A[14]), .B1(n191), .Y(n287) );
  NAND3X1M U312 ( .A(n296), .B(n297), .C(n298), .Y(ALU_OUT_Comb[12]) );
  AOI211X1M U313 ( .A0(N155), .A1(n176), .B0(n299), .C0(n300), .Y(n298) );
  MXI2X1M U314 ( .A(n179), .B(n180), .S0(A[12]), .Y(n300) );
  MXI2X1M U315 ( .A(n301), .B(n302), .S0(B[12]), .Y(n299) );
  NOR2X1M U316 ( .A(n183), .B(n303), .Y(n302) );
  MXI2X1M U317 ( .A(n165), .B(n167), .S0(A[12]), .Y(n303) );
  NOR2X1M U318 ( .A(n185), .B(n304), .Y(n301) );
  MXI2X1M U319 ( .A(n187), .B(n165), .S0(A[12]), .Y(n304) );
  AOI22X1M U320 ( .A0(A[11]), .A1(n188), .B0(N139), .B1(n189), .Y(n297) );
  AOI22X1M U321 ( .A0(N171), .A1(n190), .B0(A[13]), .B1(n191), .Y(n296) );
  NAND3X1M U322 ( .A(n305), .B(n306), .C(n307), .Y(ALU_OUT_Comb[11]) );
  AOI211X1M U323 ( .A0(N154), .A1(n176), .B0(n308), .C0(n309), .Y(n307) );
  MXI2X1M U324 ( .A(n179), .B(n180), .S0(A[11]), .Y(n309) );
  MXI2X1M U325 ( .A(n310), .B(n311), .S0(B[11]), .Y(n308) );
  NOR2X1M U326 ( .A(n183), .B(n312), .Y(n311) );
  MXI2X1M U327 ( .A(n165), .B(n167), .S0(A[11]), .Y(n312) );
  NOR2X1M U328 ( .A(n185), .B(n313), .Y(n310) );
  MXI2X1M U329 ( .A(n187), .B(n165), .S0(A[11]), .Y(n313) );
  AOI22X1M U330 ( .A0(A[10]), .A1(n188), .B0(N138), .B1(n189), .Y(n306) );
  AOI22X1M U331 ( .A0(N170), .A1(n190), .B0(A[12]), .B1(n191), .Y(n305) );
  NAND3X1M U332 ( .A(n314), .B(n315), .C(n316), .Y(ALU_OUT_Comb[10]) );
  AOI211X1M U333 ( .A0(N153), .A1(n176), .B0(n317), .C0(n318), .Y(n316) );
  MXI2X1M U334 ( .A(n179), .B(n180), .S0(A[10]), .Y(n318) );
  MXI2X1M U335 ( .A(n319), .B(n320), .S0(B[10]), .Y(n317) );
  NOR2X1M U336 ( .A(n183), .B(n321), .Y(n320) );
  MXI2X1M U337 ( .A(n165), .B(n167), .S0(A[10]), .Y(n321) );
  NOR2X1M U338 ( .A(n185), .B(n322), .Y(n319) );
  MXI2X1M U339 ( .A(n187), .B(n165), .S0(A[10]), .Y(n322) );
  AOI22X1M U340 ( .A0(A[9]), .A1(n188), .B0(N137), .B1(n189), .Y(n315) );
  CLKINVX1M U341 ( .A(n164), .Y(n188) );
  NAND3X1M U342 ( .A(ALU_FUN[1]), .B(n323), .C(ALU_FUN[2]), .Y(n164) );
  AOI22X1M U343 ( .A0(N169), .A1(n190), .B0(A[11]), .B1(n191), .Y(n314) );
  NAND4X1M U344 ( .A(n324), .B(n325), .C(n326), .D(n327), .Y(ALU_OUT_Comb[0])
         );
  AOI31X1M U345 ( .A0(n170), .A1(n323), .A2(N223), .B0(n262), .Y(n327) );
  NOR3BX1M U346 ( .AN(N225), .B(n169), .C(n168), .Y(n262) );
  AOI22X1M U347 ( .A0(N127), .A1(n189), .B0(N159), .B1(n190), .Y(n326) );
  CLKINVX1M U348 ( .A(n172), .Y(n190) );
  NAND3X1M U349 ( .A(ALU_FUN[0]), .B(n328), .C(n170), .Y(n172) );
  CLKINVX1M U350 ( .A(n161), .Y(n189) );
  AOI22X1M U351 ( .A0(A[1]), .A1(n191), .B0(N143), .B1(n176), .Y(n325) );
  CLKINVX1M U352 ( .A(n171), .Y(n176) );
  NAND3X1M U353 ( .A(n162), .B(n328), .C(n170), .Y(n171) );
  NOR2X1M U354 ( .A(n330), .B(ALU_FUN[2]), .Y(n170) );
  CLKINVX1M U355 ( .A(n163), .Y(n191) );
  CLKNAND2X2M U356 ( .A(n331), .B(ALU_FUN[3]), .Y(n163) );
  NOR2X1M U357 ( .A(n332), .B(n333), .Y(n324) );
  MXI2X1M U358 ( .A(n179), .B(n180), .S0(A[0]), .Y(n333) );
  CLKINVX1M U359 ( .A(n185), .Y(n179) );
  MXI2X1M U360 ( .A(n334), .B(n335), .S0(B[0]), .Y(n332) );
  NOR2X1M U361 ( .A(n183), .B(n336), .Y(n335) );
  MXI2X1M U362 ( .A(n165), .B(n167), .S0(A[0]), .Y(n336) );
  CLKINVX1M U363 ( .A(n267), .Y(n167) );
  OAI21X1M U364 ( .A0(ALU_FUN[3]), .A1(n169), .B0(n337), .Y(n267) );
  CLKINVX1M U365 ( .A(n180), .Y(n183) );
  CLKNAND2X2M U366 ( .A(n331), .B(n328), .Y(n180) );
  NOR2X1M U367 ( .A(n169), .B(n162), .Y(n331) );
  CLKNAND2X2M U368 ( .A(ALU_FUN[2]), .B(n330), .Y(n169) );
  NOR2X1M U369 ( .A(n185), .B(n338), .Y(n334) );
  MXI2X1M U370 ( .A(n187), .B(n165), .S0(A[0]), .Y(n338) );
  CLKINVX1M U371 ( .A(n168), .Y(n323) );
  CLKNAND2X2M U372 ( .A(ALU_FUN[3]), .B(n162), .Y(n168) );
  CLKINVX1M U373 ( .A(ALU_FUN[0]), .Y(n162) );
  CLKINVX1M U374 ( .A(n269), .Y(n187) );
  CLKNAND2X2M U375 ( .A(n166), .B(n337), .Y(n269) );
  NAND4X1M U376 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .C(n330), .D(n329), .Y(n337)
         );
  CLKINVX1M U377 ( .A(ALU_FUN[2]), .Y(n329) );
  CLKINVX1M U378 ( .A(ALU_FUN[1]), .Y(n330) );
  NOR2X1M U379 ( .A(n166), .B(ALU_FUN[0]), .Y(n185) );
  NAND3X1M U380 ( .A(ALU_FUN[1]), .B(n328), .C(ALU_FUN[2]), .Y(n166) );
  CLKINVX1M U381 ( .A(ALU_FUN[3]), .Y(n328) );
endmodule

