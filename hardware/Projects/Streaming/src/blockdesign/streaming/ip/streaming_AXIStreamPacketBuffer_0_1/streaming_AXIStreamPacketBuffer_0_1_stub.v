// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed May 22 14:40:46 2019
// Host        : ENGR-RCL11G running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/rubenpurdy/Developer/RANC/Emulation/Projects/RANCStreaming/src/blockdesign/streaming/ip/streaming_AXIStreamPacketBuffer_0_1/streaming_AXIStreamPacketBuffer_0_1_stub.v
// Design      : streaming_AXIStreamPacketBuffer_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "AXIStreamPacketBuffer,Vivado 2018.2" *)
module streaming_AXIStreamPacketBuffer_0_1(clk, rst, tick, packet, packet_valid, 
  buffer_overflow_error, buffer_to_stream_error, m00_axis_aclk, m00_axis_aresetn, 
  m00_axis_tvalid, m00_axis_tdata, m00_axis_tstrb, m00_axis_tlast, m00_axis_tready)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,tick,packet[29:0],packet_valid,buffer_overflow_error,buffer_to_stream_error,m00_axis_aclk,m00_axis_aresetn,m00_axis_tvalid,m00_axis_tdata[31:0],m00_axis_tstrb[3:0],m00_axis_tlast,m00_axis_tready" */;
  input clk;
  input rst;
  input tick;
  input [29:0]packet;
  input packet_valid;
  output buffer_overflow_error;
  output buffer_to_stream_error;
  input m00_axis_aclk;
  input m00_axis_aresetn;
  output m00_axis_tvalid;
  output [31:0]m00_axis_tdata;
  output [3:0]m00_axis_tstrb;
  output m00_axis_tlast;
  input m00_axis_tready;
endmodule
