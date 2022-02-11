// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed May 22 14:40:46 2019
// Host        : ENGR-RCL11G running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/rubenpurdy/Developer/RANC/Emulation/Projects/RANCStreaming/src/blockdesign/streaming/ip/streaming_AXIStreamPacketBuffer_0_1/streaming_AXIStreamPacketBuffer_0_1_sim_netlist.v
// Design      : streaming_AXIStreamPacketBuffer_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "streaming_AXIStreamPacketBuffer_0_1,AXIStreamPacketBuffer,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "AXIStreamPacketBuffer,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module streaming_AXIStreamPacketBuffer_0_1
   (clk,
    rst,
    tick,
    packet,
    packet_valid,
    buffer_overflow_error,
    buffer_to_stream_error,
    m00_axis_aclk,
    m00_axis_aresetn,
    m00_axis_tvalid,
    m00_axis_tdata,
    m00_axis_tstrb,
    m00_axis_tlast,
    m00_axis_tready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF m00_axis, ASSOCIATED_RESET rst, FREQ_HZ 99990000, PHASE 0.000, CLK_DOMAIN streaming_zynq_ultra_ps_e_0_0_pl_clk0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH" *) input rst;
  input tick;
  input [29:0]packet;
  input packet_valid;
  output buffer_overflow_error;
  output buffer_to_stream_error;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m00_axis_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m00_axis_aclk, ASSOCIATED_RESET m00_axis_aresetn, FREQ_HZ 99990000, PHASE 0.000, CLK_DOMAIN streaming_zynq_ultra_ps_e_0_0_pl_clk0" *) input m00_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 m00_axis_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m00_axis_aresetn, POLARITY ACTIVE_LOW" *) input m00_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m00_axis TVALID" *) output m00_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m00_axis TDATA" *) output [31:0]m00_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m00_axis TSTRB" *) output [3:0]m00_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m00_axis TLAST" *) output m00_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m00_axis TREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m00_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 99990000, PHASE 0.000, CLK_DOMAIN streaming_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef" *) input m00_axis_tready;

  wire \<const1> ;
  wire buffer_overflow_error;
  wire buffer_to_stream_error;
  wire clk;
  wire m00_axis_aclk;
  wire m00_axis_aresetn;
  wire [31:0]m00_axis_tdata;
  wire m00_axis_tlast;
  wire m00_axis_tready;
  wire m00_axis_tvalid;
  wire [29:0]packet;
  wire packet_valid;
  wire rst;
  wire tick;

  assign m00_axis_tstrb[3] = \<const1> ;
  assign m00_axis_tstrb[2] = \<const1> ;
  assign m00_axis_tstrb[1] = \<const1> ;
  assign m00_axis_tstrb[0] = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  streaming_AXIStreamPacketBuffer_0_1_AXIStreamPacketBuffer inst
       (.buffer_overflow_error(buffer_overflow_error),
        .buffer_to_stream_error(buffer_to_stream_error),
        .clk(clk),
        .m00_axis_aclk(m00_axis_aclk),
        .m00_axis_aresetn(m00_axis_aresetn),
        .m00_axis_tdata(m00_axis_tdata),
        .m00_axis_tlast(m00_axis_tlast),
        .m00_axis_tready(m00_axis_tready),
        .m00_axis_tvalid(m00_axis_tvalid),
        .packet(packet),
        .packet_valid(packet_valid),
        .rst(rst),
        .tick(tick));
endmodule

(* ORIG_REF_NAME = "AXIStreamPacketBuffer" *) 
module streaming_AXIStreamPacketBuffer_0_1_AXIStreamPacketBuffer
   (m00_axis_tvalid,
    m00_axis_tdata,
    m00_axis_tlast,
    buffer_to_stream_error,
    buffer_overflow_error,
    m00_axis_aresetn,
    m00_axis_aclk,
    rst,
    tick,
    clk,
    packet,
    packet_valid,
    m00_axis_tready);
  output m00_axis_tvalid;
  output [31:0]m00_axis_tdata;
  output m00_axis_tlast;
  output buffer_to_stream_error;
  output buffer_overflow_error;
  input m00_axis_aresetn;
  input m00_axis_aclk;
  input rst;
  input tick;
  input clk;
  input [29:0]packet;
  input packet_valid;
  input m00_axis_tready;

  wire AXIStreamPacketBuffer_M00_AXIS_inst_n_0;
  wire AXIStreamPacketBuffer_M00_AXIS_inst_n_13;
  wire AXIStreamPacketBuffer_M00_AXIS_inst_n_14;
  wire AXIStreamPacketBuffer_M00_AXIS_inst_n_15;
  wire AXIStreamPacketBuffer_M00_AXIS_inst_n_16;
  wire AXIStreamPacketBuffer_M00_AXIS_inst_n_17;
  wire AXIStreamPacketBuffer_M00_AXIS_inst_n_18;
  wire AXIStreamPacketBuffer_M00_AXIS_inst_n_19;
  wire AXIStreamPacketBuffer_M00_AXIS_inst_n_20;
  wire AXIStreamPacketBuffer_M00_AXIS_inst_n_21;
  wire AXIStreamPacketBuffer_M00_AXIS_inst_n_22;
  wire AXIStreamPacketBuffer_M00_AXIS_inst_n_23;
  wire AXIStreamPacketBuffer_M00_AXIS_inst_n_24;
  wire AXIStreamPacketBuffer_M00_AXIS_inst_n_25;
  wire AXIStreamPacketBuffer_M00_AXIS_inst_n_26;
  wire DoubleBuffer_inst_n_2;
  wire DoubleBuffer_inst_n_44;
  wire DoubleBuffer_inst_n_45;
  wire DoubleBuffer_inst_n_46;
  wire DoubleBuffer_inst_n_47;
  wire DoubleBuffer_inst_n_48;
  wire DoubleBuffer_inst_n_49;
  wire DoubleBuffer_inst_n_50;
  wire DoubleBuffer_inst_n_51;
  wire DoubleBuffer_inst_n_52;
  wire DoubleBuffer_inst_n_53;
  wire axis_tvalid0;
  wire buffer_overflow_error;
  wire buffer_to_stream_error;
  wire clk;
  wire [31:0]data;
  wire m00_axis_aclk;
  wire m00_axis_aresetn;
  wire [31:0]m00_axis_tdata;
  wire m00_axis_tlast;
  wire m00_axis_tready;
  wire m00_axis_tvalid;
  wire [7:0]num_packets;
  wire [29:0]packet;
  wire packet_valid;
  wire [7:0]read_addr;
  wire read_en;
  wire rst;
  wire tick;
  wire tx_done0__14;
  wire tx_en;

  streaming_AXIStreamPacketBuffer_0_1_AXIStreamPacketBuffer_M00_AXIS AXIStreamPacketBuffer_M00_AXIS_inst
       (.ADDRB({AXIStreamPacketBuffer_M00_AXIS_inst_n_17,AXIStreamPacketBuffer_M00_AXIS_inst_n_18,AXIStreamPacketBuffer_M00_AXIS_inst_n_19,AXIStreamPacketBuffer_M00_AXIS_inst_n_20,AXIStreamPacketBuffer_M00_AXIS_inst_n_21}),
        .ADDRG({AXIStreamPacketBuffer_M00_AXIS_inst_n_13,AXIStreamPacketBuffer_M00_AXIS_inst_n_14,AXIStreamPacketBuffer_M00_AXIS_inst_n_15,AXIStreamPacketBuffer_M00_AXIS_inst_n_16}),
        .CO(axis_tvalid0),
        .D(data),
        .DI({DoubleBuffer_inst_n_44,DoubleBuffer_inst_n_45,DoubleBuffer_inst_n_46,DoubleBuffer_inst_n_47}),
        .E(tx_en),
        .Q(read_addr),
        .S({DoubleBuffer_inst_n_48,DoubleBuffer_inst_n_49,DoubleBuffer_inst_n_50,DoubleBuffer_inst_n_51}),
        .axis_tlast_delay_reg_0(AXIStreamPacketBuffer_M00_AXIS_inst_n_26),
        .buffer_to_stream_error(buffer_to_stream_error),
        .m00_axis_aclk(m00_axis_aclk),
        .m00_axis_aresetn(m00_axis_aresetn),
        .m00_axis_tdata(m00_axis_tdata),
        .m00_axis_tlast(m00_axis_tlast),
        .m00_axis_tready(m00_axis_tready),
        .m00_axis_tvalid(m00_axis_tvalid),
        .\num_packets_reg[0] (DoubleBuffer_inst_n_52),
        .\num_packets_reg[0]_0 (DoubleBuffer_inst_n_53),
        .\num_packets_reg[6] (DoubleBuffer_inst_n_2),
        .\num_packets_reg[7] (num_packets),
        .out(AXIStreamPacketBuffer_M00_AXIS_inst_n_0),
        .read_en(read_en),
        .\read_pointer_reg[5]_0 ({AXIStreamPacketBuffer_M00_AXIS_inst_n_23,AXIStreamPacketBuffer_M00_AXIS_inst_n_24}),
        .\read_pointer_reg[5]_rep_0 (AXIStreamPacketBuffer_M00_AXIS_inst_n_22),
        .tx_done0__14(tx_done0__14),
        .tx_done_reg_0(AXIStreamPacketBuffer_M00_AXIS_inst_n_25));
  streaming_AXIStreamPacketBuffer_0_1_DoubleBuffer DoubleBuffer_inst
       (.ADDRB({AXIStreamPacketBuffer_M00_AXIS_inst_n_17,AXIStreamPacketBuffer_M00_AXIS_inst_n_18,AXIStreamPacketBuffer_M00_AXIS_inst_n_19,AXIStreamPacketBuffer_M00_AXIS_inst_n_20,AXIStreamPacketBuffer_M00_AXIS_inst_n_21}),
        .ADDRG({AXIStreamPacketBuffer_M00_AXIS_inst_n_13,AXIStreamPacketBuffer_M00_AXIS_inst_n_14,AXIStreamPacketBuffer_M00_AXIS_inst_n_15,AXIStreamPacketBuffer_M00_AXIS_inst_n_16}),
        .CO(axis_tvalid0),
        .D(data),
        .DI({DoubleBuffer_inst_n_44,DoubleBuffer_inst_n_45,DoubleBuffer_inst_n_46,DoubleBuffer_inst_n_47}),
        .E(tx_en),
        .Q(read_addr),
        .S({DoubleBuffer_inst_n_48,DoubleBuffer_inst_n_49,DoubleBuffer_inst_n_50,DoubleBuffer_inst_n_51}),
        .axis_tlast_delay_reg(DoubleBuffer_inst_n_2),
        .axis_tlast_delay_reg_0(num_packets),
        .buffer_overflow_error(buffer_overflow_error),
        .clk(clk),
        .m00_axis_tready(m00_axis_tready),
        .out(AXIStreamPacketBuffer_M00_AXIS_inst_n_0),
        .packet(packet),
        .packet_valid(packet_valid),
        .read_en(read_en),
        .\read_pointer_reg[0] (AXIStreamPacketBuffer_M00_AXIS_inst_n_26),
        .\read_pointer_reg[0]_rep__0 (DoubleBuffer_inst_n_52),
        .\read_pointer_reg[0]_rep__0_0 (DoubleBuffer_inst_n_53),
        .\read_pointer_reg[2]_rep__1 (AXIStreamPacketBuffer_M00_AXIS_inst_n_22),
        .\read_pointer_reg[3]_rep (AXIStreamPacketBuffer_M00_AXIS_inst_n_25),
        .\read_pointer_reg[3]_rep__0 ({AXIStreamPacketBuffer_M00_AXIS_inst_n_23,AXIStreamPacketBuffer_M00_AXIS_inst_n_24}),
        .rst(rst),
        .tick(tick),
        .tx_done0__14(tx_done0__14));
endmodule

