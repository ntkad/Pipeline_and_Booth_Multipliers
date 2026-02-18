/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Fri Feb 13 15:03:17 2026
/////////////////////////////////////////////////////////////


module booth_mult_16bit_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] DIFF;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19;
  wire   [16:0] carry;

  ADDF_B U2_5 ( .A(A[5]), .B(n14), .CIN(carry[5]), .COUT(carry[6]), .SUM(
        DIFF[5]) );
  ADDF_B U2_4 ( .A(A[4]), .B(n15), .CIN(carry[4]), .COUT(carry[5]), .SUM(
        DIFF[4]) );
  ADDF_B U2_3 ( .A(A[3]), .B(n16), .CIN(carry[3]), .COUT(carry[4]), .SUM(
        DIFF[3]) );
  ADDF_B U2_2 ( .A(A[2]), .B(n17), .CIN(carry[2]), .COUT(carry[3]), .SUM(
        DIFF[2]) );
  ADDF_B U2_1 ( .A(A[1]), .B(n18), .CIN(n3), .COUT(carry[2]), .SUM(DIFF[1]) );
  ADDF_C U2_14 ( .A(A[14]), .B(n5), .CIN(carry[14]), .COUT(carry[15]), .SUM(
        DIFF[14]) );
  ADDF_C U2_13 ( .A(A[13]), .B(n6), .CIN(carry[13]), .COUT(carry[14]), .SUM(
        DIFF[13]) );
  ADDF_C U2_12 ( .A(A[12]), .B(n7), .CIN(carry[12]), .COUT(carry[13]), .SUM(
        DIFF[12]) );
  ADDF_C U2_11 ( .A(A[11]), .B(n8), .CIN(carry[11]), .COUT(carry[12]), .SUM(
        DIFF[11]) );
  ADDF_C U2_10 ( .A(A[10]), .B(n9), .CIN(carry[10]), .COUT(carry[11]), .SUM(
        DIFF[10]) );
  ADDF_C U2_9 ( .A(A[9]), .B(n10), .CIN(carry[9]), .COUT(carry[10]), .SUM(
        DIFF[9]) );
  ADDF_C U2_8 ( .A(A[8]), .B(n11), .CIN(carry[8]), .COUT(carry[9]), .SUM(
        DIFF[8]) );
  ADDF_C U2_7 ( .A(A[7]), .B(n12), .CIN(carry[7]), .COUT(carry[8]), .SUM(
        DIFF[7]) );
  ADDF_C U2_6 ( .A(A[6]), .B(n13), .CIN(carry[6]), .COUT(carry[7]), .SUM(
        DIFF[6]) );
  INVERT_E U1 ( .A(carry[1]), .Z(n3) );
  INVERT_F U2 ( .A(B[0]), .Z(n19) );
  XNOR3_H U3 ( .A(A[15]), .B(n4), .C(carry[15]), .Z(n1) );
  XNOR2_C U4 ( .A(A[0]), .B(n19), .Z(DIFF[0]) );
  NOR2_C U5 ( .A(n19), .B(A[0]), .Z(carry[1]) );
  INVERT_H U6 ( .A(n1), .Z(DIFF[15]) );
  INVERT_D U7 ( .A(B[15]), .Z(n4) );
  INVERT_D U8 ( .A(B[14]), .Z(n5) );
  INVERT_D U9 ( .A(B[13]), .Z(n6) );
  INVERT_D U10 ( .A(B[12]), .Z(n7) );
  INVERT_D U11 ( .A(B[11]), .Z(n8) );
  INVERT_D U12 ( .A(B[10]), .Z(n9) );
  INVERT_D U13 ( .A(B[9]), .Z(n10) );
  INVERT_D U14 ( .A(B[8]), .Z(n11) );
  INVERT_D U15 ( .A(B[7]), .Z(n12) );
  INVERT_D U16 ( .A(B[6]), .Z(n13) );
  INVERT_D U17 ( .A(B[5]), .Z(n14) );
  INVERT_D U18 ( .A(B[4]), .Z(n15) );
  INVERT_D U19 ( .A(B[3]), .Z(n16) );
  INVERT_D U20 ( .A(B[2]), .Z(n17) );
  INVERT_D U21 ( .A(B[1]), .Z(n18) );
endmodule


module booth_mult_16bit_DW01_add_0 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n5, n1, n3, n4;
  wire   [15:1] carry;

  ADDF_B U1_14 ( .A(A[14]), .B(B[14]), .CIN(carry[14]), .COUT(carry[15]), 
        .SUM(SUM[14]) );
  ADDF_B U1_2 ( .A(A[2]), .B(B[2]), .CIN(carry[2]), .COUT(carry[3]), .SUM(
        SUM[2]) );
  ADDF_B U1_3 ( .A(A[3]), .B(B[3]), .CIN(carry[3]), .COUT(carry[4]), .SUM(
        SUM[3]) );
  ADDF_B U1_4 ( .A(A[4]), .B(B[4]), .CIN(carry[4]), .COUT(carry[5]), .SUM(
        SUM[4]) );
  ADDF_B U1_5 ( .A(A[5]), .B(B[5]), .CIN(carry[5]), .COUT(carry[6]), .SUM(
        SUM[5]) );
  ADDF_B U1_6 ( .A(A[6]), .B(B[6]), .CIN(carry[6]), .COUT(carry[7]), .SUM(
        SUM[6]) );
  ADDF_B U1_7 ( .A(A[7]), .B(B[7]), .CIN(carry[7]), .COUT(carry[8]), .SUM(
        SUM[7]) );
  ADDF_B U1_8 ( .A(A[8]), .B(B[8]), .CIN(carry[8]), .COUT(carry[9]), .SUM(
        SUM[8]) );
  ADDF_B U1_9 ( .A(A[9]), .B(B[9]), .CIN(carry[9]), .COUT(carry[10]), .SUM(
        SUM[9]) );
  ADDF_B U1_10 ( .A(A[10]), .B(B[10]), .CIN(carry[10]), .COUT(carry[11]), 
        .SUM(SUM[10]) );
  ADDF_B U1_11 ( .A(A[11]), .B(B[11]), .CIN(carry[11]), .COUT(carry[12]), 
        .SUM(SUM[11]) );
  ADDF_B U1_12 ( .A(A[12]), .B(B[12]), .CIN(carry[12]), .COUT(carry[13]), 
        .SUM(SUM[12]) );
  ADDF_B U1_13 ( .A(A[13]), .B(B[13]), .CIN(carry[13]), .COUT(carry[14]), 
        .SUM(SUM[13]) );
  ADDF_B U1_1 ( .A(A[1]), .B(B[1]), .CIN(n4), .COUT(carry[2]), .SUM(SUM[1]) );
  INVERT_E U1 ( .A(n3), .Z(n1) );
  BUFFER_H U2 ( .A(carry[1]), .Z(n4) );
  XNOR3_D U3 ( .A(A[15]), .B(B[15]), .C(carry[15]), .Z(n5) );
  AND2_H U4 ( .A(A[0]), .B(B[0]), .Z(carry[1]) );
  INVERT_H U5 ( .A(n1), .Z(SUM[15]) );
  INVERT_D U6 ( .A(n5), .Z(n3) );
  XOR2_B U7 ( .A(A[0]), .B(B[0]), .Z(SUM[0]) );
endmodule


