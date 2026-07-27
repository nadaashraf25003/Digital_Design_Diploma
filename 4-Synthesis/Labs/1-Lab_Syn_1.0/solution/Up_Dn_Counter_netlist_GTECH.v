/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : O-2018.06-SP1
// Date      : Sat Jul 25 23:23:18 2026
/////////////////////////////////////////////////////////////


module Up_Dn_Counter ( IN, Load, Up, Down, clk, Counter, High, Low );
  input [4:0] IN;
  output [4:0] Counter;
  input Load, Up, Down, clk;
  output High, Low;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40;
  assign High = N32;
  assign Low = N37;

  \**SEQGEN**  \Counter_reg[4]  ( .clear(1'b0), .preset(1'b0), .next_state(N23), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(Counter[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N18) );
  \**SEQGEN**  \Counter_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(N22), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(Counter[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N18) );
  \**SEQGEN**  \Counter_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N21), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(Counter[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N18) );
  \**SEQGEN**  \Counter_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N20), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(Counter[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N18) );
  \**SEQGEN**  \Counter_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(N19), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(Counter[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N18) );
  GTECH_AND2 C37 ( .A(Counter[3]), .B(Counter[4]), .Z(N29) );
  GTECH_AND2 C38 ( .A(Counter[2]), .B(N29), .Z(N30) );
  GTECH_AND2 C39 ( .A(Counter[1]), .B(N30), .Z(N31) );
  GTECH_AND2 C40 ( .A(Counter[0]), .B(N31), .Z(N32) );
  GTECH_OR2 C41 ( .A(Counter[3]), .B(Counter[4]), .Z(N33) );
  GTECH_OR2 C42 ( .A(Counter[2]), .B(N33), .Z(N34) );
  GTECH_OR2 C43 ( .A(Counter[1]), .B(N34), .Z(N35) );
  GTECH_OR2 C44 ( .A(Counter[0]), .B(N35), .Z(N36) );
  GTECH_NOT I_0 ( .A(N36), .Z(N37) );
  SUB_UNS_OP sub_22 ( .A(Counter), .B(1'b1), .Z({N11, N10, N9, N8, N7}) );
  ADD_UNS_OP add_26 ( .A(Counter), .B(1'b1), .Z({N17, N16, N15, N14, N13}) );
  SELECT_OP C46 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b0), 
        .CONTROL1(N0), .CONTROL2(N25), .CONTROL3(N28), .CONTROL4(N5), .Z(N18)
         );
  GTECH_BUF B_0 ( .A(Load), .Z(N0) );
  SELECT_OP C47 ( .DATA1(IN), .DATA2({N11, N10, N9, N8, N7}), .DATA3({N17, N16, 
        N15, N14, N13}), .CONTROL1(N0), .CONTROL2(N25), .CONTROL3(N28), .Z({
        N23, N22, N21, N20, N19}) );
  GTECH_AND2 C50 ( .A(Down), .B(N36), .Z(N1) );
  GTECH_AND2 C52 ( .A(N39), .B(N40), .Z(N2) );
  GTECH_AND2 C53 ( .A(Up), .B(N38), .Z(N39) );
  GTECH_NOT I_1 ( .A(N32), .Z(N38) );
  GTECH_NOT I_2 ( .A(Down), .Z(N40) );
  GTECH_OR2 C59 ( .A(N1), .B(Load), .Z(N3) );
  GTECH_OR2 C60 ( .A(N2), .B(N3), .Z(N4) );
  GTECH_NOT I_3 ( .A(N4), .Z(N5) );
  GTECH_BUF B_1 ( .A(N25), .Z(N6) );
  GTECH_BUF B_2 ( .A(N28), .Z(N12) );
  GTECH_NOT I_4 ( .A(Load), .Z(N24) );
  GTECH_AND2 C65 ( .A(N1), .B(N24), .Z(N25) );
  GTECH_AND2 C66 ( .A(N6), .B(N24) );
  GTECH_NOT I_5 ( .A(N1), .Z(N26) );
  GTECH_AND2 C68 ( .A(N24), .B(N26), .Z(N27) );
  GTECH_AND2 C69 ( .A(N2), .B(N27), .Z(N28) );
  GTECH_AND2 C70 ( .A(N12), .B(N27) );
endmodule