(* ORIG_REF_NAME = "AXIStreamPacketBuffer_M00_AXIS" *) 
module streaming_AXIStreamPacketBuffer_0_1_AXIStreamPacketBuffer_M00_AXIS
   (out,
    m00_axis_tvalid,
    m00_axis_tlast,
    CO,
    buffer_to_stream_error,
    Q,
    ADDRG,
    ADDRB,
    \read_pointer_reg[5]_rep_0 ,
    \read_pointer_reg[5]_0 ,
    tx_done_reg_0,
    axis_tlast_delay_reg_0,
    m00_axis_tdata,
    m00_axis_aclk,
    \num_packets_reg[6] ,
    DI,
    S,
    \num_packets_reg[0] ,
    \num_packets_reg[0]_0 ,
    m00_axis_aresetn,
    tx_done0__14,
    E,
    m00_axis_tready,
    \num_packets_reg[7] ,
    read_en,
    D);
  output [0:0]out;
  output m00_axis_tvalid;
  output m00_axis_tlast;
  output [0:0]CO;
  output buffer_to_stream_error;
  output [7:0]Q;
  output [3:0]ADDRG;
  output [4:0]ADDRB;
  output [0:0]\read_pointer_reg[5]_rep_0 ;
  output [1:0]\read_pointer_reg[5]_0 ;
  output tx_done_reg_0;
  output axis_tlast_delay_reg_0;
  output [31:0]m00_axis_tdata;
  input m00_axis_aclk;
  input \num_packets_reg[6] ;
  input [3:0]DI;
  input [3:0]S;
  input [0:0]\num_packets_reg[0] ;
  input [0:0]\num_packets_reg[0]_0 ;
  input m00_axis_aresetn;
  input tx_done0__14;
  input [0:0]E;
  input m00_axis_tready;
  input [7:0]\num_packets_reg[7] ;
  input read_en;
  input [31:0]D;

  wire [4:0]ADDRB;
  wire [3:0]ADDRG;
  wire [0:0]CO;
  wire [31:0]D;
  wire [3:0]DI;
  wire [0:0]E;
  wire \FSM_onehot_mst_exec_state[0]_i_1_n_0 ;
  wire \FSM_onehot_mst_exec_state[1]_i_1_n_0 ;
  wire \FSM_onehot_mst_exec_state[2]_i_1_n_0 ;
  wire \FSM_onehot_mst_exec_state[2]_i_2_n_0 ;
  wire \FSM_onehot_mst_exec_state[2]_i_3_n_0 ;
  wire [7:0]Q;
  wire [3:0]S;
  wire axis_tlast_delay_reg_0;
  wire axis_tvalid;
  wire axis_tvalid0_carry_n_5;
  wire axis_tvalid0_carry_n_6;
  wire axis_tvalid0_carry_n_7;
  wire buffer_to_stream_error;
  wire buffer_to_stream_error_i_1_n_0;
  wire buffer_to_stream_error_i_2_n_0;
  (* RTL_KEEP = "yes" *) wire count;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire \count[3]_i_1_n_0 ;
  wire \count[4]_i_1_n_0 ;
  wire \count_reg_n_0_[0] ;
  wire \count_reg_n_0_[1] ;
  wire \count_reg_n_0_[2] ;
  wire \count_reg_n_0_[3] ;
  wire \count_reg_n_0_[4] ;
  wire m00_axis_aclk;
  wire m00_axis_aresetn;
  wire [31:0]m00_axis_tdata;
  wire m00_axis_tlast;
  wire m00_axis_tready;
  wire m00_axis_tvalid;
  wire [0:0]\num_packets_reg[0] ;
  wire [0:0]\num_packets_reg[0]_0 ;
  wire \num_packets_reg[6] ;
  wire [7:0]\num_packets_reg[7] ;
  (* RTL_KEEP = "yes" *) wire [0:0]out;
  wire [1:1]p_0_in;
  wire read_en;
  (* RTL_KEEP = "yes" *) wire read_pointer;
  wire read_pointer1;
  wire read_pointer1_carry_i_10_n_0;
  wire read_pointer1_carry_i_1_n_0;
  wire read_pointer1_carry_i_2_n_0;
  wire read_pointer1_carry_i_3_n_0;
  wire read_pointer1_carry_i_5_n_0;
  wire read_pointer1_carry_i_6_n_0;
  wire read_pointer1_carry_i_7_n_0;
  wire read_pointer1_carry_i_8_n_0;
  wire read_pointer1_carry_n_5;
  wire read_pointer1_carry_n_6;
  wire read_pointer1_carry_n_7;
  wire [7:2]read_pointer2;
  wire \read_pointer[0]_i_1_n_0 ;
  wire \read_pointer[0]_rep_i_1__0_n_0 ;
  wire \read_pointer[0]_rep_i_1_n_0 ;
  wire \read_pointer[1]_rep_i_1__0_n_0 ;
  wire \read_pointer[1]_rep_i_1__1_n_0 ;
  wire \read_pointer[1]_rep_i_1_n_0 ;
  wire \read_pointer[2]_rep_i_1__0_n_0 ;
  wire \read_pointer[2]_rep_i_1__1_n_0 ;
  wire \read_pointer[2]_rep_i_1_n_0 ;
  wire \read_pointer[3]_rep_i_1__0_n_0 ;
  wire \read_pointer[3]_rep_i_1_n_0 ;
  wire \read_pointer[4]_rep_i_1_n_0 ;
  wire \read_pointer[5]_rep_i_1_n_0 ;
  wire \read_pointer[7]_i_1_n_0 ;
  wire \read_pointer[7]_i_2_n_0 ;
  wire \read_pointer[7]_i_4_n_0 ;
  wire [1:0]\read_pointer_reg[5]_0 ;
  wire [0:0]\read_pointer_reg[5]_rep_0 ;
  wire tx_done0__14;
  wire tx_done_i_1_n_0;
  wire tx_done_reg_0;
  wire tx_done_reg_n_0;
  wire [7:4]NLW_axis_tvalid0_carry_CO_UNCONNECTED;
  wire [7:0]NLW_axis_tvalid0_carry_O_UNCONNECTED;
  wire [7:3]NLW_read_pointer1_carry_CO_UNCONNECTED;
  wire [7:0]NLW_read_pointer1_carry_O_UNCONNECTED;

  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_mst_exec_state[0]_i_1 
       (.I0(out),
        .I1(tx_done_reg_n_0),
        .O(\FSM_onehot_mst_exec_state[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hBA)) 
    \FSM_onehot_mst_exec_state[1]_i_1 
       (.I0(read_pointer),
        .I1(\FSM_onehot_mst_exec_state[2]_i_3_n_0 ),
        .I2(count),
        .O(\FSM_onehot_mst_exec_state[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFEA)) 
    \FSM_onehot_mst_exec_state[2]_i_1 
       (.I0(out),
        .I1(read_pointer),
        .I2(read_en),
        .I3(count),
        .O(\FSM_onehot_mst_exec_state[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_mst_exec_state[2]_i_2 
       (.I0(\FSM_onehot_mst_exec_state[2]_i_3_n_0 ),
        .I1(count),
        .I2(tx_done_reg_n_0),
        .I3(out),
        .O(\FSM_onehot_mst_exec_state[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \FSM_onehot_mst_exec_state[2]_i_3 
       (.I0(\count_reg_n_0_[3] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(\count_reg_n_0_[0] ),
        .I3(\count_reg_n_0_[4] ),
        .I4(\count_reg_n_0_[2] ),
        .O(\FSM_onehot_mst_exec_state[2]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "INIT_COUNTER:010,SEND_STREAM:100,IDLE:001" *) 
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_mst_exec_state_reg[0] 
       (.C(m00_axis_aclk),
        .CE(\FSM_onehot_mst_exec_state[2]_i_1_n_0 ),
        .D(\FSM_onehot_mst_exec_state[0]_i_1_n_0 ),
        .Q(read_pointer),
        .S(buffer_to_stream_error_i_1_n_0));
  (* FSM_ENCODED_STATES = "INIT_COUNTER:010,SEND_STREAM:100,IDLE:001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_mst_exec_state_reg[1] 
       (.C(m00_axis_aclk),
        .CE(\FSM_onehot_mst_exec_state[2]_i_1_n_0 ),
        .D(\FSM_onehot_mst_exec_state[1]_i_1_n_0 ),
        .Q(count),
        .R(buffer_to_stream_error_i_1_n_0));
  (* FSM_ENCODED_STATES = "INIT_COUNTER:010,SEND_STREAM:100,IDLE:001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_mst_exec_state_reg[2] 
       (.C(m00_axis_aclk),
        .CE(\FSM_onehot_mst_exec_state[2]_i_1_n_0 ),
        .D(\FSM_onehot_mst_exec_state[2]_i_2_n_0 ),
        .Q(out),
        .R(buffer_to_stream_error_i_1_n_0));
  LUT6 #(
    .INIT(64'h4002100808400210)) 
    axis_tlast_delay_i_4
       (.I0(Q[0]),
        .I1(\num_packets_reg[7] [2]),
        .I2(\num_packets_reg[7] [0]),
        .I3(\num_packets_reg[7] [1]),
        .I4(Q[2]),
        .I5(\read_pointer_reg[5]_0 [0]),
        .O(axis_tlast_delay_reg_0));
  FDRE axis_tlast_delay_reg
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\num_packets_reg[6] ),
        .Q(m00_axis_tlast),
        .R(buffer_to_stream_error_i_1_n_0));
  CARRY8 axis_tvalid0_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({NLW_axis_tvalid0_carry_CO_UNCONNECTED[7:4],CO,axis_tvalid0_carry_n_5,axis_tvalid0_carry_n_6,axis_tvalid0_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,DI}),
        .O(NLW_axis_tvalid0_carry_O_UNCONNECTED[7:0]),
        .S({1'b0,1'b0,1'b0,1'b0,S}));
  LUT2 #(
    .INIT(4'h8)) 
    axis_tvalid_delay_i_1
       (.I0(out),
        .I1(CO),
        .O(axis_tvalid));
  FDRE axis_tvalid_delay_reg
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(axis_tvalid),
        .Q(m00_axis_tvalid),
        .R(buffer_to_stream_error_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    buffer_to_stream_error_i_1
       (.I0(m00_axis_aresetn),
        .O(buffer_to_stream_error_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFA8)) 
    buffer_to_stream_error_i_2
       (.I0(read_en),
        .I1(out),
        .I2(count),
        .I3(buffer_to_stream_error),
        .O(buffer_to_stream_error_i_2_n_0));
  FDRE buffer_to_stream_error_reg
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(buffer_to_stream_error_i_2_n_0),
        .Q(buffer_to_stream_error),
        .R(buffer_to_stream_error_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(\count_reg_n_0_[0] ),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count[1]_i_1 
       (.I0(\count_reg_n_0_[0] ),
        .I1(\count_reg_n_0_[1] ),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \count[2]_i_1 
       (.I0(\count_reg_n_0_[2] ),
        .I1(\count_reg_n_0_[0] ),
        .I2(\count_reg_n_0_[1] ),
        .O(\count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count[3]_i_1 
       (.I0(\count_reg_n_0_[2] ),
        .I1(\count_reg_n_0_[0] ),
        .I2(\count_reg_n_0_[1] ),
        .I3(\count_reg_n_0_[3] ),
        .O(\count[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \count[4]_i_1 
       (.I0(\count_reg_n_0_[2] ),
        .I1(\count_reg_n_0_[4] ),
        .I2(\count_reg_n_0_[0] ),
        .I3(\count_reg_n_0_[1] ),
        .I4(\count_reg_n_0_[3] ),
        .O(\count[4]_i_1_n_0 ));
  FDRE \count_reg[0] 
       (.C(m00_axis_aclk),
        .CE(count),
        .D(\count[0]_i_1_n_0 ),
        .Q(\count_reg_n_0_[0] ),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \count_reg[1] 
       (.C(m00_axis_aclk),
        .CE(count),
        .D(\count[1]_i_1_n_0 ),
        .Q(\count_reg_n_0_[1] ),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \count_reg[2] 
       (.C(m00_axis_aclk),
        .CE(count),
        .D(\count[2]_i_1_n_0 ),
        .Q(\count_reg_n_0_[2] ),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \count_reg[3] 
       (.C(m00_axis_aclk),
        .CE(count),
        .D(\count[3]_i_1_n_0 ),
        .Q(\count_reg_n_0_[3] ),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \count_reg[4] 
       (.C(m00_axis_aclk),
        .CE(count),
        .D(\count[4]_i_1_n_0 ),
        .Q(\count_reg_n_0_[4] ),
        .R(buffer_to_stream_error_i_1_n_0));
  CARRY8 read_pointer1_carry
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({NLW_read_pointer1_carry_CO_UNCONNECTED[7:5],read_pointer1,NLW_read_pointer1_carry_CO_UNCONNECTED[3],read_pointer1_carry_n_5,read_pointer1_carry_n_6,read_pointer1_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,read_pointer1_carry_i_1_n_0,read_pointer1_carry_i_2_n_0,read_pointer1_carry_i_3_n_0,\num_packets_reg[0] }),
        .O(NLW_read_pointer1_carry_O_UNCONNECTED[7:0]),
        .S({1'b0,1'b0,1'b0,read_pointer1_carry_i_5_n_0,read_pointer1_carry_i_6_n_0,read_pointer1_carry_i_7_n_0,read_pointer1_carry_i_8_n_0,\num_packets_reg[0]_0 }));
  LUT5 #(
    .INIT(32'hC2BF8002)) 
    read_pointer1_carry_i_1
       (.I0(\num_packets_reg[7] [6]),
        .I1(\read_pointer[7]_i_4_n_0 ),
        .I2(Q[6]),
        .I3(Q[7]),
        .I4(\num_packets_reg[7] [7]),
        .O(read_pointer1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h8000)) 
    read_pointer1_carry_i_10
       (.I0(ADDRB[3]),
        .I1(ADDRB[1]),
        .I2(ADDRB[0]),
        .I3(\read_pointer_reg[5]_rep_0 ),
        .O(read_pointer1_carry_i_10_n_0));
  LUT5 #(
    .INIT(32'hC2BF8002)) 
    read_pointer1_carry_i_2
       (.I0(\num_packets_reg[7] [4]),
        .I1(read_pointer1_carry_i_10_n_0),
        .I2(ADDRG[3]),
        .I3(Q[5]),
        .I4(\num_packets_reg[7] [5]),
        .O(read_pointer1_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'hC02ABFFF8000002A)) 
    read_pointer1_carry_i_3
       (.I0(\num_packets_reg[7] [2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(\num_packets_reg[7] [3]),
        .O(read_pointer1_carry_i_3_n_0));
  LUT3 #(
    .INIT(8'h7F)) 
    read_pointer1_carry_i_5
       (.I0(Q[7]),
        .I1(\read_pointer[7]_i_4_n_0 ),
        .I2(Q[6]),
        .O(read_pointer1_carry_i_5_n_0));
  LUT5 #(
    .INIT(32'h18844221)) 
    read_pointer1_carry_i_6
       (.I0(\num_packets_reg[7] [6]),
        .I1(\num_packets_reg[7] [7]),
        .I2(\read_pointer[7]_i_4_n_0 ),
        .I3(Q[6]),
        .I4(Q[7]),
        .O(read_pointer1_carry_i_6_n_0));
  LUT5 #(
    .INIT(32'h18844221)) 
    read_pointer1_carry_i_7
       (.I0(\num_packets_reg[7] [4]),
        .I1(\num_packets_reg[7] [5]),
        .I2(read_pointer1_carry_i_10_n_0),
        .I3(ADDRG[3]),
        .I4(Q[5]),
        .O(read_pointer1_carry_i_7_n_0));
  LUT6 #(
    .INIT(64'h1888844442222111)) 
    read_pointer1_carry_i_8
       (.I0(\num_packets_reg[7] [2]),
        .I1(\num_packets_reg[7] [3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(read_pointer1_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \read_pointer[0]_i_1 
       (.I0(Q[0]),
        .O(\read_pointer[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \read_pointer[0]_rep_i_1 
       (.I0(Q[0]),
        .O(\read_pointer[0]_rep_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \read_pointer[0]_rep_i_1__0 
       (.I0(Q[0]),
        .O(\read_pointer[0]_rep_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \read_pointer[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(p_0_in));
  LUT2 #(
    .INIT(4'h6)) 
    \read_pointer[1]_rep_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\read_pointer[1]_rep_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \read_pointer[1]_rep_i_1__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\read_pointer[1]_rep_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \read_pointer[1]_rep_i_1__1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\read_pointer[1]_rep_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \read_pointer[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(read_pointer2[2]));
  LUT3 #(
    .INIT(8'h78)) 
    \read_pointer[2]_rep_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\read_pointer[2]_rep_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h78)) 
    \read_pointer[2]_rep_i_1__0 
       (.I0(Q[0]),
        .I1(ADDRG[1]),
        .I2(Q[2]),
        .O(\read_pointer[2]_rep_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h78)) 
    \read_pointer[2]_rep_i_1__1 
       (.I0(Q[0]),
        .I1(ADDRG[1]),
        .I2(Q[2]),
        .O(\read_pointer[2]_rep_i_1__1_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \read_pointer[3]_i_1 
       (.I0(ADDRG[1]),
        .I1(ADDRG[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(read_pointer2[3]));
  LUT4 #(
    .INIT(16'h7F80)) 
    \read_pointer[3]_rep_i_1 
       (.I0(ADDRG[1]),
        .I1(ADDRG[0]),
        .I2(ADDRG[2]),
        .I3(Q[3]),
        .O(\read_pointer[3]_rep_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \read_pointer[3]_rep_i_1__0 
       (.I0(ADDRG[1]),
        .I1(ADDRG[0]),
        .I2(ADDRG[2]),
        .I3(Q[3]),
        .O(\read_pointer[3]_rep_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \read_pointer[4]_i_1 
       (.I0(ADDRG[2]),
        .I1(Q[0]),
        .I2(\read_pointer_reg[5]_0 [0]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(read_pointer2[4]));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \read_pointer[4]_rep_i_1 
       (.I0(ADDRG[2]),
        .I1(ADDRG[0]),
        .I2(ADDRG[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(\read_pointer[4]_rep_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \read_pointer[5]_i_1 
       (.I0(\read_pointer_reg[5]_0 [1]),
        .I1(ADDRG[1]),
        .I2(ADDRG[0]),
        .I3(ADDRG[2]),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(read_pointer2[5]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \read_pointer[5]_rep_i_1 
       (.I0(ADDRB[3]),
        .I1(ADDRB[1]),
        .I2(ADDRB[0]),
        .I3(\read_pointer_reg[5]_rep_0 ),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(\read_pointer[5]_rep_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \read_pointer[6]_i_1 
       (.I0(\read_pointer[7]_i_4_n_0 ),
        .I1(Q[6]),
        .O(read_pointer2[6]));
  LUT2 #(
    .INIT(4'hB)) 
    \read_pointer[7]_i_1 
       (.I0(read_pointer),
        .I1(m00_axis_aresetn),
        .O(\read_pointer[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \read_pointer[7]_i_2 
       (.I0(read_pointer1),
        .I1(out),
        .I2(CO),
        .I3(m00_axis_tready),
        .O(\read_pointer[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \read_pointer[7]_i_3 
       (.I0(\read_pointer[7]_i_4_n_0 ),
        .I1(Q[6]),
        .I2(Q[7]),
        .O(read_pointer2[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \read_pointer[7]_i_4 
       (.I0(Q[5]),
        .I1(ADDRB[3]),
        .I2(ADDRB[1]),
        .I3(ADDRB[0]),
        .I4(\read_pointer_reg[5]_rep_0 ),
        .I5(ADDRG[3]),
        .O(\read_pointer[7]_i_4_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[0]" *) 
  FDRE \read_pointer_reg[0] 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(\read_pointer[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[0]" *) 
  FDRE \read_pointer_reg[0]_rep 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(\read_pointer[0]_rep_i_1_n_0 ),
        .Q(ADDRB[0]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[0]" *) 
  FDRE \read_pointer_reg[0]_rep__0 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(\read_pointer[0]_rep_i_1__0_n_0 ),
        .Q(ADDRG[0]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[1]" *) 
  FDRE \read_pointer_reg[1] 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(p_0_in),
        .Q(Q[1]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[1]" *) 
  FDRE \read_pointer_reg[1]_rep 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(\read_pointer[1]_rep_i_1_n_0 ),
        .Q(ADDRG[1]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[1]" *) 
  FDRE \read_pointer_reg[1]_rep__0 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(\read_pointer[1]_rep_i_1__0_n_0 ),
        .Q(ADDRB[1]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[1]" *) 
  FDRE \read_pointer_reg[1]_rep__1 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(\read_pointer[1]_rep_i_1__1_n_0 ),
        .Q(\read_pointer_reg[5]_0 [0]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[2]" *) 
  FDRE \read_pointer_reg[2] 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(read_pointer2[2]),
        .Q(Q[2]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[2]" *) 
  FDRE \read_pointer_reg[2]_rep 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(\read_pointer[2]_rep_i_1_n_0 ),
        .Q(ADDRG[2]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[2]" *) 
  FDRE \read_pointer_reg[2]_rep__0 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(\read_pointer[2]_rep_i_1__0_n_0 ),
        .Q(ADDRB[2]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[2]" *) 
  FDRE \read_pointer_reg[2]_rep__1 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(\read_pointer[2]_rep_i_1__1_n_0 ),
        .Q(\read_pointer_reg[5]_rep_0 ),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[3]" *) 
  FDRE \read_pointer_reg[3] 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(read_pointer2[3]),
        .Q(Q[3]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[3]" *) 
  FDRE \read_pointer_reg[3]_rep 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(\read_pointer[3]_rep_i_1_n_0 ),
        .Q(ADDRB[3]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[3]" *) 
  FDRE \read_pointer_reg[3]_rep__0 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(\read_pointer[3]_rep_i_1__0_n_0 ),
        .Q(\read_pointer_reg[5]_0 [1]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[4]" *) 
  FDRE \read_pointer_reg[4] 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(read_pointer2[4]),
        .Q(Q[4]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[4]" *) 
  FDRE \read_pointer_reg[4]_rep 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(\read_pointer[4]_rep_i_1_n_0 ),
        .Q(ADDRG[3]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[5]" *) 
  FDRE \read_pointer_reg[5] 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(read_pointer2[5]),
        .Q(Q[5]),
        .R(\read_pointer[7]_i_1_n_0 ));
  (* ORIG_CELL_NAME = "read_pointer_reg[5]" *) 
  FDRE \read_pointer_reg[5]_rep 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(\read_pointer[5]_rep_i_1_n_0 ),
        .Q(ADDRB[4]),
        .R(\read_pointer[7]_i_1_n_0 ));
  FDRE \read_pointer_reg[6] 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(read_pointer2[6]),
        .Q(Q[6]),
        .R(\read_pointer[7]_i_1_n_0 ));
  FDRE \read_pointer_reg[7] 
       (.C(m00_axis_aclk),
        .CE(\read_pointer[7]_i_2_n_0 ),
        .D(read_pointer2[7]),
        .Q(Q[7]),
        .R(\read_pointer[7]_i_1_n_0 ));
  FDRE \stream_data_out_reg[0] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[0]),
        .Q(m00_axis_tdata[0]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[10] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[10]),
        .Q(m00_axis_tdata[10]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[11] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[11]),
        .Q(m00_axis_tdata[11]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[12] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[12]),
        .Q(m00_axis_tdata[12]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[13] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[13]),
        .Q(m00_axis_tdata[13]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[14] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[14]),
        .Q(m00_axis_tdata[14]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[15] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[15]),
        .Q(m00_axis_tdata[15]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[16] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[16]),
        .Q(m00_axis_tdata[16]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[17] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[17]),
        .Q(m00_axis_tdata[17]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[18] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[18]),
        .Q(m00_axis_tdata[18]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[19] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[19]),
        .Q(m00_axis_tdata[19]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[1] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[1]),
        .Q(m00_axis_tdata[1]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[20] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[20]),
        .Q(m00_axis_tdata[20]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[21] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[21]),
        .Q(m00_axis_tdata[21]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[22] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[22]),
        .Q(m00_axis_tdata[22]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[23] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[23]),
        .Q(m00_axis_tdata[23]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[24] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[24]),
        .Q(m00_axis_tdata[24]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[25] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[25]),
        .Q(m00_axis_tdata[25]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[26] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[26]),
        .Q(m00_axis_tdata[26]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[27] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[27]),
        .Q(m00_axis_tdata[27]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[28] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[28]),
        .Q(m00_axis_tdata[28]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[29] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[29]),
        .Q(m00_axis_tdata[29]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[2] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[2]),
        .Q(m00_axis_tdata[2]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[30] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[30]),
        .Q(m00_axis_tdata[30]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[31] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[31]),
        .Q(m00_axis_tdata[31]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[3] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[3]),
        .Q(m00_axis_tdata[3]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[4] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[4]),
        .Q(m00_axis_tdata[4]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[5] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[5]),
        .Q(m00_axis_tdata[5]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[6] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[6]),
        .Q(m00_axis_tdata[6]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[7] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[7]),
        .Q(m00_axis_tdata[7]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[8] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[8]),
        .Q(m00_axis_tdata[8]),
        .R(buffer_to_stream_error_i_1_n_0));
  FDRE \stream_data_out_reg[9] 
       (.C(m00_axis_aclk),
        .CE(E),
        .D(D[9]),
        .Q(m00_axis_tdata[9]),
        .R(buffer_to_stream_error_i_1_n_0));
  LUT6 #(
    .INIT(64'h000000A000E000E0)) 
    tx_done_i_1
       (.I0(tx_done_reg_n_0),
        .I1(tx_done0__14),
        .I2(m00_axis_aresetn),
        .I3(read_pointer),
        .I4(E),
        .I5(read_pointer1),
        .O(tx_done_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    tx_done_i_3
       (.I0(ADDRB[3]),
        .I1(\num_packets_reg[7] [3]),
        .I2(\num_packets_reg[7] [5]),
        .I3(Q[5]),
        .I4(\num_packets_reg[7] [4]),
        .I5(ADDRG[3]),
        .O(tx_done_reg_0));
  FDRE tx_done_reg
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(tx_done_i_1_n_0),
        .Q(tx_done_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "DoubleBuffer" *) 
module streaming_AXIStreamPacketBuffer_0_1_DoubleBuffer
   (read_en,
    buffer_overflow_error,
    axis_tlast_delay_reg,
    axis_tlast_delay_reg_0,
    D,
    E,
    DI,
    S,
    \read_pointer_reg[0]_rep__0 ,
    \read_pointer_reg[0]_rep__0_0 ,
    tx_done0__14,
    clk,
    packet,
    Q,
    ADDRG,
    ADDRB,
    \read_pointer_reg[2]_rep__1 ,
    \read_pointer_reg[3]_rep__0 ,
    rst,
    tick,
    packet_valid,
    m00_axis_tready,
    CO,
    out,
    \read_pointer_reg[3]_rep ,
    \read_pointer_reg[0] );
  output read_en;
  output buffer_overflow_error;
  output axis_tlast_delay_reg;
  output [7:0]axis_tlast_delay_reg_0;
  output [31:0]D;
  output [0:0]E;
  output [3:0]DI;
  output [3:0]S;
  output [0:0]\read_pointer_reg[0]_rep__0 ;
  output [0:0]\read_pointer_reg[0]_rep__0_0 ;
  output tx_done0__14;
  input clk;
  input [29:0]packet;
  input [7:0]Q;
  input [3:0]ADDRG;
  input [4:0]ADDRB;
  input [0:0]\read_pointer_reg[2]_rep__1 ;
  input [1:0]\read_pointer_reg[3]_rep__0 ;
  input rst;
  input tick;
  input packet_valid;
  input m00_axis_tready;
  input [0:0]CO;
  input [0:0]out;
  input \read_pointer_reg[3]_rep ;
  input \read_pointer_reg[0] ;

  wire [4:0]ADDRB;
  wire [3:0]ADDRG;
  wire [0:0]CO;
  wire [31:0]D;
  wire [3:0]DI;
  wire [0:0]E;
  wire [7:0]Q;
  wire [3:0]S;
  wire axis_tlast_delay_i_2_n_0;
  wire axis_tlast_delay_i_3_n_0;
  wire axis_tlast_delay_i_5_n_0;
  wire axis_tlast_delay_i_6_n_0;
  wire axis_tlast_delay_i_7_n_0;
  wire axis_tlast_delay_reg;
  wire [7:0]axis_tlast_delay_reg_0;
  wire buffer_0_reg_0_63_0_6_i_1_n_0;
  wire buffer_0_reg_0_63_0_6_n_0;
  wire buffer_0_reg_0_63_0_6_n_1;
  wire buffer_0_reg_0_63_0_6_n_2;
  wire buffer_0_reg_0_63_0_6_n_3;
  wire buffer_0_reg_0_63_0_6_n_4;
  wire buffer_0_reg_0_63_0_6_n_5;
  wire buffer_0_reg_0_63_0_6_n_6;
  wire buffer_0_reg_0_63_14_20_n_0;
  wire buffer_0_reg_0_63_14_20_n_1;
  wire buffer_0_reg_0_63_14_20_n_2;
  wire buffer_0_reg_0_63_14_20_n_3;
  wire buffer_0_reg_0_63_14_20_n_4;
  wire buffer_0_reg_0_63_14_20_n_5;
  wire buffer_0_reg_0_63_14_20_n_6;
  wire buffer_0_reg_0_63_21_27_n_0;
  wire buffer_0_reg_0_63_21_27_n_1;
  wire buffer_0_reg_0_63_21_27_n_2;
  wire buffer_0_reg_0_63_21_27_n_3;
  wire buffer_0_reg_0_63_21_27_n_4;
  wire buffer_0_reg_0_63_21_27_n_5;
  wire buffer_0_reg_0_63_21_27_n_6;
  wire buffer_0_reg_0_63_28_31_n_0;
  wire buffer_0_reg_0_63_28_31_n_1;
  wire buffer_0_reg_0_63_28_31_n_2;
  wire buffer_0_reg_0_63_28_31_n_3;
  wire buffer_0_reg_0_63_7_13_n_0;
  wire buffer_0_reg_0_63_7_13_n_1;
  wire buffer_0_reg_0_63_7_13_n_2;
  wire buffer_0_reg_0_63_7_13_n_3;
  wire buffer_0_reg_0_63_7_13_n_4;
  wire buffer_0_reg_0_63_7_13_n_5;
  wire buffer_0_reg_0_63_7_13_n_6;
  wire buffer_0_reg_128_191_0_6_i_1_n_0;
  wire buffer_0_reg_128_191_0_6_n_0;
  wire buffer_0_reg_128_191_0_6_n_1;
  wire buffer_0_reg_128_191_0_6_n_2;
  wire buffer_0_reg_128_191_0_6_n_3;
  wire buffer_0_reg_128_191_0_6_n_4;
  wire buffer_0_reg_128_191_0_6_n_5;
  wire buffer_0_reg_128_191_0_6_n_6;
  wire buffer_0_reg_128_191_14_20_n_0;
  wire buffer_0_reg_128_191_14_20_n_1;
  wire buffer_0_reg_128_191_14_20_n_2;
  wire buffer_0_reg_128_191_14_20_n_3;
  wire buffer_0_reg_128_191_14_20_n_4;
  wire buffer_0_reg_128_191_14_20_n_5;
  wire buffer_0_reg_128_191_14_20_n_6;
  wire buffer_0_reg_128_191_21_27_n_0;
  wire buffer_0_reg_128_191_21_27_n_1;
  wire buffer_0_reg_128_191_21_27_n_2;
  wire buffer_0_reg_128_191_21_27_n_3;
  wire buffer_0_reg_128_191_21_27_n_4;
  wire buffer_0_reg_128_191_21_27_n_5;
  wire buffer_0_reg_128_191_21_27_n_6;
  wire buffer_0_reg_128_191_28_31_n_0;
  wire buffer_0_reg_128_191_28_31_n_1;
  wire buffer_0_reg_128_191_28_31_n_2;
  wire buffer_0_reg_128_191_28_31_n_3;
  wire buffer_0_reg_128_191_7_13_n_0;
  wire buffer_0_reg_128_191_7_13_n_1;
  wire buffer_0_reg_128_191_7_13_n_2;
  wire buffer_0_reg_128_191_7_13_n_3;
  wire buffer_0_reg_128_191_7_13_n_4;
  wire buffer_0_reg_128_191_7_13_n_5;
  wire buffer_0_reg_128_191_7_13_n_6;
  wire buffer_0_reg_192_255_0_6_i_1_n_0;
  wire buffer_0_reg_192_255_0_6_n_0;
  wire buffer_0_reg_192_255_0_6_n_1;
  wire buffer_0_reg_192_255_0_6_n_2;
  wire buffer_0_reg_192_255_0_6_n_3;
  wire buffer_0_reg_192_255_0_6_n_4;
  wire buffer_0_reg_192_255_0_6_n_5;
  wire buffer_0_reg_192_255_0_6_n_6;
  wire buffer_0_reg_192_255_14_20_n_0;
  wire buffer_0_reg_192_255_14_20_n_1;
  wire buffer_0_reg_192_255_14_20_n_2;
  wire buffer_0_reg_192_255_14_20_n_3;
  wire buffer_0_reg_192_255_14_20_n_4;
  wire buffer_0_reg_192_255_14_20_n_5;
  wire buffer_0_reg_192_255_14_20_n_6;
  wire buffer_0_reg_192_255_21_27_n_0;
  wire buffer_0_reg_192_255_21_27_n_1;
  wire buffer_0_reg_192_255_21_27_n_2;
  wire buffer_0_reg_192_255_21_27_n_3;
  wire buffer_0_reg_192_255_21_27_n_4;
  wire buffer_0_reg_192_255_21_27_n_5;
  wire buffer_0_reg_192_255_21_27_n_6;
  wire buffer_0_reg_192_255_28_31_n_0;
  wire buffer_0_reg_192_255_28_31_n_1;
  wire buffer_0_reg_192_255_28_31_n_2;
  wire buffer_0_reg_192_255_28_31_n_3;
  wire buffer_0_reg_192_255_7_13_n_0;
  wire buffer_0_reg_192_255_7_13_n_1;
  wire buffer_0_reg_192_255_7_13_n_2;
  wire buffer_0_reg_192_255_7_13_n_3;
  wire buffer_0_reg_192_255_7_13_n_4;
  wire buffer_0_reg_192_255_7_13_n_5;
  wire buffer_0_reg_192_255_7_13_n_6;
  wire buffer_0_reg_64_127_0_6_i_1_n_0;
  wire buffer_0_reg_64_127_0_6_n_0;
  wire buffer_0_reg_64_127_0_6_n_1;
  wire buffer_0_reg_64_127_0_6_n_2;
  wire buffer_0_reg_64_127_0_6_n_3;
  wire buffer_0_reg_64_127_0_6_n_4;
  wire buffer_0_reg_64_127_0_6_n_5;
  wire buffer_0_reg_64_127_0_6_n_6;
  wire buffer_0_reg_64_127_14_20_n_0;
  wire buffer_0_reg_64_127_14_20_n_1;
  wire buffer_0_reg_64_127_14_20_n_2;
  wire buffer_0_reg_64_127_14_20_n_3;
  wire buffer_0_reg_64_127_14_20_n_4;
  wire buffer_0_reg_64_127_14_20_n_5;
  wire buffer_0_reg_64_127_14_20_n_6;
  wire buffer_0_reg_64_127_21_27_n_0;
  wire buffer_0_reg_64_127_21_27_n_1;
  wire buffer_0_reg_64_127_21_27_n_2;
  wire buffer_0_reg_64_127_21_27_n_3;
  wire buffer_0_reg_64_127_21_27_n_4;
  wire buffer_0_reg_64_127_21_27_n_5;
  wire buffer_0_reg_64_127_21_27_n_6;
  wire buffer_0_reg_64_127_28_31_n_0;
  wire buffer_0_reg_64_127_28_31_n_1;
  wire buffer_0_reg_64_127_28_31_n_2;
  wire buffer_0_reg_64_127_28_31_n_3;
  wire buffer_0_reg_64_127_7_13_n_0;
  wire buffer_0_reg_64_127_7_13_n_1;
  wire buffer_0_reg_64_127_7_13_n_2;
  wire buffer_0_reg_64_127_7_13_n_3;
  wire buffer_0_reg_64_127_7_13_n_4;
  wire buffer_0_reg_64_127_7_13_n_5;
  wire buffer_0_reg_64_127_7_13_n_6;
  wire buffer_1_reg_0_63_0_6_i_1_n_0;
  wire buffer_1_reg_0_63_0_6_n_0;
  wire buffer_1_reg_0_63_0_6_n_1;
  wire buffer_1_reg_0_63_0_6_n_2;
  wire buffer_1_reg_0_63_0_6_n_3;
  wire buffer_1_reg_0_63_0_6_n_4;
  wire buffer_1_reg_0_63_0_6_n_5;
  wire buffer_1_reg_0_63_0_6_n_6;
  wire buffer_1_reg_0_63_14_20_n_0;
  wire buffer_1_reg_0_63_14_20_n_1;
  wire buffer_1_reg_0_63_14_20_n_2;
  wire buffer_1_reg_0_63_14_20_n_3;
  wire buffer_1_reg_0_63_14_20_n_4;
  wire buffer_1_reg_0_63_14_20_n_5;
  wire buffer_1_reg_0_63_14_20_n_6;
  wire buffer_1_reg_0_63_21_27_n_0;
  wire buffer_1_reg_0_63_21_27_n_1;
  wire buffer_1_reg_0_63_21_27_n_2;
  wire buffer_1_reg_0_63_21_27_n_3;
  wire buffer_1_reg_0_63_21_27_n_4;
  wire buffer_1_reg_0_63_21_27_n_5;
  wire buffer_1_reg_0_63_21_27_n_6;
  wire buffer_1_reg_0_63_28_31_n_0;
  wire buffer_1_reg_0_63_28_31_n_1;
  wire buffer_1_reg_0_63_28_31_n_2;
  wire buffer_1_reg_0_63_28_31_n_3;
  wire buffer_1_reg_0_63_7_13_n_0;
  wire buffer_1_reg_0_63_7_13_n_1;
  wire buffer_1_reg_0_63_7_13_n_2;
  wire buffer_1_reg_0_63_7_13_n_3;
  wire buffer_1_reg_0_63_7_13_n_4;
  wire buffer_1_reg_0_63_7_13_n_5;
  wire buffer_1_reg_0_63_7_13_n_6;
  wire buffer_1_reg_128_191_0_6_i_1_n_0;
  wire buffer_1_reg_128_191_0_6_n_0;
  wire buffer_1_reg_128_191_0_6_n_1;
  wire buffer_1_reg_128_191_0_6_n_2;
  wire buffer_1_reg_128_191_0_6_n_3;
  wire buffer_1_reg_128_191_0_6_n_4;
  wire buffer_1_reg_128_191_0_6_n_5;
  wire buffer_1_reg_128_191_0_6_n_6;
  wire buffer_1_reg_128_191_14_20_n_0;
  wire buffer_1_reg_128_191_14_20_n_1;
  wire buffer_1_reg_128_191_14_20_n_2;
  wire buffer_1_reg_128_191_14_20_n_3;
  wire buffer_1_reg_128_191_14_20_n_4;
  wire buffer_1_reg_128_191_14_20_n_5;
  wire buffer_1_reg_128_191_14_20_n_6;
  wire buffer_1_reg_128_191_21_27_n_0;
  wire buffer_1_reg_128_191_21_27_n_1;
  wire buffer_1_reg_128_191_21_27_n_2;
  wire buffer_1_reg_128_191_21_27_n_3;
  wire buffer_1_reg_128_191_21_27_n_4;
  wire buffer_1_reg_128_191_21_27_n_5;
  wire buffer_1_reg_128_191_21_27_n_6;
  wire buffer_1_reg_128_191_28_31_n_0;
  wire buffer_1_reg_128_191_28_31_n_1;
  wire buffer_1_reg_128_191_28_31_n_2;
  wire buffer_1_reg_128_191_28_31_n_3;
  wire buffer_1_reg_128_191_7_13_n_0;
  wire buffer_1_reg_128_191_7_13_n_1;
  wire buffer_1_reg_128_191_7_13_n_2;
  wire buffer_1_reg_128_191_7_13_n_3;
  wire buffer_1_reg_128_191_7_13_n_4;
  wire buffer_1_reg_128_191_7_13_n_5;
  wire buffer_1_reg_128_191_7_13_n_6;
  wire buffer_1_reg_192_255_0_6_i_1_n_0;
  wire buffer_1_reg_192_255_0_6_n_0;
  wire buffer_1_reg_192_255_0_6_n_1;
  wire buffer_1_reg_192_255_0_6_n_2;
  wire buffer_1_reg_192_255_0_6_n_3;
  wire buffer_1_reg_192_255_0_6_n_4;
  wire buffer_1_reg_192_255_0_6_n_5;
  wire buffer_1_reg_192_255_0_6_n_6;
  wire buffer_1_reg_192_255_14_20_n_0;
  wire buffer_1_reg_192_255_14_20_n_1;
  wire buffer_1_reg_192_255_14_20_n_2;
  wire buffer_1_reg_192_255_14_20_n_3;
  wire buffer_1_reg_192_255_14_20_n_4;
  wire buffer_1_reg_192_255_14_20_n_5;
  wire buffer_1_reg_192_255_14_20_n_6;
  wire buffer_1_reg_192_255_21_27_n_0;
  wire buffer_1_reg_192_255_21_27_n_1;
  wire buffer_1_reg_192_255_21_27_n_2;
  wire buffer_1_reg_192_255_21_27_n_3;
  wire buffer_1_reg_192_255_21_27_n_4;
  wire buffer_1_reg_192_255_21_27_n_5;
  wire buffer_1_reg_192_255_21_27_n_6;
  wire buffer_1_reg_192_255_28_31_n_0;
  wire buffer_1_reg_192_255_28_31_n_1;
  wire buffer_1_reg_192_255_28_31_n_2;
  wire buffer_1_reg_192_255_28_31_n_3;
  wire buffer_1_reg_192_255_7_13_n_0;
  wire buffer_1_reg_192_255_7_13_n_1;
  wire buffer_1_reg_192_255_7_13_n_2;
  wire buffer_1_reg_192_255_7_13_n_3;
  wire buffer_1_reg_192_255_7_13_n_4;
  wire buffer_1_reg_192_255_7_13_n_5;
  wire buffer_1_reg_192_255_7_13_n_6;
  wire buffer_1_reg_64_127_0_6_i_1_n_0;
  wire buffer_1_reg_64_127_0_6_n_0;
  wire buffer_1_reg_64_127_0_6_n_1;
  wire buffer_1_reg_64_127_0_6_n_2;
  wire buffer_1_reg_64_127_0_6_n_3;
  wire buffer_1_reg_64_127_0_6_n_4;
  wire buffer_1_reg_64_127_0_6_n_5;
  wire buffer_1_reg_64_127_0_6_n_6;
  wire buffer_1_reg_64_127_14_20_n_0;
  wire buffer_1_reg_64_127_14_20_n_1;
  wire buffer_1_reg_64_127_14_20_n_2;
  wire buffer_1_reg_64_127_14_20_n_3;
  wire buffer_1_reg_64_127_14_20_n_4;
  wire buffer_1_reg_64_127_14_20_n_5;
  wire buffer_1_reg_64_127_14_20_n_6;
  wire buffer_1_reg_64_127_21_27_n_0;
  wire buffer_1_reg_64_127_21_27_n_1;
  wire buffer_1_reg_64_127_21_27_n_2;
  wire buffer_1_reg_64_127_21_27_n_3;
  wire buffer_1_reg_64_127_21_27_n_4;
  wire buffer_1_reg_64_127_21_27_n_5;
  wire buffer_1_reg_64_127_21_27_n_6;
  wire buffer_1_reg_64_127_28_31_n_0;
  wire buffer_1_reg_64_127_28_31_n_1;
  wire buffer_1_reg_64_127_28_31_n_2;
  wire buffer_1_reg_64_127_28_31_n_3;
  wire buffer_1_reg_64_127_7_13_n_0;
  wire buffer_1_reg_64_127_7_13_n_1;
  wire buffer_1_reg_64_127_7_13_n_2;
  wire buffer_1_reg_64_127_7_13_n_3;
  wire buffer_1_reg_64_127_7_13_n_4;
  wire buffer_1_reg_64_127_7_13_n_5;
  wire buffer_1_reg_64_127_7_13_n_6;
  wire buffer_overflow_error;
  wire buffer_overflow_error_i_1_n_0;
  wire buffer_overflow_error_i_2_n_0;
  wire clk;
  wire curr_buffer;
  wire curr_buffer_i_1_n_0;
  wire [31:0]dout0;
  wire [31:0]dout00_in;
  wire m00_axis_tready;
  wire [0:0]out;
  wire [29:0]packet;
  wire packet_valid;
  wire read_en;
  wire \read_pointer_reg[0] ;
  wire [0:0]\read_pointer_reg[0]_rep__0 ;
  wire [0:0]\read_pointer_reg[0]_rep__0_0 ;
  wire [0:0]\read_pointer_reg[2]_rep__1 ;
  wire \read_pointer_reg[3]_rep ;
  wire [1:0]\read_pointer_reg[3]_rep__0 ;
  wire rst;
  wire tick;
  wire tx_done0__14;
  wire tx_done_i_4_n_0;
  wire \write_addr[0]_i_1_n_0 ;
  wire \write_addr[1]_i_1_n_0 ;
  wire \write_addr[2]_i_1_n_0 ;
  wire \write_addr[3]_i_1_n_0 ;
  wire \write_addr[4]_i_1_n_0 ;
  wire \write_addr[5]_i_1_n_0 ;
  wire \write_addr[6]_i_1_n_0 ;
  wire \write_addr[7]_i_1_n_0 ;
  wire \write_addr[8]_i_1_n_0 ;
  wire \write_addr[8]_i_2_n_0 ;
  wire \write_addr[8]_i_3_n_0 ;
  wire \write_addr_reg_n_0_[0] ;
  wire \write_addr_reg_n_0_[1] ;
  wire \write_addr_reg_n_0_[2] ;
  wire \write_addr_reg_n_0_[3] ;
  wire \write_addr_reg_n_0_[4] ;
  wire \write_addr_reg_n_0_[5] ;
  wire \write_addr_reg_n_0_[6] ;
  wire \write_addr_reg_n_0_[7] ;
  wire \write_addr_reg_n_0_[8] ;
  wire NLW_buffer_0_reg_0_63_0_6_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_0_63_14_20_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_0_63_21_27_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_0_63_28_31_DOE_UNCONNECTED;
  wire NLW_buffer_0_reg_0_63_28_31_DOF_UNCONNECTED;
  wire NLW_buffer_0_reg_0_63_28_31_DOG_UNCONNECTED;
  wire NLW_buffer_0_reg_0_63_28_31_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_0_63_7_13_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_128_191_0_6_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_128_191_14_20_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_128_191_21_27_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_128_191_28_31_DOE_UNCONNECTED;
  wire NLW_buffer_0_reg_128_191_28_31_DOF_UNCONNECTED;
  wire NLW_buffer_0_reg_128_191_28_31_DOG_UNCONNECTED;
  wire NLW_buffer_0_reg_128_191_28_31_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_128_191_7_13_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_192_255_0_6_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_192_255_14_20_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_192_255_21_27_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_192_255_28_31_DOE_UNCONNECTED;
  wire NLW_buffer_0_reg_192_255_28_31_DOF_UNCONNECTED;
  wire NLW_buffer_0_reg_192_255_28_31_DOG_UNCONNECTED;
  wire NLW_buffer_0_reg_192_255_28_31_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_192_255_7_13_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_64_127_0_6_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_64_127_14_20_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_64_127_21_27_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_64_127_28_31_DOE_UNCONNECTED;
  wire NLW_buffer_0_reg_64_127_28_31_DOF_UNCONNECTED;
  wire NLW_buffer_0_reg_64_127_28_31_DOG_UNCONNECTED;
  wire NLW_buffer_0_reg_64_127_28_31_DOH_UNCONNECTED;
  wire NLW_buffer_0_reg_64_127_7_13_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_0_63_0_6_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_0_63_14_20_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_0_63_21_27_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_0_63_28_31_DOE_UNCONNECTED;
  wire NLW_buffer_1_reg_0_63_28_31_DOF_UNCONNECTED;
  wire NLW_buffer_1_reg_0_63_28_31_DOG_UNCONNECTED;
  wire NLW_buffer_1_reg_0_63_28_31_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_0_63_7_13_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_128_191_0_6_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_128_191_14_20_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_128_191_21_27_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_128_191_28_31_DOE_UNCONNECTED;
  wire NLW_buffer_1_reg_128_191_28_31_DOF_UNCONNECTED;
  wire NLW_buffer_1_reg_128_191_28_31_DOG_UNCONNECTED;
  wire NLW_buffer_1_reg_128_191_28_31_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_128_191_7_13_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_192_255_0_6_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_192_255_14_20_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_192_255_21_27_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_192_255_28_31_DOE_UNCONNECTED;
  wire NLW_buffer_1_reg_192_255_28_31_DOF_UNCONNECTED;
  wire NLW_buffer_1_reg_192_255_28_31_DOG_UNCONNECTED;
  wire NLW_buffer_1_reg_192_255_28_31_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_192_255_7_13_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_64_127_0_6_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_64_127_14_20_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_64_127_21_27_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_64_127_28_31_DOE_UNCONNECTED;
  wire NLW_buffer_1_reg_64_127_28_31_DOF_UNCONNECTED;
  wire NLW_buffer_1_reg_64_127_28_31_DOG_UNCONNECTED;
  wire NLW_buffer_1_reg_64_127_28_31_DOH_UNCONNECTED;
  wire NLW_buffer_1_reg_64_127_7_13_DOH_UNCONNECTED;

  LUT6 #(
    .INIT(64'h0000000080601806)) 
    axis_tlast_delay_i_1
       (.I0(axis_tlast_delay_reg_0[6]),
        .I1(axis_tlast_delay_i_2_n_0),
        .I2(axis_tlast_delay_reg_0[7]),
        .I3(Q[6]),
        .I4(Q[7]),
        .I5(axis_tlast_delay_i_3_n_0),
        .O(axis_tlast_delay_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    axis_tlast_delay_i_2
       (.I0(axis_tlast_delay_reg_0[4]),
        .I1(axis_tlast_delay_reg_0[2]),
        .I2(axis_tlast_delay_reg_0[0]),
        .I3(axis_tlast_delay_reg_0[1]),
        .I4(axis_tlast_delay_reg_0[3]),
        .I5(axis_tlast_delay_reg_0[5]),
        .O(axis_tlast_delay_i_2_n_0));
  LUT5 #(
    .INIT(32'h7FF7F77F)) 
    axis_tlast_delay_i_3
       (.I0(\read_pointer_reg[0] ),
        .I1(axis_tlast_delay_i_5_n_0),
        .I2(axis_tlast_delay_reg_0[3]),
        .I3(axis_tlast_delay_i_6_n_0),
        .I4(Q[3]),
        .O(axis_tlast_delay_i_3_n_0));
  LUT5 #(
    .INIT(32'h84422118)) 
    axis_tlast_delay_i_5
       (.I0(Q[4]),
        .I1(Q[5]),
        .I2(axis_tlast_delay_reg_0[4]),
        .I3(axis_tlast_delay_i_7_n_0),
        .I4(axis_tlast_delay_reg_0[5]),
        .O(axis_tlast_delay_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    axis_tlast_delay_i_6
       (.I0(axis_tlast_delay_reg_0[1]),
        .I1(axis_tlast_delay_reg_0[0]),
        .I2(axis_tlast_delay_reg_0[2]),
        .O(axis_tlast_delay_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    axis_tlast_delay_i_7
       (.I0(axis_tlast_delay_reg_0[2]),
        .I1(axis_tlast_delay_reg_0[0]),
        .I2(axis_tlast_delay_reg_0[1]),
        .I3(axis_tlast_delay_reg_0[3]),
        .O(axis_tlast_delay_i_7_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    axis_tvalid0_carry_i_1
       (.I0(axis_tlast_delay_reg_0[6]),
        .I1(Q[6]),
        .I2(Q[7]),
        .I3(axis_tlast_delay_reg_0[7]),
        .O(DI[3]));
  LUT4 #(
    .INIT(16'h2F02)) 
    axis_tvalid0_carry_i_2
       (.I0(axis_tlast_delay_reg_0[4]),
        .I1(ADDRG[3]),
        .I2(Q[5]),
        .I3(axis_tlast_delay_reg_0[5]),
        .O(DI[2]));
  LUT4 #(
    .INIT(16'h2F02)) 
    axis_tvalid0_carry_i_3
       (.I0(axis_tlast_delay_reg_0[2]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(axis_tlast_delay_reg_0[3]),
        .O(DI[1]));
  LUT4 #(
    .INIT(16'h2F02)) 
    axis_tvalid0_carry_i_4
       (.I0(axis_tlast_delay_reg_0[0]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(axis_tlast_delay_reg_0[1]),
        .O(DI[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    axis_tvalid0_carry_i_5
       (.I0(axis_tlast_delay_reg_0[6]),
        .I1(Q[6]),
        .I2(axis_tlast_delay_reg_0[7]),
        .I3(Q[7]),
        .O(S[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    axis_tvalid0_carry_i_6
       (.I0(axis_tlast_delay_reg_0[4]),
        .I1(ADDRG[3]),
        .I2(axis_tlast_delay_reg_0[5]),
        .I3(Q[5]),
        .O(S[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    axis_tvalid0_carry_i_7
       (.I0(axis_tlast_delay_reg_0[2]),
        .I1(Q[2]),
        .I2(axis_tlast_delay_reg_0[3]),
        .I3(Q[3]),
        .O(S[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    axis_tvalid0_carry_i_8
       (.I0(axis_tlast_delay_reg_0[0]),
        .I1(Q[0]),
        .I2(axis_tlast_delay_reg_0[1]),
        .I3(Q[1]),
        .O(S[0]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_0_63_0_6
       (.ADDRA({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRB({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRC({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRD({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRE({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRF({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRG({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[0]),
        .DIB(packet[1]),
        .DIC(packet[2]),
        .DID(packet[3]),
        .DIE(packet[4]),
        .DIF(packet[5]),
        .DIG(packet[6]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_0_63_0_6_n_0),
        .DOB(buffer_0_reg_0_63_0_6_n_1),
        .DOC(buffer_0_reg_0_63_0_6_n_2),
        .DOD(buffer_0_reg_0_63_0_6_n_3),
        .DOE(buffer_0_reg_0_63_0_6_n_4),
        .DOF(buffer_0_reg_0_63_0_6_n_5),
        .DOG(buffer_0_reg_0_63_0_6_n_6),
        .DOH(NLW_buffer_0_reg_0_63_0_6_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_0_63_0_6_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    buffer_0_reg_0_63_0_6_i_1
       (.I0(rst),
        .I1(tick),
        .I2(packet_valid),
        .I3(curr_buffer),
        .I4(\write_addr_reg_n_0_[6] ),
        .I5(\write_addr_reg_n_0_[7] ),
        .O(buffer_0_reg_0_63_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_0_63_14_20
       (.ADDRA({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRB({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRC({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRD({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRE({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRF({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRG({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[14]),
        .DIB(packet[15]),
        .DIC(packet[16]),
        .DID(packet[17]),
        .DIE(packet[18]),
        .DIF(packet[19]),
        .DIG(packet[20]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_0_63_14_20_n_0),
        .DOB(buffer_0_reg_0_63_14_20_n_1),
        .DOC(buffer_0_reg_0_63_14_20_n_2),
        .DOD(buffer_0_reg_0_63_14_20_n_3),
        .DOE(buffer_0_reg_0_63_14_20_n_4),
        .DOF(buffer_0_reg_0_63_14_20_n_5),
        .DOG(buffer_0_reg_0_63_14_20_n_6),
        .DOH(NLW_buffer_0_reg_0_63_14_20_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_0_63_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_0_63_21_27
       (.ADDRA({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRB({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRC({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRD({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRE({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRF({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRG({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[21]),
        .DIB(packet[22]),
        .DIC(packet[23]),
        .DID(packet[24]),
        .DIE(packet[25]),
        .DIF(packet[26]),
        .DIG(packet[27]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_0_63_21_27_n_0),
        .DOB(buffer_0_reg_0_63_21_27_n_1),
        .DOC(buffer_0_reg_0_63_21_27_n_2),
        .DOD(buffer_0_reg_0_63_21_27_n_3),
        .DOE(buffer_0_reg_0_63_21_27_n_4),
        .DOF(buffer_0_reg_0_63_21_27_n_5),
        .DOG(buffer_0_reg_0_63_21_27_n_6),
        .DOH(NLW_buffer_0_reg_0_63_21_27_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_0_63_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_0_63_28_31
       (.ADDRA({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],\read_pointer_reg[2]_rep__1 ,\read_pointer_reg[3]_rep__0 [0],ADDRB[0]}),
        .ADDRB({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],\read_pointer_reg[2]_rep__1 ,\read_pointer_reg[3]_rep__0 [0],ADDRB[0]}),
        .ADDRC({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],\read_pointer_reg[2]_rep__1 ,\read_pointer_reg[3]_rep__0 [0],ADDRB[0]}),
        .ADDRD({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],\read_pointer_reg[2]_rep__1 ,\read_pointer_reg[3]_rep__0 [0],ADDRB[0]}),
        .ADDRE({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],\read_pointer_reg[2]_rep__1 ,\read_pointer_reg[3]_rep__0 [0],ADDRB[0]}),
        .ADDRF({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],\read_pointer_reg[2]_rep__1 ,\read_pointer_reg[3]_rep__0 [0],ADDRB[0]}),
        .ADDRG({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],\read_pointer_reg[2]_rep__1 ,\read_pointer_reg[3]_rep__0 [0],ADDRB[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[28]),
        .DIB(packet[29]),
        .DIC(1'b0),
        .DID(1'b0),
        .DIE(1'b0),
        .DIF(1'b0),
        .DIG(1'b0),
        .DIH(1'b0),
        .DOA(buffer_0_reg_0_63_28_31_n_0),
        .DOB(buffer_0_reg_0_63_28_31_n_1),
        .DOC(buffer_0_reg_0_63_28_31_n_2),
        .DOD(buffer_0_reg_0_63_28_31_n_3),
        .DOE(NLW_buffer_0_reg_0_63_28_31_DOE_UNCONNECTED),
        .DOF(NLW_buffer_0_reg_0_63_28_31_DOF_UNCONNECTED),
        .DOG(NLW_buffer_0_reg_0_63_28_31_DOG_UNCONNECTED),
        .DOH(NLW_buffer_0_reg_0_63_28_31_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_0_63_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_0_63_7_13
       (.ADDRA({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRB({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRC({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRD({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRE({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRF({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRG({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[7]),
        .DIB(packet[8]),
        .DIC(packet[9]),
        .DID(packet[10]),
        .DIE(packet[11]),
        .DIF(packet[12]),
        .DIG(packet[13]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_0_63_7_13_n_0),
        .DOB(buffer_0_reg_0_63_7_13_n_1),
        .DOC(buffer_0_reg_0_63_7_13_n_2),
        .DOD(buffer_0_reg_0_63_7_13_n_3),
        .DOE(buffer_0_reg_0_63_7_13_n_4),
        .DOF(buffer_0_reg_0_63_7_13_n_5),
        .DOG(buffer_0_reg_0_63_7_13_n_6),
        .DOH(NLW_buffer_0_reg_0_63_7_13_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_0_63_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_128_191_0_6
       (.ADDRA({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRB({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRC({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRD({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRE({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRF({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRG({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[0]),
        .DIB(packet[1]),
        .DIC(packet[2]),
        .DID(packet[3]),
        .DIE(packet[4]),
        .DIF(packet[5]),
        .DIG(packet[6]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_128_191_0_6_n_0),
        .DOB(buffer_0_reg_128_191_0_6_n_1),
        .DOC(buffer_0_reg_128_191_0_6_n_2),
        .DOD(buffer_0_reg_128_191_0_6_n_3),
        .DOE(buffer_0_reg_128_191_0_6_n_4),
        .DOF(buffer_0_reg_128_191_0_6_n_5),
        .DOG(buffer_0_reg_128_191_0_6_n_6),
        .DOH(NLW_buffer_0_reg_128_191_0_6_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_128_191_0_6_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000400)) 
    buffer_0_reg_128_191_0_6_i_1
       (.I0(\write_addr_reg_n_0_[6] ),
        .I1(\write_addr_reg_n_0_[7] ),
        .I2(curr_buffer),
        .I3(packet_valid),
        .I4(tick),
        .I5(rst),
        .O(buffer_0_reg_128_191_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_128_191_14_20
       (.ADDRA({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRB({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRC({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRD({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRE({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRF({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRG({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[14]),
        .DIB(packet[15]),
        .DIC(packet[16]),
        .DID(packet[17]),
        .DIE(packet[18]),
        .DIF(packet[19]),
        .DIG(packet[20]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_128_191_14_20_n_0),
        .DOB(buffer_0_reg_128_191_14_20_n_1),
        .DOC(buffer_0_reg_128_191_14_20_n_2),
        .DOD(buffer_0_reg_128_191_14_20_n_3),
        .DOE(buffer_0_reg_128_191_14_20_n_4),
        .DOF(buffer_0_reg_128_191_14_20_n_5),
        .DOG(buffer_0_reg_128_191_14_20_n_6),
        .DOH(NLW_buffer_0_reg_128_191_14_20_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_128_191_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_128_191_21_27
       (.ADDRA({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRB({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRC({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRD({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRE({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRF({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRG({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[21]),
        .DIB(packet[22]),
        .DIC(packet[23]),
        .DID(packet[24]),
        .DIE(packet[25]),
        .DIF(packet[26]),
        .DIG(packet[27]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_128_191_21_27_n_0),
        .DOB(buffer_0_reg_128_191_21_27_n_1),
        .DOC(buffer_0_reg_128_191_21_27_n_2),
        .DOD(buffer_0_reg_128_191_21_27_n_3),
        .DOE(buffer_0_reg_128_191_21_27_n_4),
        .DOF(buffer_0_reg_128_191_21_27_n_5),
        .DOG(buffer_0_reg_128_191_21_27_n_6),
        .DOH(NLW_buffer_0_reg_128_191_21_27_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_128_191_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_128_191_28_31
       (.ADDRA({ADDRB[4],Q[4],ADDRB[3:0]}),
        .ADDRB({ADDRB[4],Q[4],ADDRB[3:0]}),
        .ADDRC({ADDRB[4],Q[4],ADDRB[3:0]}),
        .ADDRD({ADDRB[4],Q[4],ADDRB[3:0]}),
        .ADDRE({ADDRB[4],Q[4],ADDRB[3:0]}),
        .ADDRF({ADDRB[4],Q[4],ADDRB[3:0]}),
        .ADDRG({ADDRB[4],Q[4],ADDRB[3:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[28]),
        .DIB(packet[29]),
        .DIC(1'b0),
        .DID(1'b0),
        .DIE(1'b0),
        .DIF(1'b0),
        .DIG(1'b0),
        .DIH(1'b0),
        .DOA(buffer_0_reg_128_191_28_31_n_0),
        .DOB(buffer_0_reg_128_191_28_31_n_1),
        .DOC(buffer_0_reg_128_191_28_31_n_2),
        .DOD(buffer_0_reg_128_191_28_31_n_3),
        .DOE(NLW_buffer_0_reg_128_191_28_31_DOE_UNCONNECTED),
        .DOF(NLW_buffer_0_reg_128_191_28_31_DOF_UNCONNECTED),
        .DOG(NLW_buffer_0_reg_128_191_28_31_DOG_UNCONNECTED),
        .DOH(NLW_buffer_0_reg_128_191_28_31_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_128_191_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_128_191_7_13
       (.ADDRA({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRB({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRC({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRD({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRE({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRF({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRG({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[7]),
        .DIB(packet[8]),
        .DIC(packet[9]),
        .DID(packet[10]),
        .DIE(packet[11]),
        .DIF(packet[12]),
        .DIG(packet[13]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_128_191_7_13_n_0),
        .DOB(buffer_0_reg_128_191_7_13_n_1),
        .DOC(buffer_0_reg_128_191_7_13_n_2),
        .DOD(buffer_0_reg_128_191_7_13_n_3),
        .DOE(buffer_0_reg_128_191_7_13_n_4),
        .DOF(buffer_0_reg_128_191_7_13_n_5),
        .DOG(buffer_0_reg_128_191_7_13_n_6),
        .DOH(NLW_buffer_0_reg_128_191_7_13_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_128_191_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_192_255_0_6
       (.ADDRA({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRB({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRC({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRD({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRE({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRF({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRG({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[0]),
        .DIB(packet[1]),
        .DIC(packet[2]),
        .DID(packet[3]),
        .DIE(packet[4]),
        .DIF(packet[5]),
        .DIG(packet[6]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_192_255_0_6_n_0),
        .DOB(buffer_0_reg_192_255_0_6_n_1),
        .DOC(buffer_0_reg_192_255_0_6_n_2),
        .DOD(buffer_0_reg_192_255_0_6_n_3),
        .DOE(buffer_0_reg_192_255_0_6_n_4),
        .DOF(buffer_0_reg_192_255_0_6_n_5),
        .DOG(buffer_0_reg_192_255_0_6_n_6),
        .DOH(NLW_buffer_0_reg_192_255_0_6_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_192_255_0_6_i_1_n_0));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    buffer_0_reg_192_255_0_6_i_1
       (.I0(rst),
        .I1(tick),
        .I2(packet_valid),
        .I3(curr_buffer),
        .I4(\write_addr_reg_n_0_[6] ),
        .I5(\write_addr_reg_n_0_[7] ),
        .O(buffer_0_reg_192_255_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_192_255_14_20
       (.ADDRA({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRB({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRC({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRD({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRE({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRF({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRG({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[14]),
        .DIB(packet[15]),
        .DIC(packet[16]),
        .DID(packet[17]),
        .DIE(packet[18]),
        .DIF(packet[19]),
        .DIG(packet[20]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_192_255_14_20_n_0),
        .DOB(buffer_0_reg_192_255_14_20_n_1),
        .DOC(buffer_0_reg_192_255_14_20_n_2),
        .DOD(buffer_0_reg_192_255_14_20_n_3),
        .DOE(buffer_0_reg_192_255_14_20_n_4),
        .DOF(buffer_0_reg_192_255_14_20_n_5),
        .DOG(buffer_0_reg_192_255_14_20_n_6),
        .DOH(NLW_buffer_0_reg_192_255_14_20_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_192_255_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_192_255_21_27
       (.ADDRA({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRB({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRC({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRD({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRE({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRF({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRG({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[21]),
        .DIB(packet[22]),
        .DIC(packet[23]),
        .DID(packet[24]),
        .DIE(packet[25]),
        .DIF(packet[26]),
        .DIG(packet[27]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_192_255_21_27_n_0),
        .DOB(buffer_0_reg_192_255_21_27_n_1),
        .DOC(buffer_0_reg_192_255_21_27_n_2),
        .DOD(buffer_0_reg_192_255_21_27_n_3),
        .DOE(buffer_0_reg_192_255_21_27_n_4),
        .DOF(buffer_0_reg_192_255_21_27_n_5),
        .DOG(buffer_0_reg_192_255_21_27_n_6),
        .DOH(NLW_buffer_0_reg_192_255_21_27_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_192_255_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_192_255_28_31
       (.ADDRA({ADDRB[4],Q[4],ADDRB[3:1],Q[0]}),
        .ADDRB({ADDRB[4],Q[4],ADDRB[3:1],Q[0]}),
        .ADDRC({ADDRB[4],Q[4],ADDRB[3:1],Q[0]}),
        .ADDRD({ADDRB[4],Q[4],ADDRB[3:0]}),
        .ADDRE({ADDRB[4],Q[4],ADDRB[3:0]}),
        .ADDRF({ADDRB[4],Q[4],ADDRB[3:0]}),
        .ADDRG({ADDRB[4],Q[4],ADDRB[3:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[28]),
        .DIB(packet[29]),
        .DIC(1'b0),
        .DID(1'b0),
        .DIE(1'b0),
        .DIF(1'b0),
        .DIG(1'b0),
        .DIH(1'b0),
        .DOA(buffer_0_reg_192_255_28_31_n_0),
        .DOB(buffer_0_reg_192_255_28_31_n_1),
        .DOC(buffer_0_reg_192_255_28_31_n_2),
        .DOD(buffer_0_reg_192_255_28_31_n_3),
        .DOE(NLW_buffer_0_reg_192_255_28_31_DOE_UNCONNECTED),
        .DOF(NLW_buffer_0_reg_192_255_28_31_DOF_UNCONNECTED),
        .DOG(NLW_buffer_0_reg_192_255_28_31_DOG_UNCONNECTED),
        .DOH(NLW_buffer_0_reg_192_255_28_31_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_192_255_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_192_255_7_13
       (.ADDRA({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRB({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRC({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRD({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRE({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRF({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRG({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[7]),
        .DIB(packet[8]),
        .DIC(packet[9]),
        .DID(packet[10]),
        .DIE(packet[11]),
        .DIF(packet[12]),
        .DIG(packet[13]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_192_255_7_13_n_0),
        .DOB(buffer_0_reg_192_255_7_13_n_1),
        .DOC(buffer_0_reg_192_255_7_13_n_2),
        .DOD(buffer_0_reg_192_255_7_13_n_3),
        .DOE(buffer_0_reg_192_255_7_13_n_4),
        .DOF(buffer_0_reg_192_255_7_13_n_5),
        .DOG(buffer_0_reg_192_255_7_13_n_6),
        .DOH(NLW_buffer_0_reg_192_255_7_13_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_192_255_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_64_127_0_6
       (.ADDRA({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRB({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRC({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRD({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRE({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRF({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRG({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[0]),
        .DIB(packet[1]),
        .DIC(packet[2]),
        .DID(packet[3]),
        .DIE(packet[4]),
        .DIF(packet[5]),
        .DIG(packet[6]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_64_127_0_6_n_0),
        .DOB(buffer_0_reg_64_127_0_6_n_1),
        .DOC(buffer_0_reg_64_127_0_6_n_2),
        .DOD(buffer_0_reg_64_127_0_6_n_3),
        .DOE(buffer_0_reg_64_127_0_6_n_4),
        .DOF(buffer_0_reg_64_127_0_6_n_5),
        .DOG(buffer_0_reg_64_127_0_6_n_6),
        .DOH(NLW_buffer_0_reg_64_127_0_6_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_64_127_0_6_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000400)) 
    buffer_0_reg_64_127_0_6_i_1
       (.I0(\write_addr_reg_n_0_[7] ),
        .I1(\write_addr_reg_n_0_[6] ),
        .I2(curr_buffer),
        .I3(packet_valid),
        .I4(tick),
        .I5(rst),
        .O(buffer_0_reg_64_127_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_64_127_14_20
       (.ADDRA({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRB({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRC({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRD({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRE({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRF({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRG({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[14]),
        .DIB(packet[15]),
        .DIC(packet[16]),
        .DID(packet[17]),
        .DIE(packet[18]),
        .DIF(packet[19]),
        .DIG(packet[20]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_64_127_14_20_n_0),
        .DOB(buffer_0_reg_64_127_14_20_n_1),
        .DOC(buffer_0_reg_64_127_14_20_n_2),
        .DOD(buffer_0_reg_64_127_14_20_n_3),
        .DOE(buffer_0_reg_64_127_14_20_n_4),
        .DOF(buffer_0_reg_64_127_14_20_n_5),
        .DOG(buffer_0_reg_64_127_14_20_n_6),
        .DOH(NLW_buffer_0_reg_64_127_14_20_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_64_127_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_64_127_21_27
       (.ADDRA({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRB({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRC({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRD({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRE({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRF({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRG({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[21]),
        .DIB(packet[22]),
        .DIC(packet[23]),
        .DID(packet[24]),
        .DIE(packet[25]),
        .DIF(packet[26]),
        .DIG(packet[27]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_64_127_21_27_n_0),
        .DOB(buffer_0_reg_64_127_21_27_n_1),
        .DOC(buffer_0_reg_64_127_21_27_n_2),
        .DOD(buffer_0_reg_64_127_21_27_n_3),
        .DOE(buffer_0_reg_64_127_21_27_n_4),
        .DOF(buffer_0_reg_64_127_21_27_n_5),
        .DOG(buffer_0_reg_64_127_21_27_n_6),
        .DOH(NLW_buffer_0_reg_64_127_21_27_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_64_127_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_64_127_28_31
       (.ADDRA({ADDRB[4],Q[4],ADDRB[3:0]}),
        .ADDRB({ADDRB[4],Q[4],ADDRB[3:0]}),
        .ADDRC({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2:0]}),
        .ADDRD({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2:0]}),
        .ADDRE({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],ADDRB[0]}),
        .ADDRF({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],\read_pointer_reg[2]_rep__1 ,\read_pointer_reg[3]_rep__0 [0],ADDRB[0]}),
        .ADDRG({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],\read_pointer_reg[2]_rep__1 ,\read_pointer_reg[3]_rep__0 [0],ADDRB[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[28]),
        .DIB(packet[29]),
        .DIC(1'b0),
        .DID(1'b0),
        .DIE(1'b0),
        .DIF(1'b0),
        .DIG(1'b0),
        .DIH(1'b0),
        .DOA(buffer_0_reg_64_127_28_31_n_0),
        .DOB(buffer_0_reg_64_127_28_31_n_1),
        .DOC(buffer_0_reg_64_127_28_31_n_2),
        .DOD(buffer_0_reg_64_127_28_31_n_3),
        .DOE(NLW_buffer_0_reg_64_127_28_31_DOE_UNCONNECTED),
        .DOF(NLW_buffer_0_reg_64_127_28_31_DOF_UNCONNECTED),
        .DOG(NLW_buffer_0_reg_64_127_28_31_DOG_UNCONNECTED),
        .DOH(NLW_buffer_0_reg_64_127_28_31_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_64_127_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_0_reg_64_127_7_13
       (.ADDRA({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRB({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRC({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRD({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRE({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRF({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRG({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[7]),
        .DIB(packet[8]),
        .DIC(packet[9]),
        .DID(packet[10]),
        .DIE(packet[11]),
        .DIF(packet[12]),
        .DIG(packet[13]),
        .DIH(1'b0),
        .DOA(buffer_0_reg_64_127_7_13_n_0),
        .DOB(buffer_0_reg_64_127_7_13_n_1),
        .DOC(buffer_0_reg_64_127_7_13_n_2),
        .DOD(buffer_0_reg_64_127_7_13_n_3),
        .DOE(buffer_0_reg_64_127_7_13_n_4),
        .DOF(buffer_0_reg_64_127_7_13_n_5),
        .DOG(buffer_0_reg_64_127_7_13_n_6),
        .DOH(NLW_buffer_0_reg_64_127_7_13_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_0_reg_64_127_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_0_63_0_6
       (.ADDRA({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRB({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRC({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRD({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRE({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRF({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRG({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[0]),
        .DIB(packet[1]),
        .DIC(packet[2]),
        .DID(packet[3]),
        .DIE(packet[4]),
        .DIF(packet[5]),
        .DIG(packet[6]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_0_63_0_6_n_0),
        .DOB(buffer_1_reg_0_63_0_6_n_1),
        .DOC(buffer_1_reg_0_63_0_6_n_2),
        .DOD(buffer_1_reg_0_63_0_6_n_3),
        .DOE(buffer_1_reg_0_63_0_6_n_4),
        .DOF(buffer_1_reg_0_63_0_6_n_5),
        .DOG(buffer_1_reg_0_63_0_6_n_6),
        .DOH(NLW_buffer_1_reg_0_63_0_6_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_0_63_0_6_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    buffer_1_reg_0_63_0_6_i_1
       (.I0(rst),
        .I1(tick),
        .I2(packet_valid),
        .I3(curr_buffer),
        .I4(\write_addr_reg_n_0_[6] ),
        .I5(\write_addr_reg_n_0_[7] ),
        .O(buffer_1_reg_0_63_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_0_63_14_20
       (.ADDRA({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRB({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRC({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRD({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRE({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRF({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRG({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[14]),
        .DIB(packet[15]),
        .DIC(packet[16]),
        .DID(packet[17]),
        .DIE(packet[18]),
        .DIF(packet[19]),
        .DIG(packet[20]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_0_63_14_20_n_0),
        .DOB(buffer_1_reg_0_63_14_20_n_1),
        .DOC(buffer_1_reg_0_63_14_20_n_2),
        .DOD(buffer_1_reg_0_63_14_20_n_3),
        .DOE(buffer_1_reg_0_63_14_20_n_4),
        .DOF(buffer_1_reg_0_63_14_20_n_5),
        .DOG(buffer_1_reg_0_63_14_20_n_6),
        .DOH(NLW_buffer_1_reg_0_63_14_20_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_0_63_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_0_63_21_27
       (.ADDRA({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRB({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRC({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRD({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRE({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRF({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRG({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[21]),
        .DIB(packet[22]),
        .DIC(packet[23]),
        .DID(packet[24]),
        .DIE(packet[25]),
        .DIF(packet[26]),
        .DIG(packet[27]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_0_63_21_27_n_0),
        .DOB(buffer_1_reg_0_63_21_27_n_1),
        .DOC(buffer_1_reg_0_63_21_27_n_2),
        .DOD(buffer_1_reg_0_63_21_27_n_3),
        .DOE(buffer_1_reg_0_63_21_27_n_4),
        .DOF(buffer_1_reg_0_63_21_27_n_5),
        .DOG(buffer_1_reg_0_63_21_27_n_6),
        .DOH(NLW_buffer_1_reg_0_63_21_27_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_0_63_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_0_63_28_31
       (.ADDRA({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRB({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRC({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRD({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRE({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRF({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRG({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[28]),
        .DIB(packet[29]),
        .DIC(1'b0),
        .DID(1'b0),
        .DIE(1'b0),
        .DIF(1'b0),
        .DIG(1'b0),
        .DIH(1'b0),
        .DOA(buffer_1_reg_0_63_28_31_n_0),
        .DOB(buffer_1_reg_0_63_28_31_n_1),
        .DOC(buffer_1_reg_0_63_28_31_n_2),
        .DOD(buffer_1_reg_0_63_28_31_n_3),
        .DOE(NLW_buffer_1_reg_0_63_28_31_DOE_UNCONNECTED),
        .DOF(NLW_buffer_1_reg_0_63_28_31_DOF_UNCONNECTED),
        .DOG(NLW_buffer_1_reg_0_63_28_31_DOG_UNCONNECTED),
        .DOH(NLW_buffer_1_reg_0_63_28_31_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_0_63_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_0_63_7_13
       (.ADDRA({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1],ADDRG[0]}),
        .ADDRB({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1],ADDRG[0]}),
        .ADDRC({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1],ADDRG[0]}),
        .ADDRD({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1],ADDRG[0]}),
        .ADDRE({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1],ADDRG[0]}),
        .ADDRF({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1],ADDRG[0]}),
        .ADDRG({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1],ADDRG[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[7]),
        .DIB(packet[8]),
        .DIC(packet[9]),
        .DID(packet[10]),
        .DIE(packet[11]),
        .DIF(packet[12]),
        .DIG(packet[13]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_0_63_7_13_n_0),
        .DOB(buffer_1_reg_0_63_7_13_n_1),
        .DOC(buffer_1_reg_0_63_7_13_n_2),
        .DOD(buffer_1_reg_0_63_7_13_n_3),
        .DOE(buffer_1_reg_0_63_7_13_n_4),
        .DOF(buffer_1_reg_0_63_7_13_n_5),
        .DOG(buffer_1_reg_0_63_7_13_n_6),
        .DOH(NLW_buffer_1_reg_0_63_7_13_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_0_63_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_128_191_0_6
       (.ADDRA({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRB({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRC({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRD({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRE({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRF({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRG({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[0]),
        .DIB(packet[1]),
        .DIC(packet[2]),
        .DID(packet[3]),
        .DIE(packet[4]),
        .DIF(packet[5]),
        .DIG(packet[6]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_128_191_0_6_n_0),
        .DOB(buffer_1_reg_128_191_0_6_n_1),
        .DOC(buffer_1_reg_128_191_0_6_n_2),
        .DOD(buffer_1_reg_128_191_0_6_n_3),
        .DOE(buffer_1_reg_128_191_0_6_n_4),
        .DOF(buffer_1_reg_128_191_0_6_n_5),
        .DOG(buffer_1_reg_128_191_0_6_n_6),
        .DOH(NLW_buffer_1_reg_128_191_0_6_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_128_191_0_6_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000004000)) 
    buffer_1_reg_128_191_0_6_i_1
       (.I0(\write_addr_reg_n_0_[6] ),
        .I1(\write_addr_reg_n_0_[7] ),
        .I2(curr_buffer),
        .I3(packet_valid),
        .I4(tick),
        .I5(rst),
        .O(buffer_1_reg_128_191_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_128_191_14_20
       (.ADDRA({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRB({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRC({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRD({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRE({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRF({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRG({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[14]),
        .DIB(packet[15]),
        .DIC(packet[16]),
        .DID(packet[17]),
        .DIE(packet[18]),
        .DIF(packet[19]),
        .DIG(packet[20]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_128_191_14_20_n_0),
        .DOB(buffer_1_reg_128_191_14_20_n_1),
        .DOC(buffer_1_reg_128_191_14_20_n_2),
        .DOD(buffer_1_reg_128_191_14_20_n_3),
        .DOE(buffer_1_reg_128_191_14_20_n_4),
        .DOF(buffer_1_reg_128_191_14_20_n_5),
        .DOG(buffer_1_reg_128_191_14_20_n_6),
        .DOH(NLW_buffer_1_reg_128_191_14_20_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_128_191_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_128_191_21_27
       (.ADDRA({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRB({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRC({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRD({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRE({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRF({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRG({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[21]),
        .DIB(packet[22]),
        .DIC(packet[23]),
        .DID(packet[24]),
        .DIE(packet[25]),
        .DIF(packet[26]),
        .DIG(packet[27]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_128_191_21_27_n_0),
        .DOB(buffer_1_reg_128_191_21_27_n_1),
        .DOC(buffer_1_reg_128_191_21_27_n_2),
        .DOD(buffer_1_reg_128_191_21_27_n_3),
        .DOE(buffer_1_reg_128_191_21_27_n_4),
        .DOF(buffer_1_reg_128_191_21_27_n_5),
        .DOG(buffer_1_reg_128_191_21_27_n_6),
        .DOH(NLW_buffer_1_reg_128_191_21_27_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_128_191_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_128_191_28_31
       (.ADDRA({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRB({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRC({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRD({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRE({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRF({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRG({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[28]),
        .DIB(packet[29]),
        .DIC(1'b0),
        .DID(1'b0),
        .DIE(1'b0),
        .DIF(1'b0),
        .DIG(1'b0),
        .DIH(1'b0),
        .DOA(buffer_1_reg_128_191_28_31_n_0),
        .DOB(buffer_1_reg_128_191_28_31_n_1),
        .DOC(buffer_1_reg_128_191_28_31_n_2),
        .DOD(buffer_1_reg_128_191_28_31_n_3),
        .DOE(NLW_buffer_1_reg_128_191_28_31_DOE_UNCONNECTED),
        .DOF(NLW_buffer_1_reg_128_191_28_31_DOF_UNCONNECTED),
        .DOG(NLW_buffer_1_reg_128_191_28_31_DOG_UNCONNECTED),
        .DOH(NLW_buffer_1_reg_128_191_28_31_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_128_191_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_128_191_7_13
       (.ADDRA({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRB({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRC({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRD({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRE({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRF({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRG({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[7]),
        .DIB(packet[8]),
        .DIC(packet[9]),
        .DID(packet[10]),
        .DIE(packet[11]),
        .DIF(packet[12]),
        .DIG(packet[13]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_128_191_7_13_n_0),
        .DOB(buffer_1_reg_128_191_7_13_n_1),
        .DOC(buffer_1_reg_128_191_7_13_n_2),
        .DOD(buffer_1_reg_128_191_7_13_n_3),
        .DOE(buffer_1_reg_128_191_7_13_n_4),
        .DOF(buffer_1_reg_128_191_7_13_n_5),
        .DOG(buffer_1_reg_128_191_7_13_n_6),
        .DOH(NLW_buffer_1_reg_128_191_7_13_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_128_191_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_192_255_0_6
       (.ADDRA({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRB({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRC({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRD({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRE({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRF({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRG({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[0]),
        .DIB(packet[1]),
        .DIC(packet[2]),
        .DID(packet[3]),
        .DIE(packet[4]),
        .DIF(packet[5]),
        .DIG(packet[6]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_192_255_0_6_n_0),
        .DOB(buffer_1_reg_192_255_0_6_n_1),
        .DOC(buffer_1_reg_192_255_0_6_n_2),
        .DOD(buffer_1_reg_192_255_0_6_n_3),
        .DOE(buffer_1_reg_192_255_0_6_n_4),
        .DOF(buffer_1_reg_192_255_0_6_n_5),
        .DOG(buffer_1_reg_192_255_0_6_n_6),
        .DOH(NLW_buffer_1_reg_192_255_0_6_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_192_255_0_6_i_1_n_0));
  LUT6 #(
    .INIT(64'h1000000000000000)) 
    buffer_1_reg_192_255_0_6_i_1
       (.I0(rst),
        .I1(tick),
        .I2(packet_valid),
        .I3(curr_buffer),
        .I4(\write_addr_reg_n_0_[6] ),
        .I5(\write_addr_reg_n_0_[7] ),
        .O(buffer_1_reg_192_255_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_192_255_14_20
       (.ADDRA({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRB({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRC({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRD({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRE({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRF({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRG({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[14]),
        .DIB(packet[15]),
        .DIC(packet[16]),
        .DID(packet[17]),
        .DIE(packet[18]),
        .DIF(packet[19]),
        .DIG(packet[20]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_192_255_14_20_n_0),
        .DOB(buffer_1_reg_192_255_14_20_n_1),
        .DOC(buffer_1_reg_192_255_14_20_n_2),
        .DOD(buffer_1_reg_192_255_14_20_n_3),
        .DOE(buffer_1_reg_192_255_14_20_n_4),
        .DOF(buffer_1_reg_192_255_14_20_n_5),
        .DOG(buffer_1_reg_192_255_14_20_n_6),
        .DOH(NLW_buffer_1_reg_192_255_14_20_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_192_255_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_192_255_21_27
       (.ADDRA({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRG[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRB({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRG[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRC({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRG[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRD({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRG[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRE({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRG[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRF({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRG[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRG({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRG[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[21]),
        .DIB(packet[22]),
        .DIC(packet[23]),
        .DID(packet[24]),
        .DIE(packet[25]),
        .DIF(packet[26]),
        .DIG(packet[27]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_192_255_21_27_n_0),
        .DOB(buffer_1_reg_192_255_21_27_n_1),
        .DOC(buffer_1_reg_192_255_21_27_n_2),
        .DOD(buffer_1_reg_192_255_21_27_n_3),
        .DOE(buffer_1_reg_192_255_21_27_n_4),
        .DOF(buffer_1_reg_192_255_21_27_n_5),
        .DOG(buffer_1_reg_192_255_21_27_n_6),
        .DOH(NLW_buffer_1_reg_192_255_21_27_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_192_255_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_192_255_28_31
       (.ADDRA({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRB({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRC({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRD({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRE({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRF({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRG({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[28]),
        .DIB(packet[29]),
        .DIC(1'b0),
        .DID(1'b0),
        .DIE(1'b0),
        .DIF(1'b0),
        .DIG(1'b0),
        .DIH(1'b0),
        .DOA(buffer_1_reg_192_255_28_31_n_0),
        .DOB(buffer_1_reg_192_255_28_31_n_1),
        .DOC(buffer_1_reg_192_255_28_31_n_2),
        .DOD(buffer_1_reg_192_255_28_31_n_3),
        .DOE(NLW_buffer_1_reg_192_255_28_31_DOE_UNCONNECTED),
        .DOF(NLW_buffer_1_reg_192_255_28_31_DOF_UNCONNECTED),
        .DOG(NLW_buffer_1_reg_192_255_28_31_DOG_UNCONNECTED),
        .DOH(NLW_buffer_1_reg_192_255_28_31_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_192_255_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_192_255_7_13
       (.ADDRA({Q[5],ADDRG[3],Q[3],\read_pointer_reg[2]_rep__1 ,ADDRG[1],ADDRB[0]}),
        .ADDRB({Q[5],ADDRG[3],Q[3],\read_pointer_reg[2]_rep__1 ,ADDRG[1],ADDRB[0]}),
        .ADDRC({Q[5],ADDRG[3],Q[3],\read_pointer_reg[2]_rep__1 ,ADDRG[1],ADDRB[0]}),
        .ADDRD({Q[5],ADDRG[3],Q[3],\read_pointer_reg[2]_rep__1 ,ADDRG[1],ADDRB[0]}),
        .ADDRE({Q[5],ADDRG[3],Q[3],\read_pointer_reg[2]_rep__1 ,ADDRG[1],ADDRB[0]}),
        .ADDRF({Q[5],ADDRG[3],Q[3],\read_pointer_reg[2]_rep__1 ,ADDRG[1],ADDRB[0]}),
        .ADDRG({Q[5],ADDRG[3],Q[3],\read_pointer_reg[2]_rep__1 ,ADDRG[1],ADDRB[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[7]),
        .DIB(packet[8]),
        .DIC(packet[9]),
        .DID(packet[10]),
        .DIE(packet[11]),
        .DIF(packet[12]),
        .DIG(packet[13]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_192_255_7_13_n_0),
        .DOB(buffer_1_reg_192_255_7_13_n_1),
        .DOC(buffer_1_reg_192_255_7_13_n_2),
        .DOD(buffer_1_reg_192_255_7_13_n_3),
        .DOE(buffer_1_reg_192_255_7_13_n_4),
        .DOF(buffer_1_reg_192_255_7_13_n_5),
        .DOG(buffer_1_reg_192_255_7_13_n_6),
        .DOH(NLW_buffer_1_reg_192_255_7_13_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_192_255_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_64_127_0_6
       (.ADDRA({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRB({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRC({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRD({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRE({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRF({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRG({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[0]),
        .DIB(packet[1]),
        .DIC(packet[2]),
        .DID(packet[3]),
        .DIE(packet[4]),
        .DIF(packet[5]),
        .DIG(packet[6]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_64_127_0_6_n_0),
        .DOB(buffer_1_reg_64_127_0_6_n_1),
        .DOC(buffer_1_reg_64_127_0_6_n_2),
        .DOD(buffer_1_reg_64_127_0_6_n_3),
        .DOE(buffer_1_reg_64_127_0_6_n_4),
        .DOF(buffer_1_reg_64_127_0_6_n_5),
        .DOG(buffer_1_reg_64_127_0_6_n_6),
        .DOH(NLW_buffer_1_reg_64_127_0_6_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_64_127_0_6_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000004000)) 
    buffer_1_reg_64_127_0_6_i_1
       (.I0(\write_addr_reg_n_0_[7] ),
        .I1(\write_addr_reg_n_0_[6] ),
        .I2(curr_buffer),
        .I3(packet_valid),
        .I4(tick),
        .I5(rst),
        .O(buffer_1_reg_64_127_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_64_127_14_20
       (.ADDRA({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRB({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRC({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRD({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRE({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRF({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRG({Q[5],ADDRG[3],Q[3],ADDRG[2:0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[14]),
        .DIB(packet[15]),
        .DIC(packet[16]),
        .DID(packet[17]),
        .DIE(packet[18]),
        .DIF(packet[19]),
        .DIG(packet[20]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_64_127_14_20_n_0),
        .DOB(buffer_1_reg_64_127_14_20_n_1),
        .DOC(buffer_1_reg_64_127_14_20_n_2),
        .DOD(buffer_1_reg_64_127_14_20_n_3),
        .DOE(buffer_1_reg_64_127_14_20_n_4),
        .DOF(buffer_1_reg_64_127_14_20_n_5),
        .DOG(buffer_1_reg_64_127_14_20_n_6),
        .DOH(NLW_buffer_1_reg_64_127_14_20_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_64_127_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_64_127_21_27
       (.ADDRA({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRB({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRC({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRD({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRE({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRF({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRG({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[21]),
        .DIB(packet[22]),
        .DIC(packet[23]),
        .DID(packet[24]),
        .DIE(packet[25]),
        .DIF(packet[26]),
        .DIG(packet[27]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_64_127_21_27_n_0),
        .DOB(buffer_1_reg_64_127_21_27_n_1),
        .DOC(buffer_1_reg_64_127_21_27_n_2),
        .DOD(buffer_1_reg_64_127_21_27_n_3),
        .DOE(buffer_1_reg_64_127_21_27_n_4),
        .DOF(buffer_1_reg_64_127_21_27_n_5),
        .DOG(buffer_1_reg_64_127_21_27_n_6),
        .DOH(NLW_buffer_1_reg_64_127_21_27_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_64_127_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_64_127_28_31
       (.ADDRA({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRB({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRC({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRD({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRE({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRF({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRG({ADDRB[4],Q[4],\read_pointer_reg[3]_rep__0 [1],ADDRB[2],\read_pointer_reg[3]_rep__0 [0],Q[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[28]),
        .DIB(packet[29]),
        .DIC(1'b0),
        .DID(1'b0),
        .DIE(1'b0),
        .DIF(1'b0),
        .DIG(1'b0),
        .DIH(1'b0),
        .DOA(buffer_1_reg_64_127_28_31_n_0),
        .DOB(buffer_1_reg_64_127_28_31_n_1),
        .DOC(buffer_1_reg_64_127_28_31_n_2),
        .DOD(buffer_1_reg_64_127_28_31_n_3),
        .DOE(NLW_buffer_1_reg_64_127_28_31_DOE_UNCONNECTED),
        .DOF(NLW_buffer_1_reg_64_127_28_31_DOF_UNCONNECTED),
        .DOG(NLW_buffer_1_reg_64_127_28_31_DOG_UNCONNECTED),
        .DOH(NLW_buffer_1_reg_64_127_28_31_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_64_127_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 buffer_1_reg_64_127_7_13
       (.ADDRA({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRB({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRC({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1:0]}),
        .ADDRD({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1],ADDRG[0]}),
        .ADDRE({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1],ADDRG[0]}),
        .ADDRF({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1],ADDRG[0]}),
        .ADDRG({Q[5],ADDRG[3],ADDRB[3],\read_pointer_reg[2]_rep__1 ,ADDRB[1],ADDRG[0]}),
        .ADDRH({\write_addr_reg_n_0_[5] ,\write_addr_reg_n_0_[4] ,\write_addr_reg_n_0_[3] ,\write_addr_reg_n_0_[2] ,\write_addr_reg_n_0_[1] ,\write_addr_reg_n_0_[0] }),
        .DIA(packet[7]),
        .DIB(packet[8]),
        .DIC(packet[9]),
        .DID(packet[10]),
        .DIE(packet[11]),
        .DIF(packet[12]),
        .DIG(packet[13]),
        .DIH(1'b0),
        .DOA(buffer_1_reg_64_127_7_13_n_0),
        .DOB(buffer_1_reg_64_127_7_13_n_1),
        .DOC(buffer_1_reg_64_127_7_13_n_2),
        .DOD(buffer_1_reg_64_127_7_13_n_3),
        .DOE(buffer_1_reg_64_127_7_13_n_4),
        .DOF(buffer_1_reg_64_127_7_13_n_5),
        .DOG(buffer_1_reg_64_127_7_13_n_6),
        .DOH(NLW_buffer_1_reg_64_127_7_13_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(buffer_1_reg_64_127_0_6_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFF0040)) 
    buffer_overflow_error_i_1
       (.I0(buffer_overflow_error_i_2_n_0),
        .I1(packet_valid),
        .I2(\write_addr_reg_n_0_[8] ),
        .I3(tick),
        .I4(buffer_overflow_error),
        .O(buffer_overflow_error_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    buffer_overflow_error_i_2
       (.I0(\write_addr_reg_n_0_[6] ),
        .I1(\write_addr[8]_i_3_n_0 ),
        .I2(\write_addr_reg_n_0_[7] ),
        .O(buffer_overflow_error_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    buffer_overflow_error_reg
       (.C(clk),
        .CE(1'b1),
        .D(buffer_overflow_error_i_1_n_0),
        .Q(buffer_overflow_error),
        .R(rst));
  LUT2 #(
    .INIT(4'h6)) 
    curr_buffer_i_1
       (.I0(tick),
        .I1(curr_buffer),
        .O(curr_buffer_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    curr_buffer_reg
       (.C(clk),
        .CE(1'b1),
        .D(curr_buffer_i_1_n_0),
        .Q(curr_buffer),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \num_packets_reg[0] 
       (.C(clk),
        .CE(tick),
        .D(\write_addr_reg_n_0_[0] ),
        .Q(axis_tlast_delay_reg_0[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \num_packets_reg[1] 
       (.C(clk),
        .CE(tick),
        .D(\write_addr_reg_n_0_[1] ),
        .Q(axis_tlast_delay_reg_0[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \num_packets_reg[2] 
       (.C(clk),
        .CE(tick),
        .D(\write_addr_reg_n_0_[2] ),
        .Q(axis_tlast_delay_reg_0[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \num_packets_reg[3] 
       (.C(clk),
        .CE(tick),
        .D(\write_addr_reg_n_0_[3] ),
        .Q(axis_tlast_delay_reg_0[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \num_packets_reg[4] 
       (.C(clk),
        .CE(tick),
        .D(\write_addr_reg_n_0_[4] ),
        .Q(axis_tlast_delay_reg_0[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \num_packets_reg[5] 
       (.C(clk),
        .CE(tick),
        .D(\write_addr_reg_n_0_[5] ),
        .Q(axis_tlast_delay_reg_0[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \num_packets_reg[6] 
       (.C(clk),
        .CE(tick),
        .D(\write_addr_reg_n_0_[6] ),
        .Q(axis_tlast_delay_reg_0[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \num_packets_reg[7] 
       (.C(clk),
        .CE(tick),
        .D(\write_addr_reg_n_0_[7] ),
        .Q(axis_tlast_delay_reg_0[7]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    read_en_reg
       (.C(clk),
        .CE(1'b1),
        .D(tick),
        .Q(read_en),
        .R(rst));
  LUT4 #(
    .INIT(16'hCB80)) 
    read_pointer1_carry_i_4
       (.I0(axis_tlast_delay_reg_0[0]),
        .I1(Q[0]),
        .I2(\read_pointer_reg[3]_rep__0 [0]),
        .I3(axis_tlast_delay_reg_0[1]),
        .O(\read_pointer_reg[0]_rep__0 ));
  LUT4 #(
    .INIT(16'h1842)) 
    read_pointer1_carry_i_9
       (.I0(axis_tlast_delay_reg_0[0]),
        .I1(axis_tlast_delay_reg_0[1]),
        .I2(Q[0]),
        .I3(\read_pointer_reg[3]_rep__0 [0]),
        .O(\read_pointer_reg[0]_rep__0_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[0]_i_2 
       (.I0(buffer_1_reg_192_255_0_6_n_0),
        .I1(buffer_1_reg_128_191_0_6_n_0),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_0_6_n_0),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_0_6_n_0),
        .O(dout0[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[0]_i_3 
       (.I0(buffer_0_reg_192_255_0_6_n_0),
        .I1(buffer_0_reg_128_191_0_6_n_0),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_0_6_n_0),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_0_6_n_0),
        .O(dout00_in[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[10]_i_2 
       (.I0(buffer_1_reg_192_255_7_13_n_3),
        .I1(buffer_1_reg_128_191_7_13_n_3),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_7_13_n_3),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_7_13_n_3),
        .O(dout0[10]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[10]_i_3 
       (.I0(buffer_0_reg_192_255_7_13_n_3),
        .I1(buffer_0_reg_128_191_7_13_n_3),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_7_13_n_3),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_7_13_n_3),
        .O(dout00_in[10]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[11]_i_2 
       (.I0(buffer_1_reg_192_255_7_13_n_4),
        .I1(buffer_1_reg_128_191_7_13_n_4),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_7_13_n_4),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_7_13_n_4),
        .O(dout0[11]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[11]_i_3 
       (.I0(buffer_0_reg_192_255_7_13_n_4),
        .I1(buffer_0_reg_128_191_7_13_n_4),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_7_13_n_4),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_7_13_n_4),
        .O(dout00_in[11]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[12]_i_2 
       (.I0(buffer_1_reg_192_255_7_13_n_5),
        .I1(buffer_1_reg_128_191_7_13_n_5),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_7_13_n_5),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_7_13_n_5),
        .O(dout0[12]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[12]_i_3 
       (.I0(buffer_0_reg_192_255_7_13_n_5),
        .I1(buffer_0_reg_128_191_7_13_n_5),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_7_13_n_5),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_7_13_n_5),
        .O(dout00_in[12]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[13]_i_2 
       (.I0(buffer_1_reg_192_255_7_13_n_6),
        .I1(buffer_1_reg_128_191_7_13_n_6),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_7_13_n_6),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_7_13_n_6),
        .O(dout0[13]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[13]_i_3 
       (.I0(buffer_0_reg_192_255_7_13_n_6),
        .I1(buffer_0_reg_128_191_7_13_n_6),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_7_13_n_6),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_7_13_n_6),
        .O(dout00_in[13]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[14]_i_2 
       (.I0(buffer_1_reg_192_255_14_20_n_0),
        .I1(buffer_1_reg_128_191_14_20_n_0),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_14_20_n_0),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_14_20_n_0),
        .O(dout0[14]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[14]_i_3 
       (.I0(buffer_0_reg_192_255_14_20_n_0),
        .I1(buffer_0_reg_128_191_14_20_n_0),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_14_20_n_0),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_14_20_n_0),
        .O(dout00_in[14]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[15]_i_2 
       (.I0(buffer_1_reg_192_255_14_20_n_1),
        .I1(buffer_1_reg_128_191_14_20_n_1),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_14_20_n_1),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_14_20_n_1),
        .O(dout0[15]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[15]_i_3 
       (.I0(buffer_0_reg_192_255_14_20_n_1),
        .I1(buffer_0_reg_128_191_14_20_n_1),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_14_20_n_1),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_14_20_n_1),
        .O(dout00_in[15]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[16]_i_2 
       (.I0(buffer_1_reg_192_255_14_20_n_2),
        .I1(buffer_1_reg_128_191_14_20_n_2),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_14_20_n_2),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_14_20_n_2),
        .O(dout0[16]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[16]_i_3 
       (.I0(buffer_0_reg_192_255_14_20_n_2),
        .I1(buffer_0_reg_128_191_14_20_n_2),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_14_20_n_2),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_14_20_n_2),
        .O(dout00_in[16]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[17]_i_2 
       (.I0(buffer_1_reg_192_255_14_20_n_3),
        .I1(buffer_1_reg_128_191_14_20_n_3),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_14_20_n_3),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_14_20_n_3),
        .O(dout0[17]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[17]_i_3 
       (.I0(buffer_0_reg_192_255_14_20_n_3),
        .I1(buffer_0_reg_128_191_14_20_n_3),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_14_20_n_3),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_14_20_n_3),
        .O(dout00_in[17]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[18]_i_2 
       (.I0(buffer_1_reg_192_255_14_20_n_4),
        .I1(buffer_1_reg_128_191_14_20_n_4),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_14_20_n_4),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_14_20_n_4),
        .O(dout0[18]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[18]_i_3 
       (.I0(buffer_0_reg_192_255_14_20_n_4),
        .I1(buffer_0_reg_128_191_14_20_n_4),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_14_20_n_4),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_14_20_n_4),
        .O(dout00_in[18]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[19]_i_2 
       (.I0(buffer_1_reg_192_255_14_20_n_5),
        .I1(buffer_1_reg_128_191_14_20_n_5),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_14_20_n_5),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_14_20_n_5),
        .O(dout0[19]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[19]_i_3 
       (.I0(buffer_0_reg_192_255_14_20_n_5),
        .I1(buffer_0_reg_128_191_14_20_n_5),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_14_20_n_5),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_14_20_n_5),
        .O(dout00_in[19]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[1]_i_2 
       (.I0(buffer_1_reg_192_255_0_6_n_1),
        .I1(buffer_1_reg_128_191_0_6_n_1),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_0_6_n_1),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_0_6_n_1),
        .O(dout0[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[1]_i_3 
       (.I0(buffer_0_reg_192_255_0_6_n_1),
        .I1(buffer_0_reg_128_191_0_6_n_1),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_0_6_n_1),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_0_6_n_1),
        .O(dout00_in[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[20]_i_2 
       (.I0(buffer_1_reg_192_255_14_20_n_6),
        .I1(buffer_1_reg_128_191_14_20_n_6),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_14_20_n_6),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_14_20_n_6),
        .O(dout0[20]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[20]_i_3 
       (.I0(buffer_0_reg_192_255_14_20_n_6),
        .I1(buffer_0_reg_128_191_14_20_n_6),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_14_20_n_6),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_14_20_n_6),
        .O(dout00_in[20]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[21]_i_2 
       (.I0(buffer_1_reg_192_255_21_27_n_0),
        .I1(buffer_1_reg_128_191_21_27_n_0),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_21_27_n_0),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_21_27_n_0),
        .O(dout0[21]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[21]_i_3 
       (.I0(buffer_0_reg_192_255_21_27_n_0),
        .I1(buffer_0_reg_128_191_21_27_n_0),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_21_27_n_0),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_21_27_n_0),
        .O(dout00_in[21]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[22]_i_2 
       (.I0(buffer_1_reg_192_255_21_27_n_1),
        .I1(buffer_1_reg_128_191_21_27_n_1),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_21_27_n_1),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_21_27_n_1),
        .O(dout0[22]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[22]_i_3 
       (.I0(buffer_0_reg_192_255_21_27_n_1),
        .I1(buffer_0_reg_128_191_21_27_n_1),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_21_27_n_1),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_21_27_n_1),
        .O(dout00_in[22]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[23]_i_2 
       (.I0(buffer_1_reg_192_255_21_27_n_2),
        .I1(buffer_1_reg_128_191_21_27_n_2),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_21_27_n_2),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_21_27_n_2),
        .O(dout0[23]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[23]_i_3 
       (.I0(buffer_0_reg_192_255_21_27_n_2),
        .I1(buffer_0_reg_128_191_21_27_n_2),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_21_27_n_2),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_21_27_n_2),
        .O(dout00_in[23]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[24]_i_2 
       (.I0(buffer_1_reg_192_255_21_27_n_3),
        .I1(buffer_1_reg_128_191_21_27_n_3),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_21_27_n_3),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_21_27_n_3),
        .O(dout0[24]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[24]_i_3 
       (.I0(buffer_0_reg_192_255_21_27_n_3),
        .I1(buffer_0_reg_128_191_21_27_n_3),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_21_27_n_3),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_21_27_n_3),
        .O(dout00_in[24]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[25]_i_2 
       (.I0(buffer_1_reg_192_255_21_27_n_4),
        .I1(buffer_1_reg_128_191_21_27_n_4),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_21_27_n_4),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_21_27_n_4),
        .O(dout0[25]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[25]_i_3 
       (.I0(buffer_0_reg_192_255_21_27_n_4),
        .I1(buffer_0_reg_128_191_21_27_n_4),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_21_27_n_4),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_21_27_n_4),
        .O(dout00_in[25]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[26]_i_2 
       (.I0(buffer_1_reg_192_255_21_27_n_5),
        .I1(buffer_1_reg_128_191_21_27_n_5),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_21_27_n_5),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_21_27_n_5),
        .O(dout0[26]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[26]_i_3 
       (.I0(buffer_0_reg_192_255_21_27_n_5),
        .I1(buffer_0_reg_128_191_21_27_n_5),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_21_27_n_5),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_21_27_n_5),
        .O(dout00_in[26]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[27]_i_2 
       (.I0(buffer_1_reg_192_255_21_27_n_6),
        .I1(buffer_1_reg_128_191_21_27_n_6),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_21_27_n_6),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_21_27_n_6),
        .O(dout0[27]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[27]_i_3 
       (.I0(buffer_0_reg_192_255_21_27_n_6),
        .I1(buffer_0_reg_128_191_21_27_n_6),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_21_27_n_6),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_21_27_n_6),
        .O(dout00_in[27]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[28]_i_2 
       (.I0(buffer_1_reg_192_255_28_31_n_0),
        .I1(buffer_1_reg_128_191_28_31_n_0),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_28_31_n_0),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_28_31_n_0),
        .O(dout0[28]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[28]_i_3 
       (.I0(buffer_0_reg_192_255_28_31_n_0),
        .I1(buffer_0_reg_128_191_28_31_n_0),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_28_31_n_0),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_28_31_n_0),
        .O(dout00_in[28]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[29]_i_2 
       (.I0(buffer_1_reg_192_255_28_31_n_1),
        .I1(buffer_1_reg_128_191_28_31_n_1),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_28_31_n_1),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_28_31_n_1),
        .O(dout0[29]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[29]_i_3 
       (.I0(buffer_0_reg_192_255_28_31_n_1),
        .I1(buffer_0_reg_128_191_28_31_n_1),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_28_31_n_1),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_28_31_n_1),
        .O(dout00_in[29]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[2]_i_2 
       (.I0(buffer_1_reg_192_255_0_6_n_2),
        .I1(buffer_1_reg_128_191_0_6_n_2),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_0_6_n_2),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_0_6_n_2),
        .O(dout0[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[2]_i_3 
       (.I0(buffer_0_reg_192_255_0_6_n_2),
        .I1(buffer_0_reg_128_191_0_6_n_2),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_0_6_n_2),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_0_6_n_2),
        .O(dout00_in[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[30]_i_2 
       (.I0(buffer_1_reg_192_255_28_31_n_2),
        .I1(buffer_1_reg_128_191_28_31_n_2),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_28_31_n_2),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_28_31_n_2),
        .O(dout0[30]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[30]_i_3 
       (.I0(buffer_0_reg_192_255_28_31_n_2),
        .I1(buffer_0_reg_128_191_28_31_n_2),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_28_31_n_2),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_28_31_n_2),
        .O(dout00_in[30]));
  LUT3 #(
    .INIT(8'h80)) 
    \stream_data_out[31]_i_1 
       (.I0(m00_axis_tready),
        .I1(CO),
        .I2(out),
        .O(E));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[31]_i_3 
       (.I0(buffer_1_reg_192_255_28_31_n_3),
        .I1(buffer_1_reg_128_191_28_31_n_3),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_28_31_n_3),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_28_31_n_3),
        .O(dout0[31]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[31]_i_4 
       (.I0(buffer_0_reg_192_255_28_31_n_3),
        .I1(buffer_0_reg_128_191_28_31_n_3),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_28_31_n_3),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_28_31_n_3),
        .O(dout00_in[31]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[3]_i_2 
       (.I0(buffer_1_reg_192_255_0_6_n_3),
        .I1(buffer_1_reg_128_191_0_6_n_3),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_0_6_n_3),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_0_6_n_3),
        .O(dout0[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[3]_i_3 
       (.I0(buffer_0_reg_192_255_0_6_n_3),
        .I1(buffer_0_reg_128_191_0_6_n_3),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_0_6_n_3),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_0_6_n_3),
        .O(dout00_in[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[4]_i_2 
       (.I0(buffer_1_reg_192_255_0_6_n_4),
        .I1(buffer_1_reg_128_191_0_6_n_4),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_0_6_n_4),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_0_6_n_4),
        .O(dout0[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[4]_i_3 
       (.I0(buffer_0_reg_192_255_0_6_n_4),
        .I1(buffer_0_reg_128_191_0_6_n_4),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_0_6_n_4),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_0_6_n_4),
        .O(dout00_in[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[5]_i_2 
       (.I0(buffer_1_reg_192_255_0_6_n_5),
        .I1(buffer_1_reg_128_191_0_6_n_5),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_0_6_n_5),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_0_6_n_5),
        .O(dout0[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[5]_i_3 
       (.I0(buffer_0_reg_192_255_0_6_n_5),
        .I1(buffer_0_reg_128_191_0_6_n_5),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_0_6_n_5),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_0_6_n_5),
        .O(dout00_in[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[6]_i_2 
       (.I0(buffer_1_reg_192_255_0_6_n_6),
        .I1(buffer_1_reg_128_191_0_6_n_6),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_0_6_n_6),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_0_6_n_6),
        .O(dout0[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[6]_i_3 
       (.I0(buffer_0_reg_192_255_0_6_n_6),
        .I1(buffer_0_reg_128_191_0_6_n_6),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_0_6_n_6),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_0_6_n_6),
        .O(dout00_in[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[7]_i_2 
       (.I0(buffer_1_reg_192_255_7_13_n_0),
        .I1(buffer_1_reg_128_191_7_13_n_0),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_7_13_n_0),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_7_13_n_0),
        .O(dout0[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[7]_i_3 
       (.I0(buffer_0_reg_192_255_7_13_n_0),
        .I1(buffer_0_reg_128_191_7_13_n_0),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_7_13_n_0),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_7_13_n_0),
        .O(dout00_in[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[8]_i_2 
       (.I0(buffer_1_reg_192_255_7_13_n_1),
        .I1(buffer_1_reg_128_191_7_13_n_1),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_7_13_n_1),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_7_13_n_1),
        .O(dout0[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[8]_i_3 
       (.I0(buffer_0_reg_192_255_7_13_n_1),
        .I1(buffer_0_reg_128_191_7_13_n_1),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_7_13_n_1),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_7_13_n_1),
        .O(dout00_in[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[9]_i_2 
       (.I0(buffer_1_reg_192_255_7_13_n_2),
        .I1(buffer_1_reg_128_191_7_13_n_2),
        .I2(Q[7]),
        .I3(buffer_1_reg_64_127_7_13_n_2),
        .I4(Q[6]),
        .I5(buffer_1_reg_0_63_7_13_n_2),
        .O(dout0[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \stream_data_out[9]_i_3 
       (.I0(buffer_0_reg_192_255_7_13_n_2),
        .I1(buffer_0_reg_128_191_7_13_n_2),
        .I2(Q[7]),
        .I3(buffer_0_reg_64_127_7_13_n_2),
        .I4(Q[6]),
        .I5(buffer_0_reg_0_63_7_13_n_2),
        .O(dout00_in[9]));
  MUXF7 \stream_data_out_reg[0]_i_1 
       (.I0(dout0[0]),
        .I1(dout00_in[0]),
        .O(D[0]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[10]_i_1 
       (.I0(dout0[10]),
        .I1(dout00_in[10]),
        .O(D[10]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[11]_i_1 
       (.I0(dout0[11]),
        .I1(dout00_in[11]),
        .O(D[11]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[12]_i_1 
       (.I0(dout0[12]),
        .I1(dout00_in[12]),
        .O(D[12]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[13]_i_1 
       (.I0(dout0[13]),
        .I1(dout00_in[13]),
        .O(D[13]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[14]_i_1 
       (.I0(dout0[14]),
        .I1(dout00_in[14]),
        .O(D[14]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[15]_i_1 
       (.I0(dout0[15]),
        .I1(dout00_in[15]),
        .O(D[15]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[16]_i_1 
       (.I0(dout0[16]),
        .I1(dout00_in[16]),
        .O(D[16]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[17]_i_1 
       (.I0(dout0[17]),
        .I1(dout00_in[17]),
        .O(D[17]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[18]_i_1 
       (.I0(dout0[18]),
        .I1(dout00_in[18]),
        .O(D[18]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[19]_i_1 
       (.I0(dout0[19]),
        .I1(dout00_in[19]),
        .O(D[19]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[1]_i_1 
       (.I0(dout0[1]),
        .I1(dout00_in[1]),
        .O(D[1]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[20]_i_1 
       (.I0(dout0[20]),
        .I1(dout00_in[20]),
        .O(D[20]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[21]_i_1 
       (.I0(dout0[21]),
        .I1(dout00_in[21]),
        .O(D[21]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[22]_i_1 
       (.I0(dout0[22]),
        .I1(dout00_in[22]),
        .O(D[22]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[23]_i_1 
       (.I0(dout0[23]),
        .I1(dout00_in[23]),
        .O(D[23]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[24]_i_1 
       (.I0(dout0[24]),
        .I1(dout00_in[24]),
        .O(D[24]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[25]_i_1 
       (.I0(dout0[25]),
        .I1(dout00_in[25]),
        .O(D[25]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[26]_i_1 
       (.I0(dout0[26]),
        .I1(dout00_in[26]),
        .O(D[26]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[27]_i_1 
       (.I0(dout0[27]),
        .I1(dout00_in[27]),
        .O(D[27]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[28]_i_1 
       (.I0(dout0[28]),
        .I1(dout00_in[28]),
        .O(D[28]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[29]_i_1 
       (.I0(dout0[29]),
        .I1(dout00_in[29]),
        .O(D[29]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[2]_i_1 
       (.I0(dout0[2]),
        .I1(dout00_in[2]),
        .O(D[2]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[30]_i_1 
       (.I0(dout0[30]),
        .I1(dout00_in[30]),
        .O(D[30]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[31]_i_2 
       (.I0(dout0[31]),
        .I1(dout00_in[31]),
        .O(D[31]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[3]_i_1 
       (.I0(dout0[3]),
        .I1(dout00_in[3]),
        .O(D[3]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[4]_i_1 
       (.I0(dout0[4]),
        .I1(dout00_in[4]),
        .O(D[4]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[5]_i_1 
       (.I0(dout0[5]),
        .I1(dout00_in[5]),
        .O(D[5]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[6]_i_1 
       (.I0(dout0[6]),
        .I1(dout00_in[6]),
        .O(D[6]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[7]_i_1 
       (.I0(dout0[7]),
        .I1(dout00_in[7]),
        .O(D[7]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[8]_i_1 
       (.I0(dout0[8]),
        .I1(dout00_in[8]),
        .O(D[8]),
        .S(curr_buffer));
  MUXF7 \stream_data_out_reg[9]_i_1 
       (.I0(dout0[9]),
        .I1(dout00_in[9]),
        .O(D[9]),
        .S(curr_buffer));
  LUT6 #(
    .INIT(64'h9009000000000000)) 
    tx_done_i_2
       (.I0(axis_tlast_delay_reg_0[7]),
        .I1(Q[7]),
        .I2(axis_tlast_delay_reg_0[6]),
        .I3(Q[6]),
        .I4(\read_pointer_reg[3]_rep ),
        .I5(tx_done_i_4_n_0),
        .O(tx_done0__14));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    tx_done_i_4
       (.I0(axis_tlast_delay_reg_0[0]),
        .I1(ADDRG[0]),
        .I2(axis_tlast_delay_reg_0[2]),
        .I3(Q[2]),
        .I4(axis_tlast_delay_reg_0[1]),
        .I5(Q[1]),
        .O(tx_done_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \write_addr[0]_i_1 
       (.I0(\write_addr_reg_n_0_[0] ),
        .O(\write_addr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \write_addr[1]_i_1 
       (.I0(\write_addr_reg_n_0_[0] ),
        .I1(\write_addr_reg_n_0_[1] ),
        .O(\write_addr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \write_addr[2]_i_1 
       (.I0(\write_addr_reg_n_0_[1] ),
        .I1(\write_addr_reg_n_0_[0] ),
        .I2(\write_addr_reg_n_0_[2] ),
        .O(\write_addr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \write_addr[3]_i_1 
       (.I0(\write_addr_reg_n_0_[2] ),
        .I1(\write_addr_reg_n_0_[0] ),
        .I2(\write_addr_reg_n_0_[1] ),
        .I3(\write_addr_reg_n_0_[3] ),
        .O(\write_addr[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \write_addr[4]_i_1 
       (.I0(\write_addr_reg_n_0_[3] ),
        .I1(\write_addr_reg_n_0_[1] ),
        .I2(\write_addr_reg_n_0_[0] ),
        .I3(\write_addr_reg_n_0_[2] ),
        .I4(\write_addr_reg_n_0_[4] ),
        .O(\write_addr[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \write_addr[5]_i_1 
       (.I0(\write_addr_reg_n_0_[4] ),
        .I1(\write_addr_reg_n_0_[2] ),
        .I2(\write_addr_reg_n_0_[0] ),
        .I3(\write_addr_reg_n_0_[1] ),
        .I4(\write_addr_reg_n_0_[3] ),
        .I5(\write_addr_reg_n_0_[5] ),
        .O(\write_addr[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \write_addr[6]_i_1 
       (.I0(\write_addr[8]_i_3_n_0 ),
        .I1(\write_addr_reg_n_0_[6] ),
        .O(\write_addr[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hD2)) 
    \write_addr[7]_i_1 
       (.I0(\write_addr_reg_n_0_[6] ),
        .I1(\write_addr[8]_i_3_n_0 ),
        .I2(\write_addr_reg_n_0_[7] ),
        .O(\write_addr[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \write_addr[8]_i_1 
       (.I0(rst),
        .I1(tick),
        .O(\write_addr[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hDF20)) 
    \write_addr[8]_i_2 
       (.I0(\write_addr_reg_n_0_[7] ),
        .I1(\write_addr[8]_i_3_n_0 ),
        .I2(\write_addr_reg_n_0_[6] ),
        .I3(\write_addr_reg_n_0_[8] ),
        .O(\write_addr[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \write_addr[8]_i_3 
       (.I0(\write_addr_reg_n_0_[4] ),
        .I1(\write_addr_reg_n_0_[2] ),
        .I2(\write_addr_reg_n_0_[0] ),
        .I3(\write_addr_reg_n_0_[1] ),
        .I4(\write_addr_reg_n_0_[3] ),
        .I5(\write_addr_reg_n_0_[5] ),
        .O(\write_addr[8]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_addr_reg[0] 
       (.C(clk),
        .CE(packet_valid),
        .D(\write_addr[0]_i_1_n_0 ),
        .Q(\write_addr_reg_n_0_[0] ),
        .R(\write_addr[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_addr_reg[1] 
       (.C(clk),
        .CE(packet_valid),
        .D(\write_addr[1]_i_1_n_0 ),
        .Q(\write_addr_reg_n_0_[1] ),
        .R(\write_addr[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_addr_reg[2] 
       (.C(clk),
        .CE(packet_valid),
        .D(\write_addr[2]_i_1_n_0 ),
        .Q(\write_addr_reg_n_0_[2] ),
        .R(\write_addr[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_addr_reg[3] 
       (.C(clk),
        .CE(packet_valid),
        .D(\write_addr[3]_i_1_n_0 ),
        .Q(\write_addr_reg_n_0_[3] ),
        .R(\write_addr[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_addr_reg[4] 
       (.C(clk),
        .CE(packet_valid),
        .D(\write_addr[4]_i_1_n_0 ),
        .Q(\write_addr_reg_n_0_[4] ),
        .R(\write_addr[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_addr_reg[5] 
       (.C(clk),
        .CE(packet_valid),
        .D(\write_addr[5]_i_1_n_0 ),
        .Q(\write_addr_reg_n_0_[5] ),
        .R(\write_addr[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_addr_reg[6] 
       (.C(clk),
        .CE(packet_valid),
        .D(\write_addr[6]_i_1_n_0 ),
        .Q(\write_addr_reg_n_0_[6] ),
        .R(\write_addr[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_addr_reg[7] 
       (.C(clk),
        .CE(packet_valid),
        .D(\write_addr[7]_i_1_n_0 ),
        .Q(\write_addr_reg_n_0_[7] ),
        .R(\write_addr[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_addr_reg[8] 
       (.C(clk),
        .CE(packet_valid),
        .D(\write_addr[8]_i_2_n_0 ),
        .Q(\write_addr_reg_n_0_[8] ),
        .R(\write_addr[8]_i_1_n_0 ));
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
