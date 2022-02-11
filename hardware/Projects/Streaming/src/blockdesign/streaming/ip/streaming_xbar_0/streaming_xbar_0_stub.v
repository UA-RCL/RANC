// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed May 22 14:41:00 2019
// Host        : ENGR-RCL11G running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/rubenpurdy/Developer/RANC/Emulation/Projects/RANCStreaming/src/blockdesign/streaming/ip/streaming_xbar_0/streaming_xbar_0_stub.v
// Design      : streaming_xbar_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axi_crossbar_v2_1_18_axi_crossbar,Vivado 2018.2" *)
module streaming_xbar_0(aclk, aresetn, s_axi_awaddr, s_axi_awprot, 
  s_axi_awvalid, s_axi_awready, s_axi_wdata, s_axi_wstrb, s_axi_wvalid, s_axi_wready, 
  s_axi_bresp, s_axi_bvalid, s_axi_bready, s_axi_araddr, s_axi_arprot, s_axi_arvalid, 
  s_axi_arready, s_axi_rdata, s_axi_rresp, s_axi_rvalid, s_axi_rready, m_axi_awaddr, 
  m_axi_awprot, m_axi_awvalid, m_axi_awready, m_axi_wdata, m_axi_wstrb, m_axi_wvalid, 
  m_axi_wready, m_axi_bresp, m_axi_bvalid, m_axi_bready, m_axi_araddr, m_axi_arprot, 
  m_axi_arvalid, m_axi_arready, m_axi_rdata, m_axi_rresp, m_axi_rvalid, m_axi_rready)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axi_awaddr[79:0],s_axi_awprot[5:0],s_axi_awvalid[1:0],s_axi_awready[1:0],s_axi_wdata[63:0],s_axi_wstrb[7:0],s_axi_wvalid[1:0],s_axi_wready[1:0],s_axi_bresp[3:0],s_axi_bvalid[1:0],s_axi_bready[1:0],s_axi_araddr[79:0],s_axi_arprot[5:0],s_axi_arvalid[1:0],s_axi_arready[1:0],s_axi_rdata[63:0],s_axi_rresp[3:0],s_axi_rvalid[1:0],s_axi_rready[1:0],m_axi_awaddr[39:0],m_axi_awprot[2:0],m_axi_awvalid[0:0],m_axi_awready[0:0],m_axi_wdata[31:0],m_axi_wstrb[3:0],m_axi_wvalid[0:0],m_axi_wready[0:0],m_axi_bresp[1:0],m_axi_bvalid[0:0],m_axi_bready[0:0],m_axi_araddr[39:0],m_axi_arprot[2:0],m_axi_arvalid[0:0],m_axi_arready[0:0],m_axi_rdata[31:0],m_axi_rresp[1:0],m_axi_rvalid[0:0],m_axi_rready[0:0]" */;
  input aclk;
  input aresetn;
  input [79:0]s_axi_awaddr;
  input [5:0]s_axi_awprot;
  input [1:0]s_axi_awvalid;
  output [1:0]s_axi_awready;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input [1:0]s_axi_wvalid;
  output [1:0]s_axi_wready;
  output [3:0]s_axi_bresp;
  output [1:0]s_axi_bvalid;
  input [1:0]s_axi_bready;
  input [79:0]s_axi_araddr;
  input [5:0]s_axi_arprot;
  input [1:0]s_axi_arvalid;
  output [1:0]s_axi_arready;
  output [63:0]s_axi_rdata;
  output [3:0]s_axi_rresp;
  output [1:0]s_axi_rvalid;
  input [1:0]s_axi_rready;
  output [39:0]m_axi_awaddr;
  output [2:0]m_axi_awprot;
  output [0:0]m_axi_awvalid;
  input [0:0]m_axi_awready;
  output [31:0]m_axi_wdata;
  output [3:0]m_axi_wstrb;
  output [0:0]m_axi_wvalid;
  input [0:0]m_axi_wready;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_bvalid;
  output [0:0]m_axi_bready;
  output [39:0]m_axi_araddr;
  output [2:0]m_axi_arprot;
  output [0:0]m_axi_arvalid;
  input [0:0]m_axi_arready;
  input [31:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input [0:0]m_axi_rvalid;
  output [0:0]m_axi_rready;
endmodule