module booth_mult_16bit ( clk, rst_n, start, a_in, b_in, p_out, done );
  input [15:0] a_in;
  input [15:0] b_in;
  output [31:0] p_out;
  input clk, rst_n, start;
  output done;
  wire   n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         \m_reg[9] , N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51,
         N52, N53, N54, N55, N56, N57, N58, N75, N76, N77, N78, N79, n6, n7,
         n8, n9, n10, n11, n13, n14, n15, n17, n18, n19, n20, n21, n22, n23,
         n24, n27, n29, n59, n63, n68, n69, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n286, n288, n290, n292, n294, n296, n298, n300, n302, n304, n306,
         n308, n310, n312, n314, n316, n318, n320, n322, n324, n326, n328,
         n330, n332, n334, n336, n338, n340, n342, n344, n346, n348, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n396, n397, n398, n399, n400, n401, n402, n403, n404, n405,
         n406, n407, n408, n409, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578;
  wire   [1:0] state;
  wire   [32:0] shift_reg;
  wire   [4:0] count;

  DFFR_K \state_reg[0]  ( .D(n197), .CLK(clk), .RN(n547), .Q(state[0]), .QBAR(
        n447) );
  DFFR_K \state_reg[1]  ( .D(n196), .CLK(clk), .RN(n553), .Q(state[1]), .QBAR(
        n499) );
  DFFR_K \count_reg[4]  ( .D(n195), .CLK(clk), .RN(n560), .Q(count[4]), .QBAR(
        n105) );
  DFFR_K \count_reg[0]  ( .D(n194), .CLK(clk), .RN(n540), .Q(count[0]), .QBAR(
        n104) );
  DFFR_K \count_reg[1]  ( .D(n193), .CLK(clk), .RN(n541), .Q(n220) );
  DFFR_K \count_reg[2]  ( .D(n192), .CLK(clk), .RN(n540), .Q(count[2]), .QBAR(
        n107) );
  DFFR_K \count_reg[3]  ( .D(n191), .CLK(clk), .RN(n540), .Q(count[3]), .QBAR(
        n108) );
  DFFR_K \m_reg_reg[15]  ( .D(n190), .CLK(clk), .RN(n540), .QBAR(n222) );
  DFFR_K \m_reg_reg[14]  ( .D(n189), .CLK(clk), .RN(n540), .QBAR(n221) );
  DFFR_K \m_reg_reg[13]  ( .D(n188), .CLK(clk), .RN(n540), .QBAR(n218) );
  DFFR_K \m_reg_reg[12]  ( .D(n187), .CLK(clk), .RN(n541), .QBAR(n217) );
  DFFR_K \m_reg_reg[11]  ( .D(n186), .CLK(clk), .RN(n541), .QBAR(n215) );
  DFFR_K \m_reg_reg[10]  ( .D(n185), .CLK(clk), .RN(n541), .QBAR(n214) );
  DFFR_K \m_reg_reg[9]  ( .D(n184), .CLK(clk), .RN(n541), .Q(\m_reg[9] ), 
        .QBAR(n252) );
  DFFR_K \m_reg_reg[8]  ( .D(n183), .CLK(clk), .RN(n541), .QBAR(n213) );
  DFFR_K \m_reg_reg[7]  ( .D(n182), .CLK(clk), .RN(n542), .QBAR(n212) );
  DFFR_K \m_reg_reg[6]  ( .D(n181), .CLK(clk), .RN(n542), .QBAR(n211) );
  DFFR_K \m_reg_reg[5]  ( .D(n180), .CLK(clk), .RN(n542), .QBAR(n209) );
  DFFR_K \m_reg_reg[4]  ( .D(n179), .CLK(clk), .RN(n542), .QBAR(n210) );
  DFFR_K \m_reg_reg[3]  ( .D(n178), .CLK(clk), .RN(n542), .QBAR(n206) );
  DFFR_K \m_reg_reg[2]  ( .D(n177), .CLK(clk), .RN(n562), .QBAR(n207) );
  DFFR_K \m_reg_reg[1]  ( .D(n176), .CLK(clk), .RN(n542), .QBAR(n205) );
  DFFR_K \m_reg_reg[0]  ( .D(n175), .CLK(clk), .RN(n549), .QBAR(n204) );
  DFFR_K \shift_reg_reg[31]  ( .D(n174), .CLK(clk), .RN(n543), .Q(
        shift_reg[31]), .QBAR(n243) );
  DFFR_K \shift_reg_reg[30]  ( .D(n199), .CLK(clk), .RN(n543), .Q(
        shift_reg[30]), .QBAR(n242) );
  DFFR_K \shift_reg_reg[29]  ( .D(n198), .CLK(clk), .RN(n543), .Q(
        shift_reg[29]), .QBAR(n237) );
  DFFR_K \shift_reg_reg[28]  ( .D(n170), .CLK(clk), .RN(n543), .Q(
        shift_reg[28]), .QBAR(n238) );
  DFFR_K \shift_reg_reg[27]  ( .D(n169), .CLK(clk), .RN(n543), .Q(
        shift_reg[27]), .QBAR(n248) );
  DFFR_K \shift_reg_reg[26]  ( .D(n168), .CLK(clk), .RN(n543), .Q(
        shift_reg[26]), .QBAR(n247) );
  DFFR_K \shift_reg_reg[25]  ( .D(n167), .CLK(clk), .RN(n544), .Q(
        shift_reg[25]), .QBAR(n246) );
  DFFR_K \shift_reg_reg[24]  ( .D(n166), .CLK(clk), .RN(n544), .Q(
        shift_reg[24]), .QBAR(n245) );
  DFFR_K \shift_reg_reg[23]  ( .D(n165), .CLK(clk), .RN(n544), .Q(
        shift_reg[23]), .QBAR(n244) );
  DFFR_K \shift_reg_reg[22]  ( .D(n164), .CLK(clk), .RN(n544), .Q(
        shift_reg[22]), .QBAR(n249) );
  DFFR_K \shift_reg_reg[21]  ( .D(n163), .CLK(clk), .RN(n544), .Q(
        shift_reg[21]), .QBAR(n240) );
  DFFR_K \shift_reg_reg[20]  ( .D(n162), .CLK(clk), .RN(n545), .Q(
        shift_reg[20]), .QBAR(n239) );
  DFFR_K \shift_reg_reg[19]  ( .D(n161), .CLK(clk), .RN(n545), .Q(
        shift_reg[19]), .QBAR(n250) );
  DFFR_K \shift_reg_reg[18]  ( .D(n200), .CLK(clk), .RN(n545), .Q(
        shift_reg[18]), .QBAR(n241) );
  DFFR_K \shift_reg_reg[17]  ( .D(n159), .CLK(clk), .RN(n545), .Q(
        shift_reg[17]), .QBAR(n236) );
  DFFR_K \shift_reg_reg[16]  ( .D(n376), .CLK(clk), .RN(n545), .Q(
        shift_reg[16]), .QBAR(n500) );
  DFFR_K \shift_reg_reg[15]  ( .D(n157), .CLK(clk), .RN(n546), .Q(
        shift_reg[15]), .QBAR(n231) );
  DFFR_K \shift_reg_reg[14]  ( .D(n156), .CLK(clk), .RN(n546), .Q(
        shift_reg[14]), .QBAR(n225) );
  DFFR_K \shift_reg_reg[13]  ( .D(n155), .CLK(clk), .RN(n546), .Q(
        shift_reg[13]), .QBAR(n230) );
  DFFR_K \shift_reg_reg[12]  ( .D(n154), .CLK(clk), .RN(n546), .Q(
        shift_reg[12]), .QBAR(n229) );
  DFFR_K \shift_reg_reg[11]  ( .D(n153), .CLK(clk), .RN(n546), .Q(
        shift_reg[11]), .QBAR(n228) );
  DFFR_K \shift_reg_reg[10]  ( .D(n152), .CLK(clk), .RN(n547), .QBAR(n251) );
  DFFR_K \shift_reg_reg[9]  ( .D(n151), .CLK(clk), .RN(n547), .Q(shift_reg[9]), 
        .QBAR(n235) );
  DFFR_K \shift_reg_reg[8]  ( .D(n150), .CLK(clk), .RN(n547), .Q(shift_reg[8]), 
        .QBAR(n223) );
  DFFR_K \shift_reg_reg[7]  ( .D(n149), .CLK(clk), .RN(n547), .Q(shift_reg[7]), 
        .QBAR(n234) );
  DFFR_K \shift_reg_reg[6]  ( .D(n148), .CLK(clk), .RN(n547), .Q(shift_reg[6]), 
        .QBAR(n233) );
  DFFR_K \shift_reg_reg[5]  ( .D(n147), .CLK(clk), .RN(n548), .Q(shift_reg[5]), 
        .QBAR(n232) );
  DFFR_K \shift_reg_reg[4]  ( .D(n146), .CLK(clk), .RN(n548), .Q(shift_reg[4]), 
        .QBAR(n227) );
  DFFR_K \shift_reg_reg[3]  ( .D(n145), .CLK(clk), .RN(n548), .Q(shift_reg[3]), 
        .QBAR(n226) );
  DFFR_K \shift_reg_reg[2]  ( .D(n144), .CLK(clk), .RN(n548), .Q(shift_reg[2]), 
        .QBAR(n224) );
  DFFR_K \shift_reg_reg[1]  ( .D(n143), .CLK(clk), .RN(n548), .Q(shift_reg[1]), 
        .QBAR(n489) );
  DFFR_K \shift_reg_reg[0]  ( .D(n142), .CLK(clk), .RN(n549), .Q(shift_reg[0]), 
        .QBAR(n501) );
  DFFR_K \p_out_reg[31]  ( .D(n141), .CLK(clk), .RN(n549), .Q(n579), .QBAR(
        n103) );
  DFFR_K \p_out_reg[30]  ( .D(n140), .CLK(clk), .RN(n549), .Q(n580), .QBAR(
        n102) );
  DFFR_K \p_out_reg[29]  ( .D(n139), .CLK(clk), .RN(n549), .Q(n581), .QBAR(
        n101) );
  DFFR_K \p_out_reg[28]  ( .D(n138), .CLK(clk), .RN(n549), .Q(n582), .QBAR(
        n100) );
  DFFR_K \p_out_reg[27]  ( .D(n137), .CLK(clk), .RN(n550), .Q(n583), .QBAR(n99) );
  DFFR_K \p_out_reg[26]  ( .D(n136), .CLK(clk), .RN(n551), .Q(n584), .QBAR(n98) );
  DFFR_K \p_out_reg[25]  ( .D(n135), .CLK(clk), .RN(n561), .Q(n585), .QBAR(n97) );
  DFFR_K \p_out_reg[24]  ( .D(n134), .CLK(clk), .RN(n560), .Q(n586), .QBAR(n96) );
  DFFR_K \p_out_reg[23]  ( .D(n133), .CLK(clk), .RN(n562), .Q(n587), .QBAR(n95) );
  DFFR_K \p_out_reg[22]  ( .D(n132), .CLK(clk), .RN(n550), .Q(n588), .QBAR(n94) );
  DFFR_K \p_out_reg[21]  ( .D(n131), .CLK(clk), .RN(n550), .Q(n589), .QBAR(n93) );
  DFFR_K \p_out_reg[20]  ( .D(n130), .CLK(clk), .RN(n550), .Q(n590), .QBAR(n92) );
  DFFR_K \p_out_reg[19]  ( .D(n129), .CLK(clk), .RN(n550), .Q(n591), .QBAR(n91) );
  DFFR_K \p_out_reg[18]  ( .D(n128), .CLK(clk), .RN(n550), .Q(n592), .QBAR(n90) );
  DFFR_K \p_out_reg[17]  ( .D(n127), .CLK(clk), .RN(n551), .Q(n593), .QBAR(n89) );
  DFFR_K \p_out_reg[16]  ( .D(n126), .CLK(clk), .RN(n551), .Q(n594), .QBAR(n88) );
  DFFR_K \p_out_reg[15]  ( .D(n125), .CLK(clk), .RN(n551), .Q(n595), .QBAR(n87) );
  DFFR_K \p_out_reg[14]  ( .D(n124), .CLK(clk), .RN(n551), .Q(n596), .QBAR(n86) );
  DFFR_K \p_out_reg[13]  ( .D(n123), .CLK(clk), .RN(n551), .Q(n597), .QBAR(n85) );
  DFFR_K \p_out_reg[12]  ( .D(n122), .CLK(clk), .RN(n552), .Q(n598), .QBAR(n84) );
  DFFR_K \p_out_reg[11]  ( .D(n121), .CLK(clk), .RN(n552), .Q(n599), .QBAR(n83) );
  DFFR_K \p_out_reg[10]  ( .D(n120), .CLK(clk), .RN(n552), .Q(n600), .QBAR(n82) );
  DFFR_K \p_out_reg[9]  ( .D(n119), .CLK(clk), .RN(n552), .Q(n601), .QBAR(n81)
         );
  DFFR_K \p_out_reg[8]  ( .D(n118), .CLK(clk), .RN(n552), .Q(n602), .QBAR(n80)
         );
  DFFR_K \p_out_reg[7]  ( .D(n117), .CLK(clk), .RN(n553), .Q(n603), .QBAR(n79)
         );
  DFFR_K \p_out_reg[6]  ( .D(n116), .CLK(clk), .RN(n553), .Q(n604), .QBAR(n78)
         );
  DFFR_K \p_out_reg[5]  ( .D(n115), .CLK(clk), .RN(n553), .Q(n605), .QBAR(n77)
         );
  DFFR_K \p_out_reg[4]  ( .D(n114), .CLK(clk), .RN(n553), .Q(n606), .QBAR(n76)
         );
  DFFR_K \p_out_reg[3]  ( .D(n113), .CLK(clk), .RN(n553), .Q(n607), .QBAR(n75)
         );
  DFFR_K \p_out_reg[2]  ( .D(n112), .CLK(clk), .RN(n552), .Q(n608), .QBAR(n74)
         );
  DFFR_K \p_out_reg[1]  ( .D(n111), .CLK(clk), .RN(n545), .Q(n609), .QBAR(n73)
         );
  DFFR_K \p_out_reg[0]  ( .D(n110), .CLK(clk), .RN(n546), .Q(n610), .QBAR(n72)
         );
  DFFR_K done_reg ( .D(n273), .CLK(clk), .RN(n544), .Q(n611), .QBAR(n71) );
  NAND2_D U20 ( .A(n261), .B(n374), .Z(n174) );
  AOI22_C U21 ( .A1(N58), .A2(n509), .B1(N42), .B2(n482), .Z(n17) );
  XOR2_C U46 ( .A(n446), .B(n278), .Z(n27) );
  NOR2_D U148 ( .A(n267), .B(n357), .Z(n14) );
  NAND4_C U155 ( .A(n577), .B(n576), .C(n265), .D(n575), .Z(n7) );
  booth_mult_16bit_DW01_sub_0 sub_59 ( .A({n418, n476, n474, n472, n470, n468, 
        n466, n464, n462, n460, n458, n456, n454, n452, n450, n478}), .B({n419, 
        n436, n435, n434, n433, n432, n431, n429, n428, n427, n426, n425, n424, 
        n423, n422, n444}), .CI(1'b0), .DIFF({N58, N57, N56, N55, N54, N53, 
        N52, N51, N50, N49, N48, N47, N46, N45, N44, N43}) );
  booth_mult_16bit_DW01_add_0 add_58 ( .A({n418, n476, n474, n472, n470, n468, 
        n466, n464, n462, n460, n458, n456, n454, n452, n450, n478}), .B({n419, 
        n436, n435, n434, n433, n432, n431, n429, n428, n427, n426, n425, n424, 
        n423, n422, n444}), .CI(1'b0), .SUM({N42, N41, N40, N39, N38, N37, N36, 
        N35, N34, N33, N32, N31, N30, N29, N28, N27}) );
  DFFR_E \shift_reg_reg[32]  ( .D(n173), .CLK(clk), .RN(n548), .Q(
        shift_reg[32]), .QBAR(n496) );
  INVERT_H U160 ( .A(n281), .Z(n411) );
  AO2222_F U161 ( .A1(n472), .A2(n524), .B1(N56), .B2(n509), .C1(N40), .C2(
        n482), .D1(n474), .D2(n492), .Z(n198) );
  AO2222_F U162 ( .A1(n474), .A2(n524), .B1(N57), .B2(n509), .C1(N41), .C2(
        n482), .D1(n476), .D2(n492), .Z(n199) );
  INVERT_J U163 ( .A(n562), .Z(n554) );
  AO2222_F U164 ( .A1(n450), .A2(n524), .B1(N45), .B2(n480), .C1(N29), .C2(
        n508), .D1(n452), .D2(n491), .Z(n200) );
  NOR2_D U165 ( .A(n408), .B(n415), .Z(n20) );
  INVERT_H U166 ( .A(shift_reg[1]), .Z(n445) );
  INVERT_J U167 ( .A(n560), .Z(n559) );
  AND2_H U168 ( .A(n369), .B(n370), .Z(n201) );
  AND2_H U169 ( .A(n270), .B(n271), .Z(n202) );
  AND2_H U170 ( .A(n367), .B(n368), .Z(n203) );
  INVERT_N U171 ( .A(n276), .Z(n498) );
  INVERT_N U172 ( .A(n486), .Z(n488) );
  INVERT_K U173 ( .A(n506), .Z(n486) );
  INVERT_H U174 ( .A(n440), .Z(n441) );
  INVERT_I U175 ( .A(n509), .Z(n479) );
  NOR2_D U176 ( .A(n408), .B(n409), .Z(n21) );
  INVERT_J U177 ( .A(n560), .Z(n558) );
  AND2_H U178 ( .A(n371), .B(n372), .Z(n208) );
  INVERT_K U179 ( .A(n498), .Z(n490) );
  AND2_H U180 ( .A(n365), .B(n366), .Z(n216) );
  AND2_H U181 ( .A(n268), .B(n269), .Z(n219) );
  INVERT_I U182 ( .A(n508), .Z(n481) );
  INVERT_M U183 ( .A(n356), .Z(n357) );
  INVERT_H U184 ( .A(state[1]), .Z(n437) );
  INVERT_H U185 ( .A(n437), .Z(n439) );
  INVERT_K U186 ( .A(n477), .Z(n478) );
  INVERT_J U187 ( .A(n471), .Z(n472) );
  INVERT_J U188 ( .A(n469), .Z(n470) );
  INVERT_J U189 ( .A(n453), .Z(n454) );
  INVERT_J U190 ( .A(n455), .Z(n456) );
  INVERT_J U191 ( .A(n449), .Z(n450) );
  INVERT_J U192 ( .A(n473), .Z(n474) );
  INVERT_J U193 ( .A(n475), .Z(n476) );
  INVERT_J U194 ( .A(n459), .Z(n460) );
  INVERT_J U195 ( .A(n461), .Z(n462) );
  INVERT_J U196 ( .A(n463), .Z(n464) );
  INVERT_J U197 ( .A(n465), .Z(n466) );
  INVERT_J U198 ( .A(n467), .Z(n468) );
  INVERT_J U199 ( .A(n457), .Z(n458) );
  INVERT_J U200 ( .A(n451), .Z(n452) );
  INVERT_H U201 ( .A(n430), .Z(n431) );
  INVERT_J U202 ( .A(n562), .Z(n555) );
  XNOR2_C U203 ( .A(n265), .B(N75), .Z(N76) );
  AND2_H U204 ( .A(n257), .B(n574), .Z(n495) );
  INVERT_D U205 ( .A(n495), .Z(n253) );
  INVERT_H U206 ( .A(n503), .Z(n254) );
  INVERT_K U207 ( .A(n254), .Z(n255) );
  INVERT_H U208 ( .A(n502), .Z(n503) );
  INVERT_H U209 ( .A(n571), .Z(n256) );
  INVERT_K U210 ( .A(n256), .Z(n257) );
  INVERT_H U211 ( .A(n68), .Z(n571) );
  AO22_F U212 ( .A1(n257), .A2(n265), .B1(n255), .B2(N76), .Z(n193) );
  INVERT_H U213 ( .A(state[0]), .Z(n258) );
  INVERT_H U214 ( .A(n258), .Z(n259) );
  INVERT_L U215 ( .A(n493), .Z(n507) );
  BUFFER_F U216 ( .A(N78), .Z(n260) );
  XNOR2_C U217 ( .A(n567), .B(n283), .Z(N77) );
  NAND2BAL_E U218 ( .A(n265), .B(n421), .Z(n567) );
  NAND2BAL_E U219 ( .A(a_in[1]), .B(n267), .Z(n351) );
  AO22_F U220 ( .A1(n491), .A2(n418), .B1(n476), .B2(n521), .Z(n19) );
  INVERT_D U221 ( .A(n19), .Z(n261) );
  INVERT_C U222 ( .A(n262), .Z(n173) );
  NOR2_C U223 ( .A(n15), .B(n496), .Z(n263) );
  NOR2_D U224 ( .A(n263), .B(n373), .Z(n262) );
  INVERT_H U225 ( .A(n220), .Z(n264) );
  INVERT_K U226 ( .A(n264), .Z(n265) );
  AO22_F U227 ( .A1(a_in[0]), .A2(n267), .B1(n497), .B2(n444), .Z(n175) );
  INVERT_H U228 ( .A(n498), .Z(n572) );
  AO22_F U229 ( .A1(a_in[2]), .A2(n267), .B1(n498), .B2(n423), .Z(n177) );
  AO22_F U230 ( .A1(a_in[3]), .A2(n267), .B1(n498), .B2(n424), .Z(n178) );
  AO22_F U231 ( .A1(a_in[4]), .A2(n267), .B1(n498), .B2(n425), .Z(n179) );
  AO22_F U232 ( .A1(a_in[5]), .A2(n267), .B1(n497), .B2(n426), .Z(n180) );
  AO22_F U233 ( .A1(a_in[6]), .A2(n267), .B1(n498), .B2(n427), .Z(n181) );
  INVERT_I U234 ( .A(n572), .Z(n266) );
  INVERT_N U235 ( .A(n266), .Z(n267) );
  AO22_F U236 ( .A1(a_in[7]), .A2(n267), .B1(n498), .B2(n428), .Z(n182) );
  AO22_F U237 ( .A1(a_in[8]), .A2(n267), .B1(n498), .B2(n429), .Z(n183) );
  AO222_F U238 ( .A1(n381), .A2(n357), .B1(b_in[0]), .B2(n484), .C1(n446), 
        .C2(n522), .Z(n143) );
  INVERT_L U239 ( .A(n483), .Z(n484) );
  NAND2_D U240 ( .A(n219), .B(n202), .Z(n159) );
  NAND2BAL_E U241 ( .A(n450), .B(n491), .Z(n268) );
  NAND2BAL_E U242 ( .A(N28), .B(n508), .Z(n269) );
  NAND2BAL_E U243 ( .A(N44), .B(n480), .Z(n270) );
  NAND2BAL_E U244 ( .A(n478), .B(n524), .Z(n271) );
  INVERT_K U245 ( .A(n507), .Z(n491) );
  NAND3_D U246 ( .A(n573), .B(n499), .C(start), .Z(n59) );
  AO22_F U247 ( .A1(n478), .A2(n491), .B1(b_in[15]), .B2(n484), .Z(n22) );
  INVERT_D U248 ( .A(n22), .Z(n272) );
  OA21_F U249 ( .A1(n71), .A2(n573), .B(n510), .Z(n109) );
  INVERT_C U250 ( .A(n109), .Z(n273) );
  AND2_H U251 ( .A(N27), .B(n482), .Z(n23) );
  INVERT_D U252 ( .A(n23), .Z(n274) );
  INVERT_I U253 ( .A(n505), .Z(n275) );
  INVERT_M U254 ( .A(n275), .Z(n276) );
  INVERT_H U255 ( .A(n59), .Z(n505) );
  AND2_H U256 ( .A(N79), .B(n255), .Z(n494) );
  INVERT_D U257 ( .A(n494), .Z(n277) );
  INVERT_H U258 ( .A(shift_reg[0]), .Z(n278) );
  INVERT_H U259 ( .A(n278), .Z(n279) );
  INVERT_H U260 ( .A(n489), .Z(n280) );
  INVERT_H U261 ( .A(n280), .Z(n281) );
  INVERT_H U262 ( .A(count[2]), .Z(n282) );
  INVERT_H U263 ( .A(n282), .Z(n283) );
  INVERT_H U264 ( .A(n611), .Z(n284) );
  INVERT_H U265 ( .A(n284), .Z(done) );
  INVERT_H U266 ( .A(n610), .Z(n286) );
  INVERT_H U267 ( .A(n286), .Z(p_out[0]) );
  INVERT_H U268 ( .A(n609), .Z(n288) );
  INVERT_H U269 ( .A(n288), .Z(p_out[1]) );
  INVERT_H U270 ( .A(n608), .Z(n290) );
  INVERT_H U271 ( .A(n290), .Z(p_out[2]) );
  INVERT_H U272 ( .A(n607), .Z(n292) );
  INVERT_H U273 ( .A(n292), .Z(p_out[3]) );
  INVERT_H U274 ( .A(n606), .Z(n294) );
  INVERT_H U275 ( .A(n294), .Z(p_out[4]) );
  INVERT_H U276 ( .A(n605), .Z(n296) );
  INVERT_H U277 ( .A(n296), .Z(p_out[5]) );
  INVERT_H U278 ( .A(n604), .Z(n298) );
  INVERT_H U279 ( .A(n298), .Z(p_out[6]) );
  INVERT_H U280 ( .A(n603), .Z(n300) );
  INVERT_H U281 ( .A(n300), .Z(p_out[7]) );
  INVERT_H U282 ( .A(n602), .Z(n302) );
  INVERT_H U283 ( .A(n302), .Z(p_out[8]) );
  INVERT_H U284 ( .A(n601), .Z(n304) );
  INVERT_H U285 ( .A(n304), .Z(p_out[9]) );
  INVERT_H U286 ( .A(n600), .Z(n306) );
  INVERT_H U287 ( .A(n306), .Z(p_out[10]) );
  INVERT_H U288 ( .A(n599), .Z(n308) );
  INVERT_H U289 ( .A(n308), .Z(p_out[11]) );
  INVERT_H U290 ( .A(n598), .Z(n310) );
  INVERT_H U291 ( .A(n310), .Z(p_out[12]) );
  INVERT_H U292 ( .A(n597), .Z(n312) );
  INVERT_H U293 ( .A(n312), .Z(p_out[13]) );
  INVERT_H U294 ( .A(n596), .Z(n314) );
  INVERT_H U295 ( .A(n314), .Z(p_out[14]) );
  INVERT_H U296 ( .A(n595), .Z(n316) );
  INVERT_H U297 ( .A(n316), .Z(p_out[15]) );
  INVERT_H U298 ( .A(n594), .Z(n318) );
  INVERT_H U299 ( .A(n318), .Z(p_out[16]) );
  INVERT_H U300 ( .A(n593), .Z(n320) );
  INVERT_H U301 ( .A(n320), .Z(p_out[17]) );
  INVERT_H U302 ( .A(n592), .Z(n322) );
  INVERT_H U303 ( .A(n322), .Z(p_out[18]) );
  INVERT_H U304 ( .A(n591), .Z(n324) );
  INVERT_H U305 ( .A(n324), .Z(p_out[19]) );
  INVERT_H U306 ( .A(n590), .Z(n326) );
  INVERT_H U307 ( .A(n326), .Z(p_out[20]) );
  INVERT_H U308 ( .A(n589), .Z(n328) );
  INVERT_H U309 ( .A(n328), .Z(p_out[21]) );
  INVERT_H U310 ( .A(n588), .Z(n330) );
  INVERT_H U311 ( .A(n330), .Z(p_out[22]) );
  INVERT_H U312 ( .A(n587), .Z(n332) );
  INVERT_H U313 ( .A(n332), .Z(p_out[23]) );
  INVERT_H U314 ( .A(n586), .Z(n334) );
  INVERT_H U315 ( .A(n334), .Z(p_out[24]) );
  INVERT_H U316 ( .A(n585), .Z(n336) );
  INVERT_H U317 ( .A(n336), .Z(p_out[25]) );
  INVERT_H U318 ( .A(n584), .Z(n338) );
  INVERT_H U319 ( .A(n338), .Z(p_out[26]) );
  INVERT_H U320 ( .A(n583), .Z(n340) );
  INVERT_H U321 ( .A(n340), .Z(p_out[27]) );
  INVERT_H U322 ( .A(n582), .Z(n342) );
  INVERT_H U323 ( .A(n342), .Z(p_out[28]) );
  INVERT_H U324 ( .A(n581), .Z(n344) );
  INVERT_H U325 ( .A(n344), .Z(p_out[29]) );
  INVERT_H U326 ( .A(n580), .Z(n346) );
  INVERT_H U327 ( .A(n346), .Z(p_out[30]) );
  INVERT_H U328 ( .A(n579), .Z(n348) );
  INVERT_H U329 ( .A(n348), .Z(p_out[31]) );
  AO2222_F U330 ( .A1(n452), .A2(n524), .B1(N46), .B2(n480), .C1(N30), .C2(
        n508), .D1(n454), .D2(n492), .Z(n161) );
  INVERT_O U331 ( .A(n507), .Z(n492) );
  AO22_F U332 ( .A1(n257), .A2(n576), .B1(n255), .B2(N77), .Z(n192) );
  AO22_F U333 ( .A1(n521), .A2(n279), .B1(n357), .B2(n280), .Z(n142) );
  NAND2_D U334 ( .A(n350), .B(n351), .Z(n176) );
  NAND2BAL_E U335 ( .A(n497), .B(n422), .Z(n350) );
  INVERT_M U336 ( .A(n276), .Z(n497) );
  INVERT_C U337 ( .A(n352), .Z(n184) );
  INVERT_H U338 ( .A(a_in[9]), .Z(n353) );
  NOR2_C U339 ( .A(n252), .B(n276), .Z(n354) );
  NOR2_C U340 ( .A(n275), .B(n353), .Z(n355) );
  NOR2_C U341 ( .A(n354), .B(n355), .Z(n352) );
  AO22_F U342 ( .A1(a_in[10]), .A2(n490), .B1(n497), .B2(n432), .Z(n185) );
  AO22_F U343 ( .A1(a_in[11]), .A2(n490), .B1(n497), .B2(n433), .Z(n186) );
  AO22_F U344 ( .A1(a_in[12]), .A2(n490), .B1(n497), .B2(n434), .Z(n187) );
  AO22_F U345 ( .A1(a_in[13]), .A2(n490), .B1(n497), .B2(n435), .Z(n188) );
  AO22_F U346 ( .A1(a_in[14]), .A2(n490), .B1(n497), .B2(n436), .Z(n189) );
  AO22_F U347 ( .A1(a_in[15]), .A2(n490), .B1(n497), .B2(n419), .Z(n190) );
  INVERT_F U348 ( .A(n21), .Z(n406) );
  INVERT_F U349 ( .A(n20), .Z(n413) );
  INVERT_I U350 ( .A(n487), .Z(n356) );
  INVERT_H U351 ( .A(n486), .Z(n487) );
  AO222_F U352 ( .A1(n383), .A2(n357), .B1(b_in[1]), .B2(n484), .C1(n381), 
        .C2(n522), .Z(n144) );
  AO222_F U353 ( .A1(n385), .A2(n488), .B1(b_in[2]), .B2(n484), .C1(n383), 
        .C2(n523), .Z(n145) );
  AO222_F U354 ( .A1(n387), .A2(n488), .B1(b_in[3]), .B2(n484), .C1(n385), 
        .C2(n522), .Z(n146) );
  AO222_F U355 ( .A1(n389), .A2(n488), .B1(b_in[4]), .B2(n484), .C1(n387), 
        .C2(n523), .Z(n147) );
  AO222_F U356 ( .A1(n391), .A2(n488), .B1(b_in[5]), .B2(n484), .C1(n389), 
        .C2(n523), .Z(n148) );
  INVERT_C U357 ( .A(n358), .Z(n149) );
  INVERT_H U358 ( .A(b_in[6]), .Z(n359) );
  NOR2_C U359 ( .A(n526), .B(n390), .Z(n360) );
  NOR2_C U360 ( .A(n483), .B(n359), .Z(n361) );
  NOR2_C U361 ( .A(n486), .B(n392), .Z(n362) );
  NOR2_C U362 ( .A(n362), .B(n363), .Z(n358) );
  NOR2_C U363 ( .A(n360), .B(n361), .Z(n364) );
  INVERT_E U364 ( .A(n364), .Z(n363) );
  AO222_F U365 ( .A1(n395), .A2(n488), .B1(b_in[7]), .B2(n485), .C1(n393), 
        .C2(n522), .Z(n150) );
  AO222_F U366 ( .A1(n379), .A2(n488), .B1(b_in[8]), .B2(n485), .C1(n395), 
        .C2(n522), .Z(n151) );
  AO222_F U367 ( .A1(n397), .A2(n488), .B1(b_in[9]), .B2(n485), .C1(n521), 
        .C2(n379), .Z(n152) );
  AO222_F U368 ( .A1(n399), .A2(n488), .B1(b_in[10]), .B2(n485), .C1(n397), 
        .C2(n522), .Z(n153) );
  AO222_F U369 ( .A1(n401), .A2(n488), .B1(b_in[11]), .B2(n485), .C1(n399), 
        .C2(n521), .Z(n154) );
  AO222_F U370 ( .A1(n403), .A2(n488), .B1(b_in[12]), .B2(n485), .C1(n401), 
        .C2(n522), .Z(n155) );
  AO222_F U371 ( .A1(n405), .A2(n488), .B1(b_in[13]), .B2(n485), .C1(n403), 
        .C2(n522), .Z(n156) );
  AO222_F U372 ( .A1(shift_reg[16]), .A2(n488), .B1(b_in[14]), .B2(n485), .C1(
        n405), .C2(n522), .Z(n157) );
  NAND2_D U373 ( .A(n216), .B(n203), .Z(n162) );
  NAND2BAL_E U374 ( .A(n456), .B(n492), .Z(n365) );
  NAND2BAL_E U375 ( .A(N31), .B(n508), .Z(n366) );
  NAND2BAL_E U376 ( .A(N47), .B(n480), .Z(n367) );
  NAND2BAL_E U377 ( .A(n454), .B(n523), .Z(n368) );
  INVERT_M U378 ( .A(n479), .Z(n480) );
  AO2222_F U379 ( .A1(n456), .A2(n523), .B1(N48), .B2(n480), .C1(N32), .C2(
        n508), .D1(n458), .D2(n492), .Z(n163) );
  AO2222_F U380 ( .A1(n458), .A2(n524), .B1(N49), .B2(n480), .C1(N33), .C2(
        n508), .D1(n460), .D2(n492), .Z(n164) );
  AO2222_F U381 ( .A1(n460), .A2(n523), .B1(N50), .B2(n480), .C1(N34), .C2(
        n508), .D1(n462), .D2(n492), .Z(n165) );
  AO2222_F U382 ( .A1(n462), .A2(n524), .B1(N51), .B2(n480), .C1(N35), .C2(
        n482), .D1(n464), .D2(n492), .Z(n166) );
  AO2222_F U383 ( .A1(n464), .A2(n523), .B1(N52), .B2(n509), .C1(N36), .C2(
        n482), .D1(n466), .D2(n492), .Z(n167) );
  AO2222_F U384 ( .A1(n466), .A2(n523), .B1(N53), .B2(n509), .C1(N37), .C2(
        n482), .D1(n468), .D2(n492), .Z(n168) );
  AO2222_F U385 ( .A1(n468), .A2(n524), .B1(N54), .B2(n509), .C1(N38), .C2(
        n482), .D1(n470), .D2(n492), .Z(n169) );
  NAND2_D U386 ( .A(n201), .B(n208), .Z(n170) );
  NAND2BAL_E U387 ( .A(n472), .B(n492), .Z(n369) );
  NAND2BAL_E U388 ( .A(N39), .B(n482), .Z(n370) );
  NAND2BAL_E U389 ( .A(N55), .B(n509), .Z(n371) );
  NAND2BAL_E U390 ( .A(n470), .B(n524), .Z(n372) );
  INVERT_M U391 ( .A(n481), .Z(n482) );
  INVERT_H U392 ( .A(n17), .Z(n373) );
  INVERT_H U393 ( .A(n373), .Z(n374) );
  BUFFER_H U394 ( .A(n63), .Z(n504) );
  INVERT_H U395 ( .A(n501), .Z(n375) );
  NOR2_C U396 ( .A(n439), .B(n8), .Z(n197) );
  AOI22_B U397 ( .A1(N43), .A2(n480), .B1(shift_reg[16]), .B2(n521), .Z(n24)
         );
  AND3_H U398 ( .A(n272), .B(n274), .C(n24), .Z(n158) );
  INVERT_C U399 ( .A(n158), .Z(n376) );
  AND3_H U400 ( .A(n443), .B(n440), .C(n488), .Z(n196) );
  NOR2_D U401 ( .A(n491), .B(n521), .Z(n15) );
  INVERT_M U402 ( .A(n526), .Z(n521) );
  NOR2_D U403 ( .A(n441), .B(n574), .Z(n10) );
  BUFFER_J U404 ( .A(n18), .Z(n493) );
  AND2_I U405 ( .A(n27), .B(n357), .Z(n18) );
  INVERT_K U406 ( .A(n518), .Z(n516) );
  NAND2_E U407 ( .A(n439), .B(n573), .Z(n29) );
  INVERT_J U408 ( .A(n259), .Z(n573) );
  NOR2_E U409 ( .A(n441), .B(n267), .Z(n69) );
  AO22_F U410 ( .A1(n257), .A2(n575), .B1(N75), .B2(n255), .Z(n194) );
  INVERT_H U411 ( .A(n421), .Z(N75) );
  INVERT_E U412 ( .A(n568), .Z(n377) );
  INVERT_H U413 ( .A(n377), .Z(n378) );
  BUFFER_J U414 ( .A(n6), .Z(n506) );
  AND2_H U415 ( .A(n68), .B(n357), .Z(n63) );
  AOI21_E U416 ( .A1(n443), .A2(n69), .B(n521), .Z(n68) );
  INVERT_I U417 ( .A(n251), .Z(n379) );
  INVERT_H U418 ( .A(shift_reg[2]), .Z(n380) );
  INVERT_F U419 ( .A(n380), .Z(n381) );
  INVERT_H U420 ( .A(shift_reg[3]), .Z(n382) );
  INVERT_F U421 ( .A(n382), .Z(n383) );
  INVERT_H U422 ( .A(shift_reg[4]), .Z(n384) );
  INVERT_F U423 ( .A(n384), .Z(n385) );
  INVERT_H U424 ( .A(shift_reg[5]), .Z(n386) );
  INVERT_F U425 ( .A(n386), .Z(n387) );
  INVERT_H U426 ( .A(shift_reg[6]), .Z(n388) );
  INVERT_F U427 ( .A(n388), .Z(n389) );
  INVERT_H U428 ( .A(shift_reg[7]), .Z(n390) );
  INVERT_F U429 ( .A(n390), .Z(n391) );
  INVERT_H U430 ( .A(shift_reg[8]), .Z(n392) );
  INVERT_F U431 ( .A(n392), .Z(n393) );
  INVERT_H U432 ( .A(shift_reg[9]), .Z(n394) );
  INVERT_F U433 ( .A(n394), .Z(n395) );
  INVERT_H U434 ( .A(shift_reg[11]), .Z(n396) );
  INVERT_F U435 ( .A(n396), .Z(n397) );
  INVERT_H U436 ( .A(shift_reg[12]), .Z(n398) );
  INVERT_F U437 ( .A(n398), .Z(n399) );
  INVERT_H U438 ( .A(shift_reg[13]), .Z(n400) );
  INVERT_F U439 ( .A(n400), .Z(n401) );
  INVERT_H U440 ( .A(shift_reg[14]), .Z(n402) );
  INVERT_F U441 ( .A(n402), .Z(n403) );
  INVERT_H U442 ( .A(shift_reg[15]), .Z(n404) );
  INVERT_F U443 ( .A(n404), .Z(n405) );
  INVERT_I U444 ( .A(n406), .Z(n407) );
  INVERT_D U445 ( .A(n279), .Z(n410) );
  INVERT_H U446 ( .A(n357), .Z(n408) );
  NOR2_C U447 ( .A(n410), .B(n411), .Z(n412) );
  INVERT_E U448 ( .A(n412), .Z(n409) );
  INVERT_I U449 ( .A(n413), .Z(n414) );
  NOR2_C U450 ( .A(n445), .B(n375), .Z(n416) );
  INVERT_E U451 ( .A(n416), .Z(n415) );
  INVERT_H U452 ( .A(shift_reg[32]), .Z(n417) );
  INVERT_I U453 ( .A(n417), .Z(n418) );
  INVERT_I U454 ( .A(n222), .Z(n419) );
  INVERT_H U455 ( .A(count[0]), .Z(n420) );
  INVERT_I U456 ( .A(n420), .Z(n421) );
  INVERT_I U457 ( .A(n205), .Z(n422) );
  INVERT_I U458 ( .A(n207), .Z(n423) );
  INVERT_I U459 ( .A(n206), .Z(n424) );
  INVERT_I U460 ( .A(n210), .Z(n425) );
  INVERT_I U461 ( .A(n209), .Z(n426) );
  INVERT_I U462 ( .A(n211), .Z(n427) );
  INVERT_I U463 ( .A(n212), .Z(n428) );
  INVERT_I U464 ( .A(n213), .Z(n429) );
  INVERT_H U465 ( .A(\m_reg[9] ), .Z(n430) );
  INVERT_I U466 ( .A(n214), .Z(n432) );
  INVERT_I U467 ( .A(n215), .Z(n433) );
  INVERT_I U468 ( .A(n217), .Z(n434) );
  INVERT_I U469 ( .A(n218), .Z(n435) );
  INVERT_I U470 ( .A(n221), .Z(n436) );
  INVERT_D U471 ( .A(n437), .Z(n438) );
  INVERT_H U472 ( .A(n7), .Z(n440) );
  INVERT_H U473 ( .A(n105), .Z(n442) );
  INVERT_I U474 ( .A(n442), .Z(n443) );
  INVERT_I U475 ( .A(n204), .Z(n444) );
  INVERT_H U476 ( .A(n445), .Z(n446) );
  INVERT_I U477 ( .A(n447), .Z(n448) );
  XOR2_B U478 ( .A(n448), .B(n9), .Z(n8) );
  NOR2_F U479 ( .A(n521), .B(n448), .Z(n13) );
  INVERT_H U480 ( .A(shift_reg[18]), .Z(n449) );
  INVERT_H U481 ( .A(shift_reg[19]), .Z(n451) );
  INVERT_H U482 ( .A(shift_reg[20]), .Z(n453) );
  INVERT_H U483 ( .A(shift_reg[21]), .Z(n455) );
  INVERT_H U484 ( .A(shift_reg[22]), .Z(n457) );
  INVERT_H U485 ( .A(shift_reg[23]), .Z(n459) );
  INVERT_H U486 ( .A(shift_reg[24]), .Z(n461) );
  INVERT_H U487 ( .A(shift_reg[25]), .Z(n463) );
  INVERT_H U488 ( .A(shift_reg[26]), .Z(n465) );
  INVERT_H U489 ( .A(shift_reg[27]), .Z(n467) );
  INVERT_H U490 ( .A(shift_reg[28]), .Z(n469) );
  INVERT_H U491 ( .A(shift_reg[29]), .Z(n471) );
  INVERT_H U492 ( .A(shift_reg[30]), .Z(n473) );
  INVERT_H U493 ( .A(shift_reg[31]), .Z(n475) );
  INVERT_H U494 ( .A(shift_reg[17]), .Z(n477) );
  INVERT_K U495 ( .A(n13), .Z(n483) );
  INVERT_M U496 ( .A(n483), .Z(n485) );
  AO22_F U497 ( .A1(n257), .A2(n577), .B1(n255), .B2(n260), .Z(n191) );
  XNOR2_B U498 ( .A(n378), .B(count[3]), .Z(N78) );
  INVERT_K U499 ( .A(n537), .Z(n535) );
  NAND2BAL_E U500 ( .A(n498), .B(n514), .Z(n11) );
  NAND2_D U501 ( .A(n277), .B(n253), .Z(n195) );
  XOR2_B U502 ( .A(count[4]), .B(n569), .Z(N79) );
  INVERT_F U503 ( .A(n443), .Z(n574) );
  NOR2_C U504 ( .A(n378), .B(n570), .Z(n569) );
  NAND3_C U505 ( .A(n283), .B(n421), .C(n265), .Z(n568) );
  INVERT_F U506 ( .A(n504), .Z(n502) );
  INVERT_J U507 ( .A(n565), .Z(n563) );
  INVERT_H U508 ( .A(n107), .Z(n576) );
  INVERT_H U509 ( .A(n108), .Z(n577) );
  INVERT_H U510 ( .A(n104), .Z(n575) );
  INVERT_I U511 ( .A(n566), .Z(n565) );
  INVERT_L U512 ( .A(n561), .Z(n556) );
  INVERT_L U513 ( .A(n561), .Z(n557) );
  INVERT_L U514 ( .A(n527), .Z(n526) );
  INVERT_K U515 ( .A(n538), .Z(n534) );
  INVERT_H U516 ( .A(n539), .Z(n538) );
  INVERT_K U517 ( .A(n527), .Z(n525) );
  INVERT_I U518 ( .A(n539), .Z(n537) );
  INVERT_K U519 ( .A(n563), .Z(n562) );
  INVERT_K U520 ( .A(n563), .Z(n561) );
  INVERT_K U521 ( .A(n528), .Z(n527) );
  INVERT_I U522 ( .A(n11), .Z(n539) );
  INVERT_K U523 ( .A(n519), .Z(n515) );
  INVERT_H U524 ( .A(n520), .Z(n519) );
  INVERT_I U525 ( .A(n520), .Z(n518) );
  INVERT_K U526 ( .A(n564), .Z(n560) );
  INVERT_H U527 ( .A(n565), .Z(n564) );
  INVERT_I U528 ( .A(n29), .Z(n520) );
  INVERT_H U529 ( .A(rst_n), .Z(n566) );
  INVERT_L U530 ( .A(n535), .Z(n530) );
  INVERT_L U531 ( .A(n535), .Z(n531) );
  INVERT_K U532 ( .A(n554), .Z(n553) );
  INVERT_K U533 ( .A(n554), .Z(n552) );
  INVERT_K U534 ( .A(n555), .Z(n551) );
  INVERT_K U535 ( .A(n555), .Z(n550) );
  INVERT_K U536 ( .A(n556), .Z(n549) );
  INVERT_K U537 ( .A(n556), .Z(n548) );
  INVERT_K U538 ( .A(n556), .Z(n547) );
  INVERT_K U539 ( .A(n557), .Z(n546) );
  INVERT_K U540 ( .A(n557), .Z(n545) );
  INVERT_K U541 ( .A(n557), .Z(n544) );
  INVERT_L U542 ( .A(n534), .Z(n532) );
  INVERT_M U543 ( .A(n526), .Z(n522) );
  INVERT_M U544 ( .A(n525), .Z(n523) );
  INVERT_M U545 ( .A(n525), .Z(n524) );
  INVERT_K U546 ( .A(n534), .Z(n533) );
  INVERT_L U547 ( .A(n536), .Z(n529) );
  INVERT_H U548 ( .A(n537), .Z(n536) );
  INVERT_L U549 ( .A(n516), .Z(n511) );
  INVERT_L U550 ( .A(n516), .Z(n512) );
  INVERT_K U551 ( .A(n558), .Z(n543) );
  INVERT_K U552 ( .A(n558), .Z(n542) );
  INVERT_K U553 ( .A(n559), .Z(n541) );
  INVERT_K U554 ( .A(n559), .Z(n540) );
  INVERT_L U555 ( .A(n517), .Z(n510) );
  INVERT_H U556 ( .A(n518), .Z(n517) );
  INVERT_L U557 ( .A(n515), .Z(n513) );
  INVERT_K U558 ( .A(n515), .Z(n514) );
  INVERT_H U559 ( .A(n14), .Z(n528) );
  OAI22_B U560 ( .A1(n532), .A2(n103), .B1(n496), .B2(n513), .Z(n141) );
  OAI22_B U561 ( .A1(n529), .A2(n72), .B1(n281), .B2(n510), .Z(n110) );
  OAI22_B U562 ( .A1(n530), .A2(n73), .B1(n224), .B2(n511), .Z(n111) );
  OAI22_B U563 ( .A1(n529), .A2(n85), .B1(n225), .B2(n511), .Z(n123) );
  OAI22_B U564 ( .A1(n529), .A2(n87), .B1(n500), .B2(n512), .Z(n125) );
  OAI22_B U565 ( .A1(n530), .A2(n88), .B1(n236), .B2(n511), .Z(n126) );
  OAI22_B U566 ( .A1(n530), .A2(n89), .B1(n241), .B2(n511), .Z(n127) );
  OAI22_B U567 ( .A1(n530), .A2(n90), .B1(n250), .B2(n511), .Z(n128) );
  OAI22_B U568 ( .A1(n530), .A2(n91), .B1(n239), .B2(n511), .Z(n129) );
  OAI22_B U569 ( .A1(n530), .A2(n92), .B1(n240), .B2(n511), .Z(n130) );
  OAI22_B U570 ( .A1(n530), .A2(n93), .B1(n249), .B2(n512), .Z(n131) );
  OAI22_B U571 ( .A1(n531), .A2(n94), .B1(n244), .B2(n512), .Z(n132) );
  OAI22_B U572 ( .A1(n531), .A2(n95), .B1(n245), .B2(n512), .Z(n133) );
  OAI22_B U573 ( .A1(n531), .A2(n96), .B1(n246), .B2(n512), .Z(n134) );
  OAI22_B U574 ( .A1(n531), .A2(n97), .B1(n247), .B2(n512), .Z(n135) );
  OAI22_B U575 ( .A1(n531), .A2(n98), .B1(n248), .B2(n512), .Z(n136) );
  OAI22_B U576 ( .A1(n532), .A2(n74), .B1(n226), .B2(n513), .Z(n112) );
  OAI22_B U577 ( .A1(n532), .A2(n75), .B1(n227), .B2(n513), .Z(n113) );
  OAI22_B U578 ( .A1(n531), .A2(n99), .B1(n238), .B2(n513), .Z(n137) );
  OAI22_B U579 ( .A1(n531), .A2(n100), .B1(n237), .B2(n513), .Z(n138) );
  OAI22_B U580 ( .A1(n532), .A2(n101), .B1(n242), .B2(n513), .Z(n139) );
  OAI22_B U581 ( .A1(n532), .A2(n102), .B1(n243), .B2(n513), .Z(n140) );
  OAI22_B U582 ( .A1(n533), .A2(n81), .B1(n578), .B2(n510), .Z(n119) );
  OAI22_B U583 ( .A1(n529), .A2(n82), .B1(n228), .B2(n510), .Z(n120) );
  OAI22_B U584 ( .A1(n529), .A2(n83), .B1(n229), .B2(n510), .Z(n121) );
  OAI22_B U585 ( .A1(n529), .A2(n84), .B1(n230), .B2(n510), .Z(n122) );
  OAI22_B U586 ( .A1(n529), .A2(n86), .B1(n231), .B2(n510), .Z(n124) );
  OAI22_B U587 ( .A1(n532), .A2(n76), .B1(n232), .B2(n514), .Z(n114) );
  OAI22_B U588 ( .A1(n532), .A2(n77), .B1(n233), .B2(n514), .Z(n115) );
  OAI22_B U589 ( .A1(n533), .A2(n78), .B1(n234), .B2(n514), .Z(n116) );
  OAI22_B U590 ( .A1(n533), .A2(n79), .B1(n223), .B2(n514), .Z(n117) );
  OAI22_B U591 ( .A1(n533), .A2(n80), .B1(n235), .B2(n514), .Z(n118) );
  AOI21_B U592 ( .A1(n10), .A2(n357), .B(n533), .Z(n9) );
  NOR2_D U593 ( .A(n573), .B(n438), .Z(n6) );
  CLK_Q U594 ( .A(n407), .Z(n508) );
  CLK_Q U595 ( .A(n414), .Z(n509) );
  INVERT_D U596 ( .A(count[3]), .Z(n570) );
  INVERT_D U597 ( .A(n379), .Z(n578) );
endmodule

