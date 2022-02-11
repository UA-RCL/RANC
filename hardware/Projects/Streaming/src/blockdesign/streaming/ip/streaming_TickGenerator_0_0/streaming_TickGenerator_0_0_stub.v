// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed May 22 14:40:42 2019
// Host        : ENGR-RCL11G running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top streaming_TickGenerator_0_0 -prefix
//               streaming_TickGenerator_0_0_ streaming_TickGenerator_0_1_stub.v
// Design      : streaming_TickGenerator_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "TickGenerator,Vivado 2018.2" *)
module streaming_TickGenerator_0_0(clk, en, tick, intr)
/* synthesis syn_black_box black_box_pad_pin="clk,en,tick,intr" */;
  input clk;
  input en;
  output tick;
  output intr;
endmodule
