// (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:user:RANCNetwork:2.0
// IP Revision: 17

(* X_CORE_INFO = "RANCNetwork,Vivado 2018.2" *)
(* CHECK_LICENSE_TYPE = "streaming_RANCNetwork_0_1,RANCNetwork,{}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module streaming_RANCNetwork_0_1 (
  clk,
  rst,
  tick,
  outcome_capture,
  packet_out,
  packet_out_valid,
  packet_in_capture,
  forward_east_full,
  token_controller_error,
  scheduler_error,
  packet_read_error,
  fifo_write_error,
  s00_axis_aclk,
  s00_axis_aresetn,
  s00_axis_tready,
  s00_axis_tdata,
  s00_axis_tstrb,
  s00_axis_tlast,
  s00_axis_tvalid
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 99990000, PHASE 0.000, CLK_DOMAIN streaming_zynq_ultra_ps_e_0_0_pl_clk0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
input wire rst;
input wire tick;
input wire outcome_capture;
output wire [29 : 0] packet_out;
output wire packet_out_valid;
output wire packet_in_capture;
output wire forward_east_full;
output wire token_controller_error;
output wire scheduler_error;
output wire packet_read_error;
output wire fifo_write_error;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axis_aclk, ASSOCIATED_RESET s00_axis_aresetn, ASSOCIATED_BUSIF s00_axis, FREQ_HZ 99990000, PHASE 0.000, CLK_DOMAIN streaming_zynq_ultra_ps_e_0_0_pl_clk0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s00_axis_aclk CLK" *)
input wire s00_axis_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axis_aresetn, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s00_axis_aresetn RST" *)
input wire s00_axis_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_axis TREADY" *)
output wire s00_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_axis TDATA" *)
input wire [31 : 0] s00_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_axis TSTRB" *)
input wire [3 : 0] s00_axis_tstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_axis TLAST" *)
input wire s00_axis_tlast;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 99990000, PHASE 0.000, CLK_DOMAIN streaming_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_axis TVALID" *)
input wire s00_axis_tvalid;

  RANCNetwork #(
    .GRID_DIMENSION_X(5),
    .GRID_DIMENSION_Y(1),
    .OUTPUT_CORE_X_COORDINATE(4),
    .OUTPUT_CORE_Y_COORDINATE(0),
    .NUM_NEURONS(256),
    .NUM_AXONS(256),
    .NUM_TICKS(16),
    .NUM_WEIGHTS(4),
    .POTENTIAL_WIDTH(9),
    .WEIGHT_WIDTH(9),
    .LEAK_WIDTH(9),
    .THRESHOLD_WIDTH(9),
    .DX_WIDTH(9),
    .DY_WIDTH(9),
    .MEMORY_FILEPATH("C:/Users/rubenpurdy/Developer/RANC/Emulation/docs/streaming/data/"),
    .MAXIMUM_NUMBER_OF_PACKETS(200),
    .C_S00_AXIS_TDATA_WIDTH(32),
    .PACKET_WIDTH(30)
  ) inst (
    .clk(clk),
    .rst(rst),
    .tick(tick),
    .outcome_capture(outcome_capture),
    .packet_out(packet_out),
    .packet_out_valid(packet_out_valid),
    .packet_in_capture(packet_in_capture),
    .forward_east_full(forward_east_full),
    .token_controller_error(token_controller_error),
    .scheduler_error(scheduler_error),
    .packet_read_error(packet_read_error),
    .fifo_write_error(fifo_write_error),
    .s00_axis_aclk(s00_axis_aclk),
    .s00_axis_aresetn(s00_axis_aresetn),
    .s00_axis_tready(s00_axis_tready),
    .s00_axis_tdata(s00_axis_tdata),
    .s00_axis_tstrb(s00_axis_tstrb),
    .s00_axis_tlast(s00_axis_tlast),
    .s00_axis_tvalid(s00_axis_tvalid)
  );
endmodule
