// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed May 22 14:44:17 2019
// Host        : ENGR-RCL11G running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/rubenpurdy/Developer/RANC/Emulation/Projects/RANCStreaming/src/blockdesign/streaming/ip/streaming_RANCNetwork_0_1/streaming_RANCNetwork_0_1_stub.v
// Design      : streaming_RANCNetwork_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "RANCNetwork,Vivado 2018.2" *)
module streaming_RANCNetwork_0_1(clk, rst, tick, outcome_capture, packet_out, 
  packet_out_valid, packet_in_capture, forward_east_full, token_controller_error, 
  scheduler_error, packet_read_error, fifo_write_error, s00_axis_aclk, s00_axis_aresetn, 
  s00_axis_tready, s00_axis_tdata, s00_axis_tstrb, s00_axis_tlast, s00_axis_tvalid)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,tick,outcome_capture,packet_out[29:0],packet_out_valid,packet_in_capture,forward_east_full,token_controller_error,scheduler_error,packet_read_error,fifo_write_error,s00_axis_aclk,s00_axis_aresetn,s00_axis_tready,s00_axis_tdata[31:0],s00_axis_tstrb[3:0],s00_axis_tlast,s00_axis_tvalid" */;
  input clk;
  input rst;
  input tick;
  input outcome_capture;
  output [29:0]packet_out;
  output packet_out_valid;
  output packet_in_capture;
  output forward_east_full;
  output token_controller_error;
  output scheduler_error;
  output packet_read_error;
  output fifo_write_error;
  input s00_axis_aclk;
  input s00_axis_aresetn;
  output s00_axis_tready;
  input [31:0]s00_axis_tdata;
  input [3:0]s00_axis_tstrb;
  input s00_axis_tlast;
  input s00_axis_tvalid;
endmodule
