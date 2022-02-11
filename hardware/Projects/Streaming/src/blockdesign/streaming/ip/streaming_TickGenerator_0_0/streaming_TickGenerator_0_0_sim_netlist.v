// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed May 22 14:40:42 2019
// Host        : ENGR-RCL11G running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top streaming_TickGenerator_0_0 -prefix
//               streaming_TickGenerator_0_0_ streaming_TickGenerator_0_1_sim_netlist.v
// Design      : streaming_TickGenerator_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module streaming_TickGenerator_0_0_TickGenerator
   (intr,
    tick,
    en,
    clk);
  output intr;
  output tick;
  input en;
  input clk;

  wire clk;
  wire [21:0]counter;
  wire [21:0]counter_0;
  wire \counter_reg[16]_i_2_n_0 ;
  wire \counter_reg[16]_i_2_n_1 ;
  wire \counter_reg[16]_i_2_n_2 ;
  wire \counter_reg[16]_i_2_n_3 ;
  wire \counter_reg[16]_i_2_n_5 ;
  wire \counter_reg[16]_i_2_n_6 ;
  wire \counter_reg[16]_i_2_n_7 ;
  wire \counter_reg[21]_i_3_n_5 ;
  wire \counter_reg[21]_i_3_n_6 ;
  wire \counter_reg[21]_i_3_n_7 ;
  wire \counter_reg[8]_i_2_n_0 ;
  wire \counter_reg[8]_i_2_n_1 ;
  wire \counter_reg[8]_i_2_n_2 ;
  wire \counter_reg[8]_i_2_n_3 ;
  wire \counter_reg[8]_i_2_n_5 ;
  wire \counter_reg[8]_i_2_n_6 ;
  wire \counter_reg[8]_i_2_n_7 ;
  wire [21:1]data0;
  wire en;
  wire intr;
  wire intr_i_1_n_0;
  wire intr_i_2_n_0;
  wire intr_i_3_n_0;
  wire intr_i_4_n_0;
  wire intr_i_5_n_0;
  wire intr_i_6_n_0;
  wire p_0_in;
  wire tick;
  wire tick_i_1_n_0;
  wire tick_i_2_n_0;
  wire tick_i_3_n_0;
  wire tick_i_4_n_0;
  wire tick_i_5_n_0;
  wire tick_i_6_n_0;
  wire [3:3]\NLW_counter_reg[16]_i_2_CO_UNCONNECTED ;
  wire [7:3]\NLW_counter_reg[21]_i_3_CO_UNCONNECTED ;
  wire [7:5]\NLW_counter_reg[21]_i_3_O_UNCONNECTED ;
  wire [3:3]\NLW_counter_reg[8]_i_2_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h00000000FFFFFFFD)) 
    \counter[0]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(counter[0]),
        .O(counter_0[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[10]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[10]),
        .O(counter_0[10]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[11]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[11]),
        .O(counter_0[11]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[12]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[12]),
        .O(counter_0[12]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[13]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[13]),
        .O(counter_0[13]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[14]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[14]),
        .O(counter_0[14]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[15]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[15]),
        .O(counter_0[15]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[16]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[16]),
        .O(counter_0[16]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[17]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[17]),
        .O(counter_0[17]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[18]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[18]),
        .O(counter_0[18]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[19]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[19]),
        .O(counter_0[19]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[1]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[1]),
        .O(counter_0[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[20]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[20]),
        .O(counter_0[20]));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[21]_i_1 
       (.I0(en),
        .O(p_0_in));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[21]_i_2 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[21]),
        .O(counter_0[21]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[2]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[2]),
        .O(counter_0[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[3]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[3]),
        .O(counter_0[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[4]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[4]),
        .O(counter_0[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[5]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[5]),
        .O(counter_0[5]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[6]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[6]),
        .O(counter_0[6]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[7]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[7]),
        .O(counter_0[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[8]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[8]),
        .O(counter_0[8]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \counter[9]_i_1 
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(data0[9]),
        .O(counter_0[9]));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[0]),
        .Q(counter[0]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[10]),
        .Q(counter[10]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[11]),
        .Q(counter[11]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[12]),
        .Q(counter[12]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[13]),
        .Q(counter[13]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[14]),
        .Q(counter[14]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[15]),
        .Q(counter[15]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[16]),
        .Q(counter[16]),
        .R(p_0_in));
  CARRY8 \counter_reg[16]_i_2 
       (.CI(\counter_reg[8]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\counter_reg[16]_i_2_n_0 ,\counter_reg[16]_i_2_n_1 ,\counter_reg[16]_i_2_n_2 ,\counter_reg[16]_i_2_n_3 ,\NLW_counter_reg[16]_i_2_CO_UNCONNECTED [3],\counter_reg[16]_i_2_n_5 ,\counter_reg[16]_i_2_n_6 ,\counter_reg[16]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:9]),
        .S(counter[16:9]));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[17]),
        .Q(counter[17]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[18]),
        .Q(counter[18]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[19]),
        .Q(counter[19]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[1]),
        .Q(counter[1]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[20]),
        .Q(counter[20]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[21]),
        .Q(counter[21]),
        .R(p_0_in));
  CARRY8 \counter_reg[21]_i_3 
       (.CI(\counter_reg[16]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_counter_reg[21]_i_3_CO_UNCONNECTED [7:3],\counter_reg[21]_i_3_n_5 ,\counter_reg[21]_i_3_n_6 ,\counter_reg[21]_i_3_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_reg[21]_i_3_O_UNCONNECTED [7:5],data0[21:17]}),
        .S({1'b0,1'b0,1'b0,counter[21:17]}));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[2]),
        .Q(counter[2]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[3]),
        .Q(counter[3]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[4]),
        .Q(counter[4]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[5]),
        .Q(counter[5]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[6]),
        .Q(counter[6]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[7]),
        .Q(counter[7]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[8]),
        .Q(counter[8]),
        .R(p_0_in));
  CARRY8 \counter_reg[8]_i_2 
       (.CI(counter[0]),
        .CI_TOP(1'b0),
        .CO({\counter_reg[8]_i_2_n_0 ,\counter_reg[8]_i_2_n_1 ,\counter_reg[8]_i_2_n_2 ,\counter_reg[8]_i_2_n_3 ,\NLW_counter_reg[8]_i_2_CO_UNCONNECTED [3],\counter_reg[8]_i_2_n_5 ,\counter_reg[8]_i_2_n_6 ,\counter_reg[8]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:1]),
        .S(counter[8:1]));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \counter_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(counter_0[9]),
        .Q(counter[9]),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    intr_i_1
       (.I0(intr),
        .I1(intr_i_2_n_0),
        .I2(intr_i_3_n_0),
        .I3(intr_i_4_n_0),
        .I4(counter[16]),
        .I5(counter[11]),
        .O(intr_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEFFFFFF)) 
    intr_i_2
       (.I0(intr_i_5_n_0),
        .I1(intr_i_6_n_0),
        .I2(counter[20]),
        .I3(counter[2]),
        .I4(en),
        .I5(tick_i_3_n_0),
        .O(intr_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    intr_i_3
       (.I0(counter[5]),
        .I1(counter[4]),
        .I2(counter[14]),
        .I3(counter[3]),
        .O(intr_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    intr_i_4
       (.I0(counter[8]),
        .I1(counter[9]),
        .O(intr_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    intr_i_5
       (.I0(counter[10]),
        .I1(counter[18]),
        .I2(counter[7]),
        .I3(counter[19]),
        .O(intr_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFFD)) 
    intr_i_6
       (.I0(counter[0]),
        .I1(counter[15]),
        .I2(counter[1]),
        .I3(counter[17]),
        .O(intr_i_6_n_0));
  FDSE #(
    .IS_C_INVERTED(1'b1)) 
    intr_reg
       (.C(clk),
        .CE(1'b1),
        .D(intr_i_1_n_0),
        .Q(intr),
        .S(tick_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    tick_i_1
       (.I0(tick_i_2_n_0),
        .I1(tick_i_3_n_0),
        .I2(tick_i_4_n_0),
        .I3(tick_i_5_n_0),
        .I4(tick_i_6_n_0),
        .I5(en),
        .O(tick_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    tick_i_2
       (.I0(counter[11]),
        .I1(counter[16]),
        .I2(counter[3]),
        .I3(counter[14]),
        .I4(counter[4]),
        .I5(counter[5]),
        .O(tick_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    tick_i_3
       (.I0(counter[13]),
        .I1(counter[12]),
        .I2(counter[21]),
        .I3(counter[6]),
        .O(tick_i_3_n_0));
  LUT4 #(
    .INIT(16'hFF7F)) 
    tick_i_4
       (.I0(counter[20]),
        .I1(counter[10]),
        .I2(counter[7]),
        .I3(counter[0]),
        .O(tick_i_4_n_0));
  LUT4 #(
    .INIT(16'hDFFF)) 
    tick_i_5
       (.I0(counter[15]),
        .I1(counter[1]),
        .I2(counter[18]),
        .I3(counter[19]),
        .O(tick_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    tick_i_6
       (.I0(counter[9]),
        .I1(counter[8]),
        .I2(counter[17]),
        .I3(counter[2]),
        .O(tick_i_6_n_0));
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    tick_reg
       (.C(clk),
        .CE(1'b1),
        .D(1'b0),
        .Q(tick),
        .S(tick_i_1_n_0));
endmodule

(* CHECK_LICENSE_TYPE = "streaming_TickGenerator_0_1,TickGenerator,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "TickGenerator,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module streaming_TickGenerator_0_0
   (clk,
    en,
    tick,
    intr);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 99990000, PHASE 0.000, CLK_DOMAIN streaming_zynq_ultra_ps_e_0_0_pl_clk0" *) input clk;
  input en;
  output tick;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 intr INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME intr, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output intr;

  wire clk;
  wire en;
  wire intr;
  wire tick;

  streaming_TickGenerator_0_0_TickGenerator inst
       (.clk(clk),
        .en(en),
        .intr(intr),
        .tick(tick));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
