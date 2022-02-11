// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed May 22 14:41:27 2019
// Host        : ENGR-RCL11G running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top streaming_auto_pc_0 -prefix
//               streaming_auto_pc_0_ streaming_auto_pc_1_sim_netlist.v
// Design      : streaming_auto_pc_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* C_AXI_ADDR_WIDTH = "40" *) (* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) 
(* C_AXI_BUSER_WIDTH = "1" *) (* C_AXI_DATA_WIDTH = "32" *) (* C_AXI_ID_WIDTH = "1" *) 
(* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_SUPPORTS_READ = "1" *) (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) 
(* C_AXI_SUPPORTS_WRITE = "1" *) (* C_AXI_WUSER_WIDTH = "1" *) (* C_FAMILY = "zynquplus" *) 
(* C_IGNORE_ID = "1" *) (* C_M_AXI_PROTOCOL = "2" *) (* C_S_AXI_PROTOCOL = "0" *) 
(* C_TRANSLATION_MODE = "2" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* P_AXI3 = "1" *) 
(* P_AXI4 = "0" *) (* P_AXILITE = "2" *) (* P_AXILITE_SIZE = "3'b010" *) 
(* P_CONVERSION = "2" *) (* P_DECERR = "2'b11" *) (* P_INCR = "2'b01" *) 
(* P_PROTECTION = "1" *) (* P_SLVERR = "2'b10" *) 
module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_axi_protocol_converter
   (aclk,
    aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awregion,
    s_axi_awqos,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arregion,
    s_axi_arqos,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awregion,
    m_axi_awqos,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arregion,
    m_axi_arqos,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [0:0]s_axi_awid;
  input [39:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awregion;
  input [3:0]s_axi_awqos;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  input [0:0]s_axi_arid;
  input [39:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arregion;
  input [3:0]s_axi_arqos;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_awid;
  output [39:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awregion;
  output [3:0]m_axi_awqos;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [31:0]m_axi_wdata;
  output [3:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  output [0:0]m_axi_arid;
  output [39:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [0:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arregion;
  output [3:0]m_axi_arqos;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [31:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;

  wire \<const0> ;
  wire \<const1> ;
  wire aclk;
  wire aresetn;
  wire [39:0]m_axi_araddr;
  wire [2:0]m_axi_arprot;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire [39:0]m_axi_awaddr;
  wire [2:0]m_axi_awprot;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [31:0]m_axi_rdata;
  wire m_axi_rready;
  wire [1:0]m_axi_rresp;
  wire m_axi_rvalid;
  wire m_axi_wready;
  wire [39:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire [2:0]s_axi_arprot;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [39:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire [2:0]s_axi_awprot;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire [0:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;

  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const1> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const1> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const1> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const1> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_wdata[31:0] = s_axi_wdata;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const1> ;
  assign m_axi_wstrb[3:0] = s_axi_wstrb;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = s_axi_wvalid;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_wready = m_axi_wready;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s \gen_axilite.gen_b2s_conv.axilite_b2s 
       (.Q({m_axi_awprot,m_axi_awaddr[39:12]}),
        .UNCONN_OUT({s_axi_bid,s_axi_bresp}),
        .UNCONN_OUT_0({s_axi_rid,s_axi_rlast,s_axi_rresp,s_axi_rdata}),
        .aclk(aclk),
        .aresetn(aresetn),
        .in({m_axi_rresp,m_axi_rdata}),
        .m_axi_araddr(m_axi_araddr[11:0]),
        .\m_axi_arprot[2] ({m_axi_arprot,m_axi_araddr[39:12]}),
        .m_axi_arready(m_axi_arready),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_awaddr(m_axi_awaddr[11:0]),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize(s_axi_arsize[1:0]),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize(s_axi_awsize[1:0]),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid));
endmodule

module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s
   (s_axi_rvalid,
    s_axi_awready,
    Q,
    s_axi_arready,
    \m_axi_arprot[2] ,
    s_axi_bvalid,
    UNCONN_OUT,
    UNCONN_OUT_0,
    m_axi_awvalid,
    m_axi_bready,
    m_axi_arvalid,
    m_axi_rready,
    m_axi_awaddr,
    m_axi_araddr,
    m_axi_arready,
    s_axi_rready,
    s_axi_awvalid,
    aclk,
    in,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awsize,
    s_axi_awprot,
    s_axi_awaddr,
    m_axi_bresp,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arsize,
    s_axi_arprot,
    s_axi_araddr,
    m_axi_awready,
    m_axi_bvalid,
    m_axi_rvalid,
    s_axi_bready,
    s_axi_arvalid,
    aresetn);
  output s_axi_rvalid;
  output s_axi_awready;
  output [30:0]Q;
  output s_axi_arready;
  output [30:0]\m_axi_arprot[2] ;
  output s_axi_bvalid;
  output [2:0]UNCONN_OUT;
  output [35:0]UNCONN_OUT_0;
  output m_axi_awvalid;
  output m_axi_bready;
  output m_axi_arvalid;
  output m_axi_rready;
  output [11:0]m_axi_awaddr;
  output [11:0]m_axi_araddr;
  input m_axi_arready;
  input s_axi_rready;
  input s_axi_awvalid;
  input aclk;
  input [33:0]in;
  input [0:0]s_axi_awid;
  input [7:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awsize;
  input [2:0]s_axi_awprot;
  input [39:0]s_axi_awaddr;
  input [1:0]m_axi_bresp;
  input [0:0]s_axi_arid;
  input [7:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arsize;
  input [2:0]s_axi_arprot;
  input [39:0]s_axi_araddr;
  input m_axi_awready;
  input m_axi_bvalid;
  input m_axi_rvalid;
  input s_axi_bready;
  input s_axi_arvalid;
  input aresetn;

  wire [30:0]Q;
  wire \RD.ar_channel_0_n_15 ;
  wire \RD.ar_channel_0_n_16 ;
  wire \RD.ar_channel_0_n_17 ;
  wire \RD.ar_channel_0_n_18 ;
  wire \RD.ar_channel_0_n_19 ;
  wire \RD.ar_channel_0_n_2 ;
  wire \RD.ar_channel_0_n_20 ;
  wire \RD.ar_channel_0_n_21 ;
  wire \RD.ar_channel_0_n_22 ;
  wire \RD.ar_channel_0_n_23 ;
  wire \RD.ar_channel_0_n_3 ;
  wire \RD.ar_channel_0_n_4 ;
  wire \RD.ar_channel_0_n_7 ;
  wire \RD.ar_channel_0_n_9 ;
  wire \RD.r_channel_0_n_0 ;
  wire \RD.r_channel_0_n_2 ;
  wire SI_REG_n_10;
  wire SI_REG_n_11;
  wire SI_REG_n_12;
  wire SI_REG_n_123;
  wire SI_REG_n_125;
  wire SI_REG_n_126;
  wire SI_REG_n_127;
  wire SI_REG_n_128;
  wire SI_REG_n_129;
  wire SI_REG_n_13;
  wire SI_REG_n_130;
  wire SI_REG_n_131;
  wire SI_REG_n_132;
  wire SI_REG_n_133;
  wire SI_REG_n_134;
  wire SI_REG_n_135;
  wire SI_REG_n_136;
  wire SI_REG_n_137;
  wire SI_REG_n_138;
  wire SI_REG_n_139;
  wire SI_REG_n_140;
  wire SI_REG_n_141;
  wire SI_REG_n_142;
  wire SI_REG_n_144;
  wire SI_REG_n_145;
  wire SI_REG_n_146;
  wire SI_REG_n_147;
  wire SI_REG_n_148;
  wire SI_REG_n_149;
  wire SI_REG_n_150;
  wire SI_REG_n_151;
  wire SI_REG_n_152;
  wire SI_REG_n_153;
  wire SI_REG_n_154;
  wire SI_REG_n_155;
  wire SI_REG_n_156;
  wire SI_REG_n_157;
  wire SI_REG_n_158;
  wire SI_REG_n_159;
  wire SI_REG_n_160;
  wire SI_REG_n_161;
  wire SI_REG_n_162;
  wire SI_REG_n_163;
  wire SI_REG_n_164;
  wire SI_REG_n_165;
  wire SI_REG_n_166;
  wire SI_REG_n_167;
  wire SI_REG_n_168;
  wire SI_REG_n_169;
  wire SI_REG_n_170;
  wire SI_REG_n_171;
  wire SI_REG_n_172;
  wire SI_REG_n_173;
  wire SI_REG_n_174;
  wire SI_REG_n_175;
  wire SI_REG_n_176;
  wire SI_REG_n_177;
  wire SI_REG_n_19;
  wire SI_REG_n_65;
  wire SI_REG_n_66;
  wire SI_REG_n_68;
  wire SI_REG_n_69;
  wire SI_REG_n_7;
  wire SI_REG_n_70;
  wire SI_REG_n_71;
  wire SI_REG_n_77;
  wire SI_REG_n_8;
  wire [2:0]UNCONN_OUT;
  wire [35:0]UNCONN_OUT_0;
  wire \WR.aw_channel_0_n_12 ;
  wire \WR.aw_channel_0_n_13 ;
  wire \WR.aw_channel_0_n_14 ;
  wire \WR.aw_channel_0_n_15 ;
  wire \WR.aw_channel_0_n_16 ;
  wire \WR.aw_channel_0_n_17 ;
  wire \WR.aw_channel_0_n_18 ;
  wire \WR.aw_channel_0_n_19 ;
  wire \WR.aw_channel_0_n_25 ;
  wire \WR.aw_channel_0_n_26 ;
  wire \WR.aw_channel_0_n_27 ;
  wire \WR.b_channel_0_n_1 ;
  wire \WR.b_channel_0_n_2 ;
  wire \WR.b_channel_0_n_3 ;
  wire aclk;
  wire \ar.ar_pipe/m_valid_i0 ;
  wire \ar.ar_pipe/p_1_in ;
  wire \ar.ar_pipe/s_ready_i0 ;
  wire [1:0]\ar_cmd_fsm_0/state ;
  wire areset_d1;
  wire aresetn;
  wire \aw.aw_pipe/p_1_in ;
  wire [1:0]\aw_cmd_fsm_0/state ;
  wire [0:0]axaddr_wrap;
  wire b_awid;
  wire [7:0]b_awlen;
  wire b_push;
  wire \cmd_translator_0/incr_cmd_0/sel_first ;
  wire \cmd_translator_0/incr_cmd_0/sel_first_2 ;
  wire [2:2]\cmd_translator_0/wrap_cmd_0/axaddr_offset ;
  wire [2:2]\cmd_translator_0/wrap_cmd_0/axaddr_offset_0 ;
  wire [2:2]\cmd_translator_0/wrap_cmd_0/axaddr_offset_r ;
  wire [2:2]\cmd_translator_0/wrap_cmd_0/axaddr_offset_r_1 ;
  wire [33:0]in;
  wire [11:0]m_axi_araddr;
  wire [30:0]\m_axi_arprot[2] ;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire [11:0]m_axi_awaddr;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire r_rlast;
  wire s_arid;
  wire s_arid_r;
  wire s_awid;
  wire [39:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire [2:0]s_axi_arprot;
  wire s_axi_arready;
  wire [1:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [39:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire [2:0]s_axi_awprot;
  wire s_axi_awready;
  wire [1:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [11:0]si_rs_araddr;
  wire [1:1]si_rs_arburst;
  wire [3:0]si_rs_arlen;
  wire [1:0]si_rs_arsize;
  wire si_rs_arvalid;
  wire [11:0]si_rs_awaddr;
  wire [1:1]si_rs_awburst;
  wire [3:0]si_rs_awlen;
  wire [1:0]si_rs_awsize;
  wire si_rs_awvalid;
  wire si_rs_bid;
  wire si_rs_bready;
  wire [1:0]si_rs_bresp;
  wire si_rs_bvalid;
  wire [31:0]si_rs_rdata;
  wire si_rs_rid;
  wire si_rs_rlast;
  wire [1:0]si_rs_rresp;

  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_ar_channel \RD.ar_channel_0 
       (.D({SI_REG_n_169,SI_REG_n_170,SI_REG_n_171,SI_REG_n_172,SI_REG_n_173,SI_REG_n_174,SI_REG_n_175}),
        .E(\ar.ar_pipe/p_1_in ),
        .Q({s_arid,SI_REG_n_68,SI_REG_n_69,SI_REG_n_70,SI_REG_n_71,si_rs_arlen,si_rs_arburst,SI_REG_n_77,si_rs_arsize,si_rs_araddr}),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .\axaddr_incr_reg[10] ({\RD.ar_channel_0_n_16 ,\RD.ar_channel_0_n_17 ,\RD.ar_channel_0_n_18 ,\RD.ar_channel_0_n_19 ,\RD.ar_channel_0_n_20 }),
        .\axaddr_incr_reg[10]_0 (\RD.ar_channel_0_n_21 ),
        .\axaddr_incr_reg[11] (\RD.ar_channel_0_n_15 ),
        .\axaddr_incr_reg[3] (\RD.ar_channel_0_n_22 ),
        .\axaddr_incr_reg[5] (\RD.ar_channel_0_n_23 ),
        .\axaddr_offset_r_reg[2] (\cmd_translator_0/wrap_cmd_0/axaddr_offset_r ),
        .\axaddr_wrap_reg[0] (\RD.ar_channel_0_n_9 ),
        .\axlen_cnt_reg[0] (\RD.ar_channel_0_n_4 ),
        .\cnt_read_reg[2] (\RD.r_channel_0_n_0 ),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arready(m_axi_arready),
        .m_axi_arvalid(m_axi_arvalid),
        .\m_payload_i_reg[0] (\RD.ar_channel_0_n_3 ),
        .\m_payload_i_reg[0]_0 (SI_REG_n_144),
        .\m_payload_i_reg[0]_1 (SI_REG_n_157),
        .\m_payload_i_reg[11] ({SI_REG_n_145,SI_REG_n_146,SI_REG_n_147,SI_REG_n_148,SI_REG_n_149,SI_REG_n_150}),
        .\m_payload_i_reg[3] (SI_REG_n_153),
        .\m_payload_i_reg[44] (SI_REG_n_141),
        .\m_payload_i_reg[44]_0 (SI_REG_n_66),
        .\m_payload_i_reg[44]_1 (SI_REG_n_177),
        .\m_payload_i_reg[44]_2 (SI_REG_n_151),
        .\m_payload_i_reg[4] (SI_REG_n_161),
        .\m_payload_i_reg[54] (\cmd_translator_0/wrap_cmd_0/axaddr_offset ),
        .\m_payload_i_reg[55] (SI_REG_n_140),
        .\m_payload_i_reg[55]_0 (SI_REG_n_142),
        .\m_payload_i_reg[57] (SI_REG_n_158),
        .\m_payload_i_reg[5] (SI_REG_n_156),
        .\m_payload_i_reg[6] (SI_REG_n_155),
        .\m_payload_i_reg[7] (SI_REG_n_154),
        .\m_payload_i_reg[8] (SI_REG_n_152),
        .m_valid_i0(\ar.ar_pipe/m_valid_i0 ),
        .r_push_r_reg(\RD.ar_channel_0_n_2 ),
        .r_rlast(r_rlast),
        .s_arid_r(s_arid_r),
        .s_axi_arvalid(s_axi_arvalid),
        .s_ready_i0(\ar.ar_pipe/s_ready_i0 ),
        .s_ready_i_reg(s_axi_arready),
        .sel_first(\cmd_translator_0/incr_cmd_0/sel_first ),
        .si_rs_arvalid(si_rs_arvalid),
        .\state_reg[0]_rep (\ar_cmd_fsm_0/state ),
        .\wrap_boundary_axaddr_r_reg[11] (\RD.ar_channel_0_n_7 ));
  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_r_channel \RD.r_channel_0 
       (.aclk(aclk),
        .areset_d1(areset_d1),
        .in(in),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .m_valid_i_reg(\RD.r_channel_0_n_2 ),
        .out({si_rs_rresp,si_rs_rdata}),
        .r_rlast(r_rlast),
        .s_arid_r(s_arid_r),
        .s_ready_i_reg(SI_REG_n_159),
        .\skid_buffer_reg[35] ({si_rs_rid,si_rs_rlast}),
        .\state_reg[1]_rep (\RD.r_channel_0_n_0 ),
        .\state_reg[1]_rep_0 (\RD.ar_channel_0_n_2 ));
  streaming_auto_pc_0_axi_register_slice_v2_1_17_axi_register_slice SI_REG
       (.D({SI_REG_n_127,SI_REG_n_128,SI_REG_n_129,SI_REG_n_130,SI_REG_n_131}),
        .E(\aw.aw_pipe/p_1_in ),
        .Q({s_awid,SI_REG_n_10,SI_REG_n_11,SI_REG_n_12,SI_REG_n_13,si_rs_awlen,si_rs_awburst,SI_REG_n_19,si_rs_awsize,Q,si_rs_awaddr}),
        .UNCONN_OUT(UNCONN_OUT),
        .UNCONN_OUT_0(UNCONN_OUT_0),
        .aclk(aclk),
        .aresetn(aresetn),
        .\aresetn_d_reg[1] (SI_REG_n_7),
        .\axaddr_incr_reg[10] (SI_REG_n_134),
        .\axaddr_incr_reg[10]_0 ({\RD.ar_channel_0_n_16 ,\RD.ar_channel_0_n_17 ,\RD.ar_channel_0_n_18 ,\RD.ar_channel_0_n_19 ,\RD.ar_channel_0_n_20 }),
        .\axaddr_incr_reg[11] (SI_REG_n_135),
        .\axaddr_incr_reg[11]_0 ({SI_REG_n_145,SI_REG_n_146,SI_REG_n_147,SI_REG_n_148,SI_REG_n_149,SI_REG_n_150}),
        .\axaddr_incr_reg[11]_1 (SI_REG_n_152),
        .\axaddr_incr_reg[11]_2 (\RD.ar_channel_0_n_15 ),
        .\axaddr_incr_reg[2] (SI_REG_n_137),
        .\axaddr_incr_reg[2]_0 (SI_REG_n_157),
        .\axaddr_incr_reg[2]_1 (\RD.ar_channel_0_n_22 ),
        .\axaddr_incr_reg[3] (SI_REG_n_132),
        .\axaddr_incr_reg[3]_0 (SI_REG_n_151),
        .\axaddr_incr_reg[4] (SI_REG_n_136),
        .\axaddr_incr_reg[4]_0 (\RD.ar_channel_0_n_23 ),
        .\axaddr_incr_reg[5] (SI_REG_n_153),
        .\axaddr_incr_reg[5]_0 (\WR.aw_channel_0_n_27 ),
        .\axaddr_incr_reg[6] (SI_REG_n_8),
        .\axaddr_incr_reg[6]_0 (SI_REG_n_156),
        .\axaddr_incr_reg[6]_1 (\WR.aw_channel_0_n_26 ),
        .\axaddr_incr_reg[7] (SI_REG_n_155),
        .\axaddr_incr_reg[7]_0 (\WR.aw_channel_0_n_25 ),
        .\axaddr_incr_reg[8] (SI_REG_n_154),
        .\axaddr_incr_reg[8]_0 ({\WR.aw_channel_0_n_15 ,\WR.aw_channel_0_n_16 ,\WR.aw_channel_0_n_17 ,\WR.aw_channel_0_n_18 ,\WR.aw_channel_0_n_19 }),
        .\axaddr_incr_reg[9] (SI_REG_n_133),
        .\axaddr_incr_reg[9]_0 (\RD.ar_channel_0_n_21 ),
        .axaddr_offset(\cmd_translator_0/wrap_cmd_0/axaddr_offset_0 ),
        .\axaddr_offset_r_reg[0] (SI_REG_n_123),
        .\axaddr_offset_r_reg[0]_0 (SI_REG_n_144),
        .\axaddr_offset_r_reg[1] (SI_REG_n_160),
        .\axaddr_offset_r_reg[1]_0 (SI_REG_n_161),
        .\axaddr_offset_r_reg[2] (\cmd_translator_0/wrap_cmd_0/axaddr_offset ),
        .\axaddr_offset_r_reg[2]_0 (\cmd_translator_0/wrap_cmd_0/axaddr_offset_r_1 ),
        .\axaddr_offset_r_reg[2]_1 (\cmd_translator_0/wrap_cmd_0/axaddr_offset_r ),
        .\axaddr_offset_r_reg[3] (SI_REG_n_125),
        .\axaddr_wrap_reg[0] (SI_REG_n_176),
        .\axaddr_wrap_reg[0]_0 (SI_REG_n_177),
        .\axaddr_wrap_reg[0]_1 (axaddr_wrap),
        .\axaddr_wrap_reg[0]_2 (\RD.ar_channel_0_n_9 ),
        .\axaddr_wrap_reg[1] (SI_REG_n_65),
        .\axaddr_wrap_reg[1]_0 (SI_REG_n_66),
        .\axlen_cnt_reg[3] (SI_REG_n_126),
        .\axlen_cnt_reg[3]_0 (SI_REG_n_142),
        .b_push(b_push),
        .\cnt_read_reg[0]_rep (\WR.aw_channel_0_n_12 ),
        .\cnt_read_reg[3] (SI_REG_n_159),
        .\cnt_read_reg[4] (\RD.r_channel_0_n_2 ),
        .\cnt_read_reg[4]_0 ({si_rs_rresp,si_rs_rdata}),
        .m_valid_i0(\ar.ar_pipe/m_valid_i0 ),
        .m_valid_i_reg(\ar.ar_pipe/p_1_in ),
        .next_pending_r_reg(SI_REG_n_138),
        .next_pending_r_reg_0(SI_REG_n_139),
        .next_pending_r_reg_1(SI_REG_n_140),
        .next_pending_r_reg_2(SI_REG_n_158),
        .out(si_rs_bid),
        .r_push_r_reg({si_rs_rid,si_rs_rlast}),
        .\s_arid_r_reg[0] ({s_arid,SI_REG_n_68,SI_REG_n_69,SI_REG_n_70,SI_REG_n_71,si_rs_arlen,si_rs_arburst,SI_REG_n_77,si_rs_arsize,\m_axi_arprot[2] ,si_rs_araddr}),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .\s_bresp_acc_reg[1] (si_rs_bresp),
        .s_ready_i0(\ar.ar_pipe/s_ready_i0 ),
        .sel_first(\cmd_translator_0/incr_cmd_0/sel_first_2 ),
        .sel_first_0(\cmd_translator_0/incr_cmd_0/sel_first ),
        .si_rs_arvalid(si_rs_arvalid),
        .si_rs_awvalid(si_rs_awvalid),
        .si_rs_bready(si_rs_bready),
        .si_rs_bvalid(si_rs_bvalid),
        .\state_reg[0]_rep (\WR.aw_channel_0_n_14 ),
        .\state_reg[0]_rep_0 (\RD.ar_channel_0_n_7 ),
        .\state_reg[0]_rep_1 (\RD.ar_channel_0_n_4 ),
        .\state_reg[1] (\aw_cmd_fsm_0/state ),
        .\state_reg[1]_0 (\ar_cmd_fsm_0/state ),
        .\state_reg[1]_rep (\WR.aw_channel_0_n_13 ),
        .\state_reg[1]_rep_0 (\RD.ar_channel_0_n_3 ),
        .\state_reg[1]_rep_1 (\RD.ar_channel_0_n_2 ),
        .\wrap_boundary_axaddr_r_reg[6] ({SI_REG_n_162,SI_REG_n_163,SI_REG_n_164,SI_REG_n_165,SI_REG_n_166,SI_REG_n_167,SI_REG_n_168}),
        .\wrap_boundary_axaddr_r_reg[6]_0 ({SI_REG_n_169,SI_REG_n_170,SI_REG_n_171,SI_REG_n_172,SI_REG_n_173,SI_REG_n_174,SI_REG_n_175}),
        .\wrap_second_len_r_reg[3] (SI_REG_n_141));
  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_aw_channel \WR.aw_channel_0 
       (.D({SI_REG_n_162,SI_REG_n_163,SI_REG_n_164,SI_REG_n_165,SI_REG_n_166,SI_REG_n_167,SI_REG_n_168}),
        .E(\aw.aw_pipe/p_1_in ),
        .Q({s_awid,SI_REG_n_10,SI_REG_n_11,SI_REG_n_12,SI_REG_n_13,si_rs_awlen,si_rs_awburst,SI_REG_n_19,si_rs_awsize,si_rs_awaddr}),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .\axaddr_incr_reg[6] (\WR.aw_channel_0_n_27 ),
        .\axaddr_incr_reg[7] (\WR.aw_channel_0_n_26 ),
        .\axaddr_incr_reg[8] ({\WR.aw_channel_0_n_15 ,\WR.aw_channel_0_n_16 ,\WR.aw_channel_0_n_17 ,\WR.aw_channel_0_n_18 ,\WR.aw_channel_0_n_19 }),
        .\axaddr_incr_reg[8]_0 (\WR.aw_channel_0_n_25 ),
        .\axaddr_offset_r_reg[2] (\cmd_translator_0/wrap_cmd_0/axaddr_offset_r_1 ),
        .\axaddr_wrap_reg[0] (axaddr_wrap),
        .\axaddr_wrap_reg[11] (\WR.aw_channel_0_n_12 ),
        .\axlen_cnt_reg[3] (\aw_cmd_fsm_0/state ),
        .b_push(b_push),
        .\cnt_read_reg[0]_rep (\WR.b_channel_0_n_3 ),
        .\cnt_read_reg[0]_rep_0 (\WR.b_channel_0_n_1 ),
        .\cnt_read_reg[1]_rep__0 (\WR.b_channel_0_n_2 ),
        .in({b_awid,b_awlen}),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .\m_payload_i_reg[0] (SI_REG_n_123),
        .\m_payload_i_reg[10] (SI_REG_n_134),
        .\m_payload_i_reg[11] (SI_REG_n_135),
        .\m_payload_i_reg[1] (SI_REG_n_137),
        .\m_payload_i_reg[2] (SI_REG_n_132),
        .\m_payload_i_reg[3] (SI_REG_n_8),
        .\m_payload_i_reg[43] (SI_REG_n_136),
        .\m_payload_i_reg[44] (SI_REG_n_125),
        .\m_payload_i_reg[44]_0 (SI_REG_n_65),
        .\m_payload_i_reg[44]_1 (SI_REG_n_176),
        .\m_payload_i_reg[4] (SI_REG_n_160),
        .\m_payload_i_reg[54] (SI_REG_n_139),
        .\m_payload_i_reg[54]_0 (\cmd_translator_0/wrap_cmd_0/axaddr_offset_0 ),
        .\m_payload_i_reg[55] (SI_REG_n_126),
        .\m_payload_i_reg[57] (SI_REG_n_138),
        .\m_payload_i_reg[8] ({SI_REG_n_127,SI_REG_n_128,SI_REG_n_129,SI_REG_n_130,SI_REG_n_131}),
        .\m_payload_i_reg[9] (SI_REG_n_133),
        .sel_first(\cmd_translator_0/incr_cmd_0/sel_first_2 ),
        .si_rs_awvalid(si_rs_awvalid),
        .\state_reg[1]_rep (\WR.aw_channel_0_n_13 ),
        .\state_reg[1]_rep_0 (\WR.aw_channel_0_n_14 ));
  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_b_channel \WR.b_channel_0 
       (.aclk(aclk),
        .areset_d1(areset_d1),
        .b_push(b_push),
        .\cnt_read_reg[0]_rep (\WR.b_channel_0_n_1 ),
        .\cnt_read_reg[1]_rep__0 (\WR.b_channel_0_n_2 ),
        .in({b_awid,b_awlen}),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .out(si_rs_bid),
        .si_rs_bready(si_rs_bready),
        .si_rs_bvalid(si_rs_bvalid),
        .\skid_buffer_reg[1] (si_rs_bresp),
        .\state_reg[0]_rep (\WR.b_channel_0_n_3 ));
  FDRE #(
    .INIT(1'b0)) 
    areset_d1_reg
       (.C(aclk),
        .CE(1'b1),
        .D(SI_REG_n_7),
        .Q(areset_d1),
        .R(1'b0));
endmodule

module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_ar_channel
   (s_arid_r,
    sel_first,
    r_push_r_reg,
    \m_payload_i_reg[0] ,
    \axlen_cnt_reg[0] ,
    \state_reg[0]_rep ,
    \wrap_boundary_axaddr_r_reg[11] ,
    \axaddr_offset_r_reg[2] ,
    \axaddr_wrap_reg[0] ,
    m_axi_arvalid,
    m_valid_i0,
    s_ready_i0,
    E,
    r_rlast,
    \axaddr_incr_reg[11] ,
    \axaddr_incr_reg[10] ,
    \axaddr_incr_reg[10]_0 ,
    \axaddr_incr_reg[3] ,
    \axaddr_incr_reg[5] ,
    m_axi_araddr,
    aclk,
    Q,
    m_axi_arready,
    si_rs_arvalid,
    \cnt_read_reg[2] ,
    \m_payload_i_reg[0]_0 ,
    \m_payload_i_reg[54] ,
    \m_payload_i_reg[55] ,
    \m_payload_i_reg[57] ,
    areset_d1,
    \m_payload_i_reg[44] ,
    \m_payload_i_reg[55]_0 ,
    \m_payload_i_reg[4] ,
    \m_payload_i_reg[5] ,
    \m_payload_i_reg[6] ,
    \m_payload_i_reg[7] ,
    \m_payload_i_reg[8] ,
    \m_payload_i_reg[3] ,
    \m_payload_i_reg[0]_1 ,
    \m_payload_i_reg[44]_0 ,
    \m_payload_i_reg[44]_1 ,
    s_axi_arvalid,
    s_ready_i_reg,
    \m_payload_i_reg[44]_2 ,
    D,
    \m_payload_i_reg[11] );
  output s_arid_r;
  output sel_first;
  output r_push_r_reg;
  output \m_payload_i_reg[0] ;
  output \axlen_cnt_reg[0] ;
  output [1:0]\state_reg[0]_rep ;
  output \wrap_boundary_axaddr_r_reg[11] ;
  output [0:0]\axaddr_offset_r_reg[2] ;
  output [0:0]\axaddr_wrap_reg[0] ;
  output m_axi_arvalid;
  output m_valid_i0;
  output s_ready_i0;
  output [0:0]E;
  output r_rlast;
  output \axaddr_incr_reg[11] ;
  output [4:0]\axaddr_incr_reg[10] ;
  output \axaddr_incr_reg[10]_0 ;
  output \axaddr_incr_reg[3] ;
  output \axaddr_incr_reg[5] ;
  output [11:0]m_axi_araddr;
  input aclk;
  input [24:0]Q;
  input m_axi_arready;
  input si_rs_arvalid;
  input \cnt_read_reg[2] ;
  input \m_payload_i_reg[0]_0 ;
  input [0:0]\m_payload_i_reg[54] ;
  input \m_payload_i_reg[55] ;
  input \m_payload_i_reg[57] ;
  input areset_d1;
  input \m_payload_i_reg[44] ;
  input \m_payload_i_reg[55]_0 ;
  input \m_payload_i_reg[4] ;
  input \m_payload_i_reg[5] ;
  input \m_payload_i_reg[6] ;
  input \m_payload_i_reg[7] ;
  input \m_payload_i_reg[8] ;
  input \m_payload_i_reg[3] ;
  input \m_payload_i_reg[0]_1 ;
  input \m_payload_i_reg[44]_0 ;
  input \m_payload_i_reg[44]_1 ;
  input s_axi_arvalid;
  input s_ready_i_reg;
  input \m_payload_i_reg[44]_2 ;
  input [6:0]D;
  input [5:0]\m_payload_i_reg[11] ;

  wire [6:0]D;
  wire [0:0]E;
  wire [24:0]Q;
  wire aclk;
  wire ar_cmd_fsm_0_n_16;
  wire ar_cmd_fsm_0_n_17;
  wire ar_cmd_fsm_0_n_18;
  wire ar_cmd_fsm_0_n_21;
  wire ar_cmd_fsm_0_n_22;
  wire ar_cmd_fsm_0_n_23;
  wire ar_cmd_fsm_0_n_24;
  wire ar_cmd_fsm_0_n_25;
  wire ar_cmd_fsm_0_n_26;
  wire ar_cmd_fsm_0_n_5;
  wire ar_cmd_fsm_0_n_6;
  wire ar_cmd_fsm_0_n_7;
  wire ar_cmd_fsm_0_n_8;
  wire areset_d1;
  wire [4:0]\axaddr_incr_reg[10] ;
  wire \axaddr_incr_reg[10]_0 ;
  wire \axaddr_incr_reg[11] ;
  wire \axaddr_incr_reg[3] ;
  wire \axaddr_incr_reg[5] ;
  wire [0:0]\axaddr_offset_r_reg[2] ;
  wire [0:0]\axaddr_wrap_reg[0] ;
  wire \axlen_cnt_reg[0] ;
  wire cmd_translator_0_n_0;
  wire cmd_translator_0_n_11;
  wire cmd_translator_0_n_12;
  wire cmd_translator_0_n_2;
  wire cmd_translator_0_n_3;
  wire cmd_translator_0_n_4;
  wire cmd_translator_0_n_5;
  wire cmd_translator_0_n_6;
  wire cmd_translator_0_n_7;
  wire cmd_translator_0_n_8;
  wire \cnt_read_reg[2] ;
  wire [11:0]m_axi_araddr;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire \m_payload_i_reg[0] ;
  wire \m_payload_i_reg[0]_0 ;
  wire \m_payload_i_reg[0]_1 ;
  wire [5:0]\m_payload_i_reg[11] ;
  wire \m_payload_i_reg[3] ;
  wire \m_payload_i_reg[44] ;
  wire \m_payload_i_reg[44]_0 ;
  wire \m_payload_i_reg[44]_1 ;
  wire \m_payload_i_reg[44]_2 ;
  wire \m_payload_i_reg[4] ;
  wire [0:0]\m_payload_i_reg[54] ;
  wire \m_payload_i_reg[55] ;
  wire \m_payload_i_reg[55]_0 ;
  wire \m_payload_i_reg[57] ;
  wire \m_payload_i_reg[5] ;
  wire \m_payload_i_reg[6] ;
  wire \m_payload_i_reg[7] ;
  wire \m_payload_i_reg[8] ;
  wire m_valid_i0;
  wire r_push_r_reg;
  wire r_rlast;
  wire s_arid_r;
  wire s_axi_arvalid;
  wire s_ready_i0;
  wire s_ready_i_reg;
  wire sel_first;
  wire sel_first_i;
  wire si_rs_arvalid;
  wire [1:0]\state_reg[0]_rep ;
  wire \wrap_boundary_axaddr_r_reg[11] ;
  wire [3:0]\wrap_cmd_0/axaddr_offset ;
  wire [3:0]\wrap_cmd_0/axaddr_offset_r ;
  wire [3:0]\wrap_cmd_0/wrap_second_len ;
  wire [3:0]\wrap_cmd_0/wrap_second_len_r ;

  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_rd_cmd_fsm ar_cmd_fsm_0
       (.D({ar_cmd_fsm_0_n_5,ar_cmd_fsm_0_n_6,ar_cmd_fsm_0_n_7,ar_cmd_fsm_0_n_8}),
        .E(ar_cmd_fsm_0_n_16),
        .Q(\state_reg[0]_rep ),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .\axaddr_incr_reg[0] (ar_cmd_fsm_0_n_26),
        .axaddr_offset({\wrap_cmd_0/axaddr_offset [3],\wrap_cmd_0/axaddr_offset [1:0]}),
        .\axaddr_offset_r_reg[3] ({\wrap_cmd_0/axaddr_offset_r [3],\wrap_cmd_0/axaddr_offset_r [1:0]}),
        .\axlen_cnt_reg[0] (\axlen_cnt_reg[0] ),
        .\axlen_cnt_reg[1] (ar_cmd_fsm_0_n_25),
        .\axlen_cnt_reg[3] (cmd_translator_0_n_8),
        .\axlen_cnt_reg[4] (cmd_translator_0_n_12),
        .\axlen_cnt_reg[6] ({ar_cmd_fsm_0_n_21,ar_cmd_fsm_0_n_22,ar_cmd_fsm_0_n_23,ar_cmd_fsm_0_n_24}),
        .\axlen_cnt_reg[6]_0 ({cmd_translator_0_n_3,cmd_translator_0_n_4,cmd_translator_0_n_5,cmd_translator_0_n_6}),
        .\axlen_cnt_reg[7] (cmd_translator_0_n_7),
        .\cnt_read_reg[2] (\cnt_read_reg[2] ),
        .m_axi_arready(m_axi_arready),
        .m_axi_arvalid(m_axi_arvalid),
        .\m_payload_i_reg[0] (\m_payload_i_reg[0] ),
        .\m_payload_i_reg[0]_0 (E),
        .\m_payload_i_reg[0]_1 (\m_payload_i_reg[0]_0 ),
        .\m_payload_i_reg[44] (\m_payload_i_reg[44] ),
        .\m_payload_i_reg[4] (\m_payload_i_reg[4] ),
        .\m_payload_i_reg[54] (\m_payload_i_reg[54] ),
        .\m_payload_i_reg[58] ({Q[22:21],Q[17:16]}),
        .m_valid_i0(m_valid_i0),
        .r_push_r_reg(r_push_r_reg),
        .s_axburst_eq1_reg(cmd_translator_0_n_11),
        .s_axi_arvalid(s_axi_arvalid),
        .s_ready_i0(s_ready_i0),
        .s_ready_i_reg(s_ready_i_reg),
        .sel_first_i(sel_first_i),
        .sel_first_reg(ar_cmd_fsm_0_n_17),
        .sel_first_reg_0(ar_cmd_fsm_0_n_18),
        .sel_first_reg_1(cmd_translator_0_n_2),
        .sel_first_reg_2(sel_first),
        .sel_first_reg_3(cmd_translator_0_n_0),
        .si_rs_arvalid(si_rs_arvalid),
        .\wrap_boundary_axaddr_r_reg[11] (\wrap_boundary_axaddr_r_reg[11] ),
        .wrap_second_len(\wrap_cmd_0/wrap_second_len ),
        .\wrap_second_len_r_reg[3] (\wrap_cmd_0/wrap_second_len_r ));
  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_cmd_translator_1 cmd_translator_0
       (.D({ar_cmd_fsm_0_n_21,ar_cmd_fsm_0_n_22,ar_cmd_fsm_0_n_23,ar_cmd_fsm_0_n_24}),
        .E(\wrap_boundary_axaddr_r_reg[11] ),
        .Q({cmd_translator_0_n_3,cmd_translator_0_n_4,cmd_translator_0_n_5,cmd_translator_0_n_6}),
        .aclk(aclk),
        .\axaddr_incr_reg[10] (\axaddr_incr_reg[10] ),
        .\axaddr_incr_reg[10]_0 (\axaddr_incr_reg[10]_0 ),
        .\axaddr_incr_reg[11] (\axaddr_incr_reg[11] ),
        .\axaddr_incr_reg[3] (\axaddr_incr_reg[3] ),
        .\axaddr_incr_reg[5] (\axaddr_incr_reg[5] ),
        .\axaddr_incr_reg[6] (sel_first),
        .\axaddr_offset_r_reg[3] ({\wrap_cmd_0/axaddr_offset_r [3],\axaddr_offset_r_reg[2] ,\wrap_cmd_0/axaddr_offset_r [1:0]}),
        .\axaddr_wrap_reg[0] (\axaddr_wrap_reg[0] ),
        .\axlen_cnt_reg[5] (cmd_translator_0_n_12),
        .\axlen_cnt_reg[7] (cmd_translator_0_n_8),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arready(m_axi_arready),
        .\m_payload_i_reg[0] (\m_payload_i_reg[0]_1 ),
        .\m_payload_i_reg[11] (\m_payload_i_reg[11] ),
        .\m_payload_i_reg[3] (\m_payload_i_reg[3] ),
        .\m_payload_i_reg[44] (\m_payload_i_reg[44]_0 ),
        .\m_payload_i_reg[44]_0 (\m_payload_i_reg[44]_1 ),
        .\m_payload_i_reg[44]_1 (\m_payload_i_reg[44]_2 ),
        .\m_payload_i_reg[55] (\m_payload_i_reg[55] ),
        .\m_payload_i_reg[55]_0 (\m_payload_i_reg[55]_0 ),
        .\m_payload_i_reg[57] (\m_payload_i_reg[57] ),
        .\m_payload_i_reg[59] ({Q[23],Q[20:0]}),
        .\m_payload_i_reg[5] (\m_payload_i_reg[5] ),
        .\m_payload_i_reg[6] (\m_payload_i_reg[6] ),
        .\m_payload_i_reg[6]_0 (D),
        .\m_payload_i_reg[7] (\m_payload_i_reg[7] ),
        .\m_payload_i_reg[8] (\m_payload_i_reg[8] ),
        .m_valid_i_reg(ar_cmd_fsm_0_n_16),
        .next_pending_r_reg(cmd_translator_0_n_7),
        .r_rlast(r_rlast),
        .sel_first_i(sel_first_i),
        .sel_first_reg_0(cmd_translator_0_n_0),
        .sel_first_reg_1(cmd_translator_0_n_2),
        .sel_first_reg_2(ar_cmd_fsm_0_n_18),
        .sel_first_reg_3(ar_cmd_fsm_0_n_17),
        .sel_first_reg_4(ar_cmd_fsm_0_n_26),
        .si_rs_arvalid(si_rs_arvalid),
        .\state_reg[0] ({\wrap_cmd_0/axaddr_offset [3],\m_payload_i_reg[54] ,\wrap_cmd_0/axaddr_offset [1:0]}),
        .\state_reg[0]_rep (cmd_translator_0_n_11),
        .\state_reg[0]_rep_0 (\axlen_cnt_reg[0] ),
        .\state_reg[1] (\state_reg[0]_rep ),
        .\state_reg[1]_rep (r_push_r_reg),
        .\state_reg[1]_rep_0 (ar_cmd_fsm_0_n_25),
        .\wrap_second_len_r_reg[3] (\wrap_cmd_0/wrap_second_len_r ),
        .\wrap_second_len_r_reg[3]_0 (\wrap_cmd_0/wrap_second_len ),
        .\wrap_second_len_r_reg[3]_1 ({ar_cmd_fsm_0_n_5,ar_cmd_fsm_0_n_6,ar_cmd_fsm_0_n_7,ar_cmd_fsm_0_n_8}));
  FDRE \s_arid_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[24]),
        .Q(s_arid_r),
        .R(1'b0));
endmodule

module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_aw_channel
   (in,
    sel_first,
    \axlen_cnt_reg[3] ,
    \axaddr_wrap_reg[11] ,
    \state_reg[1]_rep ,
    \state_reg[1]_rep_0 ,
    \axaddr_incr_reg[8] ,
    \axaddr_offset_r_reg[2] ,
    \axaddr_wrap_reg[0] ,
    E,
    b_push,
    m_axi_awvalid,
    \axaddr_incr_reg[8]_0 ,
    \axaddr_incr_reg[7] ,
    \axaddr_incr_reg[6] ,
    m_axi_awaddr,
    aclk,
    Q,
    si_rs_awvalid,
    \m_payload_i_reg[54] ,
    \m_payload_i_reg[57] ,
    \m_payload_i_reg[55] ,
    \m_payload_i_reg[54]_0 ,
    \m_payload_i_reg[0] ,
    \m_payload_i_reg[44] ,
    \m_payload_i_reg[4] ,
    areset_d1,
    \cnt_read_reg[0]_rep ,
    m_axi_awready,
    \m_payload_i_reg[2] ,
    \m_payload_i_reg[3] ,
    \m_payload_i_reg[9] ,
    \m_payload_i_reg[10] ,
    \m_payload_i_reg[11] ,
    \m_payload_i_reg[43] ,
    \m_payload_i_reg[1] ,
    \m_payload_i_reg[44]_0 ,
    \m_payload_i_reg[44]_1 ,
    \cnt_read_reg[0]_rep_0 ,
    \cnt_read_reg[1]_rep__0 ,
    D,
    \m_payload_i_reg[8] );
  output [8:0]in;
  output sel_first;
  output [1:0]\axlen_cnt_reg[3] ;
  output \axaddr_wrap_reg[11] ;
  output \state_reg[1]_rep ;
  output \state_reg[1]_rep_0 ;
  output [4:0]\axaddr_incr_reg[8] ;
  output [0:0]\axaddr_offset_r_reg[2] ;
  output [0:0]\axaddr_wrap_reg[0] ;
  output [0:0]E;
  output b_push;
  output m_axi_awvalid;
  output \axaddr_incr_reg[8]_0 ;
  output \axaddr_incr_reg[7] ;
  output \axaddr_incr_reg[6] ;
  output [11:0]m_axi_awaddr;
  input aclk;
  input [24:0]Q;
  input si_rs_awvalid;
  input \m_payload_i_reg[54] ;
  input \m_payload_i_reg[57] ;
  input \m_payload_i_reg[55] ;
  input [0:0]\m_payload_i_reg[54]_0 ;
  input \m_payload_i_reg[0] ;
  input \m_payload_i_reg[44] ;
  input \m_payload_i_reg[4] ;
  input areset_d1;
  input \cnt_read_reg[0]_rep ;
  input m_axi_awready;
  input \m_payload_i_reg[2] ;
  input \m_payload_i_reg[3] ;
  input \m_payload_i_reg[9] ;
  input \m_payload_i_reg[10] ;
  input \m_payload_i_reg[11] ;
  input \m_payload_i_reg[43] ;
  input \m_payload_i_reg[1] ;
  input \m_payload_i_reg[44]_0 ;
  input \m_payload_i_reg[44]_1 ;
  input \cnt_read_reg[0]_rep_0 ;
  input \cnt_read_reg[1]_rep__0 ;
  input [6:0]D;
  input [4:0]\m_payload_i_reg[8] ;

  wire [6:0]D;
  wire [0:0]E;
  wire [24:0]Q;
  wire aclk;
  wire areset_d1;
  wire aw_cmd_fsm_0_n_0;
  wire aw_cmd_fsm_0_n_12;
  wire aw_cmd_fsm_0_n_13;
  wire aw_cmd_fsm_0_n_14;
  wire aw_cmd_fsm_0_n_15;
  wire aw_cmd_fsm_0_n_16;
  wire aw_cmd_fsm_0_n_28;
  wire aw_cmd_fsm_0_n_29;
  wire aw_cmd_fsm_0_n_30;
  wire aw_cmd_fsm_0_n_4;
  wire aw_cmd_fsm_0_n_5;
  wire aw_cmd_fsm_0_n_8;
  wire \axaddr_incr_reg[6] ;
  wire \axaddr_incr_reg[7] ;
  wire [4:0]\axaddr_incr_reg[8] ;
  wire \axaddr_incr_reg[8]_0 ;
  wire [0:0]\axaddr_offset_r_reg[2] ;
  wire [0:0]\axaddr_wrap_reg[0] ;
  wire \axaddr_wrap_reg[11] ;
  wire [1:0]\axlen_cnt_reg[3] ;
  wire b_push;
  wire cmd_translator_0_n_0;
  wire cmd_translator_0_n_1;
  wire cmd_translator_0_n_10;
  wire cmd_translator_0_n_11;
  wire cmd_translator_0_n_12;
  wire cmd_translator_0_n_13;
  wire cmd_translator_0_n_14;
  wire cmd_translator_0_n_15;
  wire cmd_translator_0_n_16;
  wire cmd_translator_0_n_18;
  wire cmd_translator_0_n_19;
  wire cmd_translator_0_n_2;
  wire cmd_translator_0_n_20;
  wire \cnt_read_reg[0]_rep ;
  wire \cnt_read_reg[0]_rep_0 ;
  wire \cnt_read_reg[1]_rep__0 ;
  wire [8:0]in;
  wire incr_next_pending;
  wire [11:0]m_axi_awaddr;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire \m_payload_i_reg[0] ;
  wire \m_payload_i_reg[10] ;
  wire \m_payload_i_reg[11] ;
  wire \m_payload_i_reg[1] ;
  wire \m_payload_i_reg[2] ;
  wire \m_payload_i_reg[3] ;
  wire \m_payload_i_reg[43] ;
  wire \m_payload_i_reg[44] ;
  wire \m_payload_i_reg[44]_0 ;
  wire \m_payload_i_reg[44]_1 ;
  wire \m_payload_i_reg[4] ;
  wire \m_payload_i_reg[54] ;
  wire [0:0]\m_payload_i_reg[54]_0 ;
  wire \m_payload_i_reg[55] ;
  wire \m_payload_i_reg[57] ;
  wire [4:0]\m_payload_i_reg[8] ;
  wire \m_payload_i_reg[9] ;
  wire sel_first;
  wire sel_first__0;
  wire sel_first_i;
  wire si_rs_awvalid;
  wire \state_reg[1]_rep ;
  wire \state_reg[1]_rep_0 ;
  wire [3:0]\wrap_cmd_0/axaddr_offset ;
  wire [3:0]\wrap_cmd_0/axaddr_offset_r ;
  wire [3:0]\wrap_cmd_0/wrap_second_len ;
  wire [3:0]\wrap_cmd_0/wrap_second_len_r ;
  wire [3:0]wrap_cnt;
  wire wrap_next_pending;

  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_wr_cmd_fsm aw_cmd_fsm_0
       (.D({aw_cmd_fsm_0_n_13,aw_cmd_fsm_0_n_14,aw_cmd_fsm_0_n_15,aw_cmd_fsm_0_n_16}),
        .E(aw_cmd_fsm_0_n_0),
        .Q(\axlen_cnt_reg[3] ),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .axaddr_offset({\wrap_cmd_0/axaddr_offset [3],\wrap_cmd_0/axaddr_offset [1:0]}),
        .\axaddr_offset_r_reg[3] ({\wrap_cmd_0/axaddr_offset_r [3],\wrap_cmd_0/axaddr_offset_r [1:0]}),
        .\axaddr_wrap_reg[11] (\axaddr_wrap_reg[11] ),
        .\axaddr_wrap_reg[11]_0 (aw_cmd_fsm_0_n_30),
        .\axlen_cnt_reg[2] (cmd_translator_0_n_14),
        .\axlen_cnt_reg[4] (cmd_translator_0_n_19),
        .\axlen_cnt_reg[6] ({cmd_translator_0_n_10,cmd_translator_0_n_11,cmd_translator_0_n_12,cmd_translator_0_n_13}),
        .\axlen_cnt_reg[7] (cmd_translator_0_n_15),
        .b_push(b_push),
        .\cnt_read_reg[0]_rep (\cnt_read_reg[0]_rep ),
        .\cnt_read_reg[0]_rep_0 (\cnt_read_reg[0]_rep_0 ),
        .\cnt_read_reg[1]_rep__0 (\cnt_read_reg[1]_rep__0 ),
        .incr_next_pending(incr_next_pending),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .\m_payload_i_reg[0] (E),
        .\m_payload_i_reg[0]_0 (\m_payload_i_reg[0] ),
        .\m_payload_i_reg[44] (\m_payload_i_reg[44] ),
        .\m_payload_i_reg[4] (\m_payload_i_reg[4] ),
        .\m_payload_i_reg[54] (\m_payload_i_reg[54] ),
        .\m_payload_i_reg[54]_0 (\m_payload_i_reg[54]_0 ),
        .\m_payload_i_reg[57] (\m_payload_i_reg[57] ),
        .\m_payload_i_reg[58] ({Q[22:21],Q[17:15],Q[11]}),
        .next_pending_r_reg(aw_cmd_fsm_0_n_4),
        .next_pending_r_reg_0(cmd_translator_0_n_1),
        .next_pending_r_reg_1(cmd_translator_0_n_0),
        .s_axburst_eq0_reg(aw_cmd_fsm_0_n_8),
        .s_axburst_eq1_reg(aw_cmd_fsm_0_n_12),
        .s_axburst_eq1_reg_0(cmd_translator_0_n_18),
        .sel_first__0(sel_first__0),
        .sel_first_i(sel_first_i),
        .sel_first_reg(aw_cmd_fsm_0_n_28),
        .sel_first_reg_0(aw_cmd_fsm_0_n_29),
        .sel_first_reg_1(sel_first),
        .sel_first_reg_2(cmd_translator_0_n_2),
        .si_rs_awvalid(si_rs_awvalid),
        .\state_reg[0]_rep_0 (cmd_translator_0_n_16),
        .\state_reg[1]_rep_0 (\state_reg[1]_rep ),
        .\state_reg[1]_rep_1 (\state_reg[1]_rep_0 ),
        .\wrap_boundary_axaddr_r_reg[11] (aw_cmd_fsm_0_n_5),
        .\wrap_boundary_axaddr_r_reg[11]_0 (cmd_translator_0_n_20),
        .\wrap_cnt_r_reg[3] (wrap_cnt),
        .wrap_next_pending(wrap_next_pending),
        .\wrap_second_len_r_reg[3] (\wrap_cmd_0/wrap_second_len ),
        .\wrap_second_len_r_reg[3]_0 (\wrap_cmd_0/wrap_second_len_r ));
  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_cmd_translator cmd_translator_0
       (.D({aw_cmd_fsm_0_n_13,aw_cmd_fsm_0_n_14,aw_cmd_fsm_0_n_15,aw_cmd_fsm_0_n_16}),
        .E(aw_cmd_fsm_0_n_0),
        .Q(\axaddr_incr_reg[8] ),
        .aclk(aclk),
        .\axaddr_incr_reg[3] (sel_first),
        .\axaddr_incr_reg[6] (\axaddr_incr_reg[6] ),
        .\axaddr_incr_reg[7] (\axaddr_incr_reg[7] ),
        .\axaddr_incr_reg[8] (\axaddr_incr_reg[8]_0 ),
        .\axaddr_offset_r_reg[3] ({\wrap_cmd_0/axaddr_offset_r [3],\axaddr_offset_r_reg[2] ,\wrap_cmd_0/axaddr_offset_r [1:0]}),
        .\axaddr_wrap_reg[0] (\axaddr_wrap_reg[0] ),
        .\axaddr_wrap_reg[11] (cmd_translator_0_n_20),
        .\axlen_cnt_reg[4] (cmd_translator_0_n_15),
        .\axlen_cnt_reg[5] (cmd_translator_0_n_19),
        .\axlen_cnt_reg[7] ({cmd_translator_0_n_10,cmd_translator_0_n_11,cmd_translator_0_n_12,cmd_translator_0_n_13}),
        .\axlen_cnt_reg[7]_0 (cmd_translator_0_n_14),
        .\cnt_read_reg[0]_rep (\axaddr_wrap_reg[11] ),
        .incr_next_pending(incr_next_pending),
        .m_axi_awaddr(m_axi_awaddr),
        .\m_payload_i_reg[10] (\m_payload_i_reg[10] ),
        .\m_payload_i_reg[11] (\m_payload_i_reg[11] ),
        .\m_payload_i_reg[11]_0 (aw_cmd_fsm_0_n_30),
        .\m_payload_i_reg[1] (\m_payload_i_reg[1] ),
        .\m_payload_i_reg[2] (\m_payload_i_reg[2] ),
        .\m_payload_i_reg[3] (\m_payload_i_reg[3] ),
        .\m_payload_i_reg[43] (\m_payload_i_reg[43] ),
        .\m_payload_i_reg[44] (\m_payload_i_reg[44]_0 ),
        .\m_payload_i_reg[44]_0 (\m_payload_i_reg[44]_1 ),
        .\m_payload_i_reg[47] (aw_cmd_fsm_0_n_8),
        .\m_payload_i_reg[47]_0 (aw_cmd_fsm_0_n_12),
        .\m_payload_i_reg[55] (\m_payload_i_reg[55] ),
        .\m_payload_i_reg[59] ({Q[23],Q[20:0]}),
        .\m_payload_i_reg[6] (D),
        .\m_payload_i_reg[8] (\m_payload_i_reg[8] ),
        .\m_payload_i_reg[9] (\m_payload_i_reg[9] ),
        .next_pending_r_reg(cmd_translator_0_n_0),
        .next_pending_r_reg_0(cmd_translator_0_n_1),
        .next_pending_r_reg_1(cmd_translator_0_n_16),
        .sel_first__0(sel_first__0),
        .sel_first_i(sel_first_i),
        .sel_first_reg_0(cmd_translator_0_n_2),
        .sel_first_reg_1(aw_cmd_fsm_0_n_29),
        .sel_first_reg_2(aw_cmd_fsm_0_n_28),
        .si_rs_awvalid(si_rs_awvalid),
        .\state_reg[0] (aw_cmd_fsm_0_n_4),
        .\state_reg[0]_rep (cmd_translator_0_n_18),
        .\state_reg[0]_rep_0 (\state_reg[1]_rep_0 ),
        .\state_reg[1] ({\wrap_cmd_0/axaddr_offset [3],\m_payload_i_reg[54]_0 ,\wrap_cmd_0/axaddr_offset [1:0]}),
        .\state_reg[1]_rep (aw_cmd_fsm_0_n_5),
        .\state_reg[1]_rep_0 (\state_reg[1]_rep ),
        .wrap_next_pending(wrap_next_pending),
        .\wrap_second_len_r_reg[3] (\wrap_cmd_0/wrap_second_len_r ),
        .\wrap_second_len_r_reg[3]_0 (\wrap_cmd_0/wrap_second_len ),
        .\wrap_second_len_r_reg[3]_1 (wrap_cnt));
  FDRE \s_awid_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[24]),
        .Q(in[8]),
        .R(1'b0));
  FDRE \s_awlen_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[16]),
        .Q(in[0]),
        .R(1'b0));
  FDRE \s_awlen_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[17]),
        .Q(in[1]),
        .R(1'b0));
  FDRE \s_awlen_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[18]),
        .Q(in[2]),
        .R(1'b0));
  FDRE \s_awlen_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[19]),
        .Q(in[3]),
        .R(1'b0));
  FDRE \s_awlen_r_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[20]),
        .Q(in[4]),
        .R(1'b0));
  FDRE \s_awlen_r_reg[5] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[21]),
        .Q(in[5]),
        .R(1'b0));
  FDRE \s_awlen_r_reg[6] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[22]),
        .Q(in[6]),
        .R(1'b0));
  FDRE \s_awlen_r_reg[7] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[23]),
        .Q(in[7]),
        .R(1'b0));
endmodule

module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_b_channel
   (si_rs_bvalid,
    \cnt_read_reg[0]_rep ,
    \cnt_read_reg[1]_rep__0 ,
    \state_reg[0]_rep ,
    m_axi_bready,
    out,
    \skid_buffer_reg[1] ,
    areset_d1,
    aclk,
    b_push,
    si_rs_bready,
    m_axi_bresp,
    m_axi_bvalid,
    in);
  output si_rs_bvalid;
  output \cnt_read_reg[0]_rep ;
  output \cnt_read_reg[1]_rep__0 ;
  output \state_reg[0]_rep ;
  output m_axi_bready;
  output [0:0]out;
  output [1:0]\skid_buffer_reg[1] ;
  input areset_d1;
  input aclk;
  input b_push;
  input si_rs_bready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  input [8:0]in;

  wire aclk;
  wire areset_d1;
  wire b_push;
  wire bid_fifo_0_n_5;
  wire bid_fifo_0_n_6;
  wire \bresp_cnt[7]_i_2_n_0 ;
  wire [7:0]bresp_cnt_reg__0;
  wire bresp_push;
  wire [1:0]cnt_read;
  wire \cnt_read_reg[0]_rep ;
  wire \cnt_read_reg[1]_rep__0 ;
  wire [8:0]in;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire mhandshake;
  wire mhandshake_r;
  wire [0:0]out;
  wire [7:0]p_0_in;
  wire s_bresp_acc;
  wire s_bresp_acc0;
  wire \s_bresp_acc_reg_n_0_[0] ;
  wire \s_bresp_acc_reg_n_0_[1] ;
  wire shandshake;
  wire shandshake_r;
  wire si_rs_bready;
  wire si_rs_bvalid;
  wire [1:0]\skid_buffer_reg[1] ;
  wire \state_reg[0]_rep ;

  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_simple_fifo bid_fifo_0
       (.D(bid_fifo_0_n_5),
        .Q(cnt_read),
        .SR(s_bresp_acc0),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .b_push(b_push),
        .\bresp_cnt_reg[7] (bresp_cnt_reg__0),
        .bresp_push(bresp_push),
        .bvalid_i_reg(bid_fifo_0_n_6),
        .bvalid_i_reg_0(si_rs_bvalid),
        .\cnt_read_reg[0]_rep_0 (\cnt_read_reg[0]_rep ),
        .\cnt_read_reg[1]_rep__0_0 (\cnt_read_reg[1]_rep__0 ),
        .in(in),
        .mhandshake_r(mhandshake_r),
        .out(out),
        .shandshake_r(shandshake_r),
        .si_rs_bready(si_rs_bready),
        .\state_reg[0]_rep (\state_reg[0]_rep ));
  LUT1 #(
    .INIT(2'h1)) 
    \bresp_cnt[0]_i_1 
       (.I0(bresp_cnt_reg__0[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \bresp_cnt[1]_i_1 
       (.I0(bresp_cnt_reg__0[1]),
        .I1(bresp_cnt_reg__0[0]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \bresp_cnt[2]_i_1 
       (.I0(bresp_cnt_reg__0[2]),
        .I1(bresp_cnt_reg__0[0]),
        .I2(bresp_cnt_reg__0[1]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \bresp_cnt[3]_i_1 
       (.I0(bresp_cnt_reg__0[3]),
        .I1(bresp_cnt_reg__0[1]),
        .I2(bresp_cnt_reg__0[0]),
        .I3(bresp_cnt_reg__0[2]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \bresp_cnt[4]_i_1 
       (.I0(bresp_cnt_reg__0[4]),
        .I1(bresp_cnt_reg__0[2]),
        .I2(bresp_cnt_reg__0[0]),
        .I3(bresp_cnt_reg__0[1]),
        .I4(bresp_cnt_reg__0[3]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \bresp_cnt[5]_i_1 
       (.I0(bresp_cnt_reg__0[5]),
        .I1(bresp_cnt_reg__0[3]),
        .I2(bresp_cnt_reg__0[1]),
        .I3(bresp_cnt_reg__0[0]),
        .I4(bresp_cnt_reg__0[2]),
        .I5(bresp_cnt_reg__0[4]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \bresp_cnt[6]_i_1 
       (.I0(bresp_cnt_reg__0[6]),
        .I1(\bresp_cnt[7]_i_2_n_0 ),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \bresp_cnt[7]_i_1 
       (.I0(bresp_cnt_reg__0[7]),
        .I1(\bresp_cnt[7]_i_2_n_0 ),
        .I2(bresp_cnt_reg__0[6]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \bresp_cnt[7]_i_2 
       (.I0(bresp_cnt_reg__0[5]),
        .I1(bresp_cnt_reg__0[3]),
        .I2(bresp_cnt_reg__0[1]),
        .I3(bresp_cnt_reg__0[0]),
        .I4(bresp_cnt_reg__0[2]),
        .I5(bresp_cnt_reg__0[4]),
        .O(\bresp_cnt[7]_i_2_n_0 ));
  FDRE \bresp_cnt_reg[0] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[0]),
        .Q(bresp_cnt_reg__0[0]),
        .R(s_bresp_acc0));
  FDRE \bresp_cnt_reg[1] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[1]),
        .Q(bresp_cnt_reg__0[1]),
        .R(s_bresp_acc0));
  FDRE \bresp_cnt_reg[2] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[2]),
        .Q(bresp_cnt_reg__0[2]),
        .R(s_bresp_acc0));
  FDRE \bresp_cnt_reg[3] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[3]),
        .Q(bresp_cnt_reg__0[3]),
        .R(s_bresp_acc0));
  FDRE \bresp_cnt_reg[4] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[4]),
        .Q(bresp_cnt_reg__0[4]),
        .R(s_bresp_acc0));
  FDRE \bresp_cnt_reg[5] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[5]),
        .Q(bresp_cnt_reg__0[5]),
        .R(s_bresp_acc0));
  FDRE \bresp_cnt_reg[6] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[6]),
        .Q(bresp_cnt_reg__0[6]),
        .R(s_bresp_acc0));
  FDRE \bresp_cnt_reg[7] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[7]),
        .Q(bresp_cnt_reg__0[7]),
        .R(s_bresp_acc0));
  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_simple_fifo__parameterized0 bresp_fifo_0
       (.D(bid_fifo_0_n_5),
        .E(s_bresp_acc),
        .Q(cnt_read),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .mhandshake(mhandshake),
        .mhandshake_r(mhandshake_r),
        .\s_bresp_acc_reg[1] ({\s_bresp_acc_reg_n_0_[1] ,\s_bresp_acc_reg_n_0_[0] }),
        .sel(bresp_push),
        .shandshake_r(shandshake_r),
        .\skid_buffer_reg[1] (\skid_buffer_reg[1] ));
  FDRE #(
    .INIT(1'b0)) 
    bvalid_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(bid_fifo_0_n_6),
        .Q(si_rs_bvalid),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mhandshake_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(mhandshake),
        .Q(mhandshake_r),
        .R(areset_d1));
  FDRE \s_bresp_acc_reg[0] 
       (.C(aclk),
        .CE(s_bresp_acc),
        .D(m_axi_bresp[0]),
        .Q(\s_bresp_acc_reg_n_0_[0] ),
        .R(s_bresp_acc0));
  FDRE \s_bresp_acc_reg[1] 
       (.C(aclk),
        .CE(s_bresp_acc),
        .D(m_axi_bresp[1]),
        .Q(\s_bresp_acc_reg_n_0_[1] ),
        .R(s_bresp_acc0));
  LUT2 #(
    .INIT(4'h8)) 
    shandshake_r_i_1
       (.I0(si_rs_bvalid),
        .I1(si_rs_bready),
        .O(shandshake));
  FDRE #(
    .INIT(1'b0)) 
    shandshake_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(shandshake),
        .Q(shandshake_r),
        .R(areset_d1));
endmodule

module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_cmd_translator
   (next_pending_r_reg,
    next_pending_r_reg_0,
    sel_first_reg_0,
    \axaddr_incr_reg[3] ,
    sel_first__0,
    Q,
    \axlen_cnt_reg[7] ,
    \axlen_cnt_reg[7]_0 ,
    \axlen_cnt_reg[4] ,
    next_pending_r_reg_1,
    \axaddr_wrap_reg[0] ,
    \state_reg[0]_rep ,
    \axlen_cnt_reg[5] ,
    \axaddr_wrap_reg[11] ,
    \axaddr_incr_reg[8] ,
    \axaddr_incr_reg[7] ,
    \axaddr_incr_reg[6] ,
    m_axi_awaddr,
    \axaddr_offset_r_reg[3] ,
    \wrap_second_len_r_reg[3] ,
    incr_next_pending,
    aclk,
    wrap_next_pending,
    sel_first_i,
    \m_payload_i_reg[47] ,
    \m_payload_i_reg[47]_0 ,
    sel_first_reg_1,
    sel_first_reg_2,
    \cnt_read_reg[0]_rep ,
    \m_payload_i_reg[59] ,
    \state_reg[1]_rep ,
    \state_reg[0] ,
    \m_payload_i_reg[55] ,
    \state_reg[0]_rep_0 ,
    si_rs_awvalid,
    \state_reg[1]_rep_0 ,
    \m_payload_i_reg[2] ,
    \m_payload_i_reg[3] ,
    \m_payload_i_reg[9] ,
    \m_payload_i_reg[10] ,
    \m_payload_i_reg[11] ,
    \m_payload_i_reg[43] ,
    \m_payload_i_reg[1] ,
    \m_payload_i_reg[44] ,
    \m_payload_i_reg[44]_0 ,
    E,
    D,
    \state_reg[1] ,
    \wrap_second_len_r_reg[3]_0 ,
    \wrap_second_len_r_reg[3]_1 ,
    \m_payload_i_reg[6] ,
    \m_payload_i_reg[11]_0 ,
    \m_payload_i_reg[8] );
  output next_pending_r_reg;
  output next_pending_r_reg_0;
  output sel_first_reg_0;
  output \axaddr_incr_reg[3] ;
  output sel_first__0;
  output [4:0]Q;
  output [3:0]\axlen_cnt_reg[7] ;
  output \axlen_cnt_reg[7]_0 ;
  output \axlen_cnt_reg[4] ;
  output next_pending_r_reg_1;
  output [0:0]\axaddr_wrap_reg[0] ;
  output \state_reg[0]_rep ;
  output \axlen_cnt_reg[5] ;
  output \axaddr_wrap_reg[11] ;
  output \axaddr_incr_reg[8] ;
  output \axaddr_incr_reg[7] ;
  output \axaddr_incr_reg[6] ;
  output [11:0]m_axi_awaddr;
  output [3:0]\axaddr_offset_r_reg[3] ;
  output [3:0]\wrap_second_len_r_reg[3] ;
  input incr_next_pending;
  input aclk;
  input wrap_next_pending;
  input sel_first_i;
  input \m_payload_i_reg[47] ;
  input \m_payload_i_reg[47]_0 ;
  input sel_first_reg_1;
  input sel_first_reg_2;
  input \cnt_read_reg[0]_rep ;
  input [21:0]\m_payload_i_reg[59] ;
  input \state_reg[1]_rep ;
  input \state_reg[0] ;
  input \m_payload_i_reg[55] ;
  input \state_reg[0]_rep_0 ;
  input si_rs_awvalid;
  input \state_reg[1]_rep_0 ;
  input \m_payload_i_reg[2] ;
  input \m_payload_i_reg[3] ;
  input \m_payload_i_reg[9] ;
  input \m_payload_i_reg[10] ;
  input \m_payload_i_reg[11] ;
  input \m_payload_i_reg[43] ;
  input \m_payload_i_reg[1] ;
  input \m_payload_i_reg[44] ;
  input \m_payload_i_reg[44]_0 ;
  input [0:0]E;
  input [3:0]D;
  input [3:0]\state_reg[1] ;
  input [3:0]\wrap_second_len_r_reg[3]_0 ;
  input [3:0]\wrap_second_len_r_reg[3]_1 ;
  input [6:0]\m_payload_i_reg[6] ;
  input [0:0]\m_payload_i_reg[11]_0 ;
  input [4:0]\m_payload_i_reg[8] ;

  wire [3:0]D;
  wire [0:0]E;
  wire [4:0]Q;
  wire aclk;
  wire \axaddr_incr_reg[3] ;
  wire \axaddr_incr_reg[6] ;
  wire \axaddr_incr_reg[7] ;
  wire \axaddr_incr_reg[8] ;
  wire [3:0]\axaddr_offset_r_reg[3] ;
  wire [0:0]\axaddr_wrap_reg[0] ;
  wire \axaddr_wrap_reg[11] ;
  wire \axlen_cnt_reg[4] ;
  wire \axlen_cnt_reg[5] ;
  wire [3:0]\axlen_cnt_reg[7] ;
  wire \axlen_cnt_reg[7]_0 ;
  wire \cnt_read_reg[0]_rep ;
  wire incr_cmd_0_n_2;
  wire incr_cmd_0_n_22;
  wire incr_cmd_0_n_23;
  wire incr_cmd_0_n_24;
  wire incr_cmd_0_n_25;
  wire incr_cmd_0_n_26;
  wire incr_cmd_0_n_27;
  wire incr_cmd_0_n_3;
  wire incr_cmd_0_n_7;
  wire incr_cmd_0_n_8;
  wire incr_cmd_0_n_9;
  wire incr_next_pending;
  wire [11:0]m_axi_awaddr;
  wire \m_payload_i_reg[10] ;
  wire \m_payload_i_reg[11] ;
  wire [0:0]\m_payload_i_reg[11]_0 ;
  wire \m_payload_i_reg[1] ;
  wire \m_payload_i_reg[2] ;
  wire \m_payload_i_reg[3] ;
  wire \m_payload_i_reg[43] ;
  wire \m_payload_i_reg[44] ;
  wire \m_payload_i_reg[44]_0 ;
  wire \m_payload_i_reg[47] ;
  wire \m_payload_i_reg[47]_0 ;
  wire \m_payload_i_reg[55] ;
  wire [21:0]\m_payload_i_reg[59] ;
  wire [6:0]\m_payload_i_reg[6] ;
  wire [4:0]\m_payload_i_reg[8] ;
  wire \m_payload_i_reg[9] ;
  wire next_pending_r_reg;
  wire next_pending_r_reg_0;
  wire next_pending_r_reg_1;
  wire s_axburst_eq0;
  wire s_axburst_eq1;
  wire sel_first__0;
  wire sel_first_i;
  wire sel_first_reg_0;
  wire sel_first_reg_1;
  wire sel_first_reg_2;
  wire si_rs_awvalid;
  wire \state_reg[0] ;
  wire \state_reg[0]_rep ;
  wire \state_reg[0]_rep_0 ;
  wire [3:0]\state_reg[1] ;
  wire \state_reg[1]_rep ;
  wire \state_reg[1]_rep_0 ;
  wire wrap_next_pending;
  wire [3:0]\wrap_second_len_r_reg[3] ;
  wire [3:0]\wrap_second_len_r_reg[3]_0 ;
  wire [3:0]\wrap_second_len_r_reg[3]_1 ;

  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_incr_cmd incr_cmd_0
       (.D(D),
        .E(E),
        .Q({incr_cmd_0_n_2,incr_cmd_0_n_3,Q[4:2],incr_cmd_0_n_7,incr_cmd_0_n_8,incr_cmd_0_n_9,Q[1:0]}),
        .aclk(aclk),
        .\axaddr_incr_reg[3]_0 (\axaddr_incr_reg[3] ),
        .\axaddr_incr_reg[6]_0 (\axaddr_incr_reg[6] ),
        .\axaddr_incr_reg[7]_0 (\axaddr_incr_reg[7] ),
        .\axaddr_incr_reg[8]_0 (\axaddr_incr_reg[8] ),
        .\axlen_cnt_reg[4]_0 (\axlen_cnt_reg[4] ),
        .\axlen_cnt_reg[5]_0 (\axlen_cnt_reg[5] ),
        .\axlen_cnt_reg[7]_0 (\axlen_cnt_reg[7] ),
        .\axlen_cnt_reg[7]_1 (\axlen_cnt_reg[7]_0 ),
        .\cnt_read_reg[0]_rep (\cnt_read_reg[0]_rep ),
        .incr_next_pending(incr_next_pending),
        .\m_axi_awaddr[0] (incr_cmd_0_n_27),
        .\m_axi_awaddr[10] (incr_cmd_0_n_23),
        .\m_axi_awaddr[11] (incr_cmd_0_n_22),
        .\m_axi_awaddr[1] (incr_cmd_0_n_26),
        .\m_axi_awaddr[4] (incr_cmd_0_n_25),
        .\m_axi_awaddr[7] (incr_cmd_0_n_24),
        .\m_payload_i_reg[10] (\m_payload_i_reg[10] ),
        .\m_payload_i_reg[11] (\m_payload_i_reg[11] ),
        .\m_payload_i_reg[1] (\m_payload_i_reg[1] ),
        .\m_payload_i_reg[2] (\m_payload_i_reg[2] ),
        .\m_payload_i_reg[3] (\m_payload_i_reg[3] ),
        .\m_payload_i_reg[43] (\m_payload_i_reg[43] ),
        .\m_payload_i_reg[55] (\m_payload_i_reg[55] ),
        .\m_payload_i_reg[59] ({\m_payload_i_reg[59] [21:20],\m_payload_i_reg[59] [18],\m_payload_i_reg[59] [14:12],\m_payload_i_reg[59] [10],\m_payload_i_reg[59] [7],\m_payload_i_reg[59] [5:4],\m_payload_i_reg[59] [1:0]}),
        .\m_payload_i_reg[8] (\m_payload_i_reg[8] ),
        .\m_payload_i_reg[9] (\m_payload_i_reg[9] ),
        .next_pending_r_reg_0(next_pending_r_reg),
        .sel_first_reg_0(sel_first_reg_1),
        .\state_reg[0] (\state_reg[0] ),
        .\state_reg[1]_rep (\state_reg[1]_rep ));
  LUT3 #(
    .INIT(8'hB8)) 
    \memory_reg[3][0]_srl4_i_2 
       (.I0(s_axburst_eq1),
        .I1(\m_payload_i_reg[59] [15]),
        .I2(s_axburst_eq0),
        .O(\state_reg[0]_rep ));
  FDRE s_axburst_eq0_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\m_payload_i_reg[47] ),
        .Q(s_axburst_eq0),
        .R(1'b0));
  FDRE s_axburst_eq1_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\m_payload_i_reg[47]_0 ),
        .Q(s_axburst_eq1),
        .R(1'b0));
  FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(sel_first_i),
        .Q(sel_first_reg_0),
        .R(1'b0));
  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_wrap_cmd wrap_cmd_0
       (.E(E),
        .Q(\axaddr_wrap_reg[0] ),
        .aclk(aclk),
        .\axaddr_incr_reg[11] ({incr_cmd_0_n_2,incr_cmd_0_n_3,Q[4],Q[2],incr_cmd_0_n_7,incr_cmd_0_n_8,incr_cmd_0_n_9}),
        .\axaddr_offset_r_reg[3]_0 (\axaddr_offset_r_reg[3] ),
        .\axaddr_wrap_reg[11]_0 (\axaddr_wrap_reg[11] ),
        .\cnt_read_reg[0]_rep (\cnt_read_reg[0]_rep ),
        .m_axi_awaddr(m_axi_awaddr),
        .\m_payload_i_reg[11] (\m_payload_i_reg[11]_0 ),
        .\m_payload_i_reg[44] (\m_payload_i_reg[44] ),
        .\m_payload_i_reg[44]_0 (\m_payload_i_reg[44]_0 ),
        .\m_payload_i_reg[55] ({\m_payload_i_reg[59] [19:15],\m_payload_i_reg[59] [13:0]}),
        .\m_payload_i_reg[6] (\m_payload_i_reg[6] ),
        .next_pending_r_reg_0(next_pending_r_reg_0),
        .next_pending_r_reg_1(next_pending_r_reg_1),
        .sel_first_reg_0(sel_first__0),
        .sel_first_reg_1(sel_first_reg_2),
        .sel_first_reg_2(incr_cmd_0_n_22),
        .sel_first_reg_3(incr_cmd_0_n_23),
        .sel_first_reg_4(incr_cmd_0_n_24),
        .sel_first_reg_5(incr_cmd_0_n_25),
        .sel_first_reg_6(incr_cmd_0_n_26),
        .sel_first_reg_7(incr_cmd_0_n_27),
        .si_rs_awvalid(si_rs_awvalid),
        .\state_reg[0]_rep (\state_reg[0]_rep_0 ),
        .\state_reg[1] (\state_reg[1] ),
        .\state_reg[1]_rep (\state_reg[1]_rep ),
        .\state_reg[1]_rep_0 (\state_reg[1]_rep_0 ),
        .wrap_next_pending(wrap_next_pending),
        .\wrap_second_len_r_reg[3]_0 (\wrap_second_len_r_reg[3] ),
        .\wrap_second_len_r_reg[3]_1 (\wrap_second_len_r_reg[3]_0 ),
        .\wrap_second_len_r_reg[3]_2 (\wrap_second_len_r_reg[3]_1 ));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_17_b2s_cmd_translator" *) 
module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_cmd_translator_1
   (sel_first_reg_0,
    \axaddr_incr_reg[6] ,
    sel_first_reg_1,
    Q,
    next_pending_r_reg,
    \axlen_cnt_reg[7] ,
    \axaddr_wrap_reg[0] ,
    r_rlast,
    \state_reg[0]_rep ,
    \axlen_cnt_reg[5] ,
    \axaddr_incr_reg[11] ,
    \axaddr_incr_reg[10] ,
    \axaddr_incr_reg[10]_0 ,
    \axaddr_incr_reg[3] ,
    \axaddr_incr_reg[5] ,
    m_axi_araddr,
    \axaddr_offset_r_reg[3] ,
    \wrap_second_len_r_reg[3] ,
    aclk,
    sel_first_i,
    sel_first_reg_2,
    sel_first_reg_3,
    \m_payload_i_reg[59] ,
    \m_payload_i_reg[55] ,
    \state_reg[1]_rep ,
    E,
    \m_payload_i_reg[57] ,
    \state_reg[1] ,
    si_rs_arvalid,
    \m_payload_i_reg[55]_0 ,
    \state_reg[1]_rep_0 ,
    \m_payload_i_reg[5] ,
    \m_payload_i_reg[6] ,
    \m_payload_i_reg[7] ,
    \m_payload_i_reg[8] ,
    \m_payload_i_reg[3] ,
    \m_payload_i_reg[0] ,
    \m_payload_i_reg[44] ,
    \m_payload_i_reg[44]_0 ,
    \m_payload_i_reg[44]_1 ,
    \state_reg[0]_rep_0 ,
    m_axi_arready,
    m_valid_i_reg,
    D,
    \state_reg[0] ,
    \wrap_second_len_r_reg[3]_0 ,
    \wrap_second_len_r_reg[3]_1 ,
    \m_payload_i_reg[6]_0 ,
    sel_first_reg_4,
    \m_payload_i_reg[11] );
  output sel_first_reg_0;
  output \axaddr_incr_reg[6] ;
  output sel_first_reg_1;
  output [3:0]Q;
  output next_pending_r_reg;
  output \axlen_cnt_reg[7] ;
  output [0:0]\axaddr_wrap_reg[0] ;
  output r_rlast;
  output \state_reg[0]_rep ;
  output \axlen_cnt_reg[5] ;
  output \axaddr_incr_reg[11] ;
  output [4:0]\axaddr_incr_reg[10] ;
  output \axaddr_incr_reg[10]_0 ;
  output \axaddr_incr_reg[3] ;
  output \axaddr_incr_reg[5] ;
  output [11:0]m_axi_araddr;
  output [3:0]\axaddr_offset_r_reg[3] ;
  output [3:0]\wrap_second_len_r_reg[3] ;
  input aclk;
  input sel_first_i;
  input sel_first_reg_2;
  input sel_first_reg_3;
  input [21:0]\m_payload_i_reg[59] ;
  input \m_payload_i_reg[55] ;
  input \state_reg[1]_rep ;
  input [0:0]E;
  input \m_payload_i_reg[57] ;
  input [1:0]\state_reg[1] ;
  input si_rs_arvalid;
  input \m_payload_i_reg[55]_0 ;
  input \state_reg[1]_rep_0 ;
  input \m_payload_i_reg[5] ;
  input \m_payload_i_reg[6] ;
  input \m_payload_i_reg[7] ;
  input \m_payload_i_reg[8] ;
  input \m_payload_i_reg[3] ;
  input \m_payload_i_reg[0] ;
  input \m_payload_i_reg[44] ;
  input \m_payload_i_reg[44]_0 ;
  input \m_payload_i_reg[44]_1 ;
  input \state_reg[0]_rep_0 ;
  input m_axi_arready;
  input [0:0]m_valid_i_reg;
  input [3:0]D;
  input [3:0]\state_reg[0] ;
  input [3:0]\wrap_second_len_r_reg[3]_0 ;
  input [3:0]\wrap_second_len_r_reg[3]_1 ;
  input [6:0]\m_payload_i_reg[6]_0 ;
  input [0:0]sel_first_reg_4;
  input [5:0]\m_payload_i_reg[11] ;

  wire [3:0]D;
  wire [0:0]E;
  wire [3:0]Q;
  wire aclk;
  wire [4:0]\axaddr_incr_reg[10] ;
  wire \axaddr_incr_reg[10]_0 ;
  wire \axaddr_incr_reg[11] ;
  wire \axaddr_incr_reg[3] ;
  wire \axaddr_incr_reg[5] ;
  wire \axaddr_incr_reg[6] ;
  wire [3:0]\axaddr_offset_r_reg[3] ;
  wire [0:0]\axaddr_wrap_reg[0] ;
  wire \axlen_cnt_reg[5] ;
  wire \axlen_cnt_reg[7] ;
  wire incr_cmd_0_n_10;
  wire incr_cmd_0_n_11;
  wire incr_cmd_0_n_12;
  wire incr_cmd_0_n_13;
  wire incr_cmd_0_n_15;
  wire incr_cmd_0_n_17;
  wire incr_cmd_0_n_25;
  wire incr_cmd_0_n_8;
  wire incr_next_pending;
  wire [11:0]m_axi_araddr;
  wire m_axi_arready;
  wire \m_payload_i_reg[0] ;
  wire [5:0]\m_payload_i_reg[11] ;
  wire \m_payload_i_reg[3] ;
  wire \m_payload_i_reg[44] ;
  wire \m_payload_i_reg[44]_0 ;
  wire \m_payload_i_reg[44]_1 ;
  wire \m_payload_i_reg[55] ;
  wire \m_payload_i_reg[55]_0 ;
  wire \m_payload_i_reg[57] ;
  wire [21:0]\m_payload_i_reg[59] ;
  wire \m_payload_i_reg[5] ;
  wire \m_payload_i_reg[6] ;
  wire [6:0]\m_payload_i_reg[6]_0 ;
  wire \m_payload_i_reg[7] ;
  wire \m_payload_i_reg[8] ;
  wire [0:0]m_valid_i_reg;
  wire next_pending_r_reg;
  wire r_rlast;
  wire s_axburst_eq0;
  wire s_axburst_eq1;
  wire sel_first_i;
  wire sel_first_reg_0;
  wire sel_first_reg_1;
  wire sel_first_reg_2;
  wire sel_first_reg_3;
  wire [0:0]sel_first_reg_4;
  wire si_rs_arvalid;
  wire [3:0]\state_reg[0] ;
  wire \state_reg[0]_rep ;
  wire \state_reg[0]_rep_0 ;
  wire [1:0]\state_reg[1] ;
  wire \state_reg[1]_rep ;
  wire \state_reg[1]_rep_0 ;
  wire wrap_cmd_0_n_1;
  wire wrap_cmd_0_n_2;
  wire [3:0]\wrap_second_len_r_reg[3] ;
  wire [3:0]\wrap_second_len_r_reg[3]_0 ;
  wire [3:0]\wrap_second_len_r_reg[3]_1 ;

  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_incr_cmd_2 incr_cmd_0
       (.D(D),
        .E(E),
        .Q(Q),
        .aclk(aclk),
        .\axaddr_incr_reg[10]_0 (\axaddr_incr_reg[10]_0 ),
        .\axaddr_incr_reg[11]_0 ({incr_cmd_0_n_8,\axaddr_incr_reg[10] [4],incr_cmd_0_n_10,incr_cmd_0_n_11,incr_cmd_0_n_12,incr_cmd_0_n_13,\axaddr_incr_reg[10] [3],incr_cmd_0_n_15,\axaddr_incr_reg[10] [2],incr_cmd_0_n_17,\axaddr_incr_reg[10] [1:0]}),
        .\axaddr_incr_reg[11]_1 (\axaddr_incr_reg[11] ),
        .\axaddr_incr_reg[3]_0 (\axaddr_incr_reg[3] ),
        .\axaddr_incr_reg[5]_0 (\axaddr_incr_reg[5] ),
        .\axaddr_incr_reg[6]_0 (\axaddr_incr_reg[6] ),
        .\axlen_cnt_reg[5]_0 (\axlen_cnt_reg[5] ),
        .\axlen_cnt_reg[7]_0 (\axlen_cnt_reg[7] ),
        .incr_next_pending(incr_next_pending),
        .\m_axi_araddr[11] (incr_cmd_0_n_25),
        .\m_payload_i_reg[0] (\m_payload_i_reg[0] ),
        .\m_payload_i_reg[11] (\m_payload_i_reg[11] ),
        .\m_payload_i_reg[3] (\m_payload_i_reg[3] ),
        .\m_payload_i_reg[44] (\m_payload_i_reg[44]_1 ),
        .\m_payload_i_reg[55] (\m_payload_i_reg[55] ),
        .\m_payload_i_reg[55]_0 (\m_payload_i_reg[55]_0 ),
        .\m_payload_i_reg[57] (\m_payload_i_reg[57] ),
        .\m_payload_i_reg[59] ({\m_payload_i_reg[59] [21:20],\m_payload_i_reg[59] [18],\m_payload_i_reg[59] [14:12],\m_payload_i_reg[59] [9:6],\m_payload_i_reg[59] [4]}),
        .\m_payload_i_reg[5] (\m_payload_i_reg[5] ),
        .\m_payload_i_reg[6] (\m_payload_i_reg[6] ),
        .\m_payload_i_reg[7] (\m_payload_i_reg[7] ),
        .\m_payload_i_reg[8] (\m_payload_i_reg[8] ),
        .m_valid_i_reg(m_valid_i_reg),
        .next_pending_r_reg_0(next_pending_r_reg),
        .sel_first_reg_0(sel_first_reg_2),
        .sel_first_reg_1(sel_first_reg_4),
        .\state_reg[1]_rep (\state_reg[1]_rep ),
        .\state_reg[1]_rep_0 (\state_reg[1]_rep_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    r_rlast_r_i_1
       (.I0(s_axburst_eq0),
        .I1(\m_payload_i_reg[59] [15]),
        .I2(s_axburst_eq1),
        .O(r_rlast));
  FDRE s_axburst_eq0_reg
       (.C(aclk),
        .CE(1'b1),
        .D(wrap_cmd_0_n_1),
        .Q(s_axburst_eq0),
        .R(1'b0));
  FDRE s_axburst_eq1_reg
       (.C(aclk),
        .CE(1'b1),
        .D(wrap_cmd_0_n_2),
        .Q(s_axburst_eq1),
        .R(1'b0));
  FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(sel_first_i),
        .Q(sel_first_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \state[1]_i_3 
       (.I0(s_axburst_eq1),
        .I1(\m_payload_i_reg[59] [15]),
        .I2(s_axburst_eq0),
        .O(\state_reg[0]_rep ));
  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_wrap_cmd_3 wrap_cmd_0
       (.E(E),
        .Q(\axaddr_wrap_reg[0] ),
        .aclk(aclk),
        .\axaddr_incr_reg[11] ({incr_cmd_0_n_8,\axaddr_incr_reg[10] [4],incr_cmd_0_n_10,incr_cmd_0_n_11,incr_cmd_0_n_12,incr_cmd_0_n_13,\axaddr_incr_reg[10] [3],incr_cmd_0_n_15,\axaddr_incr_reg[10] [2],incr_cmd_0_n_17,\axaddr_incr_reg[10] [1:0]}),
        .\axaddr_offset_r_reg[3]_0 (\axaddr_offset_r_reg[3] ),
        .incr_next_pending(incr_next_pending),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arready(m_axi_arready),
        .\m_payload_i_reg[44] (\m_payload_i_reg[44] ),
        .\m_payload_i_reg[44]_0 (\m_payload_i_reg[44]_0 ),
        .\m_payload_i_reg[55] ({\m_payload_i_reg[59] [19:15],\m_payload_i_reg[59] [13:0]}),
        .\m_payload_i_reg[55]_0 (\m_payload_i_reg[55] ),
        .\m_payload_i_reg[6] (\m_payload_i_reg[6]_0 ),
        .m_valid_i_reg(m_valid_i_reg),
        .s_axburst_eq0_reg(wrap_cmd_0_n_1),
        .s_axburst_eq1_reg(wrap_cmd_0_n_2),
        .sel_first_i(sel_first_i),
        .sel_first_reg_0(sel_first_reg_1),
        .sel_first_reg_1(sel_first_reg_3),
        .sel_first_reg_2(incr_cmd_0_n_25),
        .si_rs_arvalid(si_rs_arvalid),
        .\state_reg[0] (\state_reg[0] ),
        .\state_reg[0]_rep (\state_reg[0]_rep_0 ),
        .\state_reg[1] (\state_reg[1] ),
        .\state_reg[1]_rep (\state_reg[1]_rep ),
        .\wrap_second_len_r_reg[3]_0 (\wrap_second_len_r_reg[3] ),
        .\wrap_second_len_r_reg[3]_1 (\wrap_second_len_r_reg[3]_0 ),
        .\wrap_second_len_r_reg[3]_2 (\wrap_second_len_r_reg[3]_1 ));
endmodule

module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_incr_cmd
   (next_pending_r_reg_0,
    \axaddr_incr_reg[3]_0 ,
    Q,
    \axlen_cnt_reg[7]_0 ,
    \axlen_cnt_reg[7]_1 ,
    \axlen_cnt_reg[4]_0 ,
    \axlen_cnt_reg[5]_0 ,
    \axaddr_incr_reg[8]_0 ,
    \axaddr_incr_reg[7]_0 ,
    \axaddr_incr_reg[6]_0 ,
    \m_axi_awaddr[11] ,
    \m_axi_awaddr[10] ,
    \m_axi_awaddr[7] ,
    \m_axi_awaddr[4] ,
    \m_axi_awaddr[1] ,
    \m_axi_awaddr[0] ,
    incr_next_pending,
    aclk,
    sel_first_reg_0,
    \cnt_read_reg[0]_rep ,
    \m_payload_i_reg[59] ,
    \state_reg[1]_rep ,
    \state_reg[0] ,
    \m_payload_i_reg[55] ,
    \m_payload_i_reg[2] ,
    \m_payload_i_reg[3] ,
    \m_payload_i_reg[9] ,
    \m_payload_i_reg[10] ,
    \m_payload_i_reg[11] ,
    \m_payload_i_reg[43] ,
    \m_payload_i_reg[1] ,
    E,
    D,
    \m_payload_i_reg[8] );
  output next_pending_r_reg_0;
  output \axaddr_incr_reg[3]_0 ;
  output [9:0]Q;
  output [3:0]\axlen_cnt_reg[7]_0 ;
  output \axlen_cnt_reg[7]_1 ;
  output \axlen_cnt_reg[4]_0 ;
  output \axlen_cnt_reg[5]_0 ;
  output \axaddr_incr_reg[8]_0 ;
  output \axaddr_incr_reg[7]_0 ;
  output \axaddr_incr_reg[6]_0 ;
  output \m_axi_awaddr[11] ;
  output \m_axi_awaddr[10] ;
  output \m_axi_awaddr[7] ;
  output \m_axi_awaddr[4] ;
  output \m_axi_awaddr[1] ;
  output \m_axi_awaddr[0] ;
  input incr_next_pending;
  input aclk;
  input sel_first_reg_0;
  input \cnt_read_reg[0]_rep ;
  input [11:0]\m_payload_i_reg[59] ;
  input \state_reg[1]_rep ;
  input \state_reg[0] ;
  input \m_payload_i_reg[55] ;
  input \m_payload_i_reg[2] ;
  input \m_payload_i_reg[3] ;
  input \m_payload_i_reg[9] ;
  input \m_payload_i_reg[10] ;
  input \m_payload_i_reg[11] ;
  input \m_payload_i_reg[43] ;
  input \m_payload_i_reg[1] ;
  input [0:0]E;
  input [3:0]D;
  input [4:0]\m_payload_i_reg[8] ;

  wire [3:0]D;
  wire [0:0]E;
  wire [9:0]Q;
  wire aclk;
  wire \axaddr_incr[10]_i_2_n_0 ;
  wire \axaddr_incr[11]_i_1__0_n_0 ;
  wire \axaddr_incr[11]_i_3__0_n_0 ;
  wire \axaddr_incr[11]_i_5_n_0 ;
  wire \axaddr_incr[2]_i_2__0_n_0 ;
  wire \axaddr_incr[3]_i_2__0_n_0 ;
  wire \axaddr_incr[4]_i_1_n_0 ;
  wire \axaddr_incr[5]_i_1_n_0 ;
  wire \axaddr_incr[5]_i_2__0_n_0 ;
  wire \axaddr_incr[9]_i_2_n_0 ;
  wire \axaddr_incr_reg[10]_i_1_n_0 ;
  wire \axaddr_incr_reg[11]_i_2_n_0 ;
  wire \axaddr_incr_reg[2]_i_1_n_0 ;
  wire \axaddr_incr_reg[3]_0 ;
  wire \axaddr_incr_reg[3]_i_1_n_0 ;
  wire \axaddr_incr_reg[6]_0 ;
  wire \axaddr_incr_reg[7]_0 ;
  wire \axaddr_incr_reg[8]_0 ;
  wire \axaddr_incr_reg[9]_i_1_n_0 ;
  wire \axaddr_incr_reg_n_0_[10] ;
  wire \axaddr_incr_reg_n_0_[4] ;
  wire \axlen_cnt[2]_i_1_n_0 ;
  wire \axlen_cnt[3]_i_1_n_0 ;
  wire \axlen_cnt[4]_i_1_n_0 ;
  wire \axlen_cnt[4]_i_3_n_0 ;
  wire \axlen_cnt[4]_i_4_n_0 ;
  wire \axlen_cnt[7]_i_2_n_0 ;
  wire \axlen_cnt_reg[4]_0 ;
  wire \axlen_cnt_reg[5]_0 ;
  wire [3:0]\axlen_cnt_reg[7]_0 ;
  wire \axlen_cnt_reg[7]_1 ;
  wire \axlen_cnt_reg_n_0_[2] ;
  wire \axlen_cnt_reg_n_0_[3] ;
  wire \axlen_cnt_reg_n_0_[4] ;
  wire \axlen_cnt_reg_n_0_[7] ;
  wire \cnt_read_reg[0]_rep ;
  wire incr_next_pending;
  wire \m_axi_awaddr[0] ;
  wire \m_axi_awaddr[10] ;
  wire \m_axi_awaddr[11] ;
  wire \m_axi_awaddr[1] ;
  wire \m_axi_awaddr[4] ;
  wire \m_axi_awaddr[7] ;
  wire \m_payload_i_reg[10] ;
  wire \m_payload_i_reg[11] ;
  wire \m_payload_i_reg[1] ;
  wire \m_payload_i_reg[2] ;
  wire \m_payload_i_reg[3] ;
  wire \m_payload_i_reg[43] ;
  wire \m_payload_i_reg[55] ;
  wire [11:0]\m_payload_i_reg[59] ;
  wire [4:0]\m_payload_i_reg[8] ;
  wire \m_payload_i_reg[9] ;
  wire next_pending_r_reg_0;
  wire sel_first_reg_0;
  wire \state_reg[0] ;
  wire \state_reg[1]_rep ;

  LUT3 #(
    .INIT(8'h6A)) 
    \axaddr_incr[10]_i_2 
       (.I0(\axaddr_incr_reg_n_0_[10] ),
        .I1(\axaddr_incr[11]_i_5_n_0 ),
        .I2(Q[8]),
        .O(\axaddr_incr[10]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \axaddr_incr[11]_i_1__0 
       (.I0(\axaddr_incr_reg[3]_0 ),
        .I1(\cnt_read_reg[0]_rep ),
        .O(\axaddr_incr[11]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \axaddr_incr[11]_i_3__0 
       (.I0(Q[9]),
        .I1(Q[8]),
        .I2(\axaddr_incr[11]_i_5_n_0 ),
        .I3(\axaddr_incr_reg_n_0_[10] ),
        .O(\axaddr_incr[11]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \axaddr_incr[11]_i_5 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\axaddr_incr_reg_n_0_[4] ),
        .I3(\axaddr_incr[5]_i_2__0_n_0 ),
        .I4(Q[4]),
        .I5(Q[6]),
        .O(\axaddr_incr[11]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hA5A5666A)) 
    \axaddr_incr[2]_i_2__0 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(\m_payload_i_reg[59] [6]),
        .I3(Q[0]),
        .I4(\m_payload_i_reg[59] [7]),
        .O(\axaddr_incr[2]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h003F0F7FFFC0F080)) 
    \axaddr_incr[3]_i_2__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(\m_payload_i_reg[59] [7]),
        .I4(\m_payload_i_reg[59] [6]),
        .I5(Q[3]),
        .O(\axaddr_incr[3]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'h909F9F90)) 
    \axaddr_incr[4]_i_1 
       (.I0(\m_payload_i_reg[59] [2]),
        .I1(\m_payload_i_reg[43] ),
        .I2(\axaddr_incr_reg[3]_0 ),
        .I3(\axaddr_incr_reg_n_0_[4] ),
        .I4(\axaddr_incr[5]_i_2__0_n_0 ),
        .O(\axaddr_incr[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h909F9F909F909F90)) 
    \axaddr_incr[5]_i_1 
       (.I0(\m_payload_i_reg[59] [3]),
        .I1(\m_payload_i_reg[3] ),
        .I2(\axaddr_incr_reg[3]_0 ),
        .I3(Q[4]),
        .I4(\axaddr_incr[5]_i_2__0_n_0 ),
        .I5(\axaddr_incr_reg_n_0_[4] ),
        .O(\axaddr_incr[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA88AA8880808000)) 
    \axaddr_incr[5]_i_2__0 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(\m_payload_i_reg[59] [6]),
        .I4(Q[0]),
        .I5(\m_payload_i_reg[59] [7]),
        .O(\axaddr_incr[5]_i_2__0_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \axaddr_incr[6]_i_3 
       (.I0(Q[4]),
        .I1(\axaddr_incr[5]_i_2__0_n_0 ),
        .I2(\axaddr_incr_reg_n_0_[4] ),
        .O(\axaddr_incr_reg[6]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \axaddr_incr[7]_i_3 
       (.I0(Q[5]),
        .I1(\axaddr_incr_reg_n_0_[4] ),
        .I2(\axaddr_incr[5]_i_2__0_n_0 ),
        .I3(Q[4]),
        .O(\axaddr_incr_reg[7]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \axaddr_incr[8]_i_3 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(\axaddr_incr[5]_i_2__0_n_0 ),
        .I3(\axaddr_incr_reg_n_0_[4] ),
        .I4(Q[5]),
        .O(\axaddr_incr_reg[8]_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \axaddr_incr[9]_i_2 
       (.I0(Q[8]),
        .I1(\axaddr_incr[11]_i_5_n_0 ),
        .O(\axaddr_incr[9]_i_2_n_0 ));
  FDRE \axaddr_incr_reg[0] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1__0_n_0 ),
        .D(\m_payload_i_reg[8] [0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[10] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1__0_n_0 ),
        .D(\axaddr_incr_reg[10]_i_1_n_0 ),
        .Q(\axaddr_incr_reg_n_0_[10] ),
        .R(1'b0));
  MUXF7 \axaddr_incr_reg[10]_i_1 
       (.I0(\axaddr_incr[10]_i_2_n_0 ),
        .I1(\m_payload_i_reg[10] ),
        .O(\axaddr_incr_reg[10]_i_1_n_0 ),
        .S(\axaddr_incr_reg[3]_0 ));
  FDRE \axaddr_incr_reg[11] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1__0_n_0 ),
        .D(\axaddr_incr_reg[11]_i_2_n_0 ),
        .Q(Q[9]),
        .R(1'b0));
  MUXF7 \axaddr_incr_reg[11]_i_2 
       (.I0(\axaddr_incr[11]_i_3__0_n_0 ),
        .I1(\m_payload_i_reg[11] ),
        .O(\axaddr_incr_reg[11]_i_2_n_0 ),
        .S(\axaddr_incr_reg[3]_0 ));
  FDRE \axaddr_incr_reg[1] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1__0_n_0 ),
        .D(\m_payload_i_reg[8] [1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[2] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1__0_n_0 ),
        .D(\axaddr_incr_reg[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(1'b0));
  MUXF7 \axaddr_incr_reg[2]_i_1 
       (.I0(\axaddr_incr[2]_i_2__0_n_0 ),
        .I1(\m_payload_i_reg[1] ),
        .O(\axaddr_incr_reg[2]_i_1_n_0 ),
        .S(\axaddr_incr_reg[3]_0 ));
  FDRE \axaddr_incr_reg[3] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1__0_n_0 ),
        .D(\axaddr_incr_reg[3]_i_1_n_0 ),
        .Q(Q[3]),
        .R(1'b0));
  MUXF7 \axaddr_incr_reg[3]_i_1 
       (.I0(\axaddr_incr[3]_i_2__0_n_0 ),
        .I1(\m_payload_i_reg[2] ),
        .O(\axaddr_incr_reg[3]_i_1_n_0 ),
        .S(\axaddr_incr_reg[3]_0 ));
  FDRE \axaddr_incr_reg[4] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1__0_n_0 ),
        .D(\axaddr_incr[4]_i_1_n_0 ),
        .Q(\axaddr_incr_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \axaddr_incr_reg[5] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1__0_n_0 ),
        .D(\axaddr_incr[5]_i_1_n_0 ),
        .Q(Q[4]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[6] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1__0_n_0 ),
        .D(\m_payload_i_reg[8] [2]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[7] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1__0_n_0 ),
        .D(\m_payload_i_reg[8] [3]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[8] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1__0_n_0 ),
        .D(\m_payload_i_reg[8] [4]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[9] 
       (.C(aclk),
        .CE(\axaddr_incr[11]_i_1__0_n_0 ),
        .D(\axaddr_incr_reg[9]_i_1_n_0 ),
        .Q(Q[8]),
        .R(1'b0));
  MUXF7 \axaddr_incr_reg[9]_i_1 
       (.I0(\axaddr_incr[9]_i_2_n_0 ),
        .I1(\m_payload_i_reg[9] ),
        .O(\axaddr_incr_reg[9]_i_1_n_0 ),
        .S(\axaddr_incr_reg[3]_0 ));
  LUT6 #(
    .INIT(64'hF8F8F88F88888888)) 
    \axlen_cnt[2]_i_1 
       (.I0(\state_reg[1]_rep ),
        .I1(\m_payload_i_reg[59] [9]),
        .I2(\axlen_cnt_reg_n_0_[2] ),
        .I3(\axlen_cnt_reg[7]_0 [0]),
        .I4(\axlen_cnt_reg[7]_0 [1]),
        .I5(\state_reg[0] ),
        .O(\axlen_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEEEBAAAAAAAA)) 
    \axlen_cnt[3]_i_1 
       (.I0(\m_payload_i_reg[55] ),
        .I1(\axlen_cnt_reg_n_0_[3] ),
        .I2(\axlen_cnt_reg[7]_0 [1]),
        .I3(\axlen_cnt_reg[7]_0 [0]),
        .I4(\axlen_cnt_reg_n_0_[2] ),
        .I5(\state_reg[0] ),
        .O(\axlen_cnt[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8B88888B)) 
    \axlen_cnt[4]_i_1 
       (.I0(\m_payload_i_reg[59] [10]),
        .I1(\state_reg[1]_rep ),
        .I2(\axlen_cnt_reg[4]_0 ),
        .I3(\axlen_cnt[4]_i_3_n_0 ),
        .I4(\axlen_cnt_reg_n_0_[4] ),
        .O(\axlen_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \axlen_cnt[4]_i_2 
       (.I0(\axlen_cnt_reg_n_0_[7] ),
        .I1(\axlen_cnt_reg[7]_0 [3]),
        .I2(\axlen_cnt_reg_n_0_[4] ),
        .I3(\axlen_cnt_reg[7]_0 [2]),
        .I4(\axlen_cnt_reg[7]_0 [1]),
        .I5(\axlen_cnt[4]_i_4_n_0 ),
        .O(\axlen_cnt_reg[4]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \axlen_cnt[4]_i_3 
       (.I0(\axlen_cnt_reg_n_0_[2] ),
        .I1(\axlen_cnt_reg_n_0_[3] ),
        .I2(\axlen_cnt_reg[7]_0 [0]),
        .I3(\axlen_cnt_reg[7]_0 [1]),
        .O(\axlen_cnt[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \axlen_cnt[4]_i_4 
       (.I0(\axlen_cnt_reg_n_0_[3] ),
        .I1(\axlen_cnt_reg_n_0_[2] ),
        .O(\axlen_cnt[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \axlen_cnt[5]_i_2 
       (.I0(\axlen_cnt_reg_n_0_[4] ),
        .I1(\axlen_cnt_reg[7]_0 [1]),
        .I2(\axlen_cnt_reg[7]_0 [0]),
        .I3(\axlen_cnt_reg_n_0_[3] ),
        .I4(\axlen_cnt_reg_n_0_[2] ),
        .O(\axlen_cnt_reg[5]_0 ));
  LUT6 #(
    .INIT(64'hF88FF8F888888888)) 
    \axlen_cnt[7]_i_2 
       (.I0(\state_reg[1]_rep ),
        .I1(\m_payload_i_reg[59] [11]),
        .I2(\axlen_cnt_reg_n_0_[7] ),
        .I3(\axlen_cnt_reg[7]_0 [3]),
        .I4(\axlen_cnt_reg[7]_1 ),
        .I5(\state_reg[0] ),
        .O(\axlen_cnt[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \axlen_cnt[7]_i_3 
       (.I0(\axlen_cnt_reg_n_0_[2] ),
        .I1(\axlen_cnt_reg_n_0_[3] ),
        .I2(\axlen_cnt_reg[7]_0 [0]),
        .I3(\axlen_cnt_reg[7]_0 [1]),
        .I4(\axlen_cnt_reg_n_0_[4] ),
        .I5(\axlen_cnt_reg[7]_0 [2]),
        .O(\axlen_cnt_reg[7]_1 ));
  FDRE \axlen_cnt_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(D[0]),
        .Q(\axlen_cnt_reg[7]_0 [0]),
        .R(1'b0));
  FDRE \axlen_cnt_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(D[1]),
        .Q(\axlen_cnt_reg[7]_0 [1]),
        .R(1'b0));
  FDRE \axlen_cnt_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt[2]_i_1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt[3]_i_1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt[4]_i_1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(D[2]),
        .Q(\axlen_cnt_reg[7]_0 [2]),
        .R(1'b0));
  FDRE \axlen_cnt_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(D[3]),
        .Q(\axlen_cnt_reg[7]_0 [3]),
        .R(1'b0));
  FDRE \axlen_cnt_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt[7]_i_2_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[7] ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hEF40)) 
    \m_axi_awaddr[0]_INST_0_i_1 
       (.I0(\axaddr_incr_reg[3]_0 ),
        .I1(Q[0]),
        .I2(\m_payload_i_reg[59] [8]),
        .I3(\m_payload_i_reg[59] [0]),
        .O(\m_axi_awaddr[0] ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT4 #(
    .INIT(16'hEF40)) 
    \m_axi_awaddr[10]_INST_0_i_1 
       (.I0(\axaddr_incr_reg[3]_0 ),
        .I1(\axaddr_incr_reg_n_0_[10] ),
        .I2(\m_payload_i_reg[59] [8]),
        .I3(\m_payload_i_reg[59] [5]),
        .O(\m_axi_awaddr[10] ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \m_axi_awaddr[11]_INST_0_i_1 
       (.I0(\axaddr_incr_reg[3]_0 ),
        .I1(\m_payload_i_reg[59] [8]),
        .O(\m_axi_awaddr[11] ));
  LUT4 #(
    .INIT(16'hEF40)) 
    \m_axi_awaddr[1]_INST_0_i_1 
       (.I0(\axaddr_incr_reg[3]_0 ),
        .I1(Q[1]),
        .I2(\m_payload_i_reg[59] [8]),
        .I3(\m_payload_i_reg[59] [1]),
        .O(\m_axi_awaddr[1] ));
  LUT4 #(
    .INIT(16'hEF40)) 
    \m_axi_awaddr[4]_INST_0_i_1 
       (.I0(\axaddr_incr_reg[3]_0 ),
        .I1(\axaddr_incr_reg_n_0_[4] ),
        .I2(\m_payload_i_reg[59] [8]),
        .I3(\m_payload_i_reg[59] [2]),
        .O(\m_axi_awaddr[4] ));
  LUT4 #(
    .INIT(16'hEF40)) 
    \m_axi_awaddr[7]_INST_0_i_1 
       (.I0(\axaddr_incr_reg[3]_0 ),
        .I1(Q[6]),
        .I2(\m_payload_i_reg[59] [8]),
        .I3(\m_payload_i_reg[59] [4]),
        .O(\m_axi_awaddr[7] ));
  FDRE next_pending_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(incr_next_pending),
        .Q(next_pending_r_reg_0),
        .R(1'b0));
  FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(sel_first_reg_0),
        .Q(\axaddr_incr_reg[3]_0 ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_17_b2s_incr_cmd" *) 
module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_incr_cmd_2
   (incr_next_pending,
    \axaddr_incr_reg[6]_0 ,
    Q,
    next_pending_r_reg_0,
    \axlen_cnt_reg[7]_0 ,
    \axaddr_incr_reg[11]_0 ,
    \axlen_cnt_reg[5]_0 ,
    \axaddr_incr_reg[11]_1 ,
    \axaddr_incr_reg[10]_0 ,
    \axaddr_incr_reg[3]_0 ,
    \axaddr_incr_reg[5]_0 ,
    \m_axi_araddr[11] ,
    aclk,
    sel_first_reg_0,
    \m_payload_i_reg[57] ,
    \m_payload_i_reg[55] ,
    \state_reg[1]_rep ,
    E,
    \m_payload_i_reg[55]_0 ,
    \state_reg[1]_rep_0 ,
    \m_payload_i_reg[59] ,
    \m_payload_i_reg[5] ,
    \m_payload_i_reg[6] ,
    \m_payload_i_reg[7] ,
    \m_payload_i_reg[8] ,
    \m_payload_i_reg[3] ,
    \m_payload_i_reg[0] ,
    \m_payload_i_reg[44] ,
    m_valid_i_reg,
    D,
    sel_first_reg_1,
    \m_payload_i_reg[11] );
  output incr_next_pending;
  output \axaddr_incr_reg[6]_0 ;
  output [3:0]Q;
  output next_pending_r_reg_0;
  output \axlen_cnt_reg[7]_0 ;
  output [11:0]\axaddr_incr_reg[11]_0 ;
  output \axlen_cnt_reg[5]_0 ;
  output \axaddr_incr_reg[11]_1 ;
  output \axaddr_incr_reg[10]_0 ;
  output \axaddr_incr_reg[3]_0 ;
  output \axaddr_incr_reg[5]_0 ;
  output \m_axi_araddr[11] ;
  input aclk;
  input sel_first_reg_0;
  input \m_payload_i_reg[57] ;
  input \m_payload_i_reg[55] ;
  input \state_reg[1]_rep ;
  input [0:0]E;
  input \m_payload_i_reg[55]_0 ;
  input \state_reg[1]_rep_0 ;
  input [10:0]\m_payload_i_reg[59] ;
  input \m_payload_i_reg[5] ;
  input \m_payload_i_reg[6] ;
  input \m_payload_i_reg[7] ;
  input \m_payload_i_reg[8] ;
  input \m_payload_i_reg[3] ;
  input \m_payload_i_reg[0] ;
  input \m_payload_i_reg[44] ;
  input [0:0]m_valid_i_reg;
  input [3:0]D;
  input [0:0]sel_first_reg_1;
  input [5:0]\m_payload_i_reg[11] ;

  wire [3:0]D;
  wire [0:0]E;
  wire [3:0]Q;
  wire aclk;
  wire \axaddr_incr[2]_i_2_n_0 ;
  wire \axaddr_incr[4]_i_1__0_n_0 ;
  wire \axaddr_incr[4]_i_2__0_n_0 ;
  wire \axaddr_incr[6]_i_1__0_n_0 ;
  wire \axaddr_incr[7]_i_1__0_n_0 ;
  wire \axaddr_incr[7]_i_3__0_n_0 ;
  wire \axaddr_incr[8]_i_1__0_n_0 ;
  wire \axaddr_incr[8]_i_3__0_n_0 ;
  wire \axaddr_incr[9]_i_1_n_0 ;
  wire \axaddr_incr[9]_i_2__0_n_0 ;
  wire \axaddr_incr_reg[10]_0 ;
  wire [11:0]\axaddr_incr_reg[11]_0 ;
  wire \axaddr_incr_reg[11]_1 ;
  wire \axaddr_incr_reg[2]_i_1__0_n_0 ;
  wire \axaddr_incr_reg[3]_0 ;
  wire \axaddr_incr_reg[5]_0 ;
  wire \axaddr_incr_reg[6]_0 ;
  wire \axlen_cnt[2]_i_1__2_n_0 ;
  wire \axlen_cnt[3]_i_1__2_n_0 ;
  wire \axlen_cnt[4]_i_1__0_n_0 ;
  wire \axlen_cnt[4]_i_2__0_n_0 ;
  wire \axlen_cnt[7]_i_2__0_n_0 ;
  wire \axlen_cnt_reg[5]_0 ;
  wire \axlen_cnt_reg[7]_0 ;
  wire \axlen_cnt_reg_n_0_[2] ;
  wire \axlen_cnt_reg_n_0_[3] ;
  wire \axlen_cnt_reg_n_0_[4] ;
  wire \axlen_cnt_reg_n_0_[7] ;
  wire incr_next_pending;
  wire \m_axi_araddr[11] ;
  wire \m_payload_i_reg[0] ;
  wire [5:0]\m_payload_i_reg[11] ;
  wire \m_payload_i_reg[3] ;
  wire \m_payload_i_reg[44] ;
  wire \m_payload_i_reg[55] ;
  wire \m_payload_i_reg[55]_0 ;
  wire \m_payload_i_reg[57] ;
  wire [10:0]\m_payload_i_reg[59] ;
  wire \m_payload_i_reg[5] ;
  wire \m_payload_i_reg[6] ;
  wire \m_payload_i_reg[7] ;
  wire \m_payload_i_reg[8] ;
  wire [0:0]m_valid_i_reg;
  wire next_pending_r_i_5_n_0;
  wire next_pending_r_reg_0;
  wire next_pending_r_reg_n_0;
  wire sel_first_reg_0;
  wire [0:0]sel_first_reg_1;
  wire \state_reg[1]_rep ;
  wire \state_reg[1]_rep_0 ;

  LUT5 #(
    .INIT(32'h80000000)) 
    \axaddr_incr[10]_i_2__0 
       (.I0(\axaddr_incr_reg[11]_0 [9]),
        .I1(\axaddr_incr_reg[11]_0 [7]),
        .I2(\axaddr_incr[7]_i_3__0_n_0 ),
        .I3(\axaddr_incr_reg[11]_0 [6]),
        .I4(\axaddr_incr_reg[11]_0 [8]),
        .O(\axaddr_incr_reg[10]_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \axaddr_incr[11]_i_4__0 
       (.I0(\axaddr_incr_reg[11]_0 [11]),
        .I1(\axaddr_incr_reg[11]_0 [9]),
        .I2(\axaddr_incr_reg[11]_0 [7]),
        .I3(\axaddr_incr[8]_i_3__0_n_0 ),
        .I4(\axaddr_incr_reg[11]_0 [8]),
        .I5(\axaddr_incr_reg[11]_0 [10]),
        .O(\axaddr_incr_reg[11]_1 ));
  LUT5 #(
    .INIT(32'h9956AA66)) 
    \axaddr_incr[2]_i_2 
       (.I0(\axaddr_incr_reg[11]_0 [2]),
        .I1(\m_payload_i_reg[59] [6]),
        .I2(\axaddr_incr_reg[11]_0 [0]),
        .I3(\m_payload_i_reg[59] [5]),
        .I4(\axaddr_incr_reg[11]_0 [1]),
        .O(\axaddr_incr[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0A0A8880)) 
    \axaddr_incr[3]_i_3__0 
       (.I0(\axaddr_incr_reg[11]_0 [2]),
        .I1(\axaddr_incr_reg[11]_0 [1]),
        .I2(\m_payload_i_reg[59] [5]),
        .I3(\axaddr_incr_reg[11]_0 [0]),
        .I4(\m_payload_i_reg[59] [6]),
        .O(\axaddr_incr_reg[3]_0 ));
  LUT5 #(
    .INIT(32'h606F6F60)) 
    \axaddr_incr[4]_i_1__0 
       (.I0(\m_payload_i_reg[59] [0]),
        .I1(\m_payload_i_reg[3] ),
        .I2(\axaddr_incr_reg[6]_0 ),
        .I3(\axaddr_incr_reg[11]_0 [4]),
        .I4(\axaddr_incr[4]_i_2__0_n_0 ),
        .O(\axaddr_incr[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hAA88AA8880808000)) 
    \axaddr_incr[4]_i_2__0 
       (.I0(\axaddr_incr_reg[11]_0 [3]),
        .I1(\axaddr_incr_reg[11]_0 [2]),
        .I2(\axaddr_incr_reg[11]_0 [1]),
        .I3(\m_payload_i_reg[59] [5]),
        .I4(\axaddr_incr_reg[11]_0 [0]),
        .I5(\m_payload_i_reg[59] [6]),
        .O(\axaddr_incr[4]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'hAA800000)) 
    \axaddr_incr[5]_i_3 
       (.I0(\axaddr_incr_reg[11]_0 [4]),
        .I1(\m_payload_i_reg[59] [5]),
        .I2(\m_payload_i_reg[59] [6]),
        .I3(\axaddr_incr_reg[3]_0 ),
        .I4(\axaddr_incr_reg[11]_0 [3]),
        .O(\axaddr_incr_reg[5]_0 ));
  LUT5 #(
    .INIT(32'h606F6F60)) 
    \axaddr_incr[6]_i_1__0 
       (.I0(\m_payload_i_reg[59] [1]),
        .I1(\m_payload_i_reg[5] ),
        .I2(\axaddr_incr_reg[6]_0 ),
        .I3(\axaddr_incr_reg[11]_0 [6]),
        .I4(\axaddr_incr[7]_i_3__0_n_0 ),
        .O(\axaddr_incr[6]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h606F6F606F606F60)) 
    \axaddr_incr[7]_i_1__0 
       (.I0(\m_payload_i_reg[59] [2]),
        .I1(\m_payload_i_reg[6] ),
        .I2(\axaddr_incr_reg[6]_0 ),
        .I3(\axaddr_incr_reg[11]_0 [7]),
        .I4(\axaddr_incr[7]_i_3__0_n_0 ),
        .I5(\axaddr_incr_reg[11]_0 [6]),
        .O(\axaddr_incr[7]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h8880808000000000)) 
    \axaddr_incr[7]_i_3__0 
       (.I0(\axaddr_incr_reg[11]_0 [5]),
        .I1(\axaddr_incr_reg[11]_0 [3]),
        .I2(\axaddr_incr_reg[3]_0 ),
        .I3(\m_payload_i_reg[59] [6]),
        .I4(\m_payload_i_reg[59] [5]),
        .I5(\axaddr_incr_reg[11]_0 [4]),
        .O(\axaddr_incr[7]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h606F6F606F606F60)) 
    \axaddr_incr[8]_i_1__0 
       (.I0(\m_payload_i_reg[59] [3]),
        .I1(\m_payload_i_reg[7] ),
        .I2(\axaddr_incr_reg[6]_0 ),
        .I3(\axaddr_incr_reg[11]_0 [8]),
        .I4(\axaddr_incr[8]_i_3__0_n_0 ),
        .I5(\axaddr_incr_reg[11]_0 [7]),
        .O(\axaddr_incr[8]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h8880000000000000)) 
    \axaddr_incr[8]_i_3__0 
       (.I0(\axaddr_incr_reg[11]_0 [6]),
        .I1(\axaddr_incr_reg[11]_0 [4]),
        .I2(\m_payload_i_reg[44] ),
        .I3(\axaddr_incr_reg[3]_0 ),
        .I4(\axaddr_incr_reg[11]_0 [3]),
        .I5(\axaddr_incr_reg[11]_0 [5]),
        .O(\axaddr_incr[8]_i_3__0_n_0 ));
  LUT5 #(
    .INIT(32'h606F6F60)) 
    \axaddr_incr[9]_i_1 
       (.I0(\m_payload_i_reg[59] [4]),
        .I1(\m_payload_i_reg[8] ),
        .I2(\axaddr_incr_reg[6]_0 ),
        .I3(\axaddr_incr_reg[11]_0 [9]),
        .I4(\axaddr_incr[9]_i_2__0_n_0 ),
        .O(\axaddr_incr[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \axaddr_incr[9]_i_2__0 
       (.I0(\axaddr_incr_reg[11]_0 [8]),
        .I1(\axaddr_incr_reg[11]_0 [6]),
        .I2(\axaddr_incr_reg[11]_0 [4]),
        .I3(\axaddr_incr[4]_i_2__0_n_0 ),
        .I4(\axaddr_incr_reg[11]_0 [5]),
        .I5(\axaddr_incr_reg[11]_0 [7]),
        .O(\axaddr_incr[9]_i_2__0_n_0 ));
  FDRE \axaddr_incr_reg[0] 
       (.C(aclk),
        .CE(sel_first_reg_1),
        .D(\m_payload_i_reg[11] [0]),
        .Q(\axaddr_incr_reg[11]_0 [0]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[10] 
       (.C(aclk),
        .CE(sel_first_reg_1),
        .D(\m_payload_i_reg[11] [4]),
        .Q(\axaddr_incr_reg[11]_0 [10]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[11] 
       (.C(aclk),
        .CE(sel_first_reg_1),
        .D(\m_payload_i_reg[11] [5]),
        .Q(\axaddr_incr_reg[11]_0 [11]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[1] 
       (.C(aclk),
        .CE(sel_first_reg_1),
        .D(\m_payload_i_reg[11] [1]),
        .Q(\axaddr_incr_reg[11]_0 [1]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[2] 
       (.C(aclk),
        .CE(sel_first_reg_1),
        .D(\axaddr_incr_reg[2]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [2]),
        .R(1'b0));
  MUXF7 \axaddr_incr_reg[2]_i_1__0 
       (.I0(\axaddr_incr[2]_i_2_n_0 ),
        .I1(\m_payload_i_reg[0] ),
        .O(\axaddr_incr_reg[2]_i_1__0_n_0 ),
        .S(\axaddr_incr_reg[6]_0 ));
  FDRE \axaddr_incr_reg[3] 
       (.C(aclk),
        .CE(sel_first_reg_1),
        .D(\m_payload_i_reg[11] [2]),
        .Q(\axaddr_incr_reg[11]_0 [3]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[4] 
       (.C(aclk),
        .CE(sel_first_reg_1),
        .D(\axaddr_incr[4]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [4]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[5] 
       (.C(aclk),
        .CE(sel_first_reg_1),
        .D(\m_payload_i_reg[11] [3]),
        .Q(\axaddr_incr_reg[11]_0 [5]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[6] 
       (.C(aclk),
        .CE(sel_first_reg_1),
        .D(\axaddr_incr[6]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [6]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[7] 
       (.C(aclk),
        .CE(sel_first_reg_1),
        .D(\axaddr_incr[7]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [7]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[8] 
       (.C(aclk),
        .CE(sel_first_reg_1),
        .D(\axaddr_incr[8]_i_1__0_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [8]),
        .R(1'b0));
  FDRE \axaddr_incr_reg[9] 
       (.C(aclk),
        .CE(sel_first_reg_1),
        .D(\axaddr_incr[9]_i_1_n_0 ),
        .Q(\axaddr_incr_reg[11]_0 [9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF8F8F88F88888888)) 
    \axlen_cnt[2]_i_1__2 
       (.I0(E),
        .I1(\m_payload_i_reg[59] [8]),
        .I2(\axlen_cnt_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(\state_reg[1]_rep_0 ),
        .O(\axlen_cnt[2]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEEEBAAAAAAAA)) 
    \axlen_cnt[3]_i_1__2 
       (.I0(\m_payload_i_reg[55]_0 ),
        .I1(\axlen_cnt_reg_n_0_[3] ),
        .I2(\axlen_cnt_reg_n_0_[2] ),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\state_reg[1]_rep_0 ),
        .O(\axlen_cnt[3]_i_1__2_n_0 ));
  LUT5 #(
    .INIT(32'hFF909090)) 
    \axlen_cnt[4]_i_1__0 
       (.I0(\axlen_cnt_reg_n_0_[4] ),
        .I1(\axlen_cnt[4]_i_2__0_n_0 ),
        .I2(\state_reg[1]_rep_0 ),
        .I3(E),
        .I4(\m_payload_i_reg[59] [9]),
        .O(\axlen_cnt[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \axlen_cnt[4]_i_2__0 
       (.I0(\axlen_cnt_reg_n_0_[3] ),
        .I1(\axlen_cnt_reg_n_0_[2] ),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(\axlen_cnt[4]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \axlen_cnt[5]_i_2__0 
       (.I0(\axlen_cnt_reg_n_0_[4] ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\axlen_cnt_reg_n_0_[2] ),
        .I4(\axlen_cnt_reg_n_0_[3] ),
        .O(\axlen_cnt_reg[5]_0 ));
  LUT6 #(
    .INIT(64'hFFFF828882888288)) 
    \axlen_cnt[7]_i_2__0 
       (.I0(\state_reg[1]_rep_0 ),
        .I1(\axlen_cnt_reg_n_0_[7] ),
        .I2(Q[3]),
        .I3(\axlen_cnt_reg[7]_0 ),
        .I4(E),
        .I5(\m_payload_i_reg[59] [10]),
        .O(\axlen_cnt[7]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \axlen_cnt[7]_i_4 
       (.I0(\axlen_cnt_reg_n_0_[3] ),
        .I1(\axlen_cnt_reg_n_0_[2] ),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\axlen_cnt_reg_n_0_[4] ),
        .I5(Q[2]),
        .O(\axlen_cnt_reg[7]_0 ));
  FDRE \axlen_cnt_reg[0] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(D[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \axlen_cnt_reg[1] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(D[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \axlen_cnt_reg[2] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axlen_cnt[2]_i_1__2_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[3] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axlen_cnt[3]_i_1__2_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[4] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axlen_cnt[4]_i_1__0_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[5] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(D[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \axlen_cnt_reg[6] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(D[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE \axlen_cnt_reg[7] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axlen_cnt[7]_i_2__0_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[7] ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hB)) 
    \m_axi_araddr[11]_INST_0_i_1 
       (.I0(\axaddr_incr_reg[6]_0 ),
        .I1(\m_payload_i_reg[59] [7]),
        .O(\m_axi_araddr[11] ));
  LUT6 #(
    .INIT(64'hDDDDCCFCFFDDFFFC)) 
    next_pending_r_i_1__2
       (.I0(\m_payload_i_reg[57] ),
        .I1(\m_payload_i_reg[55] ),
        .I2(next_pending_r_reg_n_0),
        .I3(\state_reg[1]_rep ),
        .I4(E),
        .I5(next_pending_r_reg_0),
        .O(incr_next_pending));
  LUT4 #(
    .INIT(16'h0002)) 
    next_pending_r_i_4
       (.I0(next_pending_r_i_5_n_0),
        .I1(\axlen_cnt_reg_n_0_[7] ),
        .I2(Q[3]),
        .I3(\axlen_cnt_reg_n_0_[4] ),
        .O(next_pending_r_reg_0));
  LUT4 #(
    .INIT(16'h0001)) 
    next_pending_r_i_5
       (.I0(Q[1]),
        .I1(\axlen_cnt_reg_n_0_[2] ),
        .I2(\axlen_cnt_reg_n_0_[3] ),
        .I3(Q[2]),
        .O(next_pending_r_i_5_n_0));
  FDRE next_pending_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(incr_next_pending),
        .Q(next_pending_r_reg_n_0),
        .R(1'b0));
  FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(sel_first_reg_0),
        .Q(\axaddr_incr_reg[6]_0 ),
        .R(1'b0));
endmodule

module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_r_channel
   (\state_reg[1]_rep ,
    m_axi_rready,
    m_valid_i_reg,
    out,
    \skid_buffer_reg[35] ,
    \state_reg[1]_rep_0 ,
    aclk,
    r_rlast,
    s_arid_r,
    s_ready_i_reg,
    m_axi_rvalid,
    in,
    areset_d1);
  output \state_reg[1]_rep ;
  output m_axi_rready;
  output m_valid_i_reg;
  output [33:0]out;
  output [1:0]\skid_buffer_reg[35] ;
  input \state_reg[1]_rep_0 ;
  input aclk;
  input r_rlast;
  input s_arid_r;
  input s_ready_i_reg;
  input m_axi_rvalid;
  input [33:0]in;
  input areset_d1;

  wire aclk;
  wire areset_d1;
  wire [33:0]in;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire m_valid_i_reg;
  wire [33:0]out;
  wire r_push_r;
  wire r_rlast;
  wire rd_data_fifo_0_n_1;
  wire rd_data_fifo_0_n_2;
  wire rd_data_fifo_0_n_3;
  wire rd_data_fifo_0_n_4;
  wire s_arid_r;
  wire s_ready_i_reg;
  wire [1:0]\skid_buffer_reg[35] ;
  wire \state_reg[1]_rep ;
  wire \state_reg[1]_rep_0 ;
  wire [1:0]trans_in;

  FDRE \r_arid_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(s_arid_r),
        .Q(trans_in[1]),
        .R(1'b0));
  FDRE r_push_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\state_reg[1]_rep_0 ),
        .Q(r_push_r),
        .R(1'b0));
  FDRE r_rlast_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(r_rlast),
        .Q(trans_in[0]),
        .R(1'b0));
  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_simple_fifo__parameterized1 rd_data_fifo_0
       (.aclk(aclk),
        .areset_d1(areset_d1),
        .\cnt_read_reg[3]_rep__2_0 (rd_data_fifo_0_n_2),
        .\cnt_read_reg[4]_rep__2_0 (rd_data_fifo_0_n_1),
        .in(in),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .m_valid_i_reg(rd_data_fifo_0_n_4),
        .out(out),
        .s_ready_i_reg(s_ready_i_reg),
        .\state_reg[1]_rep (rd_data_fifo_0_n_3));
  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_simple_fifo__parameterized2 transaction_fifo_0
       (.aclk(aclk),
        .areset_d1(areset_d1),
        .\cnt_read_reg[0]_rep__2 (rd_data_fifo_0_n_3),
        .\cnt_read_reg[2]_rep__2 (rd_data_fifo_0_n_4),
        .\cnt_read_reg[3]_rep__2 (rd_data_fifo_0_n_2),
        .\cnt_read_reg[4]_rep__2 (rd_data_fifo_0_n_1),
        .in(trans_in),
        .m_valid_i_reg(m_valid_i_reg),
        .r_push_r(r_push_r),
        .s_ready_i_reg(s_ready_i_reg),
        .\skid_buffer_reg[35] (\skid_buffer_reg[35] ),
        .\state_reg[1]_rep (\state_reg[1]_rep ));
endmodule

module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_rd_cmd_fsm
   (r_push_r_reg,
    \m_payload_i_reg[0] ,
    \axlen_cnt_reg[0] ,
    Q,
    D,
    wrap_second_len,
    axaddr_offset,
    E,
    sel_first_reg,
    sel_first_reg_0,
    sel_first_i,
    \wrap_boundary_axaddr_r_reg[11] ,
    \axlen_cnt_reg[6] ,
    \axlen_cnt_reg[1] ,
    \axaddr_incr_reg[0] ,
    m_axi_arvalid,
    m_valid_i0,
    s_ready_i0,
    \m_payload_i_reg[0]_0 ,
    m_axi_arready,
    si_rs_arvalid,
    s_axburst_eq1_reg,
    \cnt_read_reg[2] ,
    \m_payload_i_reg[0]_1 ,
    \wrap_second_len_r_reg[3] ,
    \m_payload_i_reg[54] ,
    sel_first_reg_1,
    areset_d1,
    sel_first_reg_2,
    sel_first_reg_3,
    \axaddr_offset_r_reg[3] ,
    \m_payload_i_reg[44] ,
    \m_payload_i_reg[58] ,
    \axlen_cnt_reg[6]_0 ,
    \m_payload_i_reg[4] ,
    \axlen_cnt_reg[3] ,
    \axlen_cnt_reg[4] ,
    \axlen_cnt_reg[7] ,
    s_axi_arvalid,
    s_ready_i_reg,
    aclk);
  output r_push_r_reg;
  output \m_payload_i_reg[0] ;
  output \axlen_cnt_reg[0] ;
  output [1:0]Q;
  output [3:0]D;
  output [3:0]wrap_second_len;
  output [2:0]axaddr_offset;
  output [0:0]E;
  output sel_first_reg;
  output sel_first_reg_0;
  output sel_first_i;
  output [0:0]\wrap_boundary_axaddr_r_reg[11] ;
  output [3:0]\axlen_cnt_reg[6] ;
  output \axlen_cnt_reg[1] ;
  output [0:0]\axaddr_incr_reg[0] ;
  output m_axi_arvalid;
  output m_valid_i0;
  output s_ready_i0;
  output [0:0]\m_payload_i_reg[0]_0 ;
  input m_axi_arready;
  input si_rs_arvalid;
  input s_axburst_eq1_reg;
  input \cnt_read_reg[2] ;
  input \m_payload_i_reg[0]_1 ;
  input [3:0]\wrap_second_len_r_reg[3] ;
  input [0:0]\m_payload_i_reg[54] ;
  input sel_first_reg_1;
  input areset_d1;
  input sel_first_reg_2;
  input sel_first_reg_3;
  input [2:0]\axaddr_offset_r_reg[3] ;
  input \m_payload_i_reg[44] ;
  input [3:0]\m_payload_i_reg[58] ;
  input [3:0]\axlen_cnt_reg[6]_0 ;
  input \m_payload_i_reg[4] ;
  input \axlen_cnt_reg[3] ;
  input \axlen_cnt_reg[4] ;
  input \axlen_cnt_reg[7] ;
  input s_axi_arvalid;
  input s_ready_i_reg;
  input aclk;

  wire [3:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire aclk;
  wire areset_d1;
  wire [0:0]\axaddr_incr_reg[0] ;
  wire [2:0]axaddr_offset;
  wire \axaddr_offset_r[1]_i_2__0_n_0 ;
  wire [2:0]\axaddr_offset_r_reg[3] ;
  wire \axlen_cnt_reg[0] ;
  wire \axlen_cnt_reg[1] ;
  wire \axlen_cnt_reg[3] ;
  wire \axlen_cnt_reg[4] ;
  wire [3:0]\axlen_cnt_reg[6] ;
  wire [3:0]\axlen_cnt_reg[6]_0 ;
  wire \axlen_cnt_reg[7] ;
  wire \cnt_read_reg[2] ;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire \m_payload_i_reg[0] ;
  wire [0:0]\m_payload_i_reg[0]_0 ;
  wire \m_payload_i_reg[0]_1 ;
  wire \m_payload_i_reg[44] ;
  wire \m_payload_i_reg[4] ;
  wire [0:0]\m_payload_i_reg[54] ;
  wire [3:0]\m_payload_i_reg[58] ;
  wire m_valid_i0;
  wire [1:0]next_state__0;
  wire r_push_r_reg;
  wire s_axburst_eq1_reg;
  wire s_axi_arvalid;
  wire s_ready_i0;
  wire s_ready_i_reg;
  wire sel_first_i;
  wire sel_first_reg;
  wire sel_first_reg_0;
  wire sel_first_reg_1;
  wire sel_first_reg_2;
  wire sel_first_reg_3;
  wire si_rs_arvalid;
  wire [0:0]\wrap_boundary_axaddr_r_reg[11] ;
  wire \wrap_cnt_r[3]_i_2__0_n_0 ;
  wire \wrap_cnt_r[3]_i_3__0_n_0 ;
  wire [3:0]wrap_second_len;
  wire \wrap_second_len_r[0]_i_2__0_n_0 ;
  wire [3:0]\wrap_second_len_r_reg[3] ;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hAAEA)) 
    \axaddr_incr[11]_i_1 
       (.I0(sel_first_reg_2),
        .I1(m_axi_arready),
        .I2(\axlen_cnt_reg[0] ),
        .I3(\m_payload_i_reg[0] ),
        .O(\axaddr_incr_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFEFAAAA)) 
    \axaddr_offset_r[0]_i_1__0 
       (.I0(\m_payload_i_reg[0]_1 ),
        .I1(\axlen_cnt_reg[0] ),
        .I2(si_rs_arvalid),
        .I3(\m_payload_i_reg[0] ),
        .I4(\axaddr_offset_r_reg[3] [0]),
        .O(axaddr_offset[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \axaddr_offset_r[1]_i_1__0 
       (.I0(\axaddr_offset_r[1]_i_2__0_n_0 ),
        .O(axaddr_offset[1]));
  LUT6 #(
    .INIT(64'h55555555553F5555)) 
    \axaddr_offset_r[1]_i_2__0 
       (.I0(\axaddr_offset_r_reg[3] [1]),
        .I1(\m_payload_i_reg[4] ),
        .I2(\m_payload_i_reg[58] [1]),
        .I3(\m_payload_i_reg[0] ),
        .I4(si_rs_arvalid),
        .I5(Q[0]),
        .O(\axaddr_offset_r[1]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFEFAAAA)) 
    \axaddr_offset_r[3]_i_1__0 
       (.I0(\m_payload_i_reg[44] ),
        .I1(Q[0]),
        .I2(si_rs_arvalid),
        .I3(Q[1]),
        .I4(\axaddr_offset_r_reg[3] [2]),
        .O(axaddr_offset[2]));
  LUT5 #(
    .INIT(32'h40FF4040)) 
    \axlen_cnt[0]_i_1__2 
       (.I0(\axlen_cnt_reg[0] ),
        .I1(si_rs_arvalid),
        .I2(\m_payload_i_reg[58] [0]),
        .I3(\axlen_cnt_reg[6]_0 [0]),
        .I4(\axlen_cnt_reg[1] ),
        .O(\axlen_cnt_reg[6] [0]));
  LUT5 #(
    .INIT(32'hF88F8888)) 
    \axlen_cnt[1]_i_1__2 
       (.I0(\wrap_boundary_axaddr_r_reg[11] ),
        .I1(\m_payload_i_reg[58] [1]),
        .I2(\axlen_cnt_reg[6]_0 [1]),
        .I3(\axlen_cnt_reg[6]_0 [0]),
        .I4(\axlen_cnt_reg[1] ),
        .O(\axlen_cnt_reg[6] [1]));
  LUT5 #(
    .INIT(32'hFF282828)) 
    \axlen_cnt[5]_i_1__0 
       (.I0(\axlen_cnt_reg[1] ),
        .I1(\axlen_cnt_reg[6]_0 [2]),
        .I2(\axlen_cnt_reg[4] ),
        .I3(\wrap_boundary_axaddr_r_reg[11] ),
        .I4(\m_payload_i_reg[58] [2]),
        .O(\axlen_cnt_reg[6] [2]));
  LUT5 #(
    .INIT(32'h88F8F888)) 
    \axlen_cnt[6]_i_1__0 
       (.I0(\wrap_boundary_axaddr_r_reg[11] ),
        .I1(\m_payload_i_reg[58] [3]),
        .I2(\axlen_cnt_reg[1] ),
        .I3(\axlen_cnt_reg[6]_0 [3]),
        .I4(\axlen_cnt_reg[3] ),
        .O(\axlen_cnt_reg[6] [3]));
  LUT4 #(
    .INIT(16'h00CA)) 
    \axlen_cnt[7]_i_1 
       (.I0(si_rs_arvalid),
        .I1(m_axi_arready),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h00FB)) 
    \axlen_cnt[7]_i_3__0 
       (.I0(\m_payload_i_reg[0] ),
        .I1(si_rs_arvalid),
        .I2(\axlen_cnt_reg[0] ),
        .I3(\axlen_cnt_reg[7] ),
        .O(\axlen_cnt_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    m_axi_arvalid_INST_0
       (.I0(\axlen_cnt_reg[0] ),
        .I1(\m_payload_i_reg[0] ),
        .O(m_axi_arvalid));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hD5)) 
    \m_payload_i[39]_i_1__0 
       (.I0(si_rs_arvalid),
        .I1(\m_payload_i_reg[0] ),
        .I2(\axlen_cnt_reg[0] ),
        .O(\m_payload_i_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFF70FFFF)) 
    m_valid_i_i_1
       (.I0(\axlen_cnt_reg[0] ),
        .I1(\m_payload_i_reg[0] ),
        .I2(si_rs_arvalid),
        .I3(s_axi_arvalid),
        .I4(s_ready_i_reg),
        .O(m_valid_i0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h40)) 
    r_push_r_i_1
       (.I0(\m_payload_i_reg[0] ),
        .I1(\axlen_cnt_reg[0] ),
        .I2(m_axi_arready),
        .O(r_push_r_reg));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h8FFF8F8F)) 
    s_ready_i_i_1__0
       (.I0(\axlen_cnt_reg[0] ),
        .I1(\m_payload_i_reg[0] ),
        .I2(si_rs_arvalid),
        .I3(s_axi_arvalid),
        .I4(s_ready_i_reg),
        .O(s_ready_i0));
  LUT6 #(
    .INIT(64'hFFFFFFFFCCCC4F4C)) 
    sel_first_i_1__2
       (.I0(m_axi_arready),
        .I1(sel_first_reg_1),
        .I2(Q[0]),
        .I3(si_rs_arvalid),
        .I4(Q[1]),
        .I5(areset_d1),
        .O(sel_first_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFFCCCC4F4C)) 
    sel_first_i_1__3
       (.I0(m_axi_arready),
        .I1(sel_first_reg_2),
        .I2(Q[0]),
        .I3(si_rs_arvalid),
        .I4(Q[1]),
        .I5(areset_d1),
        .O(sel_first_reg_0));
  LUT6 #(
    .INIT(64'hFCFFFFFFCCCECCCE)) 
    sel_first_i_1__4
       (.I0(si_rs_arvalid),
        .I1(areset_d1),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(m_axi_arready),
        .I5(sel_first_reg_3),
        .O(sel_first_i));
  LUT6 #(
    .INIT(64'h003030303E3E3E3E)) 
    \state[0]_i_1__0 
       (.I0(si_rs_arvalid),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(m_axi_arready),
        .I4(s_axburst_eq1_reg),
        .I5(\cnt_read_reg[2] ),
        .O(next_state__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00AAB000)) 
    \state[1]_i_1__0 
       (.I0(\cnt_read_reg[2] ),
        .I1(s_axburst_eq1_reg),
        .I2(m_axi_arready),
        .I3(\axlen_cnt_reg[0] ),
        .I4(\m_payload_i_reg[0] ),
        .O(next_state__0[1]));
  (* FSM_ENCODED_STATES = "SM_IDLE:00,SM_CMD_EN:01,SM_CMD_ACCEPTED:10,SM_DONE:11" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "state_reg[0]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(next_state__0[0]),
        .Q(Q[0]),
        .R(areset_d1));
  (* FSM_ENCODED_STATES = "SM_IDLE:00,SM_CMD_EN:01,SM_CMD_ACCEPTED:10,SM_DONE:11" *) 
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "state_reg[0]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(next_state__0[0]),
        .Q(\axlen_cnt_reg[0] ),
        .R(areset_d1));
  (* FSM_ENCODED_STATES = "SM_IDLE:00,SM_CMD_EN:01,SM_CMD_ACCEPTED:10,SM_DONE:11" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "state_reg[1]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(next_state__0[1]),
        .Q(Q[1]),
        .R(areset_d1));
  (* FSM_ENCODED_STATES = "SM_IDLE:00,SM_CMD_EN:01,SM_CMD_ACCEPTED:10,SM_DONE:11" *) 
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "state_reg[1]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(next_state__0[1]),
        .Q(\m_payload_i_reg[0] ),
        .R(areset_d1));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \wrap_boundary_axaddr_r[11]_i_1 
       (.I0(\axlen_cnt_reg[0] ),
        .I1(si_rs_arvalid),
        .I2(\m_payload_i_reg[0] ),
        .O(\wrap_boundary_axaddr_r_reg[11] ));
  LUT6 #(
    .INIT(64'hFFCF0000AAAAFFEF)) 
    \wrap_cnt_r[0]_i_1__0 
       (.I0(\m_payload_i_reg[0]_1 ),
        .I1(Q[0]),
        .I2(si_rs_arvalid),
        .I3(Q[1]),
        .I4(\wrap_second_len_r_reg[3] [0]),
        .I5(\wrap_second_len_r[0]_i_2__0_n_0 ),
        .O(D[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \wrap_cnt_r[1]_i_1__0 
       (.I0(wrap_second_len[1]),
        .I1(\wrap_cnt_r[3]_i_2__0_n_0 ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \wrap_cnt_r[2]_i_1__0 
       (.I0(wrap_second_len[2]),
        .I1(\wrap_cnt_r[3]_i_2__0_n_0 ),
        .I2(wrap_second_len[1]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \wrap_cnt_r[3]_i_1__0 
       (.I0(wrap_second_len[3]),
        .I1(wrap_second_len[1]),
        .I2(\wrap_cnt_r[3]_i_2__0_n_0 ),
        .I3(wrap_second_len[2]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0000FFEF)) 
    \wrap_cnt_r[3]_i_2__0 
       (.I0(\m_payload_i_reg[54] ),
        .I1(axaddr_offset[0]),
        .I2(\axaddr_offset_r[1]_i_2__0_n_0 ),
        .I3(axaddr_offset[2]),
        .I4(\wrap_cnt_r[3]_i_3__0_n_0 ),
        .O(\wrap_cnt_r[3]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAFFEF)) 
    \wrap_cnt_r[3]_i_3__0 
       (.I0(\m_payload_i_reg[0]_1 ),
        .I1(Q[0]),
        .I2(si_rs_arvalid),
        .I3(Q[1]),
        .I4(\wrap_second_len_r_reg[3] [0]),
        .O(\wrap_cnt_r[3]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h00000000CCCCC5CC)) 
    \wrap_second_len_r[0]_i_1__0 
       (.I0(\wrap_second_len_r[0]_i_2__0_n_0 ),
        .I1(\wrap_second_len_r_reg[3] [0]),
        .I2(Q[1]),
        .I3(si_rs_arvalid),
        .I4(Q[0]),
        .I5(\m_payload_i_reg[0]_1 ),
        .O(wrap_second_len[0]));
  LUT6 #(
    .INIT(64'h0000000000000D00)) 
    \wrap_second_len_r[0]_i_2__0 
       (.I0(\axaddr_offset_r_reg[3] [2]),
        .I1(\wrap_boundary_axaddr_r_reg[11] ),
        .I2(\m_payload_i_reg[44] ),
        .I3(\axaddr_offset_r[1]_i_2__0_n_0 ),
        .I4(axaddr_offset[0]),
        .I5(\m_payload_i_reg[54] ),
        .O(\wrap_second_len_r[0]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h3C2CFFFF3C2C0000)) 
    \wrap_second_len_r[1]_i_1__0 
       (.I0(\m_payload_i_reg[54] ),
        .I1(axaddr_offset[0]),
        .I2(\axaddr_offset_r[1]_i_2__0_n_0 ),
        .I3(axaddr_offset[2]),
        .I4(\wrap_boundary_axaddr_r_reg[11] ),
        .I5(\wrap_second_len_r_reg[3] [1]),
        .O(wrap_second_len[1]));
  LUT6 #(
    .INIT(64'h9A8AFFFF9A8A0000)) 
    \wrap_second_len_r[2]_i_1__0 
       (.I0(\m_payload_i_reg[54] ),
        .I1(axaddr_offset[0]),
        .I2(\axaddr_offset_r[1]_i_2__0_n_0 ),
        .I3(axaddr_offset[2]),
        .I4(\wrap_boundary_axaddr_r_reg[11] ),
        .I5(\wrap_second_len_r_reg[3] [2]),
        .O(wrap_second_len[2]));
  LUT6 #(
    .INIT(64'hEF00FFFFEF00EF00)) 
    \wrap_second_len_r[3]_i_1__0 
       (.I0(\m_payload_i_reg[54] ),
        .I1(axaddr_offset[0]),
        .I2(\axaddr_offset_r[1]_i_2__0_n_0 ),
        .I3(\m_payload_i_reg[44] ),
        .I4(\wrap_boundary_axaddr_r_reg[11] ),
        .I5(\wrap_second_len_r_reg[3] [3]),
        .O(wrap_second_len[3]));
endmodule

module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_simple_fifo
   (\cnt_read_reg[0]_rep_0 ,
    \cnt_read_reg[1]_rep__0_0 ,
    \state_reg[0]_rep ,
    SR,
    bresp_push,
    D,
    bvalid_i_reg,
    out,
    b_push,
    shandshake_r,
    areset_d1,
    Q,
    \bresp_cnt_reg[7] ,
    si_rs_bready,
    bvalid_i_reg_0,
    mhandshake_r,
    in,
    aclk);
  output \cnt_read_reg[0]_rep_0 ;
  output \cnt_read_reg[1]_rep__0_0 ;
  output \state_reg[0]_rep ;
  output [0:0]SR;
  output bresp_push;
  output [0:0]D;
  output bvalid_i_reg;
  output [0:0]out;
  input b_push;
  input shandshake_r;
  input areset_d1;
  input [1:0]Q;
  input [7:0]\bresp_cnt_reg[7] ;
  input si_rs_bready;
  input bvalid_i_reg_0;
  input mhandshake_r;
  input [8:0]in;
  input aclk;

  wire [0:0]D;
  wire [1:0]Q;
  wire [0:0]SR;
  wire aclk;
  wire areset_d1;
  wire b_push;
  wire [7:0]\bresp_cnt_reg[7] ;
  wire bresp_push;
  wire bvalid_i_i_2_n_0;
  wire bvalid_i_reg;
  wire bvalid_i_reg_0;
  wire [1:0]cnt_read;
  wire \cnt_read[0]_i_1__2_n_0 ;
  wire \cnt_read[1]_i_1_n_0 ;
  wire \cnt_read_reg[0]_rep_0 ;
  wire \cnt_read_reg[1]_rep__0_0 ;
  wire \cnt_read_reg[1]_rep_n_0 ;
  wire [8:0]in;
  wire \memory_reg[3][0]_srl4_i_2__0_n_0 ;
  wire \memory_reg[3][0]_srl4_i_3_n_0 ;
  wire \memory_reg[3][0]_srl4_i_4_n_0 ;
  wire \memory_reg[3][0]_srl4_i_5_n_0 ;
  wire \memory_reg[3][0]_srl4_i_6_n_0 ;
  wire \memory_reg[3][0]_srl4_n_0 ;
  wire \memory_reg[3][1]_srl4_n_0 ;
  wire \memory_reg[3][2]_srl4_n_0 ;
  wire \memory_reg[3][3]_srl4_n_0 ;
  wire \memory_reg[3][4]_srl4_n_0 ;
  wire \memory_reg[3][5]_srl4_n_0 ;
  wire \memory_reg[3][6]_srl4_n_0 ;
  wire \memory_reg[3][7]_srl4_n_0 ;
  wire mhandshake_r;
  wire [0:0]out;
  wire shandshake_r;
  wire si_rs_bready;
  wire \state_reg[0]_rep ;

  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT4 #(
    .INIT(16'h0444)) 
    bvalid_i_i_1
       (.I0(areset_d1),
        .I1(bvalid_i_i_2_n_0),
        .I2(si_rs_bready),
        .I3(bvalid_i_reg_0),
        .O(bvalid_i_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFF00070707)) 
    bvalid_i_i_2
       (.I0(\cnt_read_reg[1]_rep__0_0 ),
        .I1(\cnt_read_reg[0]_rep_0 ),
        .I2(shandshake_r),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(bvalid_i_reg_0),
        .O(bvalid_i_i_2_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    \cnt_read[0]_i_1 
       (.I0(bresp_push),
        .I1(shandshake_r),
        .I2(Q[0]),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \cnt_read[0]_i_1__2 
       (.I0(\cnt_read_reg[0]_rep_0 ),
        .I1(b_push),
        .I2(shandshake_r),
        .O(\cnt_read[0]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT4 #(
    .INIT(16'hE718)) 
    \cnt_read[1]_i_1 
       (.I0(\cnt_read_reg[0]_rep_0 ),
        .I1(b_push),
        .I2(shandshake_r),
        .I3(\cnt_read_reg[1]_rep__0_0 ),
        .O(\cnt_read[1]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[0]_i_1__2_n_0 ),
        .Q(cnt_read[0]),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[0]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[0]_i_1__2_n_0 ),
        .Q(\cnt_read_reg[0]_rep_0 ),
        .S(areset_d1));
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[1]_i_1_n_0 ),
        .Q(cnt_read[1]),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[1]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[1]_i_1_n_0 ),
        .Q(\cnt_read_reg[1]_rep_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[1]_rep__0 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[1]_i_1_n_0 ),
        .Q(\cnt_read_reg[1]_rep__0_0 ),
        .S(areset_d1));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][0]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][0]_srl4 
       (.A0(cnt_read[0]),
        .A1(\cnt_read_reg[1]_rep_n_0 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[0]),
        .Q(\memory_reg[3][0]_srl4_n_0 ));
  LUT5 #(
    .INIT(32'h00000041)) 
    \memory_reg[3][0]_srl4_i_1__0 
       (.I0(\memory_reg[3][0]_srl4_i_2__0_n_0 ),
        .I1(\memory_reg[3][6]_srl4_n_0 ),
        .I2(\bresp_cnt_reg[7] [6]),
        .I3(\memory_reg[3][0]_srl4_i_3_n_0 ),
        .I4(\memory_reg[3][0]_srl4_i_4_n_0 ),
        .O(bresp_push));
  LUT5 #(
    .INIT(32'h6F6FFF6F)) 
    \memory_reg[3][0]_srl4_i_2__0 
       (.I0(\bresp_cnt_reg[7] [2]),
        .I1(\memory_reg[3][2]_srl4_n_0 ),
        .I2(mhandshake_r),
        .I3(\memory_reg[3][4]_srl4_n_0 ),
        .I4(\bresp_cnt_reg[7] [4]),
        .O(\memory_reg[3][0]_srl4_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFBAFFBABA)) 
    \memory_reg[3][0]_srl4_i_3 
       (.I0(\memory_reg[3][0]_srl4_i_5_n_0 ),
        .I1(\bresp_cnt_reg[7] [5]),
        .I2(\memory_reg[3][5]_srl4_n_0 ),
        .I3(\memory_reg[3][1]_srl4_n_0 ),
        .I4(\bresp_cnt_reg[7] [1]),
        .I5(\memory_reg[3][0]_srl4_i_6_n_0 ),
        .O(\memory_reg[3][0]_srl4_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h66F666F6FFFF66F6)) 
    \memory_reg[3][0]_srl4_i_4 
       (.I0(\memory_reg[3][0]_srl4_n_0 ),
        .I1(\bresp_cnt_reg[7] [0]),
        .I2(\memory_reg[3][3]_srl4_n_0 ),
        .I3(\bresp_cnt_reg[7] [3]),
        .I4(\bresp_cnt_reg[7] [5]),
        .I5(\memory_reg[3][5]_srl4_n_0 ),
        .O(\memory_reg[3][0]_srl4_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    \memory_reg[3][0]_srl4_i_5 
       (.I0(\cnt_read_reg[0]_rep_0 ),
        .I1(\cnt_read_reg[1]_rep__0_0 ),
        .I2(\memory_reg[3][4]_srl4_n_0 ),
        .I3(\bresp_cnt_reg[7] [4]),
        .O(\memory_reg[3][0]_srl4_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h66F666F6FFFF66F6)) 
    \memory_reg[3][0]_srl4_i_6 
       (.I0(\bresp_cnt_reg[7] [7]),
        .I1(\memory_reg[3][7]_srl4_n_0 ),
        .I2(\bresp_cnt_reg[7] [3]),
        .I3(\memory_reg[3][3]_srl4_n_0 ),
        .I4(\memory_reg[3][1]_srl4_n_0 ),
        .I5(\bresp_cnt_reg[7] [1]),
        .O(\memory_reg[3][0]_srl4_i_6_n_0 ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][1]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][1]_srl4 
       (.A0(cnt_read[0]),
        .A1(\cnt_read_reg[1]_rep_n_0 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[1]),
        .Q(\memory_reg[3][1]_srl4_n_0 ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][2]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][2]_srl4 
       (.A0(cnt_read[0]),
        .A1(\cnt_read_reg[1]_rep_n_0 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[2]),
        .Q(\memory_reg[3][2]_srl4_n_0 ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][3]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][3]_srl4 
       (.A0(cnt_read[0]),
        .A1(\cnt_read_reg[1]_rep_n_0 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[3]),
        .Q(\memory_reg[3][3]_srl4_n_0 ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][4]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][4]_srl4 
       (.A0(cnt_read[0]),
        .A1(cnt_read[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[4]),
        .Q(\memory_reg[3][4]_srl4_n_0 ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][5]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][5]_srl4 
       (.A0(cnt_read[0]),
        .A1(cnt_read[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[5]),
        .Q(\memory_reg[3][5]_srl4_n_0 ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][6]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][6]_srl4 
       (.A0(cnt_read[0]),
        .A1(cnt_read[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[6]),
        .Q(\memory_reg[3][6]_srl4_n_0 ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][7]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][7]_srl4 
       (.A0(cnt_read[0]),
        .A1(cnt_read[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[7]),
        .Q(\memory_reg[3][7]_srl4_n_0 ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][8]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][8]_srl4 
       (.A0(cnt_read[0]),
        .A1(cnt_read[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[8]),
        .Q(out));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \s_bresp_acc[1]_i_1 
       (.I0(areset_d1),
        .I1(bresp_push),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \state[0]_i_2 
       (.I0(\cnt_read_reg[0]_rep_0 ),
        .I1(\cnt_read_reg[1]_rep__0_0 ),
        .O(\state_reg[0]_rep ));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_17_b2s_simple_fifo" *) 
module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_simple_fifo__parameterized0
   (Q,
    E,
    mhandshake,
    m_axi_bready,
    \skid_buffer_reg[1] ,
    shandshake_r,
    sel,
    \s_bresp_acc_reg[1] ,
    m_axi_bresp,
    m_axi_bvalid,
    mhandshake_r,
    aclk,
    areset_d1,
    D);
  output [1:0]Q;
  output [0:0]E;
  output mhandshake;
  output m_axi_bready;
  output [1:0]\skid_buffer_reg[1] ;
  input shandshake_r;
  input sel;
  input [1:0]\s_bresp_acc_reg[1] ;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  input mhandshake_r;
  input aclk;
  input areset_d1;
  input [0:0]D;

  wire [0:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire aclk;
  wire areset_d1;
  wire \cnt_read[1]_i_1__0_n_0 ;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire mhandshake;
  wire mhandshake_r;
  wire [1:0]\s_bresp_acc_reg[1] ;
  wire sel;
  wire shandshake_r;
  wire [1:0]\skid_buffer_reg[1] ;

  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT4 #(
    .INIT(16'hA69A)) 
    \cnt_read[1]_i_1__0 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(shandshake_r),
        .I3(sel),
        .O(\cnt_read[1]_i_1__0_n_0 ));
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(D),
        .Q(Q[0]),
        .S(areset_d1));
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[1]_i_1__0_n_0 ),
        .Q(Q[1]),
        .S(areset_d1));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT3 #(
    .INIT(8'h08)) 
    m_axi_bready_INST_0
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(mhandshake_r),
        .O(m_axi_bready));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3][0]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][0]_srl4 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(sel),
        .CLK(aclk),
        .D(\s_bresp_acc_reg[1] [0]),
        .Q(\skid_buffer_reg[1] [0]));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3][1]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \memory_reg[3][1]_srl4 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(sel),
        .CLK(aclk),
        .D(\s_bresp_acc_reg[1] [1]),
        .Q(\skid_buffer_reg[1] [1]));
  LUT4 #(
    .INIT(16'h2000)) 
    mhandshake_r_i_1
       (.I0(m_axi_bvalid),
        .I1(mhandshake_r),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(mhandshake));
  LUT5 #(
    .INIT(32'h2020A220)) 
    \s_bresp_acc[1]_i_2 
       (.I0(mhandshake),
        .I1(\s_bresp_acc_reg[1] [1]),
        .I2(m_axi_bresp[1]),
        .I3(m_axi_bresp[0]),
        .I4(\s_bresp_acc_reg[1] [0]),
        .O(E));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_17_b2s_simple_fifo" *) 
module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_simple_fifo__parameterized1
   (m_axi_rready,
    \cnt_read_reg[4]_rep__2_0 ,
    \cnt_read_reg[3]_rep__2_0 ,
    \state_reg[1]_rep ,
    m_valid_i_reg,
    out,
    s_ready_i_reg,
    m_axi_rvalid,
    in,
    aclk,
    areset_d1);
  output m_axi_rready;
  output \cnt_read_reg[4]_rep__2_0 ;
  output \cnt_read_reg[3]_rep__2_0 ;
  output \state_reg[1]_rep ;
  output m_valid_i_reg;
  output [33:0]out;
  input s_ready_i_reg;
  input m_axi_rvalid;
  input [33:0]in;
  input aclk;
  input areset_d1;

  wire aclk;
  wire areset_d1;
  wire [4:0]cnt_read;
  wire \cnt_read[0]_i_1__0_n_0 ;
  wire \cnt_read[1]_i_1__2_n_0 ;
  wire \cnt_read[2]_i_1_n_0 ;
  wire \cnt_read[3]_i_1_n_0 ;
  wire \cnt_read[4]_i_1_n_0 ;
  wire \cnt_read[4]_i_2_n_0 ;
  wire \cnt_read_reg[0]_rep__0_n_0 ;
  wire \cnt_read_reg[0]_rep__1_n_0 ;
  wire \cnt_read_reg[0]_rep__2_n_0 ;
  wire \cnt_read_reg[0]_rep_n_0 ;
  wire \cnt_read_reg[1]_rep__0_n_0 ;
  wire \cnt_read_reg[1]_rep__1_n_0 ;
  wire \cnt_read_reg[1]_rep__2_n_0 ;
  wire \cnt_read_reg[1]_rep_n_0 ;
  wire \cnt_read_reg[2]_rep__0_n_0 ;
  wire \cnt_read_reg[2]_rep__1_n_0 ;
  wire \cnt_read_reg[2]_rep__2_n_0 ;
  wire \cnt_read_reg[2]_rep_n_0 ;
  wire \cnt_read_reg[3]_rep__0_n_0 ;
  wire \cnt_read_reg[3]_rep__1_n_0 ;
  wire \cnt_read_reg[3]_rep__2_0 ;
  wire \cnt_read_reg[3]_rep_n_0 ;
  wire \cnt_read_reg[4]_rep__0_n_0 ;
  wire \cnt_read_reg[4]_rep__1_n_0 ;
  wire \cnt_read_reg[4]_rep__2_0 ;
  wire \cnt_read_reg[4]_rep_n_0 ;
  wire [33:0]in;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire m_valid_i_reg;
  wire [33:0]out;
  wire s_ready_i_reg;
  wire \state_reg[1]_rep ;
  wire wr_en0;
  wire \NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][10]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][11]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][12]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][13]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][14]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][15]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][16]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][17]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][18]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][19]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][20]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][21]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][22]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][23]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][24]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][25]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][26]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][27]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][28]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][29]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][2]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][30]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][31]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][32]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][33]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][3]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][4]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][5]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][6]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][7]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][8]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][9]_srl32_Q31_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \cnt_read[0]_i_1__0 
       (.I0(\cnt_read_reg[0]_rep__2_n_0 ),
        .I1(s_ready_i_reg),
        .I2(wr_en0),
        .O(\cnt_read[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h9AA6)) 
    \cnt_read[1]_i_1__2 
       (.I0(\cnt_read_reg[1]_rep__2_n_0 ),
        .I1(s_ready_i_reg),
        .I2(wr_en0),
        .I3(\cnt_read_reg[0]_rep__2_n_0 ),
        .O(\cnt_read[1]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hAA6AA9AA)) 
    \cnt_read[2]_i_1 
       (.I0(\cnt_read_reg[2]_rep__2_n_0 ),
        .I1(\cnt_read_reg[0]_rep__2_n_0 ),
        .I2(wr_en0),
        .I3(s_ready_i_reg),
        .I4(\cnt_read_reg[1]_rep__2_n_0 ),
        .O(\cnt_read[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9AAAAAAAAAAAAAA6)) 
    \cnt_read[3]_i_1 
       (.I0(\cnt_read_reg[3]_rep__2_0 ),
        .I1(s_ready_i_reg),
        .I2(wr_en0),
        .I3(\cnt_read_reg[1]_rep__2_n_0 ),
        .I4(\cnt_read_reg[0]_rep__2_n_0 ),
        .I5(\cnt_read_reg[2]_rep__2_n_0 ),
        .O(\cnt_read[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt_read[4]_i_1 
       (.I0(\cnt_read_reg[4]_rep__2_0 ),
        .I1(\cnt_read[4]_i_2_n_0 ),
        .O(\cnt_read[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000800000010000)) 
    \cnt_read[4]_i_2 
       (.I0(\cnt_read_reg[2]_rep__2_n_0 ),
        .I1(\cnt_read_reg[1]_rep__2_n_0 ),
        .I2(\cnt_read_reg[0]_rep__2_n_0 ),
        .I3(wr_en0),
        .I4(s_ready_i_reg),
        .I5(\cnt_read_reg[3]_rep__2_0 ),
        .O(\cnt_read[4]_i_2_n_0 ));
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[0]_i_1__0_n_0 ),
        .Q(cnt_read[0]),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[0]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[0]_i_1__0_n_0 ),
        .Q(\cnt_read_reg[0]_rep_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[0]_rep__0 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[0]_i_1__0_n_0 ),
        .Q(\cnt_read_reg[0]_rep__0_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[0]_rep__1 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[0]_i_1__0_n_0 ),
        .Q(\cnt_read_reg[0]_rep__1_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[0]_rep__2 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[0]_i_1__0_n_0 ),
        .Q(\cnt_read_reg[0]_rep__2_n_0 ),
        .S(areset_d1));
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[1]_i_1__2_n_0 ),
        .Q(cnt_read[1]),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[1]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[1]_i_1__2_n_0 ),
        .Q(\cnt_read_reg[1]_rep_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[1]_rep__0 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[1]_i_1__2_n_0 ),
        .Q(\cnt_read_reg[1]_rep__0_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[1]_rep__1 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[1]_i_1__2_n_0 ),
        .Q(\cnt_read_reg[1]_rep__1_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[1]_rep__2 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[1]_i_1__2_n_0 ),
        .Q(\cnt_read_reg[1]_rep__2_n_0 ),
        .S(areset_d1));
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[2]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[2]_i_1_n_0 ),
        .Q(cnt_read[2]),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[2]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[2]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[2]_i_1_n_0 ),
        .Q(\cnt_read_reg[2]_rep_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[2]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[2]_rep__0 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[2]_i_1_n_0 ),
        .Q(\cnt_read_reg[2]_rep__0_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[2]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[2]_rep__1 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[2]_i_1_n_0 ),
        .Q(\cnt_read_reg[2]_rep__1_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[2]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[2]_rep__2 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[2]_i_1_n_0 ),
        .Q(\cnt_read_reg[2]_rep__2_n_0 ),
        .S(areset_d1));
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[3]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[3]_i_1_n_0 ),
        .Q(cnt_read[3]),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[3]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[3]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[3]_i_1_n_0 ),
        .Q(\cnt_read_reg[3]_rep_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[3]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[3]_rep__0 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[3]_i_1_n_0 ),
        .Q(\cnt_read_reg[3]_rep__0_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[3]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[3]_rep__1 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[3]_i_1_n_0 ),
        .Q(\cnt_read_reg[3]_rep__1_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[3]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[3]_rep__2 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[3]_i_1_n_0 ),
        .Q(\cnt_read_reg[3]_rep__2_0 ),
        .S(areset_d1));
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[4]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[4]_i_1_n_0 ),
        .Q(cnt_read[4]),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[4]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[4]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[4]_i_1_n_0 ),
        .Q(\cnt_read_reg[4]_rep_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[4]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[4]_rep__0 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[4]_i_1_n_0 ),
        .Q(\cnt_read_reg[4]_rep__0_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[4]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[4]_rep__1 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[4]_i_1_n_0 ),
        .Q(\cnt_read_reg[4]_rep__1_n_0 ),
        .S(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "cnt_read_reg[4]" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[4]_rep__2 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[4]_i_1_n_0 ),
        .Q(\cnt_read_reg[4]_rep__2_0 ),
        .S(areset_d1));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h9FFF1FFF)) 
    m_axi_rready_INST_0
       (.I0(\cnt_read_reg[2]_rep__2_n_0 ),
        .I1(\cnt_read_reg[1]_rep__2_n_0 ),
        .I2(\cnt_read_reg[4]_rep__2_0 ),
        .I3(\cnt_read_reg[3]_rep__2_0 ),
        .I4(\cnt_read_reg[0]_rep__2_n_0 ),
        .O(m_axi_rready));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    m_valid_i_i_4
       (.I0(\cnt_read_reg[2]_rep__2_n_0 ),
        .I1(\cnt_read_reg[0]_rep__2_n_0 ),
        .I2(\cnt_read_reg[1]_rep__2_n_0 ),
        .O(m_valid_i_reg));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][0]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][0]_srl32 
       (.A({\cnt_read_reg[4]_rep__1_n_0 ,\cnt_read_reg[3]_rep__1_n_0 ,\cnt_read_reg[2]_rep__1_n_0 ,\cnt_read_reg[1]_rep__1_n_0 ,\cnt_read_reg[0]_rep__1_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[0]),
        .Q(out[0]),
        .Q31(\NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED ));
  LUT6 #(
    .INIT(64'h82AAAAAA02AAAAAA)) 
    \memory_reg[31][0]_srl32_i_1 
       (.I0(m_axi_rvalid),
        .I1(\cnt_read_reg[2]_rep__2_n_0 ),
        .I2(\cnt_read_reg[1]_rep__2_n_0 ),
        .I3(\cnt_read_reg[4]_rep__2_0 ),
        .I4(\cnt_read_reg[3]_rep__2_0 ),
        .I5(\cnt_read_reg[0]_rep__2_n_0 ),
        .O(wr_en0));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][10]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][10]_srl32 
       (.A({\cnt_read_reg[4]_rep__0_n_0 ,\cnt_read_reg[3]_rep__0_n_0 ,\cnt_read_reg[2]_rep__0_n_0 ,\cnt_read_reg[1]_rep__0_n_0 ,\cnt_read_reg[0]_rep__0_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[10]),
        .Q(out[10]),
        .Q31(\NLW_memory_reg[31][10]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][11]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][11]_srl32 
       (.A({\cnt_read_reg[4]_rep__0_n_0 ,\cnt_read_reg[3]_rep__0_n_0 ,\cnt_read_reg[2]_rep__0_n_0 ,\cnt_read_reg[1]_rep__0_n_0 ,\cnt_read_reg[0]_rep__0_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[11]),
        .Q(out[11]),
        .Q31(\NLW_memory_reg[31][11]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][12]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][12]_srl32 
       (.A({\cnt_read_reg[4]_rep__0_n_0 ,\cnt_read_reg[3]_rep__0_n_0 ,\cnt_read_reg[2]_rep__0_n_0 ,\cnt_read_reg[1]_rep__0_n_0 ,\cnt_read_reg[0]_rep__0_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[12]),
        .Q(out[12]),
        .Q31(\NLW_memory_reg[31][12]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][13]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][13]_srl32 
       (.A({\cnt_read_reg[4]_rep__0_n_0 ,\cnt_read_reg[3]_rep__0_n_0 ,\cnt_read_reg[2]_rep__0_n_0 ,\cnt_read_reg[1]_rep__0_n_0 ,\cnt_read_reg[0]_rep__0_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[13]),
        .Q(out[13]),
        .Q31(\NLW_memory_reg[31][13]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][14]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][14]_srl32 
       (.A({\cnt_read_reg[4]_rep__0_n_0 ,\cnt_read_reg[3]_rep__0_n_0 ,\cnt_read_reg[2]_rep__0_n_0 ,\cnt_read_reg[1]_rep__0_n_0 ,\cnt_read_reg[0]_rep__0_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[14]),
        .Q(out[14]),
        .Q31(\NLW_memory_reg[31][14]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][15]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][15]_srl32 
       (.A({\cnt_read_reg[4]_rep__0_n_0 ,\cnt_read_reg[3]_rep__0_n_0 ,\cnt_read_reg[2]_rep__0_n_0 ,\cnt_read_reg[1]_rep__0_n_0 ,\cnt_read_reg[0]_rep__0_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[15]),
        .Q(out[15]),
        .Q31(\NLW_memory_reg[31][15]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][16]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][16]_srl32 
       (.A({\cnt_read_reg[4]_rep_n_0 ,\cnt_read_reg[3]_rep_n_0 ,\cnt_read_reg[2]_rep_n_0 ,\cnt_read_reg[1]_rep_n_0 ,\cnt_read_reg[0]_rep_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[16]),
        .Q(out[16]),
        .Q31(\NLW_memory_reg[31][16]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][17]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][17]_srl32 
       (.A({\cnt_read_reg[4]_rep_n_0 ,\cnt_read_reg[3]_rep_n_0 ,\cnt_read_reg[2]_rep_n_0 ,\cnt_read_reg[1]_rep_n_0 ,\cnt_read_reg[0]_rep_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[17]),
        .Q(out[17]),
        .Q31(\NLW_memory_reg[31][17]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][18]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][18]_srl32 
       (.A({\cnt_read_reg[4]_rep_n_0 ,\cnt_read_reg[3]_rep_n_0 ,\cnt_read_reg[2]_rep_n_0 ,\cnt_read_reg[1]_rep_n_0 ,\cnt_read_reg[0]_rep_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[18]),
        .Q(out[18]),
        .Q31(\NLW_memory_reg[31][18]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][19]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][19]_srl32 
       (.A({\cnt_read_reg[4]_rep_n_0 ,\cnt_read_reg[3]_rep_n_0 ,\cnt_read_reg[2]_rep_n_0 ,\cnt_read_reg[1]_rep_n_0 ,\cnt_read_reg[0]_rep_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[19]),
        .Q(out[19]),
        .Q31(\NLW_memory_reg[31][19]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][1]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][1]_srl32 
       (.A({\cnt_read_reg[4]_rep__1_n_0 ,\cnt_read_reg[3]_rep__1_n_0 ,\cnt_read_reg[2]_rep__1_n_0 ,\cnt_read_reg[1]_rep__1_n_0 ,\cnt_read_reg[0]_rep__1_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[1]),
        .Q(out[1]),
        .Q31(\NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][20]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][20]_srl32 
       (.A({\cnt_read_reg[4]_rep_n_0 ,\cnt_read_reg[3]_rep_n_0 ,\cnt_read_reg[2]_rep_n_0 ,\cnt_read_reg[1]_rep_n_0 ,\cnt_read_reg[0]_rep_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[20]),
        .Q(out[20]),
        .Q31(\NLW_memory_reg[31][20]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][21]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][21]_srl32 
       (.A({\cnt_read_reg[4]_rep_n_0 ,\cnt_read_reg[3]_rep_n_0 ,\cnt_read_reg[2]_rep_n_0 ,\cnt_read_reg[1]_rep_n_0 ,\cnt_read_reg[0]_rep_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[21]),
        .Q(out[21]),
        .Q31(\NLW_memory_reg[31][21]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][22]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][22]_srl32 
       (.A({\cnt_read_reg[4]_rep_n_0 ,\cnt_read_reg[3]_rep_n_0 ,\cnt_read_reg[2]_rep_n_0 ,\cnt_read_reg[1]_rep_n_0 ,\cnt_read_reg[0]_rep_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[22]),
        .Q(out[22]),
        .Q31(\NLW_memory_reg[31][22]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][23]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][23]_srl32 
       (.A({\cnt_read_reg[4]_rep_n_0 ,\cnt_read_reg[3]_rep_n_0 ,\cnt_read_reg[2]_rep_n_0 ,\cnt_read_reg[1]_rep_n_0 ,\cnt_read_reg[0]_rep_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[23]),
        .Q(out[23]),
        .Q31(\NLW_memory_reg[31][23]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][24]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][24]_srl32 
       (.A({\cnt_read_reg[4]_rep_n_0 ,\cnt_read_reg[3]_rep_n_0 ,\cnt_read_reg[2]_rep_n_0 ,\cnt_read_reg[1]_rep_n_0 ,\cnt_read_reg[0]_rep_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[24]),
        .Q(out[24]),
        .Q31(\NLW_memory_reg[31][24]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][25]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][25]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[25]),
        .Q(out[25]),
        .Q31(\NLW_memory_reg[31][25]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][26]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][26]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[26]),
        .Q(out[26]),
        .Q31(\NLW_memory_reg[31][26]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][27]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][27]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[27]),
        .Q(out[27]),
        .Q31(\NLW_memory_reg[31][27]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][28]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][28]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[28]),
        .Q(out[28]),
        .Q31(\NLW_memory_reg[31][28]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][29]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][29]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[29]),
        .Q(out[29]),
        .Q31(\NLW_memory_reg[31][29]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][2]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][2]_srl32 
       (.A({\cnt_read_reg[4]_rep__1_n_0 ,\cnt_read_reg[3]_rep__1_n_0 ,\cnt_read_reg[2]_rep__1_n_0 ,\cnt_read_reg[1]_rep__1_n_0 ,\cnt_read_reg[0]_rep__1_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[2]),
        .Q(out[2]),
        .Q31(\NLW_memory_reg[31][2]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][30]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][30]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[30]),
        .Q(out[30]),
        .Q31(\NLW_memory_reg[31][30]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][31]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][31]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[31]),
        .Q(out[31]),
        .Q31(\NLW_memory_reg[31][31]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][32]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][32]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[32]),
        .Q(out[32]),
        .Q31(\NLW_memory_reg[31][32]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][33]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][33]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[33]),
        .Q(out[33]),
        .Q31(\NLW_memory_reg[31][33]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][3]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][3]_srl32 
       (.A({\cnt_read_reg[4]_rep__1_n_0 ,\cnt_read_reg[3]_rep__1_n_0 ,\cnt_read_reg[2]_rep__1_n_0 ,\cnt_read_reg[1]_rep__1_n_0 ,\cnt_read_reg[0]_rep__1_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[3]),
        .Q(out[3]),
        .Q31(\NLW_memory_reg[31][3]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][4]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][4]_srl32 
       (.A({\cnt_read_reg[4]_rep__1_n_0 ,\cnt_read_reg[3]_rep__1_n_0 ,\cnt_read_reg[2]_rep__1_n_0 ,\cnt_read_reg[1]_rep__1_n_0 ,\cnt_read_reg[0]_rep__1_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[4]),
        .Q(out[4]),
        .Q31(\NLW_memory_reg[31][4]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][5]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][5]_srl32 
       (.A({\cnt_read_reg[4]_rep__1_n_0 ,\cnt_read_reg[3]_rep__1_n_0 ,\cnt_read_reg[2]_rep__1_n_0 ,\cnt_read_reg[1]_rep__1_n_0 ,\cnt_read_reg[0]_rep__1_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[5]),
        .Q(out[5]),
        .Q31(\NLW_memory_reg[31][5]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][6]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][6]_srl32 
       (.A({\cnt_read_reg[4]_rep__1_n_0 ,\cnt_read_reg[3]_rep__1_n_0 ,\cnt_read_reg[2]_rep__1_n_0 ,\cnt_read_reg[1]_rep__1_n_0 ,\cnt_read_reg[0]_rep__1_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[6]),
        .Q(out[6]),
        .Q31(\NLW_memory_reg[31][6]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][7]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][7]_srl32 
       (.A({\cnt_read_reg[4]_rep__0_n_0 ,\cnt_read_reg[3]_rep__0_n_0 ,\cnt_read_reg[2]_rep__0_n_0 ,\cnt_read_reg[1]_rep__0_n_0 ,\cnt_read_reg[0]_rep__0_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[7]),
        .Q(out[7]),
        .Q31(\NLW_memory_reg[31][7]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][8]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][8]_srl32 
       (.A({\cnt_read_reg[4]_rep__0_n_0 ,\cnt_read_reg[3]_rep__0_n_0 ,\cnt_read_reg[2]_rep__0_n_0 ,\cnt_read_reg[1]_rep__0_n_0 ,\cnt_read_reg[0]_rep__0_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[8]),
        .Q(out[8]),
        .Q31(\NLW_memory_reg[31][8]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][9]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][9]_srl32 
       (.A({\cnt_read_reg[4]_rep__0_n_0 ,\cnt_read_reg[3]_rep__0_n_0 ,\cnt_read_reg[2]_rep__0_n_0 ,\cnt_read_reg[1]_rep__0_n_0 ,\cnt_read_reg[0]_rep__0_n_0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[9]),
        .Q(out[9]),
        .Q31(\NLW_memory_reg[31][9]_srl32_Q31_UNCONNECTED ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h40C0C000)) 
    \state[1]_i_4 
       (.I0(\cnt_read_reg[0]_rep__2_n_0 ),
        .I1(\cnt_read_reg[3]_rep__2_0 ),
        .I2(\cnt_read_reg[4]_rep__2_0 ),
        .I3(\cnt_read_reg[1]_rep__2_n_0 ),
        .I4(\cnt_read_reg[2]_rep__2_n_0 ),
        .O(\state_reg[1]_rep ));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_17_b2s_simple_fifo" *) 
module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_simple_fifo__parameterized2
   (\state_reg[1]_rep ,
    m_valid_i_reg,
    \skid_buffer_reg[35] ,
    \cnt_read_reg[0]_rep__2 ,
    s_ready_i_reg,
    r_push_r,
    \cnt_read_reg[3]_rep__2 ,
    \cnt_read_reg[2]_rep__2 ,
    \cnt_read_reg[4]_rep__2 ,
    in,
    aclk,
    areset_d1);
  output \state_reg[1]_rep ;
  output m_valid_i_reg;
  output [1:0]\skid_buffer_reg[35] ;
  input \cnt_read_reg[0]_rep__2 ;
  input s_ready_i_reg;
  input r_push_r;
  input \cnt_read_reg[3]_rep__2 ;
  input \cnt_read_reg[2]_rep__2 ;
  input \cnt_read_reg[4]_rep__2 ;
  input [1:0]in;
  input aclk;
  input areset_d1;

  wire aclk;
  wire areset_d1;
  wire [4:0]cnt_read;
  wire \cnt_read[0]_i_1__1_n_0 ;
  wire \cnt_read[1]_i_1__1_n_0 ;
  wire \cnt_read[2]_i_1__0_n_0 ;
  wire \cnt_read[3]_i_1__0_n_0 ;
  wire \cnt_read[4]_i_1__0_n_0 ;
  wire \cnt_read[4]_i_2__0_n_0 ;
  wire \cnt_read_reg[0]_rep__2 ;
  wire \cnt_read_reg[2]_rep__2 ;
  wire \cnt_read_reg[3]_rep__2 ;
  wire \cnt_read_reg[4]_rep__2 ;
  wire [1:0]in;
  wire m_valid_i_i_3_n_0;
  wire m_valid_i_reg;
  wire r_push_r;
  wire s_ready_i_reg;
  wire [1:0]\skid_buffer_reg[35] ;
  wire \state_reg[1]_rep ;
  wire \NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \cnt_read[0]_i_1__1 
       (.I0(cnt_read[0]),
        .I1(s_ready_i_reg),
        .I2(r_push_r),
        .O(\cnt_read[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hDB24)) 
    \cnt_read[1]_i_1__1 
       (.I0(cnt_read[0]),
        .I1(s_ready_i_reg),
        .I2(r_push_r),
        .I3(cnt_read[1]),
        .O(\cnt_read[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hF7EF0810)) 
    \cnt_read[2]_i_1__0 
       (.I0(cnt_read[0]),
        .I1(cnt_read[1]),
        .I2(s_ready_i_reg),
        .I3(r_push_r),
        .I4(cnt_read[2]),
        .O(\cnt_read[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hBFFF4000FFFD0002)) 
    \cnt_read[3]_i_1__0 
       (.I0(s_ready_i_reg),
        .I1(r_push_r),
        .I2(cnt_read[1]),
        .I3(cnt_read[0]),
        .I4(cnt_read[3]),
        .I5(cnt_read[2]),
        .O(\cnt_read[3]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt_read[4]_i_1__0 
       (.I0(cnt_read[4]),
        .I1(\cnt_read[4]_i_2__0_n_0 ),
        .O(\cnt_read[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0800000000000010)) 
    \cnt_read[4]_i_2__0 
       (.I0(cnt_read[3]),
        .I1(cnt_read[2]),
        .I2(s_ready_i_reg),
        .I3(r_push_r),
        .I4(cnt_read[0]),
        .I5(cnt_read[1]),
        .O(\cnt_read[4]_i_2__0_n_0 ));
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[0]_i_1__1_n_0 ),
        .Q(cnt_read[0]),
        .S(areset_d1));
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[1]_i_1__1_n_0 ),
        .Q(cnt_read[1]),
        .S(areset_d1));
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[2]_i_1__0_n_0 ),
        .Q(cnt_read[2]),
        .S(areset_d1));
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[3]_i_1__0_n_0 ),
        .Q(cnt_read[3]),
        .S(areset_d1));
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \cnt_read_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(\cnt_read[4]_i_1__0_n_0 ),
        .Q(cnt_read[4]),
        .S(areset_d1));
  LUT6 #(
    .INIT(64'h7F7F007F7F7F7F7F)) 
    m_valid_i_i_2
       (.I0(cnt_read[4]),
        .I1(cnt_read[3]),
        .I2(m_valid_i_i_3_n_0),
        .I3(\cnt_read_reg[3]_rep__2 ),
        .I4(\cnt_read_reg[2]_rep__2 ),
        .I5(\cnt_read_reg[4]_rep__2 ),
        .O(m_valid_i_reg));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h80)) 
    m_valid_i_i_3
       (.I0(cnt_read[2]),
        .I1(cnt_read[0]),
        .I2(cnt_read[1]),
        .O(m_valid_i_i_3_n_0));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][0]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][0]_srl32 
       (.A(cnt_read),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[0]),
        .Q(\skid_buffer_reg[35] [0]),
        .Q31(\NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED ));
  (* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
  (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][1]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \memory_reg[31][1]_srl32 
       (.A(cnt_read),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[1]),
        .Q(\skid_buffer_reg[35] [1]),
        .Q31(\NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED ));
  LUT6 #(
    .INIT(64'hBFEEAAAAAAAAAAAA)) 
    \state[1]_i_2 
       (.I0(\cnt_read_reg[0]_rep__2 ),
        .I1(cnt_read[2]),
        .I2(cnt_read[0]),
        .I3(cnt_read[1]),
        .I4(cnt_read[3]),
        .I5(cnt_read[4]),
        .O(\state_reg[1]_rep ));
endmodule

module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_wr_cmd_fsm
   (E,
    Q,
    \axaddr_wrap_reg[11] ,
    next_pending_r_reg,
    \wrap_boundary_axaddr_r_reg[11] ,
    \state_reg[1]_rep_0 ,
    \state_reg[1]_rep_1 ,
    s_axburst_eq0_reg,
    wrap_next_pending,
    sel_first_i,
    incr_next_pending,
    s_axburst_eq1_reg,
    D,
    \wrap_cnt_r_reg[3] ,
    \wrap_second_len_r_reg[3] ,
    axaddr_offset,
    sel_first_reg,
    sel_first_reg_0,
    \axaddr_wrap_reg[11]_0 ,
    \m_payload_i_reg[0] ,
    b_push,
    m_axi_awvalid,
    si_rs_awvalid,
    \axlen_cnt_reg[7] ,
    \m_payload_i_reg[58] ,
    \m_payload_i_reg[54] ,
    next_pending_r_reg_0,
    \state_reg[0]_rep_0 ,
    \m_payload_i_reg[57] ,
    next_pending_r_reg_1,
    \axlen_cnt_reg[6] ,
    \axlen_cnt_reg[2] ,
    \axlen_cnt_reg[4] ,
    \m_payload_i_reg[54]_0 ,
    \wrap_second_len_r_reg[3]_0 ,
    \m_payload_i_reg[0]_0 ,
    \m_payload_i_reg[44] ,
    \axaddr_offset_r_reg[3] ,
    \m_payload_i_reg[4] ,
    sel_first__0,
    areset_d1,
    sel_first_reg_1,
    sel_first_reg_2,
    \cnt_read_reg[0]_rep ,
    s_axburst_eq1_reg_0,
    m_axi_awready,
    \wrap_boundary_axaddr_r_reg[11]_0 ,
    \cnt_read_reg[0]_rep_0 ,
    \cnt_read_reg[1]_rep__0 ,
    aclk);
  output [0:0]E;
  output [1:0]Q;
  output \axaddr_wrap_reg[11] ;
  output next_pending_r_reg;
  output \wrap_boundary_axaddr_r_reg[11] ;
  output \state_reg[1]_rep_0 ;
  output \state_reg[1]_rep_1 ;
  output s_axburst_eq0_reg;
  output wrap_next_pending;
  output sel_first_i;
  output incr_next_pending;
  output s_axburst_eq1_reg;
  output [3:0]D;
  output [3:0]\wrap_cnt_r_reg[3] ;
  output [3:0]\wrap_second_len_r_reg[3] ;
  output [2:0]axaddr_offset;
  output sel_first_reg;
  output sel_first_reg_0;
  output [0:0]\axaddr_wrap_reg[11]_0 ;
  output [0:0]\m_payload_i_reg[0] ;
  output b_push;
  output m_axi_awvalid;
  input si_rs_awvalid;
  input \axlen_cnt_reg[7] ;
  input [5:0]\m_payload_i_reg[58] ;
  input \m_payload_i_reg[54] ;
  input next_pending_r_reg_0;
  input \state_reg[0]_rep_0 ;
  input \m_payload_i_reg[57] ;
  input next_pending_r_reg_1;
  input [3:0]\axlen_cnt_reg[6] ;
  input \axlen_cnt_reg[2] ;
  input \axlen_cnt_reg[4] ;
  input [0:0]\m_payload_i_reg[54]_0 ;
  input [3:0]\wrap_second_len_r_reg[3]_0 ;
  input \m_payload_i_reg[0]_0 ;
  input \m_payload_i_reg[44] ;
  input [2:0]\axaddr_offset_r_reg[3] ;
  input \m_payload_i_reg[4] ;
  input sel_first__0;
  input areset_d1;
  input sel_first_reg_1;
  input sel_first_reg_2;
  input \cnt_read_reg[0]_rep ;
  input s_axburst_eq1_reg_0;
  input m_axi_awready;
  input \wrap_boundary_axaddr_r_reg[11]_0 ;
  input \cnt_read_reg[0]_rep_0 ;
  input \cnt_read_reg[1]_rep__0 ;
  input aclk;

  wire [3:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire aclk;
  wire areset_d1;
  wire [2:0]axaddr_offset;
  wire \axaddr_offset_r[1]_i_2_n_0 ;
  wire [2:0]\axaddr_offset_r_reg[3] ;
  wire \axaddr_wrap_reg[11] ;
  wire [0:0]\axaddr_wrap_reg[11]_0 ;
  wire \axlen_cnt_reg[2] ;
  wire \axlen_cnt_reg[4] ;
  wire [3:0]\axlen_cnt_reg[6] ;
  wire \axlen_cnt_reg[7] ;
  wire b_push;
  wire \cnt_read_reg[0]_rep ;
  wire \cnt_read_reg[0]_rep_0 ;
  wire \cnt_read_reg[1]_rep__0 ;
  wire incr_next_pending;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire [0:0]\m_payload_i_reg[0] ;
  wire \m_payload_i_reg[0]_0 ;
  wire \m_payload_i_reg[44] ;
  wire \m_payload_i_reg[4] ;
  wire \m_payload_i_reg[54] ;
  wire [0:0]\m_payload_i_reg[54]_0 ;
  wire \m_payload_i_reg[57] ;
  wire [5:0]\m_payload_i_reg[58] ;
  wire next_pending_r_reg;
  wire next_pending_r_reg_0;
  wire next_pending_r_reg_1;
  wire s_axburst_eq0_reg;
  wire s_axburst_eq1_reg;
  wire s_axburst_eq1_reg_0;
  wire sel_first__0;
  wire sel_first_i;
  wire sel_first_reg;
  wire sel_first_reg_0;
  wire sel_first_reg_1;
  wire sel_first_reg_2;
  wire si_rs_awvalid;
  wire \state[0]_i_1_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state_reg[0]_rep_0 ;
  wire \state_reg[1]_rep_0 ;
  wire \state_reg[1]_rep_1 ;
  wire \wrap_boundary_axaddr_r_reg[11] ;
  wire \wrap_boundary_axaddr_r_reg[11]_0 ;
  wire \wrap_cnt_r[3]_i_2_n_0 ;
  wire \wrap_cnt_r[3]_i_3_n_0 ;
  wire [3:0]\wrap_cnt_r_reg[3] ;
  wire wrap_next_pending;
  wire \wrap_second_len_r[0]_i_2_n_0 ;
  wire [3:0]\wrap_second_len_r_reg[3] ;
  wire [3:0]\wrap_second_len_r_reg[3]_0 ;

  LUT5 #(
    .INIT(32'hFFFFFB00)) 
    \axaddr_offset_r[0]_i_1 
       (.I0(Q[1]),
        .I1(si_rs_awvalid),
        .I2(Q[0]),
        .I3(\axaddr_offset_r_reg[3] [0]),
        .I4(\m_payload_i_reg[0]_0 ),
        .O(axaddr_offset[0]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \axaddr_offset_r[1]_i_1 
       (.I0(\axaddr_offset_r[1]_i_2_n_0 ),
        .O(axaddr_offset[1]));
  LUT6 #(
    .INIT(64'h55555555553F5555)) 
    \axaddr_offset_r[1]_i_2 
       (.I0(\axaddr_offset_r_reg[3] [1]),
        .I1(\m_payload_i_reg[4] ),
        .I2(\m_payload_i_reg[58] [3]),
        .I3(Q[0]),
        .I4(si_rs_awvalid),
        .I5(Q[1]),
        .O(\axaddr_offset_r[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEFAAAA)) 
    \axaddr_offset_r[3]_i_1 
       (.I0(\m_payload_i_reg[44] ),
        .I1(Q[1]),
        .I2(si_rs_awvalid),
        .I3(Q[0]),
        .I4(\axaddr_offset_r_reg[3] [2]),
        .O(axaddr_offset[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_wrap[11]_i_1 
       (.I0(\m_payload_i_reg[58] [0]),
        .I1(\axaddr_wrap_reg[11] ),
        .I2(\wrap_boundary_axaddr_r_reg[11]_0 ),
        .O(\axaddr_wrap_reg[11]_0 ));
  LUT6 #(
    .INIT(64'h0400FFFF04000400)) 
    \axlen_cnt[0]_i_1 
       (.I0(Q[1]),
        .I1(si_rs_awvalid),
        .I2(Q[0]),
        .I3(\m_payload_i_reg[58] [2]),
        .I4(\axlen_cnt_reg[6] [0]),
        .I5(next_pending_r_reg),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hF88F8888)) 
    \axlen_cnt[1]_i_1 
       (.I0(\wrap_boundary_axaddr_r_reg[11] ),
        .I1(\m_payload_i_reg[58] [3]),
        .I2(\axlen_cnt_reg[6] [1]),
        .I3(\axlen_cnt_reg[6] [0]),
        .I4(next_pending_r_reg),
        .O(D[1]));
  LUT5 #(
    .INIT(32'h8FF88888)) 
    \axlen_cnt[5]_i_1 
       (.I0(\wrap_boundary_axaddr_r_reg[11] ),
        .I1(\m_payload_i_reg[58] [4]),
        .I2(\axlen_cnt_reg[6] [2]),
        .I3(\axlen_cnt_reg[4] ),
        .I4(next_pending_r_reg),
        .O(D[2]));
  LUT5 #(
    .INIT(32'h8FF88888)) 
    \axlen_cnt[6]_i_1 
       (.I0(\wrap_boundary_axaddr_r_reg[11] ),
        .I1(\m_payload_i_reg[58] [5]),
        .I2(\axlen_cnt_reg[6] [3]),
        .I3(\axlen_cnt_reg[2] ),
        .I4(next_pending_r_reg),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT4 #(
    .INIT(16'h04FF)) 
    \axlen_cnt[7]_i_1__0 
       (.I0(Q[0]),
        .I1(si_rs_awvalid),
        .I2(Q[1]),
        .I3(\axaddr_wrap_reg[11] ),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT2 #(
    .INIT(4'h2)) 
    m_axi_awvalid_INST_0
       (.I0(\state_reg[1]_rep_1 ),
        .I1(\state_reg[1]_rep_0 ),
        .O(m_axi_awvalid));
  LUT2 #(
    .INIT(4'hB)) 
    \m_payload_i[39]_i_1 
       (.I0(b_push),
        .I1(si_rs_awvalid),
        .O(\m_payload_i_reg[0] ));
  LUT6 #(
    .INIT(64'hA0A000A0A8A800A8)) 
    \memory_reg[3][0]_srl4_i_1 
       (.I0(\state_reg[1]_rep_1 ),
        .I1(m_axi_awready),
        .I2(\state_reg[1]_rep_0 ),
        .I3(\cnt_read_reg[1]_rep__0 ),
        .I4(\cnt_read_reg[0]_rep_0 ),
        .I5(s_axburst_eq1_reg_0),
        .O(b_push));
  LUT5 #(
    .INIT(32'hF755F3C0)) 
    next_pending_r_i_1
       (.I0(\m_payload_i_reg[54] ),
        .I1(\axaddr_wrap_reg[11] ),
        .I2(next_pending_r_reg_0),
        .I3(\state_reg[0]_rep_0 ),
        .I4(\wrap_boundary_axaddr_r_reg[11] ),
        .O(wrap_next_pending));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    next_pending_r_i_1__0
       (.I0(\m_payload_i_reg[57] ),
        .I1(\wrap_boundary_axaddr_r_reg[11] ),
        .I2(next_pending_r_reg_1),
        .I3(\axaddr_wrap_reg[11] ),
        .I4(next_pending_r_reg),
        .O(incr_next_pending));
  LUT6 #(
    .INIT(64'h30BA30FF00FF00FF)) 
    next_pending_r_i_3__0
       (.I0(s_axburst_eq1_reg_0),
        .I1(\cnt_read_reg[0]_rep_0 ),
        .I2(\cnt_read_reg[1]_rep__0 ),
        .I3(\state_reg[1]_rep_0 ),
        .I4(m_axi_awready),
        .I5(\state_reg[1]_rep_1 ),
        .O(\axaddr_wrap_reg[11] ));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT4 #(
    .INIT(16'h00FB)) 
    next_pending_r_i_4__0
       (.I0(Q[0]),
        .I1(si_rs_awvalid),
        .I2(Q[1]),
        .I3(\axlen_cnt_reg[7] ),
        .O(next_pending_r_reg));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    s_axburst_eq0_i_1
       (.I0(wrap_next_pending),
        .I1(\m_payload_i_reg[58] [1]),
        .I2(sel_first_i),
        .I3(incr_next_pending),
        .O(s_axburst_eq0_reg));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT4 #(
    .INIT(16'hABA8)) 
    s_axburst_eq1_i_1
       (.I0(wrap_next_pending),
        .I1(\m_payload_i_reg[58] [1]),
        .I2(sel_first_i),
        .I3(incr_next_pending),
        .O(s_axburst_eq1_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFF88888F88)) 
    sel_first_i_1
       (.I0(sel_first__0),
        .I1(\axaddr_wrap_reg[11] ),
        .I2(\state_reg[1]_rep_0 ),
        .I3(si_rs_awvalid),
        .I4(\state_reg[1]_rep_1 ),
        .I5(areset_d1),
        .O(sel_first_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFF88888F88)) 
    sel_first_i_1__0
       (.I0(sel_first_reg_1),
        .I1(\axaddr_wrap_reg[11] ),
        .I2(\state_reg[1]_rep_0 ),
        .I3(si_rs_awvalid),
        .I4(\state_reg[1]_rep_1 ),
        .I5(areset_d1),
        .O(sel_first_reg_0));
  LUT6 #(
    .INIT(64'hFFFFFF04FF04FF04)) 
    sel_first_i_1__1
       (.I0(\state_reg[1]_rep_0 ),
        .I1(si_rs_awvalid),
        .I2(\state_reg[1]_rep_1 ),
        .I3(areset_d1),
        .I4(\axaddr_wrap_reg[11] ),
        .I5(sel_first_reg_2),
        .O(sel_first_i));
  LUT6 #(
    .INIT(64'h3F223F2E3FEE3FEE)) 
    \state[0]_i_1 
       (.I0(si_rs_awvalid),
        .I1(\state_reg[1]_rep_1 ),
        .I2(\cnt_read_reg[0]_rep ),
        .I3(\state_reg[1]_rep_0 ),
        .I4(s_axburst_eq1_reg_0),
        .I5(m_axi_awready),
        .O(\state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2020E0200000E000)) 
    \state[1]_i_1 
       (.I0(m_axi_awready),
        .I1(\state_reg[1]_rep_0 ),
        .I2(\state_reg[1]_rep_1 ),
        .I3(\cnt_read_reg[1]_rep__0 ),
        .I4(\cnt_read_reg[0]_rep_0 ),
        .I5(s_axburst_eq1_reg_0),
        .O(\state[1]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "state_reg[0]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\state[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "state_reg[0]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\state[0]_i_1_n_0 ),
        .Q(\state_reg[1]_rep_1 ),
        .R(areset_d1));
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "state_reg[1]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(areset_d1));
  (* IS_FANOUT_CONSTRAINED = "1" *) 
  (* KEEP = "yes" *) 
  (* ORIG_CELL_NAME = "state_reg[1]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(\state_reg[1]_rep_0 ),
        .R(areset_d1));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \wrap_boundary_axaddr_r[11]_i_1__0 
       (.I0(\state_reg[1]_rep_0 ),
        .I1(si_rs_awvalid),
        .I2(\state_reg[1]_rep_1 ),
        .O(\wrap_boundary_axaddr_r_reg[11] ));
  LUT6 #(
    .INIT(64'hFFCF0000AAAAFFEF)) 
    \wrap_cnt_r[0]_i_1 
       (.I0(\m_payload_i_reg[0]_0 ),
        .I1(Q[1]),
        .I2(si_rs_awvalid),
        .I3(Q[0]),
        .I4(\wrap_second_len_r_reg[3]_0 [0]),
        .I5(\wrap_second_len_r[0]_i_2_n_0 ),
        .O(\wrap_cnt_r_reg[3] [0]));
  LUT2 #(
    .INIT(4'h6)) 
    \wrap_cnt_r[1]_i_1 
       (.I0(\wrap_second_len_r_reg[3] [1]),
        .I1(\wrap_cnt_r[3]_i_2_n_0 ),
        .O(\wrap_cnt_r_reg[3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \wrap_cnt_r[2]_i_1 
       (.I0(\wrap_second_len_r_reg[3] [2]),
        .I1(\wrap_cnt_r[3]_i_2_n_0 ),
        .I2(\wrap_second_len_r_reg[3] [1]),
        .O(\wrap_cnt_r_reg[3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \wrap_cnt_r[3]_i_1 
       (.I0(\wrap_second_len_r_reg[3] [3]),
        .I1(\wrap_second_len_r_reg[3] [1]),
        .I2(\wrap_cnt_r[3]_i_2_n_0 ),
        .I3(\wrap_second_len_r_reg[3] [2]),
        .O(\wrap_cnt_r_reg[3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT5 #(
    .INIT(32'h0000FFEF)) 
    \wrap_cnt_r[3]_i_2 
       (.I0(\m_payload_i_reg[54]_0 ),
        .I1(axaddr_offset[0]),
        .I2(\axaddr_offset_r[1]_i_2_n_0 ),
        .I3(axaddr_offset[2]),
        .I4(\wrap_cnt_r[3]_i_3_n_0 ),
        .O(\wrap_cnt_r[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAFFEF)) 
    \wrap_cnt_r[3]_i_3 
       (.I0(\m_payload_i_reg[0]_0 ),
        .I1(Q[1]),
        .I2(si_rs_awvalid),
        .I3(Q[0]),
        .I4(\wrap_second_len_r_reg[3]_0 [0]),
        .O(\wrap_cnt_r[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h4444404444444544)) 
    \wrap_second_len_r[0]_i_1 
       (.I0(\m_payload_i_reg[0]_0 ),
        .I1(\wrap_second_len_r_reg[3]_0 [0]),
        .I2(Q[0]),
        .I3(si_rs_awvalid),
        .I4(Q[1]),
        .I5(\wrap_second_len_r[0]_i_2_n_0 ),
        .O(\wrap_second_len_r_reg[3] [0]));
  LUT6 #(
    .INIT(64'h0000000000000D00)) 
    \wrap_second_len_r[0]_i_2 
       (.I0(\axaddr_offset_r_reg[3] [2]),
        .I1(\wrap_boundary_axaddr_r_reg[11] ),
        .I2(\m_payload_i_reg[44] ),
        .I3(\axaddr_offset_r[1]_i_2_n_0 ),
        .I4(axaddr_offset[0]),
        .I5(\m_payload_i_reg[54]_0 ),
        .O(\wrap_second_len_r[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h3C2CFFFF3C2C0000)) 
    \wrap_second_len_r[1]_i_1 
       (.I0(\m_payload_i_reg[54]_0 ),
        .I1(axaddr_offset[0]),
        .I2(\axaddr_offset_r[1]_i_2_n_0 ),
        .I3(axaddr_offset[2]),
        .I4(\wrap_boundary_axaddr_r_reg[11] ),
        .I5(\wrap_second_len_r_reg[3]_0 [1]),
        .O(\wrap_second_len_r_reg[3] [1]));
  LUT6 #(
    .INIT(64'h9A8AFFFF9A8A0000)) 
    \wrap_second_len_r[2]_i_1 
       (.I0(\m_payload_i_reg[54]_0 ),
        .I1(axaddr_offset[0]),
        .I2(\axaddr_offset_r[1]_i_2_n_0 ),
        .I3(axaddr_offset[2]),
        .I4(\wrap_boundary_axaddr_r_reg[11] ),
        .I5(\wrap_second_len_r_reg[3]_0 [2]),
        .O(\wrap_second_len_r_reg[3] [2]));
  LUT6 #(
    .INIT(64'hEF00FFFFEF00EF00)) 
    \wrap_second_len_r[3]_i_1 
       (.I0(\m_payload_i_reg[54]_0 ),
        .I1(axaddr_offset[0]),
        .I2(\axaddr_offset_r[1]_i_2_n_0 ),
        .I3(\m_payload_i_reg[44] ),
        .I4(\wrap_boundary_axaddr_r_reg[11] ),
        .I5(\wrap_second_len_r_reg[3]_0 [3]),
        .O(\wrap_second_len_r_reg[3] [3]));
endmodule

module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_wrap_cmd
   (next_pending_r_reg_0,
    sel_first_reg_0,
    next_pending_r_reg_1,
    Q,
    \axaddr_wrap_reg[11]_0 ,
    m_axi_awaddr,
    \axaddr_offset_r_reg[3]_0 ,
    \wrap_second_len_r_reg[3]_0 ,
    wrap_next_pending,
    aclk,
    sel_first_reg_1,
    \m_payload_i_reg[55] ,
    \state_reg[1]_rep ,
    \state_reg[0]_rep ,
    si_rs_awvalid,
    \state_reg[1]_rep_0 ,
    \cnt_read_reg[0]_rep ,
    \m_payload_i_reg[44] ,
    \m_payload_i_reg[44]_0 ,
    sel_first_reg_2,
    \axaddr_incr_reg[11] ,
    sel_first_reg_3,
    sel_first_reg_4,
    sel_first_reg_5,
    sel_first_reg_6,
    sel_first_reg_7,
    \state_reg[1] ,
    \wrap_second_len_r_reg[3]_1 ,
    E,
    \wrap_second_len_r_reg[3]_2 ,
    \m_payload_i_reg[6] ,
    \m_payload_i_reg[11] );
  output next_pending_r_reg_0;
  output sel_first_reg_0;
  output next_pending_r_reg_1;
  output [0:0]Q;
  output \axaddr_wrap_reg[11]_0 ;
  output [11:0]m_axi_awaddr;
  output [3:0]\axaddr_offset_r_reg[3]_0 ;
  output [3:0]\wrap_second_len_r_reg[3]_0 ;
  input wrap_next_pending;
  input aclk;
  input sel_first_reg_1;
  input [18:0]\m_payload_i_reg[55] ;
  input \state_reg[1]_rep ;
  input \state_reg[0]_rep ;
  input si_rs_awvalid;
  input \state_reg[1]_rep_0 ;
  input \cnt_read_reg[0]_rep ;
  input \m_payload_i_reg[44] ;
  input \m_payload_i_reg[44]_0 ;
  input sel_first_reg_2;
  input [6:0]\axaddr_incr_reg[11] ;
  input sel_first_reg_3;
  input sel_first_reg_4;
  input sel_first_reg_5;
  input sel_first_reg_6;
  input sel_first_reg_7;
  input [3:0]\state_reg[1] ;
  input [3:0]\wrap_second_len_r_reg[3]_1 ;
  input [0:0]E;
  input [3:0]\wrap_second_len_r_reg[3]_2 ;
  input [6:0]\m_payload_i_reg[6] ;
  input [0:0]\m_payload_i_reg[11] ;

  wire [0:0]E;
  wire [0:0]Q;
  wire aclk;
  wire [6:0]\axaddr_incr_reg[11] ;
  wire [3:0]\axaddr_offset_r_reg[3]_0 ;
  wire [11:1]axaddr_wrap;
  wire \axaddr_wrap[0]_i_1_n_0 ;
  wire \axaddr_wrap[10]_i_1_n_0 ;
  wire \axaddr_wrap[10]_i_2_n_0 ;
  wire \axaddr_wrap[10]_i_3_n_0 ;
  wire \axaddr_wrap[10]_i_4_n_0 ;
  wire \axaddr_wrap[1]_i_1_n_0 ;
  wire \axaddr_wrap[2]_i_1_n_0 ;
  wire \axaddr_wrap[2]_i_2_n_0 ;
  wire \axaddr_wrap[3]_i_1_n_0 ;
  wire \axaddr_wrap[3]_i_2_n_0 ;
  wire \axaddr_wrap[4]_i_1_n_0 ;
  wire \axaddr_wrap[4]_i_2_n_0 ;
  wire \axaddr_wrap[5]_i_1_n_0 ;
  wire \axaddr_wrap[5]_i_2_n_0 ;
  wire \axaddr_wrap[6]_i_1_n_0 ;
  wire \axaddr_wrap[6]_i_2_n_0 ;
  wire \axaddr_wrap[7]_i_1_n_0 ;
  wire \axaddr_wrap[7]_i_2_n_0 ;
  wire \axaddr_wrap[8]_i_1_n_0 ;
  wire \axaddr_wrap[8]_i_2_n_0 ;
  wire \axaddr_wrap[9]_i_1_n_0 ;
  wire \axaddr_wrap[9]_i_2_n_0 ;
  wire \axaddr_wrap_reg[11]_0 ;
  wire \axlen_cnt[0]_i_1__0_n_0 ;
  wire \axlen_cnt[1]_i_1__0_n_0 ;
  wire \axlen_cnt[2]_i_1__0_n_0 ;
  wire \axlen_cnt[3]_i_1__0_n_0 ;
  wire \axlen_cnt_reg_n_0_[0] ;
  wire \axlen_cnt_reg_n_0_[1] ;
  wire \axlen_cnt_reg_n_0_[2] ;
  wire \axlen_cnt_reg_n_0_[3] ;
  wire \cnt_read_reg[0]_rep ;
  wire [11:0]m_axi_awaddr;
  wire [0:0]\m_payload_i_reg[11] ;
  wire \m_payload_i_reg[44] ;
  wire \m_payload_i_reg[44]_0 ;
  wire [18:0]\m_payload_i_reg[55] ;
  wire [6:0]\m_payload_i_reg[6] ;
  wire next_pending_r_reg_0;
  wire next_pending_r_reg_1;
  wire sel_first_reg_0;
  wire sel_first_reg_1;
  wire sel_first_reg_2;
  wire sel_first_reg_3;
  wire sel_first_reg_4;
  wire sel_first_reg_5;
  wire sel_first_reg_6;
  wire sel_first_reg_7;
  wire si_rs_awvalid;
  wire \state_reg[0]_rep ;
  wire [3:0]\state_reg[1] ;
  wire \state_reg[1]_rep ;
  wire \state_reg[1]_rep_0 ;
  wire [11:0]wrap_boundary_axaddr_r;
  wire [3:0]wrap_cnt_r;
  wire wrap_next_pending;
  wire [3:0]\wrap_second_len_r_reg[3]_0 ;
  wire [3:0]\wrap_second_len_r_reg[3]_1 ;
  wire [3:0]\wrap_second_len_r_reg[3]_2 ;

  FDRE \axaddr_offset_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\state_reg[1] [0]),
        .Q(\axaddr_offset_r_reg[3]_0 [0]),
        .R(1'b0));
  FDRE \axaddr_offset_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\state_reg[1] [1]),
        .Q(\axaddr_offset_r_reg[3]_0 [1]),
        .R(1'b0));
  FDRE \axaddr_offset_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\state_reg[1] [2]),
        .Q(\axaddr_offset_r_reg[3]_0 [2]),
        .R(1'b0));
  FDRE \axaddr_offset_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\state_reg[1] [3]),
        .Q(\axaddr_offset_r_reg[3]_0 [3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hB888B8BBB8BBB888)) 
    \axaddr_wrap[0]_i_1 
       (.I0(\m_payload_i_reg[55] [0]),
        .I1(\cnt_read_reg[0]_rep ),
        .I2(wrap_boundary_axaddr_r[0]),
        .I3(\axaddr_wrap[10]_i_2_n_0 ),
        .I4(Q),
        .I5(\m_payload_i_reg[44]_0 ),
        .O(\axaddr_wrap[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB888B8BBB8BBB888)) 
    \axaddr_wrap[10]_i_1 
       (.I0(\m_payload_i_reg[55] [10]),
        .I1(\cnt_read_reg[0]_rep ),
        .I2(wrap_boundary_axaddr_r[10]),
        .I3(\axaddr_wrap[10]_i_2_n_0 ),
        .I4(axaddr_wrap[10]),
        .I5(\axaddr_wrap[10]_i_3_n_0 ),
        .O(\axaddr_wrap[10]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h09)) 
    \axaddr_wrap[10]_i_2 
       (.I0(wrap_cnt_r[3]),
        .I1(\axlen_cnt_reg_n_0_[3] ),
        .I2(\axaddr_wrap[10]_i_4_n_0 ),
        .O(\axaddr_wrap[10]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \axaddr_wrap[10]_i_3 
       (.I0(axaddr_wrap[9]),
        .I1(\axaddr_wrap[9]_i_2_n_0 ),
        .O(\axaddr_wrap[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \axaddr_wrap[10]_i_4 
       (.I0(wrap_cnt_r[0]),
        .I1(\axlen_cnt_reg_n_0_[0] ),
        .I2(\axlen_cnt_reg_n_0_[2] ),
        .I3(wrap_cnt_r[2]),
        .I4(\axlen_cnt_reg_n_0_[1] ),
        .I5(wrap_cnt_r[1]),
        .O(\axaddr_wrap[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    \axaddr_wrap[11]_i_2 
       (.I0(wrap_boundary_axaddr_r[11]),
        .I1(\axaddr_wrap[10]_i_2_n_0 ),
        .I2(axaddr_wrap[11]),
        .I3(axaddr_wrap[9]),
        .I4(\axaddr_wrap[9]_i_2_n_0 ),
        .I5(axaddr_wrap[10]),
        .O(\axaddr_wrap_reg[11]_0 ));
  LUT6 #(
    .INIT(64'hB888B8BBB8BBB888)) 
    \axaddr_wrap[1]_i_1 
       (.I0(\m_payload_i_reg[55] [1]),
        .I1(\cnt_read_reg[0]_rep ),
        .I2(wrap_boundary_axaddr_r[1]),
        .I3(\axaddr_wrap[10]_i_2_n_0 ),
        .I4(axaddr_wrap[1]),
        .I5(\m_payload_i_reg[44] ),
        .O(\axaddr_wrap[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axaddr_wrap[2]_i_1 
       (.I0(\m_payload_i_reg[55] [2]),
        .I1(\cnt_read_reg[0]_rep ),
        .I2(wrap_boundary_axaddr_r[2]),
        .I3(\axaddr_wrap[10]_i_2_n_0 ),
        .I4(\axaddr_wrap[2]_i_2_n_0 ),
        .O(\axaddr_wrap[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF3070CF8)) 
    \axaddr_wrap[2]_i_2 
       (.I0(Q),
        .I1(axaddr_wrap[1]),
        .I2(\m_payload_i_reg[55] [13]),
        .I3(\m_payload_i_reg[55] [12]),
        .I4(axaddr_wrap[2]),
        .O(\axaddr_wrap[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axaddr_wrap[3]_i_1 
       (.I0(\m_payload_i_reg[55] [3]),
        .I1(\cnt_read_reg[0]_rep ),
        .I2(wrap_boundary_axaddr_r[3]),
        .I3(\axaddr_wrap[10]_i_2_n_0 ),
        .I4(\axaddr_wrap[3]_i_2_n_0 ),
        .O(\axaddr_wrap[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h003F0F7FFFC0F080)) 
    \axaddr_wrap[3]_i_2 
       (.I0(Q),
        .I1(axaddr_wrap[1]),
        .I2(axaddr_wrap[2]),
        .I3(\m_payload_i_reg[55] [13]),
        .I4(\m_payload_i_reg[55] [12]),
        .I5(axaddr_wrap[3]),
        .O(\axaddr_wrap[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888B8BBB8BBB888)) 
    \axaddr_wrap[4]_i_1 
       (.I0(\m_payload_i_reg[55] [4]),
        .I1(\cnt_read_reg[0]_rep ),
        .I2(wrap_boundary_axaddr_r[4]),
        .I3(\axaddr_wrap[10]_i_2_n_0 ),
        .I4(axaddr_wrap[4]),
        .I5(\axaddr_wrap[4]_i_2_n_0 ),
        .O(\axaddr_wrap[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA88AA8880808000)) 
    \axaddr_wrap[4]_i_2 
       (.I0(axaddr_wrap[3]),
        .I1(axaddr_wrap[2]),
        .I2(axaddr_wrap[1]),
        .I3(\m_payload_i_reg[55] [12]),
        .I4(Q),
        .I5(\m_payload_i_reg[55] [13]),
        .O(\axaddr_wrap[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888B8BBB8BBB888)) 
    \axaddr_wrap[5]_i_1 
       (.I0(\m_payload_i_reg[55] [5]),
        .I1(\cnt_read_reg[0]_rep ),
        .I2(wrap_boundary_axaddr_r[5]),
        .I3(\axaddr_wrap[10]_i_2_n_0 ),
        .I4(axaddr_wrap[5]),
        .I5(\axaddr_wrap[5]_i_2_n_0 ),
        .O(\axaddr_wrap[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \axaddr_wrap[5]_i_2 
       (.I0(axaddr_wrap[4]),
        .I1(\axaddr_wrap[4]_i_2_n_0 ),
        .O(\axaddr_wrap[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888B8BBB8BBB888)) 
    \axaddr_wrap[6]_i_1 
       (.I0(\m_payload_i_reg[55] [6]),
        .I1(\cnt_read_reg[0]_rep ),
        .I2(wrap_boundary_axaddr_r[6]),
        .I3(\axaddr_wrap[10]_i_2_n_0 ),
        .I4(axaddr_wrap[6]),
        .I5(\axaddr_wrap[6]_i_2_n_0 ),
        .O(\axaddr_wrap[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \axaddr_wrap[6]_i_2 
       (.I0(axaddr_wrap[5]),
        .I1(\axaddr_wrap[4]_i_2_n_0 ),
        .I2(axaddr_wrap[4]),
        .O(\axaddr_wrap[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888B8BBB8BBB888)) 
    \axaddr_wrap[7]_i_1 
       (.I0(\m_payload_i_reg[55] [7]),
        .I1(\cnt_read_reg[0]_rep ),
        .I2(wrap_boundary_axaddr_r[7]),
        .I3(\axaddr_wrap[10]_i_2_n_0 ),
        .I4(axaddr_wrap[7]),
        .I5(\axaddr_wrap[7]_i_2_n_0 ),
        .O(\axaddr_wrap[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \axaddr_wrap[7]_i_2 
       (.I0(axaddr_wrap[6]),
        .I1(axaddr_wrap[4]),
        .I2(\axaddr_wrap[4]_i_2_n_0 ),
        .I3(axaddr_wrap[5]),
        .O(\axaddr_wrap[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888B8BBB8BBB888)) 
    \axaddr_wrap[8]_i_1 
       (.I0(\m_payload_i_reg[55] [8]),
        .I1(\cnt_read_reg[0]_rep ),
        .I2(wrap_boundary_axaddr_r[8]),
        .I3(\axaddr_wrap[10]_i_2_n_0 ),
        .I4(axaddr_wrap[8]),
        .I5(\axaddr_wrap[8]_i_2_n_0 ),
        .O(\axaddr_wrap[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \axaddr_wrap[8]_i_2 
       (.I0(axaddr_wrap[7]),
        .I1(axaddr_wrap[5]),
        .I2(\axaddr_wrap[4]_i_2_n_0 ),
        .I3(axaddr_wrap[4]),
        .I4(axaddr_wrap[6]),
        .O(\axaddr_wrap[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888B8BBB8BBB888)) 
    \axaddr_wrap[9]_i_1 
       (.I0(\m_payload_i_reg[55] [9]),
        .I1(\cnt_read_reg[0]_rep ),
        .I2(wrap_boundary_axaddr_r[9]),
        .I3(\axaddr_wrap[10]_i_2_n_0 ),
        .I4(axaddr_wrap[9]),
        .I5(\axaddr_wrap[9]_i_2_n_0 ),
        .O(\axaddr_wrap[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \axaddr_wrap[9]_i_2 
       (.I0(axaddr_wrap[8]),
        .I1(axaddr_wrap[6]),
        .I2(axaddr_wrap[4]),
        .I3(\axaddr_wrap[4]_i_2_n_0 ),
        .I4(axaddr_wrap[5]),
        .I5(axaddr_wrap[7]),
        .O(\axaddr_wrap[9]_i_2_n_0 ));
  FDRE \axaddr_wrap_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(\axaddr_wrap[0]_i_1_n_0 ),
        .Q(Q),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(\axaddr_wrap[10]_i_1_n_0 ),
        .Q(axaddr_wrap[10]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(\m_payload_i_reg[11] ),
        .Q(axaddr_wrap[11]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(\axaddr_wrap[1]_i_1_n_0 ),
        .Q(axaddr_wrap[1]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(\axaddr_wrap[2]_i_1_n_0 ),
        .Q(axaddr_wrap[2]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(\axaddr_wrap[3]_i_1_n_0 ),
        .Q(axaddr_wrap[3]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(\axaddr_wrap[4]_i_1_n_0 ),
        .Q(axaddr_wrap[4]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(\axaddr_wrap[5]_i_1_n_0 ),
        .Q(axaddr_wrap[5]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(\axaddr_wrap[6]_i_1_n_0 ),
        .Q(axaddr_wrap[6]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(\axaddr_wrap[7]_i_1_n_0 ),
        .Q(axaddr_wrap[7]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(\axaddr_wrap[8]_i_1_n_0 ),
        .Q(axaddr_wrap[8]),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(\axaddr_wrap[9]_i_1_n_0 ),
        .Q(axaddr_wrap[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hA3A3A3A3A3A3A3A0)) 
    \axlen_cnt[0]_i_1__0 
       (.I0(\m_payload_i_reg[55] [15]),
        .I1(\axlen_cnt_reg_n_0_[0] ),
        .I2(\state_reg[1]_rep ),
        .I3(\axlen_cnt_reg_n_0_[3] ),
        .I4(\axlen_cnt_reg_n_0_[2] ),
        .I5(\axlen_cnt_reg_n_0_[1] ),
        .O(\axlen_cnt[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAC3AAC3AAC3AAC0)) 
    \axlen_cnt[1]_i_1__0 
       (.I0(\m_payload_i_reg[55] [16]),
        .I1(\axlen_cnt_reg_n_0_[1] ),
        .I2(\axlen_cnt_reg_n_0_[0] ),
        .I3(\state_reg[1]_rep ),
        .I4(\axlen_cnt_reg_n_0_[3] ),
        .I5(\axlen_cnt_reg_n_0_[2] ),
        .O(\axlen_cnt[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAAACCC3AAAACCC0)) 
    \axlen_cnt[2]_i_1__0 
       (.I0(\m_payload_i_reg[55] [17]),
        .I1(\axlen_cnt_reg_n_0_[2] ),
        .I2(\axlen_cnt_reg_n_0_[0] ),
        .I3(\axlen_cnt_reg_n_0_[1] ),
        .I4(\state_reg[1]_rep ),
        .I5(\axlen_cnt_reg_n_0_[3] ),
        .O(\axlen_cnt[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAACCCCCCC0)) 
    \axlen_cnt[3]_i_1__0 
       (.I0(\m_payload_i_reg[55] [18]),
        .I1(\axlen_cnt_reg_n_0_[3] ),
        .I2(\axlen_cnt_reg_n_0_[2] ),
        .I3(\axlen_cnt_reg_n_0_[1] ),
        .I4(\axlen_cnt_reg_n_0_[0] ),
        .I5(\state_reg[1]_rep ),
        .O(\axlen_cnt[3]_i_1__0_n_0 ));
  FDRE \axlen_cnt_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt[0]_i_1__0_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt[1]_i_1__0_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt[2]_i_1__0_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(\axlen_cnt[3]_i_1__0_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[3] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \m_axi_awaddr[0]_INST_0 
       (.I0(\m_payload_i_reg[55] [0]),
        .I1(sel_first_reg_0),
        .I2(Q),
        .I3(\m_payload_i_reg[55] [14]),
        .I4(sel_first_reg_7),
        .O(m_axi_awaddr[0]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \m_axi_awaddr[10]_INST_0 
       (.I0(\m_payload_i_reg[55] [10]),
        .I1(sel_first_reg_0),
        .I2(axaddr_wrap[10]),
        .I3(\m_payload_i_reg[55] [14]),
        .I4(sel_first_reg_3),
        .O(m_axi_awaddr[10]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_awaddr[11]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(axaddr_wrap[11]),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [11]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [6]),
        .O(m_axi_awaddr[11]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \m_axi_awaddr[1]_INST_0 
       (.I0(\m_payload_i_reg[55] [1]),
        .I1(sel_first_reg_0),
        .I2(axaddr_wrap[1]),
        .I3(\m_payload_i_reg[55] [14]),
        .I4(sel_first_reg_6),
        .O(m_axi_awaddr[1]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_awaddr[2]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(axaddr_wrap[2]),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [2]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [0]),
        .O(m_axi_awaddr[2]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_awaddr[3]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(axaddr_wrap[3]),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [3]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [1]),
        .O(m_axi_awaddr[3]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \m_axi_awaddr[4]_INST_0 
       (.I0(\m_payload_i_reg[55] [4]),
        .I1(sel_first_reg_0),
        .I2(axaddr_wrap[4]),
        .I3(\m_payload_i_reg[55] [14]),
        .I4(sel_first_reg_5),
        .O(m_axi_awaddr[4]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_awaddr[5]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(axaddr_wrap[5]),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [5]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [2]),
        .O(m_axi_awaddr[5]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_awaddr[6]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(axaddr_wrap[6]),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [6]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [3]),
        .O(m_axi_awaddr[6]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \m_axi_awaddr[7]_INST_0 
       (.I0(\m_payload_i_reg[55] [7]),
        .I1(sel_first_reg_0),
        .I2(axaddr_wrap[7]),
        .I3(\m_payload_i_reg[55] [14]),
        .I4(sel_first_reg_4),
        .O(m_axi_awaddr[7]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_awaddr[8]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(axaddr_wrap[8]),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [8]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [4]),
        .O(m_axi_awaddr[8]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_awaddr[9]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(axaddr_wrap[9]),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [9]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [5]),
        .O(m_axi_awaddr[9]));
  LUT6 #(
    .INIT(64'hFBFBFBFBFBFBFB00)) 
    next_pending_r_i_3
       (.I0(\state_reg[0]_rep ),
        .I1(si_rs_awvalid),
        .I2(\state_reg[1]_rep_0 ),
        .I3(\axlen_cnt_reg_n_0_[3] ),
        .I4(\axlen_cnt_reg_n_0_[2] ),
        .I5(\axlen_cnt_reg_n_0_[1] ),
        .O(next_pending_r_reg_1));
  FDRE next_pending_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(wrap_next_pending),
        .Q(next_pending_r_reg_0),
        .R(1'b0));
  FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(sel_first_reg_1),
        .Q(sel_first_reg_0),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[0] 
       (.C(aclk),
        .CE(\state_reg[1]_rep ),
        .D(\m_payload_i_reg[6] [0]),
        .Q(wrap_boundary_axaddr_r[0]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[10] 
       (.C(aclk),
        .CE(\state_reg[1]_rep ),
        .D(\m_payload_i_reg[55] [10]),
        .Q(wrap_boundary_axaddr_r[10]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[11] 
       (.C(aclk),
        .CE(\state_reg[1]_rep ),
        .D(\m_payload_i_reg[55] [11]),
        .Q(wrap_boundary_axaddr_r[11]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[1] 
       (.C(aclk),
        .CE(\state_reg[1]_rep ),
        .D(\m_payload_i_reg[6] [1]),
        .Q(wrap_boundary_axaddr_r[1]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[2] 
       (.C(aclk),
        .CE(\state_reg[1]_rep ),
        .D(\m_payload_i_reg[6] [2]),
        .Q(wrap_boundary_axaddr_r[2]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[3] 
       (.C(aclk),
        .CE(\state_reg[1]_rep ),
        .D(\m_payload_i_reg[6] [3]),
        .Q(wrap_boundary_axaddr_r[3]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[4] 
       (.C(aclk),
        .CE(\state_reg[1]_rep ),
        .D(\m_payload_i_reg[6] [4]),
        .Q(wrap_boundary_axaddr_r[4]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[5] 
       (.C(aclk),
        .CE(\state_reg[1]_rep ),
        .D(\m_payload_i_reg[6] [5]),
        .Q(wrap_boundary_axaddr_r[5]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[6] 
       (.C(aclk),
        .CE(\state_reg[1]_rep ),
        .D(\m_payload_i_reg[6] [6]),
        .Q(wrap_boundary_axaddr_r[6]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[7] 
       (.C(aclk),
        .CE(\state_reg[1]_rep ),
        .D(\m_payload_i_reg[55] [7]),
        .Q(wrap_boundary_axaddr_r[7]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[8] 
       (.C(aclk),
        .CE(\state_reg[1]_rep ),
        .D(\m_payload_i_reg[55] [8]),
        .Q(wrap_boundary_axaddr_r[8]),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[9] 
       (.C(aclk),
        .CE(\state_reg[1]_rep ),
        .D(\m_payload_i_reg[55] [9]),
        .Q(wrap_boundary_axaddr_r[9]),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_2 [0]),
        .Q(wrap_cnt_r[0]),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_2 [1]),
        .Q(wrap_cnt_r[1]),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_2 [2]),
        .Q(wrap_cnt_r[2]),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_2 [3]),
        .Q(wrap_cnt_r[3]),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [0]),
        .Q(\wrap_second_len_r_reg[3]_0 [0]),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [1]),
        .Q(\wrap_second_len_r_reg[3]_0 [1]),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [2]),
        .Q(\wrap_second_len_r_reg[3]_0 [2]),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [3]),
        .Q(\wrap_second_len_r_reg[3]_0 [3]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_17_b2s_wrap_cmd" *) 
module streaming_auto_pc_0_axi_protocol_converter_v2_1_17_b2s_wrap_cmd_3
   (sel_first_reg_0,
    s_axburst_eq0_reg,
    s_axburst_eq1_reg,
    Q,
    m_axi_araddr,
    \axaddr_offset_r_reg[3]_0 ,
    \wrap_second_len_r_reg[3]_0 ,
    aclk,
    sel_first_reg_1,
    \m_payload_i_reg[55] ,
    sel_first_i,
    incr_next_pending,
    \m_payload_i_reg[55]_0 ,
    \state_reg[1]_rep ,
    E,
    \state_reg[1] ,
    si_rs_arvalid,
    \m_payload_i_reg[44] ,
    \m_payload_i_reg[44]_0 ,
    sel_first_reg_2,
    \axaddr_incr_reg[11] ,
    \state_reg[0]_rep ,
    m_axi_arready,
    \state_reg[0] ,
    \wrap_second_len_r_reg[3]_1 ,
    m_valid_i_reg,
    \wrap_second_len_r_reg[3]_2 ,
    \m_payload_i_reg[6] );
  output sel_first_reg_0;
  output s_axburst_eq0_reg;
  output s_axburst_eq1_reg;
  output [0:0]Q;
  output [11:0]m_axi_araddr;
  output [3:0]\axaddr_offset_r_reg[3]_0 ;
  output [3:0]\wrap_second_len_r_reg[3]_0 ;
  input aclk;
  input sel_first_reg_1;
  input [18:0]\m_payload_i_reg[55] ;
  input sel_first_i;
  input incr_next_pending;
  input \m_payload_i_reg[55]_0 ;
  input \state_reg[1]_rep ;
  input [0:0]E;
  input [1:0]\state_reg[1] ;
  input si_rs_arvalid;
  input \m_payload_i_reg[44] ;
  input \m_payload_i_reg[44]_0 ;
  input sel_first_reg_2;
  input [11:0]\axaddr_incr_reg[11] ;
  input \state_reg[0]_rep ;
  input m_axi_arready;
  input [3:0]\state_reg[0] ;
  input [3:0]\wrap_second_len_r_reg[3]_1 ;
  input [0:0]m_valid_i_reg;
  input [3:0]\wrap_second_len_r_reg[3]_2 ;
  input [6:0]\m_payload_i_reg[6] ;

  wire [0:0]E;
  wire [0:0]Q;
  wire aclk;
  wire [11:0]\axaddr_incr_reg[11] ;
  wire [3:0]\axaddr_offset_r_reg[3]_0 ;
  wire \axaddr_wrap[0]_i_1__0_n_0 ;
  wire \axaddr_wrap[10]_i_1__0_n_0 ;
  wire \axaddr_wrap[10]_i_2__0_n_0 ;
  wire \axaddr_wrap[10]_i_3__0_n_0 ;
  wire \axaddr_wrap[10]_i_4__0_n_0 ;
  wire \axaddr_wrap[11]_i_1__0_n_0 ;
  wire \axaddr_wrap[11]_i_2__0_n_0 ;
  wire \axaddr_wrap[1]_i_1__0_n_0 ;
  wire \axaddr_wrap[2]_i_1__0_n_0 ;
  wire \axaddr_wrap[2]_i_2__0_n_0 ;
  wire \axaddr_wrap[3]_i_1__0_n_0 ;
  wire \axaddr_wrap[3]_i_2__0_n_0 ;
  wire \axaddr_wrap[4]_i_1__0_n_0 ;
  wire \axaddr_wrap[4]_i_2__0_n_0 ;
  wire \axaddr_wrap[5]_i_1__0_n_0 ;
  wire \axaddr_wrap[5]_i_2__0_n_0 ;
  wire \axaddr_wrap[6]_i_1__0_n_0 ;
  wire \axaddr_wrap[6]_i_2__0_n_0 ;
  wire \axaddr_wrap[7]_i_1__0_n_0 ;
  wire \axaddr_wrap[7]_i_2__0_n_0 ;
  wire \axaddr_wrap[8]_i_1__0_n_0 ;
  wire \axaddr_wrap[8]_i_2__0_n_0 ;
  wire \axaddr_wrap[9]_i_1__0_n_0 ;
  wire \axaddr_wrap[9]_i_2__0_n_0 ;
  wire \axaddr_wrap_reg_n_0_[10] ;
  wire \axaddr_wrap_reg_n_0_[11] ;
  wire \axaddr_wrap_reg_n_0_[1] ;
  wire \axaddr_wrap_reg_n_0_[2] ;
  wire \axaddr_wrap_reg_n_0_[3] ;
  wire \axaddr_wrap_reg_n_0_[4] ;
  wire \axaddr_wrap_reg_n_0_[5] ;
  wire \axaddr_wrap_reg_n_0_[6] ;
  wire \axaddr_wrap_reg_n_0_[7] ;
  wire \axaddr_wrap_reg_n_0_[8] ;
  wire \axaddr_wrap_reg_n_0_[9] ;
  wire \axlen_cnt[0]_i_1__1_n_0 ;
  wire \axlen_cnt[1]_i_1__1_n_0 ;
  wire \axlen_cnt[2]_i_1__1_n_0 ;
  wire \axlen_cnt[3]_i_1__1_n_0 ;
  wire \axlen_cnt_reg_n_0_[0] ;
  wire \axlen_cnt_reg_n_0_[1] ;
  wire \axlen_cnt_reg_n_0_[2] ;
  wire \axlen_cnt_reg_n_0_[3] ;
  wire incr_next_pending;
  wire [11:0]m_axi_araddr;
  wire m_axi_arready;
  wire \m_payload_i_reg[44] ;
  wire \m_payload_i_reg[44]_0 ;
  wire [18:0]\m_payload_i_reg[55] ;
  wire \m_payload_i_reg[55]_0 ;
  wire [6:0]\m_payload_i_reg[6] ;
  wire [0:0]m_valid_i_reg;
  wire next_pending_r_i_2__1_n_0;
  wire next_pending_r_reg_n_0;
  wire s_axburst_eq0_reg;
  wire s_axburst_eq1_reg;
  wire sel_first_i;
  wire sel_first_reg_0;
  wire sel_first_reg_1;
  wire sel_first_reg_2;
  wire si_rs_arvalid;
  wire [3:0]\state_reg[0] ;
  wire \state_reg[0]_rep ;
  wire [1:0]\state_reg[1] ;
  wire \state_reg[1]_rep ;
  wire \wrap_boundary_axaddr_r_reg_n_0_[0] ;
  wire \wrap_boundary_axaddr_r_reg_n_0_[10] ;
  wire \wrap_boundary_axaddr_r_reg_n_0_[11] ;
  wire \wrap_boundary_axaddr_r_reg_n_0_[1] ;
  wire \wrap_boundary_axaddr_r_reg_n_0_[2] ;
  wire \wrap_boundary_axaddr_r_reg_n_0_[3] ;
  wire \wrap_boundary_axaddr_r_reg_n_0_[4] ;
  wire \wrap_boundary_axaddr_r_reg_n_0_[5] ;
  wire \wrap_boundary_axaddr_r_reg_n_0_[6] ;
  wire \wrap_boundary_axaddr_r_reg_n_0_[7] ;
  wire \wrap_boundary_axaddr_r_reg_n_0_[8] ;
  wire \wrap_boundary_axaddr_r_reg_n_0_[9] ;
  wire \wrap_cnt_r_reg_n_0_[0] ;
  wire \wrap_cnt_r_reg_n_0_[1] ;
  wire \wrap_cnt_r_reg_n_0_[2] ;
  wire \wrap_cnt_r_reg_n_0_[3] ;
  wire wrap_next_pending;
  wire [3:0]\wrap_second_len_r_reg[3]_0 ;
  wire [3:0]\wrap_second_len_r_reg[3]_1 ;
  wire [3:0]\wrap_second_len_r_reg[3]_2 ;

  FDRE \axaddr_offset_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\state_reg[0] [0]),
        .Q(\axaddr_offset_r_reg[3]_0 [0]),
        .R(1'b0));
  FDRE \axaddr_offset_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\state_reg[0] [1]),
        .Q(\axaddr_offset_r_reg[3]_0 [1]),
        .R(1'b0));
  FDRE \axaddr_offset_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\state_reg[0] [2]),
        .Q(\axaddr_offset_r_reg[3]_0 [2]),
        .R(1'b0));
  FDRE \axaddr_offset_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\state_reg[0] [3]),
        .Q(\axaddr_offset_r_reg[3]_0 [3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axaddr_wrap[0]_i_1__0 
       (.I0(\wrap_boundary_axaddr_r_reg_n_0_[0] ),
        .I1(\axaddr_wrap[10]_i_2__0_n_0 ),
        .I2(Q),
        .I3(\m_payload_i_reg[44]_0 ),
        .I4(\state_reg[1]_rep ),
        .I5(\m_payload_i_reg[55] [0]),
        .O(\axaddr_wrap[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axaddr_wrap[10]_i_1__0 
       (.I0(\wrap_boundary_axaddr_r_reg_n_0_[10] ),
        .I1(\axaddr_wrap[10]_i_2__0_n_0 ),
        .I2(\axaddr_wrap_reg_n_0_[10] ),
        .I3(\axaddr_wrap[10]_i_3__0_n_0 ),
        .I4(\state_reg[1]_rep ),
        .I5(\m_payload_i_reg[55] [10]),
        .O(\axaddr_wrap[10]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h09)) 
    \axaddr_wrap[10]_i_2__0 
       (.I0(\wrap_cnt_r_reg_n_0_[3] ),
        .I1(\axlen_cnt_reg_n_0_[3] ),
        .I2(\axaddr_wrap[10]_i_4__0_n_0 ),
        .O(\axaddr_wrap[10]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \axaddr_wrap[10]_i_3__0 
       (.I0(\axaddr_wrap_reg_n_0_[9] ),
        .I1(\axaddr_wrap[9]_i_2__0_n_0 ),
        .O(\axaddr_wrap[10]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \axaddr_wrap[10]_i_4__0 
       (.I0(\wrap_cnt_r_reg_n_0_[0] ),
        .I1(\axlen_cnt_reg_n_0_[0] ),
        .I2(\axlen_cnt_reg_n_0_[1] ),
        .I3(\wrap_cnt_r_reg_n_0_[1] ),
        .I4(\axlen_cnt_reg_n_0_[2] ),
        .I5(\wrap_cnt_r_reg_n_0_[2] ),
        .O(\axaddr_wrap[10]_i_4__0_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \axaddr_wrap[11]_i_1__0 
       (.I0(\axaddr_wrap[11]_i_2__0_n_0 ),
        .I1(\state_reg[0]_rep ),
        .I2(m_axi_arready),
        .I3(\m_payload_i_reg[55] [11]),
        .O(\axaddr_wrap[11]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    \axaddr_wrap[11]_i_2__0 
       (.I0(\wrap_boundary_axaddr_r_reg_n_0_[11] ),
        .I1(\axaddr_wrap[10]_i_2__0_n_0 ),
        .I2(\axaddr_wrap_reg_n_0_[11] ),
        .I3(\axaddr_wrap_reg_n_0_[9] ),
        .I4(\axaddr_wrap[9]_i_2__0_n_0 ),
        .I5(\axaddr_wrap_reg_n_0_[10] ),
        .O(\axaddr_wrap[11]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axaddr_wrap[1]_i_1__0 
       (.I0(\wrap_boundary_axaddr_r_reg_n_0_[1] ),
        .I1(\axaddr_wrap[10]_i_2__0_n_0 ),
        .I2(\axaddr_wrap_reg_n_0_[1] ),
        .I3(\m_payload_i_reg[44] ),
        .I4(\state_reg[1]_rep ),
        .I5(\m_payload_i_reg[55] [1]),
        .O(\axaddr_wrap[1]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axaddr_wrap[2]_i_1__0 
       (.I0(\wrap_boundary_axaddr_r_reg_n_0_[2] ),
        .I1(\axaddr_wrap[10]_i_2__0_n_0 ),
        .I2(\axaddr_wrap[2]_i_2__0_n_0 ),
        .I3(\state_reg[1]_rep ),
        .I4(\m_payload_i_reg[55] [2]),
        .O(\axaddr_wrap[2]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hF3070CF8)) 
    \axaddr_wrap[2]_i_2__0 
       (.I0(Q),
        .I1(\axaddr_wrap_reg_n_0_[1] ),
        .I2(\m_payload_i_reg[55] [13]),
        .I3(\m_payload_i_reg[55] [12]),
        .I4(\axaddr_wrap_reg_n_0_[2] ),
        .O(\axaddr_wrap[2]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axaddr_wrap[3]_i_1__0 
       (.I0(\wrap_boundary_axaddr_r_reg_n_0_[3] ),
        .I1(\axaddr_wrap[10]_i_2__0_n_0 ),
        .I2(\axaddr_wrap[3]_i_2__0_n_0 ),
        .I3(\state_reg[1]_rep ),
        .I4(\m_payload_i_reg[55] [3]),
        .O(\axaddr_wrap[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h003F0F7FFFC0F080)) 
    \axaddr_wrap[3]_i_2__0 
       (.I0(Q),
        .I1(\axaddr_wrap_reg_n_0_[1] ),
        .I2(\axaddr_wrap_reg_n_0_[2] ),
        .I3(\m_payload_i_reg[55] [13]),
        .I4(\m_payload_i_reg[55] [12]),
        .I5(\axaddr_wrap_reg_n_0_[3] ),
        .O(\axaddr_wrap[3]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axaddr_wrap[4]_i_1__0 
       (.I0(\wrap_boundary_axaddr_r_reg_n_0_[4] ),
        .I1(\axaddr_wrap[10]_i_2__0_n_0 ),
        .I2(\axaddr_wrap_reg_n_0_[4] ),
        .I3(\axaddr_wrap[4]_i_2__0_n_0 ),
        .I4(\state_reg[1]_rep ),
        .I5(\m_payload_i_reg[55] [4]),
        .O(\axaddr_wrap[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hAA88AA8880808000)) 
    \axaddr_wrap[4]_i_2__0 
       (.I0(\axaddr_wrap_reg_n_0_[3] ),
        .I1(\axaddr_wrap_reg_n_0_[2] ),
        .I2(\axaddr_wrap_reg_n_0_[1] ),
        .I3(\m_payload_i_reg[55] [12]),
        .I4(Q),
        .I5(\m_payload_i_reg[55] [13]),
        .O(\axaddr_wrap[4]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axaddr_wrap[5]_i_1__0 
       (.I0(\wrap_boundary_axaddr_r_reg_n_0_[5] ),
        .I1(\axaddr_wrap[10]_i_2__0_n_0 ),
        .I2(\axaddr_wrap_reg_n_0_[5] ),
        .I3(\axaddr_wrap[5]_i_2__0_n_0 ),
        .I4(\state_reg[1]_rep ),
        .I5(\m_payload_i_reg[55] [5]),
        .O(\axaddr_wrap[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \axaddr_wrap[5]_i_2__0 
       (.I0(\axaddr_wrap_reg_n_0_[4] ),
        .I1(\axaddr_wrap[4]_i_2__0_n_0 ),
        .O(\axaddr_wrap[5]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axaddr_wrap[6]_i_1__0 
       (.I0(\wrap_boundary_axaddr_r_reg_n_0_[6] ),
        .I1(\axaddr_wrap[10]_i_2__0_n_0 ),
        .I2(\axaddr_wrap_reg_n_0_[6] ),
        .I3(\axaddr_wrap[6]_i_2__0_n_0 ),
        .I4(\state_reg[1]_rep ),
        .I5(\m_payload_i_reg[55] [6]),
        .O(\axaddr_wrap[6]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \axaddr_wrap[6]_i_2__0 
       (.I0(\axaddr_wrap_reg_n_0_[5] ),
        .I1(\axaddr_wrap[4]_i_2__0_n_0 ),
        .I2(\axaddr_wrap_reg_n_0_[4] ),
        .O(\axaddr_wrap[6]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axaddr_wrap[7]_i_1__0 
       (.I0(\wrap_boundary_axaddr_r_reg_n_0_[7] ),
        .I1(\axaddr_wrap[10]_i_2__0_n_0 ),
        .I2(\axaddr_wrap_reg_n_0_[7] ),
        .I3(\axaddr_wrap[7]_i_2__0_n_0 ),
        .I4(\state_reg[1]_rep ),
        .I5(\m_payload_i_reg[55] [7]),
        .O(\axaddr_wrap[7]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \axaddr_wrap[7]_i_2__0 
       (.I0(\axaddr_wrap_reg_n_0_[6] ),
        .I1(\axaddr_wrap_reg_n_0_[4] ),
        .I2(\axaddr_wrap[4]_i_2__0_n_0 ),
        .I3(\axaddr_wrap_reg_n_0_[5] ),
        .O(\axaddr_wrap[7]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axaddr_wrap[8]_i_1__0 
       (.I0(\wrap_boundary_axaddr_r_reg_n_0_[8] ),
        .I1(\axaddr_wrap[10]_i_2__0_n_0 ),
        .I2(\axaddr_wrap_reg_n_0_[8] ),
        .I3(\axaddr_wrap[8]_i_2__0_n_0 ),
        .I4(\state_reg[1]_rep ),
        .I5(\m_payload_i_reg[55] [8]),
        .O(\axaddr_wrap[8]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \axaddr_wrap[8]_i_2__0 
       (.I0(\axaddr_wrap_reg_n_0_[7] ),
        .I1(\axaddr_wrap_reg_n_0_[5] ),
        .I2(\axaddr_wrap[4]_i_2__0_n_0 ),
        .I3(\axaddr_wrap_reg_n_0_[4] ),
        .I4(\axaddr_wrap_reg_n_0_[6] ),
        .O(\axaddr_wrap[8]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axaddr_wrap[9]_i_1__0 
       (.I0(\wrap_boundary_axaddr_r_reg_n_0_[9] ),
        .I1(\axaddr_wrap[10]_i_2__0_n_0 ),
        .I2(\axaddr_wrap_reg_n_0_[9] ),
        .I3(\axaddr_wrap[9]_i_2__0_n_0 ),
        .I4(\state_reg[1]_rep ),
        .I5(\m_payload_i_reg[55] [9]),
        .O(\axaddr_wrap[9]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \axaddr_wrap[9]_i_2__0 
       (.I0(\axaddr_wrap_reg_n_0_[8] ),
        .I1(\axaddr_wrap_reg_n_0_[6] ),
        .I2(\axaddr_wrap_reg_n_0_[4] ),
        .I3(\axaddr_wrap[4]_i_2__0_n_0 ),
        .I4(\axaddr_wrap_reg_n_0_[5] ),
        .I5(\axaddr_wrap_reg_n_0_[7] ),
        .O(\axaddr_wrap[9]_i_2__0_n_0 ));
  FDRE \axaddr_wrap_reg[0] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axaddr_wrap[0]_i_1__0_n_0 ),
        .Q(Q),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[10] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axaddr_wrap[10]_i_1__0_n_0 ),
        .Q(\axaddr_wrap_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[11] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axaddr_wrap[11]_i_1__0_n_0 ),
        .Q(\axaddr_wrap_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[1] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axaddr_wrap[1]_i_1__0_n_0 ),
        .Q(\axaddr_wrap_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[2] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axaddr_wrap[2]_i_1__0_n_0 ),
        .Q(\axaddr_wrap_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[3] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axaddr_wrap[3]_i_1__0_n_0 ),
        .Q(\axaddr_wrap_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[4] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axaddr_wrap[4]_i_1__0_n_0 ),
        .Q(\axaddr_wrap_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[5] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axaddr_wrap[5]_i_1__0_n_0 ),
        .Q(\axaddr_wrap_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[6] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axaddr_wrap[6]_i_1__0_n_0 ),
        .Q(\axaddr_wrap_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[7] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axaddr_wrap[7]_i_1__0_n_0 ),
        .Q(\axaddr_wrap_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[8] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axaddr_wrap[8]_i_1__0_n_0 ),
        .Q(\axaddr_wrap_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \axaddr_wrap_reg[9] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axaddr_wrap[9]_i_1__0_n_0 ),
        .Q(\axaddr_wrap_reg_n_0_[9] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hA3A3A3A3A3A3A3A0)) 
    \axlen_cnt[0]_i_1__1 
       (.I0(\m_payload_i_reg[55] [15]),
        .I1(\axlen_cnt_reg_n_0_[0] ),
        .I2(E),
        .I3(\axlen_cnt_reg_n_0_[3] ),
        .I4(\axlen_cnt_reg_n_0_[2] ),
        .I5(\axlen_cnt_reg_n_0_[1] ),
        .O(\axlen_cnt[0]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hAAC3AAC3AAC3AAC0)) 
    \axlen_cnt[1]_i_1__1 
       (.I0(\m_payload_i_reg[55] [16]),
        .I1(\axlen_cnt_reg_n_0_[1] ),
        .I2(\axlen_cnt_reg_n_0_[0] ),
        .I3(E),
        .I4(\axlen_cnt_reg_n_0_[3] ),
        .I5(\axlen_cnt_reg_n_0_[2] ),
        .O(\axlen_cnt[1]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAACCC3AAAACCC0)) 
    \axlen_cnt[2]_i_1__1 
       (.I0(\m_payload_i_reg[55] [17]),
        .I1(\axlen_cnt_reg_n_0_[2] ),
        .I2(\axlen_cnt_reg_n_0_[0] ),
        .I3(\axlen_cnt_reg_n_0_[1] ),
        .I4(E),
        .I5(\axlen_cnt_reg_n_0_[3] ),
        .O(\axlen_cnt[2]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAACCCCCCC0)) 
    \axlen_cnt[3]_i_1__1 
       (.I0(\m_payload_i_reg[55] [18]),
        .I1(\axlen_cnt_reg_n_0_[3] ),
        .I2(\axlen_cnt_reg_n_0_[2] ),
        .I3(\axlen_cnt_reg_n_0_[1] ),
        .I4(\axlen_cnt_reg_n_0_[0] ),
        .I5(E),
        .O(\axlen_cnt[3]_i_1__1_n_0 ));
  FDRE \axlen_cnt_reg[0] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axlen_cnt[0]_i_1__1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[1] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axlen_cnt[1]_i_1__1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[2] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axlen_cnt[2]_i_1__1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \axlen_cnt_reg[3] 
       (.C(aclk),
        .CE(m_valid_i_reg),
        .D(\axlen_cnt[3]_i_1__1_n_0 ),
        .Q(\axlen_cnt_reg_n_0_[3] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_araddr[0]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(Q),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [0]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [0]),
        .O(m_axi_araddr[0]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_araddr[10]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(\axaddr_wrap_reg_n_0_[10] ),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [10]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [10]),
        .O(m_axi_araddr[10]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_araddr[11]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(\axaddr_wrap_reg_n_0_[11] ),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [11]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [11]),
        .O(m_axi_araddr[11]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_araddr[1]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(\axaddr_wrap_reg_n_0_[1] ),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [1]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [1]),
        .O(m_axi_araddr[1]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_araddr[2]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(\axaddr_wrap_reg_n_0_[2] ),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [2]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [2]),
        .O(m_axi_araddr[2]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_araddr[3]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(\axaddr_wrap_reg_n_0_[3] ),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [3]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [3]),
        .O(m_axi_araddr[3]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_araddr[4]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(\axaddr_wrap_reg_n_0_[4] ),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [4]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [4]),
        .O(m_axi_araddr[4]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_araddr[5]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(\axaddr_wrap_reg_n_0_[5] ),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [5]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [5]),
        .O(m_axi_araddr[5]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_araddr[6]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(\axaddr_wrap_reg_n_0_[6] ),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [6]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [6]),
        .O(m_axi_araddr[6]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_araddr[7]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(\axaddr_wrap_reg_n_0_[7] ),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [7]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [7]),
        .O(m_axi_araddr[7]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_araddr[8]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(\axaddr_wrap_reg_n_0_[8] ),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [8]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [8]),
        .O(m_axi_araddr[8]));
  LUT6 #(
    .INIT(64'hEF40EF4FEF40E040)) 
    \m_axi_araddr[9]_INST_0 
       (.I0(sel_first_reg_0),
        .I1(\axaddr_wrap_reg_n_0_[9] ),
        .I2(\m_payload_i_reg[55] [14]),
        .I3(\m_payload_i_reg[55] [9]),
        .I4(sel_first_reg_2),
        .I5(\axaddr_incr_reg[11] [9]),
        .O(m_axi_araddr[9]));
  LUT5 #(
    .INIT(32'hFEAAFEAE)) 
    next_pending_r_i_1__1
       (.I0(\m_payload_i_reg[55]_0 ),
        .I1(next_pending_r_reg_n_0),
        .I2(\state_reg[1]_rep ),
        .I3(next_pending_r_i_2__1_n_0),
        .I4(E),
        .O(wrap_next_pending));
  LUT6 #(
    .INIT(64'hFBFBFBFBFBFBFB00)) 
    next_pending_r_i_2__1
       (.I0(\state_reg[1] [1]),
        .I1(si_rs_arvalid),
        .I2(\state_reg[1] [0]),
        .I3(\axlen_cnt_reg_n_0_[3] ),
        .I4(\axlen_cnt_reg_n_0_[2] ),
        .I5(\axlen_cnt_reg_n_0_[1] ),
        .O(next_pending_r_i_2__1_n_0));
  FDRE next_pending_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(wrap_next_pending),
        .Q(next_pending_r_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    s_axburst_eq0_i_1__0
       (.I0(wrap_next_pending),
        .I1(\m_payload_i_reg[55] [14]),
        .I2(sel_first_i),
        .I3(incr_next_pending),
        .O(s_axburst_eq0_reg));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hABA8)) 
    s_axburst_eq1_i_1__0
       (.I0(wrap_next_pending),
        .I1(\m_payload_i_reg[55] [14]),
        .I2(sel_first_i),
        .I3(incr_next_pending),
        .O(s_axburst_eq1_reg));
  FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(sel_first_reg_1),
        .Q(sel_first_reg_0),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(\m_payload_i_reg[6] [0]),
        .Q(\wrap_boundary_axaddr_r_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(\m_payload_i_reg[55] [10]),
        .Q(\wrap_boundary_axaddr_r_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(\m_payload_i_reg[55] [11]),
        .Q(\wrap_boundary_axaddr_r_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(\m_payload_i_reg[6] [1]),
        .Q(\wrap_boundary_axaddr_r_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(\m_payload_i_reg[6] [2]),
        .Q(\wrap_boundary_axaddr_r_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(\m_payload_i_reg[6] [3]),
        .Q(\wrap_boundary_axaddr_r_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(\m_payload_i_reg[6] [4]),
        .Q(\wrap_boundary_axaddr_r_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(\m_payload_i_reg[6] [5]),
        .Q(\wrap_boundary_axaddr_r_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(\m_payload_i_reg[6] [6]),
        .Q(\wrap_boundary_axaddr_r_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(\m_payload_i_reg[55] [7]),
        .Q(\wrap_boundary_axaddr_r_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(\m_payload_i_reg[55] [8]),
        .Q(\wrap_boundary_axaddr_r_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \wrap_boundary_axaddr_r_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(\m_payload_i_reg[55] [9]),
        .Q(\wrap_boundary_axaddr_r_reg_n_0_[9] ),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_2 [0]),
        .Q(\wrap_cnt_r_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_2 [1]),
        .Q(\wrap_cnt_r_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_2 [2]),
        .Q(\wrap_cnt_r_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \wrap_cnt_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_2 [3]),
        .Q(\wrap_cnt_r_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [0]),
        .Q(\wrap_second_len_r_reg[3]_0 [0]),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [1]),
        .Q(\wrap_second_len_r_reg[3]_0 [1]),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [2]),
        .Q(\wrap_second_len_r_reg[3]_0 [2]),
        .R(1'b0));
  FDRE \wrap_second_len_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\wrap_second_len_r_reg[3]_1 [3]),
        .Q(\wrap_second_len_r_reg[3]_0 [3]),
        .R(1'b0));
endmodule

module streaming_auto_pc_0_axi_register_slice_v2_1_17_axi_register_slice
   (s_axi_awready,
    s_axi_arready,
    si_rs_awvalid,
    s_axi_bvalid,
    si_rs_bready,
    si_rs_arvalid,
    s_axi_rvalid,
    \aresetn_d_reg[1] ,
    \axaddr_incr_reg[6] ,
    Q,
    \axaddr_wrap_reg[1] ,
    \axaddr_wrap_reg[1]_0 ,
    \s_arid_r_reg[0] ,
    \axaddr_offset_r_reg[0] ,
    axaddr_offset,
    \axaddr_offset_r_reg[3] ,
    \axlen_cnt_reg[3] ,
    D,
    \axaddr_incr_reg[3] ,
    \axaddr_incr_reg[9] ,
    \axaddr_incr_reg[10] ,
    \axaddr_incr_reg[11] ,
    \axaddr_incr_reg[4] ,
    \axaddr_incr_reg[2] ,
    next_pending_r_reg,
    next_pending_r_reg_0,
    next_pending_r_reg_1,
    \wrap_second_len_r_reg[3] ,
    \axlen_cnt_reg[3]_0 ,
    \axaddr_offset_r_reg[2] ,
    \axaddr_offset_r_reg[0]_0 ,
    \axaddr_incr_reg[11]_0 ,
    \axaddr_incr_reg[3]_0 ,
    \axaddr_incr_reg[11]_1 ,
    \axaddr_incr_reg[5] ,
    \axaddr_incr_reg[8] ,
    \axaddr_incr_reg[7] ,
    \axaddr_incr_reg[6]_0 ,
    \axaddr_incr_reg[2]_0 ,
    next_pending_r_reg_2,
    \cnt_read_reg[3] ,
    \axaddr_offset_r_reg[1] ,
    \axaddr_offset_r_reg[1]_0 ,
    \wrap_boundary_axaddr_r_reg[6] ,
    \wrap_boundary_axaddr_r_reg[6]_0 ,
    \axaddr_wrap_reg[0] ,
    \axaddr_wrap_reg[0]_0 ,
    UNCONN_OUT,
    UNCONN_OUT_0,
    aclk,
    s_ready_i0,
    m_valid_i0,
    \cnt_read_reg[0]_rep ,
    \cnt_read_reg[4] ,
    s_axi_rready,
    \axaddr_wrap_reg[0]_1 ,
    \axaddr_incr_reg[8]_0 ,
    \axaddr_wrap_reg[0]_2 ,
    b_push,
    s_axi_awvalid,
    \state_reg[1] ,
    \axaddr_offset_r_reg[2]_0 ,
    \state_reg[0]_rep ,
    \state_reg[1]_rep ,
    sel_first,
    \axaddr_incr_reg[5]_0 ,
    \axaddr_incr_reg[6]_1 ,
    \axaddr_incr_reg[7]_0 ,
    \state_reg[0]_rep_0 ,
    \state_reg[1]_0 ,
    \axaddr_offset_r_reg[2]_1 ,
    \state_reg[1]_rep_0 ,
    \state_reg[0]_rep_1 ,
    sel_first_0,
    \axaddr_incr_reg[2]_1 ,
    \axaddr_incr_reg[10]_0 ,
    \axaddr_incr_reg[9]_0 ,
    \axaddr_incr_reg[11]_2 ,
    \axaddr_incr_reg[4]_0 ,
    \state_reg[1]_rep_1 ,
    si_rs_bvalid,
    s_axi_bready,
    out,
    \s_bresp_acc_reg[1] ,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awsize,
    s_axi_awprot,
    s_axi_awaddr,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arsize,
    s_axi_arprot,
    s_axi_araddr,
    r_push_r_reg,
    \cnt_read_reg[4]_0 ,
    aresetn,
    E,
    m_valid_i_reg);
  output s_axi_awready;
  output s_axi_arready;
  output si_rs_awvalid;
  output s_axi_bvalid;
  output si_rs_bready;
  output si_rs_arvalid;
  output s_axi_rvalid;
  output \aresetn_d_reg[1] ;
  output \axaddr_incr_reg[6] ;
  output [55:0]Q;
  output \axaddr_wrap_reg[1] ;
  output \axaddr_wrap_reg[1]_0 ;
  output [55:0]\s_arid_r_reg[0] ;
  output \axaddr_offset_r_reg[0] ;
  output [0:0]axaddr_offset;
  output \axaddr_offset_r_reg[3] ;
  output \axlen_cnt_reg[3] ;
  output [4:0]D;
  output \axaddr_incr_reg[3] ;
  output \axaddr_incr_reg[9] ;
  output \axaddr_incr_reg[10] ;
  output \axaddr_incr_reg[11] ;
  output \axaddr_incr_reg[4] ;
  output \axaddr_incr_reg[2] ;
  output next_pending_r_reg;
  output next_pending_r_reg_0;
  output next_pending_r_reg_1;
  output \wrap_second_len_r_reg[3] ;
  output \axlen_cnt_reg[3]_0 ;
  output [0:0]\axaddr_offset_r_reg[2] ;
  output \axaddr_offset_r_reg[0]_0 ;
  output [5:0]\axaddr_incr_reg[11]_0 ;
  output \axaddr_incr_reg[3]_0 ;
  output \axaddr_incr_reg[11]_1 ;
  output \axaddr_incr_reg[5] ;
  output \axaddr_incr_reg[8] ;
  output \axaddr_incr_reg[7] ;
  output \axaddr_incr_reg[6]_0 ;
  output \axaddr_incr_reg[2]_0 ;
  output next_pending_r_reg_2;
  output \cnt_read_reg[3] ;
  output \axaddr_offset_r_reg[1] ;
  output \axaddr_offset_r_reg[1]_0 ;
  output [6:0]\wrap_boundary_axaddr_r_reg[6] ;
  output [6:0]\wrap_boundary_axaddr_r_reg[6]_0 ;
  output \axaddr_wrap_reg[0] ;
  output \axaddr_wrap_reg[0]_0 ;
  output [2:0]UNCONN_OUT;
  output [35:0]UNCONN_OUT_0;
  input aclk;
  input s_ready_i0;
  input m_valid_i0;
  input \cnt_read_reg[0]_rep ;
  input \cnt_read_reg[4] ;
  input s_axi_rready;
  input [0:0]\axaddr_wrap_reg[0]_1 ;
  input [4:0]\axaddr_incr_reg[8]_0 ;
  input [0:0]\axaddr_wrap_reg[0]_2 ;
  input b_push;
  input s_axi_awvalid;
  input [1:0]\state_reg[1] ;
  input [0:0]\axaddr_offset_r_reg[2]_0 ;
  input \state_reg[0]_rep ;
  input \state_reg[1]_rep ;
  input sel_first;
  input \axaddr_incr_reg[5]_0 ;
  input \axaddr_incr_reg[6]_1 ;
  input \axaddr_incr_reg[7]_0 ;
  input \state_reg[0]_rep_0 ;
  input [1:0]\state_reg[1]_0 ;
  input [0:0]\axaddr_offset_r_reg[2]_1 ;
  input \state_reg[1]_rep_0 ;
  input \state_reg[0]_rep_1 ;
  input sel_first_0;
  input \axaddr_incr_reg[2]_1 ;
  input [4:0]\axaddr_incr_reg[10]_0 ;
  input \axaddr_incr_reg[9]_0 ;
  input \axaddr_incr_reg[11]_2 ;
  input \axaddr_incr_reg[4]_0 ;
  input \state_reg[1]_rep_1 ;
  input si_rs_bvalid;
  input s_axi_bready;
  input [0:0]out;
  input [1:0]\s_bresp_acc_reg[1] ;
  input [0:0]s_axi_awid;
  input [7:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awsize;
  input [2:0]s_axi_awprot;
  input [39:0]s_axi_awaddr;
  input [0:0]s_axi_arid;
  input [7:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arsize;
  input [2:0]s_axi_arprot;
  input [39:0]s_axi_araddr;
  input [1:0]r_push_r_reg;
  input [33:0]\cnt_read_reg[4]_0 ;
  input aresetn;
  input [0:0]E;
  input [0:0]m_valid_i_reg;

  wire [4:0]D;
  wire [0:0]E;
  wire [55:0]Q;
  wire [2:0]UNCONN_OUT;
  wire [35:0]UNCONN_OUT_0;
  wire aclk;
  wire \ar.ar_pipe_n_2 ;
  wire aresetn;
  wire \aresetn_d_reg[1] ;
  wire \aw.aw_pipe_n_1 ;
  wire \aw.aw_pipe_n_3 ;
  wire \axaddr_incr_reg[10] ;
  wire [4:0]\axaddr_incr_reg[10]_0 ;
  wire \axaddr_incr_reg[11] ;
  wire [5:0]\axaddr_incr_reg[11]_0 ;
  wire \axaddr_incr_reg[11]_1 ;
  wire \axaddr_incr_reg[11]_2 ;
  wire \axaddr_incr_reg[2] ;
  wire \axaddr_incr_reg[2]_0 ;
  wire \axaddr_incr_reg[2]_1 ;
  wire \axaddr_incr_reg[3] ;
  wire \axaddr_incr_reg[3]_0 ;
  wire \axaddr_incr_reg[4] ;
  wire \axaddr_incr_reg[4]_0 ;
  wire \axaddr_incr_reg[5] ;
  wire \axaddr_incr_reg[5]_0 ;
  wire \axaddr_incr_reg[6] ;
  wire \axaddr_incr_reg[6]_0 ;
  wire \axaddr_incr_reg[6]_1 ;
  wire \axaddr_incr_reg[7] ;
  wire \axaddr_incr_reg[7]_0 ;
  wire \axaddr_incr_reg[8] ;
  wire [4:0]\axaddr_incr_reg[8]_0 ;
  wire \axaddr_incr_reg[9] ;
  wire \axaddr_incr_reg[9]_0 ;
  wire [0:0]axaddr_offset;
  wire \axaddr_offset_r_reg[0] ;
  wire \axaddr_offset_r_reg[0]_0 ;
  wire \axaddr_offset_r_reg[1] ;
  wire \axaddr_offset_r_reg[1]_0 ;
  wire [0:0]\axaddr_offset_r_reg[2] ;
  wire [0:0]\axaddr_offset_r_reg[2]_0 ;
  wire [0:0]\axaddr_offset_r_reg[2]_1 ;
  wire \axaddr_offset_r_reg[3] ;
  wire \axaddr_wrap_reg[0] ;
  wire \axaddr_wrap_reg[0]_0 ;
  wire [0:0]\axaddr_wrap_reg[0]_1 ;
  wire [0:0]\axaddr_wrap_reg[0]_2 ;
  wire \axaddr_wrap_reg[1] ;
  wire \axaddr_wrap_reg[1]_0 ;
  wire \axlen_cnt_reg[3] ;
  wire \axlen_cnt_reg[3]_0 ;
  wire b_push;
  wire \cnt_read_reg[0]_rep ;
  wire \cnt_read_reg[3] ;
  wire \cnt_read_reg[4] ;
  wire [33:0]\cnt_read_reg[4]_0 ;
  wire m_valid_i0;
  wire [0:0]m_valid_i_reg;
  wire next_pending_r_reg;
  wire next_pending_r_reg_0;
  wire next_pending_r_reg_1;
  wire next_pending_r_reg_2;
  wire [0:0]out;
  wire [1:0]r_push_r_reg;
  wire [55:0]\s_arid_r_reg[0] ;
  wire [39:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire [2:0]s_axi_arprot;
  wire s_axi_arready;
  wire [1:0]s_axi_arsize;
  wire [39:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire [2:0]s_axi_awprot;
  wire s_axi_awready;
  wire [1:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [1:0]\s_bresp_acc_reg[1] ;
  wire s_ready_i0;
  wire sel_first;
  wire sel_first_0;
  wire si_rs_arvalid;
  wire si_rs_awvalid;
  wire si_rs_bready;
  wire si_rs_bvalid;
  wire \state_reg[0]_rep ;
  wire \state_reg[0]_rep_0 ;
  wire \state_reg[0]_rep_1 ;
  wire [1:0]\state_reg[1] ;
  wire [1:0]\state_reg[1]_0 ;
  wire \state_reg[1]_rep ;
  wire \state_reg[1]_rep_0 ;
  wire \state_reg[1]_rep_1 ;
  wire [6:0]\wrap_boundary_axaddr_r_reg[6] ;
  wire [6:0]\wrap_boundary_axaddr_r_reg[6]_0 ;
  wire \wrap_second_len_r_reg[3] ;

  streaming_auto_pc_0_axi_register_slice_v2_1_17_axic_register_slice \ar.ar_pipe 
       (.Q(\s_arid_r_reg[0] ),
        .aclk(aclk),
        .aresetn(aresetn),
        .\aresetn_d_reg[0] (\aw.aw_pipe_n_1 ),
        .\aresetn_d_reg[0]_0 (\aw.aw_pipe_n_3 ),
        .\aresetn_d_reg[1]_0 (\aresetn_d_reg[1] ),
        .\axaddr_incr_reg[10] (\axaddr_incr_reg[10]_0 ),
        .\axaddr_incr_reg[11] (\axaddr_incr_reg[11]_0 ),
        .\axaddr_incr_reg[11]_0 (\axaddr_incr_reg[11]_1 ),
        .\axaddr_incr_reg[11]_1 (\axaddr_incr_reg[11]_2 ),
        .\axaddr_incr_reg[2] (\axaddr_incr_reg[2]_0 ),
        .\axaddr_incr_reg[2]_0 (\axaddr_incr_reg[2]_1 ),
        .\axaddr_incr_reg[3] (\axaddr_incr_reg[3]_0 ),
        .\axaddr_incr_reg[4] (\axaddr_incr_reg[4]_0 ),
        .\axaddr_incr_reg[5] (\axaddr_incr_reg[5] ),
        .\axaddr_incr_reg[6] (\axaddr_incr_reg[6]_0 ),
        .\axaddr_incr_reg[7] (\axaddr_incr_reg[7] ),
        .\axaddr_incr_reg[8] (\axaddr_incr_reg[8] ),
        .\axaddr_incr_reg[9] (\axaddr_incr_reg[9]_0 ),
        .\axaddr_offset_r_reg[0] (\axaddr_offset_r_reg[0]_0 ),
        .\axaddr_offset_r_reg[1] (\axaddr_offset_r_reg[1]_0 ),
        .\axaddr_offset_r_reg[2] (si_rs_arvalid),
        .\axaddr_offset_r_reg[2]_0 (\axaddr_offset_r_reg[2] ),
        .\axaddr_offset_r_reg[2]_1 (\axaddr_offset_r_reg[2]_1 ),
        .\axaddr_wrap_reg[0] (\axaddr_wrap_reg[0]_0 ),
        .\axaddr_wrap_reg[0]_0 (\axaddr_wrap_reg[0]_2 ),
        .\axaddr_wrap_reg[1] (\axaddr_wrap_reg[1]_0 ),
        .\axlen_cnt_reg[3] (\axlen_cnt_reg[3]_0 ),
        .m_valid_i0(m_valid_i0),
        .m_valid_i_reg_0(\ar.ar_pipe_n_2 ),
        .m_valid_i_reg_1(m_valid_i_reg),
        .next_pending_r_reg(next_pending_r_reg_1),
        .next_pending_r_reg_0(next_pending_r_reg_2),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize(s_axi_arsize),
        .s_ready_i0(s_ready_i0),
        .sel_first_0(sel_first_0),
        .\state_reg[0]_rep (\state_reg[0]_rep_0 ),
        .\state_reg[0]_rep_0 (\state_reg[0]_rep_1 ),
        .\state_reg[1] (\state_reg[1]_0 ),
        .\state_reg[1]_rep (\state_reg[1]_rep_0 ),
        .\state_reg[1]_rep_0 (\state_reg[1]_rep_1 ),
        .\wrap_boundary_axaddr_r_reg[6] (\wrap_boundary_axaddr_r_reg[6]_0 ),
        .\wrap_second_len_r_reg[3] (\wrap_second_len_r_reg[3] ));
  streaming_auto_pc_0_axi_register_slice_v2_1_17_axic_register_slice_0 \aw.aw_pipe 
       (.D(D),
        .E(E),
        .Q(Q),
        .aclk(aclk),
        .aresetn(\aresetn_d_reg[1] ),
        .\aresetn_d_reg[1] (\aw.aw_pipe_n_3 ),
        .\aresetn_d_reg[1]_0 (\ar.ar_pipe_n_2 ),
        .\axaddr_incr_reg[10] (\axaddr_incr_reg[10] ),
        .\axaddr_incr_reg[11] (\axaddr_incr_reg[11] ),
        .\axaddr_incr_reg[2] (\axaddr_incr_reg[2] ),
        .\axaddr_incr_reg[3] (\axaddr_incr_reg[3] ),
        .\axaddr_incr_reg[4] (\axaddr_incr_reg[4] ),
        .\axaddr_incr_reg[5] (\axaddr_incr_reg[5]_0 ),
        .\axaddr_incr_reg[6] (\axaddr_incr_reg[6] ),
        .\axaddr_incr_reg[6]_0 (\axaddr_incr_reg[6]_1 ),
        .\axaddr_incr_reg[7] (\axaddr_incr_reg[7]_0 ),
        .\axaddr_incr_reg[8] (\axaddr_incr_reg[8]_0 ),
        .\axaddr_incr_reg[9] (\axaddr_incr_reg[9] ),
        .axaddr_offset(axaddr_offset),
        .\axaddr_offset_r_reg[0] (\axaddr_offset_r_reg[0] ),
        .\axaddr_offset_r_reg[1] (\axaddr_offset_r_reg[1] ),
        .\axaddr_offset_r_reg[2] (\axaddr_offset_r_reg[2]_0 ),
        .\axaddr_offset_r_reg[3] (\axaddr_offset_r_reg[3] ),
        .\axaddr_wrap_reg[0] (\axaddr_wrap_reg[0] ),
        .\axaddr_wrap_reg[0]_0 (\axaddr_wrap_reg[0]_1 ),
        .\axaddr_wrap_reg[1] (\axaddr_wrap_reg[1] ),
        .\axlen_cnt_reg[3] (\axlen_cnt_reg[3] ),
        .b_push(b_push),
        .\cnt_read_reg[0]_rep (\cnt_read_reg[0]_rep ),
        .m_valid_i_reg_0(si_rs_awvalid),
        .next_pending_r_reg(next_pending_r_reg),
        .next_pending_r_reg_0(next_pending_r_reg_0),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_ready_i_reg_0(\aw.aw_pipe_n_1 ),
        .sel_first(sel_first),
        .\state_reg[0]_rep (\state_reg[0]_rep ),
        .\state_reg[1] (\state_reg[1] ),
        .\state_reg[1]_rep (\state_reg[1]_rep ),
        .\wrap_boundary_axaddr_r_reg[6] (\wrap_boundary_axaddr_r_reg[6] ));
  streaming_auto_pc_0_axi_register_slice_v2_1_17_axic_register_slice__parameterized1 \b.b_pipe 
       (.UNCONN_OUT(UNCONN_OUT),
        .aclk(aclk),
        .\aresetn_d_reg[0] (\aw.aw_pipe_n_1 ),
        .\aresetn_d_reg[1] (\ar.ar_pipe_n_2 ),
        .out(out),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .\s_bresp_acc_reg[1] (\s_bresp_acc_reg[1] ),
        .si_rs_bvalid(si_rs_bvalid),
        .\skid_buffer_reg[0]_0 (si_rs_bready));
  streaming_auto_pc_0_axi_register_slice_v2_1_17_axic_register_slice__parameterized2 \r.r_pipe 
       (.UNCONN_OUT(UNCONN_OUT_0),
        .aclk(aclk),
        .\aresetn_d_reg[0] (\aw.aw_pipe_n_1 ),
        .\aresetn_d_reg[1] (\ar.ar_pipe_n_2 ),
        .\cnt_read_reg[3] (\cnt_read_reg[3] ),
        .\cnt_read_reg[4] (\cnt_read_reg[4] ),
        .\cnt_read_reg[4]_0 (\cnt_read_reg[4]_0 ),
        .r_push_r_reg(r_push_r_reg),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid));
endmodule

module streaming_auto_pc_0_axi_register_slice_v2_1_17_axic_register_slice
   (s_axi_arready,
    \axaddr_offset_r_reg[2] ,
    m_valid_i_reg_0,
    \aresetn_d_reg[1]_0 ,
    \axaddr_wrap_reg[1] ,
    Q,
    next_pending_r_reg,
    \wrap_second_len_r_reg[3] ,
    \axlen_cnt_reg[3] ,
    \axaddr_offset_r_reg[2]_0 ,
    \axaddr_offset_r_reg[0] ,
    \axaddr_incr_reg[11] ,
    \axaddr_incr_reg[3] ,
    \axaddr_incr_reg[11]_0 ,
    \axaddr_incr_reg[5] ,
    \axaddr_incr_reg[8] ,
    \axaddr_incr_reg[7] ,
    \axaddr_incr_reg[6] ,
    \axaddr_incr_reg[2] ,
    next_pending_r_reg_0,
    \axaddr_offset_r_reg[1] ,
    \wrap_boundary_axaddr_r_reg[6] ,
    \axaddr_wrap_reg[0] ,
    \aresetn_d_reg[0] ,
    s_ready_i0,
    aclk,
    m_valid_i0,
    \aresetn_d_reg[0]_0 ,
    \axaddr_wrap_reg[0]_0 ,
    \state_reg[0]_rep ,
    \state_reg[1] ,
    \axaddr_offset_r_reg[2]_1 ,
    \state_reg[1]_rep ,
    \state_reg[0]_rep_0 ,
    sel_first_0,
    \axaddr_incr_reg[2]_0 ,
    \axaddr_incr_reg[10] ,
    \axaddr_incr_reg[9] ,
    \axaddr_incr_reg[11]_1 ,
    \axaddr_incr_reg[4] ,
    \state_reg[1]_rep_0 ,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arsize,
    s_axi_arprot,
    s_axi_araddr,
    aresetn,
    m_valid_i_reg_1);
  output s_axi_arready;
  output \axaddr_offset_r_reg[2] ;
  output m_valid_i_reg_0;
  output \aresetn_d_reg[1]_0 ;
  output \axaddr_wrap_reg[1] ;
  output [55:0]Q;
  output next_pending_r_reg;
  output \wrap_second_len_r_reg[3] ;
  output \axlen_cnt_reg[3] ;
  output [0:0]\axaddr_offset_r_reg[2]_0 ;
  output \axaddr_offset_r_reg[0] ;
  output [5:0]\axaddr_incr_reg[11] ;
  output \axaddr_incr_reg[3] ;
  output \axaddr_incr_reg[11]_0 ;
  output \axaddr_incr_reg[5] ;
  output \axaddr_incr_reg[8] ;
  output \axaddr_incr_reg[7] ;
  output \axaddr_incr_reg[6] ;
  output \axaddr_incr_reg[2] ;
  output next_pending_r_reg_0;
  output \axaddr_offset_r_reg[1] ;
  output [6:0]\wrap_boundary_axaddr_r_reg[6] ;
  output \axaddr_wrap_reg[0] ;
  input \aresetn_d_reg[0] ;
  input s_ready_i0;
  input aclk;
  input m_valid_i0;
  input \aresetn_d_reg[0]_0 ;
  input [0:0]\axaddr_wrap_reg[0]_0 ;
  input \state_reg[0]_rep ;
  input [1:0]\state_reg[1] ;
  input [0:0]\axaddr_offset_r_reg[2]_1 ;
  input \state_reg[1]_rep ;
  input \state_reg[0]_rep_0 ;
  input sel_first_0;
  input \axaddr_incr_reg[2]_0 ;
  input [4:0]\axaddr_incr_reg[10] ;
  input \axaddr_incr_reg[9] ;
  input \axaddr_incr_reg[11]_1 ;
  input \axaddr_incr_reg[4] ;
  input \state_reg[1]_rep_0 ;
  input [0:0]s_axi_arid;
  input [7:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arsize;
  input [2:0]s_axi_arprot;
  input [39:0]s_axi_araddr;
  input aresetn;
  input [0:0]m_valid_i_reg_1;

  wire [55:0]Q;
  wire aclk;
  wire aresetn;
  wire \aresetn_d_reg[0] ;
  wire \aresetn_d_reg[0]_0 ;
  wire \aresetn_d_reg[1]_0 ;
  wire \aresetn_d_reg_n_0_[1] ;
  wire \axaddr_incr[1]_i_2__0_n_0 ;
  wire \axaddr_incr[3]_i_2_n_0 ;
  wire [4:0]\axaddr_incr_reg[10] ;
  wire [5:0]\axaddr_incr_reg[11] ;
  wire \axaddr_incr_reg[11]_0 ;
  wire \axaddr_incr_reg[11]_1 ;
  wire \axaddr_incr_reg[2] ;
  wire \axaddr_incr_reg[2]_0 ;
  wire \axaddr_incr_reg[3] ;
  wire \axaddr_incr_reg[4] ;
  wire \axaddr_incr_reg[5] ;
  wire \axaddr_incr_reg[6] ;
  wire \axaddr_incr_reg[7] ;
  wire \axaddr_incr_reg[8] ;
  wire \axaddr_incr_reg[9] ;
  wire \axaddr_offset_r[0]_i_3__0_n_0 ;
  wire \axaddr_offset_r[0]_i_4__0_n_0 ;
  wire \axaddr_offset_r[2]_i_2__0_n_0 ;
  wire \axaddr_offset_r[3]_i_3__0_n_0 ;
  wire \axaddr_offset_r_reg[0] ;
  wire \axaddr_offset_r_reg[1] ;
  wire \axaddr_offset_r_reg[2] ;
  wire [0:0]\axaddr_offset_r_reg[2]_0 ;
  wire [0:0]\axaddr_offset_r_reg[2]_1 ;
  wire \axaddr_wrap_reg[0] ;
  wire [0:0]\axaddr_wrap_reg[0]_0 ;
  wire \axaddr_wrap_reg[1] ;
  wire \axlen_cnt_reg[3] ;
  wire \m_payload_i[0]_i_1__1_n_0 ;
  wire \m_payload_i[10]_i_1__0_n_0 ;
  wire \m_payload_i[11]_i_1__0_n_0 ;
  wire \m_payload_i[12]_i_1__0_n_0 ;
  wire \m_payload_i[13]_i_1__0_n_0 ;
  wire \m_payload_i[14]_i_1__0_n_0 ;
  wire \m_payload_i[15]_i_1__0_n_0 ;
  wire \m_payload_i[16]_i_1__0_n_0 ;
  wire \m_payload_i[17]_i_1__0_n_0 ;
  wire \m_payload_i[18]_i_1__0_n_0 ;
  wire \m_payload_i[19]_i_1__0_n_0 ;
  wire \m_payload_i[1]_i_1__1_n_0 ;
  wire \m_payload_i[20]_i_1__0_n_0 ;
  wire \m_payload_i[21]_i_1__0_n_0 ;
  wire \m_payload_i[22]_i_1__0_n_0 ;
  wire \m_payload_i[23]_i_1__0_n_0 ;
  wire \m_payload_i[24]_i_1__0_n_0 ;
  wire \m_payload_i[25]_i_1__0_n_0 ;
  wire \m_payload_i[26]_i_1__0_n_0 ;
  wire \m_payload_i[27]_i_1__0_n_0 ;
  wire \m_payload_i[28]_i_1__0_n_0 ;
  wire \m_payload_i[29]_i_1__0_n_0 ;
  wire \m_payload_i[2]_i_1__1_n_0 ;
  wire \m_payload_i[30]_i_1__0_n_0 ;
  wire \m_payload_i[31]_i_1__0_n_0 ;
  wire \m_payload_i[32]_i_1__0_n_0 ;
  wire \m_payload_i[33]_i_1__0_n_0 ;
  wire \m_payload_i[34]_i_1__0_n_0 ;
  wire \m_payload_i[35]_i_1__1_n_0 ;
  wire \m_payload_i[36]_i_1__0_n_0 ;
  wire \m_payload_i[37]_i_1__0_n_0 ;
  wire \m_payload_i[38]_i_1__0_n_0 ;
  wire \m_payload_i[39]_i_2__0_n_0 ;
  wire \m_payload_i[3]_i_1__0_n_0 ;
  wire \m_payload_i[40]_i_1__0_n_0 ;
  wire \m_payload_i[41]_i_1__0_n_0 ;
  wire \m_payload_i[42]_i_1__0_n_0 ;
  wire \m_payload_i[43]_i_1__0_n_0 ;
  wire \m_payload_i[44]_i_1__0_n_0 ;
  wire \m_payload_i[46]_i_1__0_n_0 ;
  wire \m_payload_i[47]_i_1__0_n_0 ;
  wire \m_payload_i[4]_i_1__0_n_0 ;
  wire \m_payload_i[52]_i_1__0_n_0 ;
  wire \m_payload_i[53]_i_1__0_n_0 ;
  wire \m_payload_i[54]_i_1__0_n_0 ;
  wire \m_payload_i[55]_i_1__0_n_0 ;
  wire \m_payload_i[56]_i_1__0_n_0 ;
  wire \m_payload_i[57]_i_1__0_n_0 ;
  wire \m_payload_i[58]_i_1__0_n_0 ;
  wire \m_payload_i[59]_i_1__0_n_0 ;
  wire \m_payload_i[5]_i_1__0_n_0 ;
  wire \m_payload_i[61]_i_1__0_n_0 ;
  wire \m_payload_i[6]_i_1__0_n_0 ;
  wire \m_payload_i[7]_i_1__0_n_0 ;
  wire \m_payload_i[8]_i_1__0_n_0 ;
  wire \m_payload_i[9]_i_1__0_n_0 ;
  wire m_valid_i0;
  wire m_valid_i_reg_0;
  wire [0:0]m_valid_i_reg_1;
  wire next_pending_r_reg;
  wire next_pending_r_reg_0;
  wire [39:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire [2:0]s_axi_arprot;
  wire s_axi_arready;
  wire [1:0]s_axi_arsize;
  wire s_ready_i0;
  wire sel_first_0;
  wire \skid_buffer_reg_n_0_[0] ;
  wire \skid_buffer_reg_n_0_[10] ;
  wire \skid_buffer_reg_n_0_[11] ;
  wire \skid_buffer_reg_n_0_[12] ;
  wire \skid_buffer_reg_n_0_[13] ;
  wire \skid_buffer_reg_n_0_[14] ;
  wire \skid_buffer_reg_n_0_[15] ;
  wire \skid_buffer_reg_n_0_[16] ;
  wire \skid_buffer_reg_n_0_[17] ;
  wire \skid_buffer_reg_n_0_[18] ;
  wire \skid_buffer_reg_n_0_[19] ;
  wire \skid_buffer_reg_n_0_[1] ;
  wire \skid_buffer_reg_n_0_[20] ;
  wire \skid_buffer_reg_n_0_[21] ;
  wire \skid_buffer_reg_n_0_[22] ;
  wire \skid_buffer_reg_n_0_[23] ;
  wire \skid_buffer_reg_n_0_[24] ;
  wire \skid_buffer_reg_n_0_[25] ;
  wire \skid_buffer_reg_n_0_[26] ;
  wire \skid_buffer_reg_n_0_[27] ;
  wire \skid_buffer_reg_n_0_[28] ;
  wire \skid_buffer_reg_n_0_[29] ;
  wire \skid_buffer_reg_n_0_[2] ;
  wire \skid_buffer_reg_n_0_[30] ;
  wire \skid_buffer_reg_n_0_[31] ;
  wire \skid_buffer_reg_n_0_[32] ;
  wire \skid_buffer_reg_n_0_[33] ;
  wire \skid_buffer_reg_n_0_[34] ;
  wire \skid_buffer_reg_n_0_[35] ;
  wire \skid_buffer_reg_n_0_[36] ;
  wire \skid_buffer_reg_n_0_[37] ;
  wire \skid_buffer_reg_n_0_[38] ;
  wire \skid_buffer_reg_n_0_[39] ;
  wire \skid_buffer_reg_n_0_[3] ;
  wire \skid_buffer_reg_n_0_[40] ;
  wire \skid_buffer_reg_n_0_[41] ;
  wire \skid_buffer_reg_n_0_[42] ;
  wire \skid_buffer_reg_n_0_[43] ;
  wire \skid_buffer_reg_n_0_[44] ;
  wire \skid_buffer_reg_n_0_[46] ;
  wire \skid_buffer_reg_n_0_[47] ;
  wire \skid_buffer_reg_n_0_[4] ;
  wire \skid_buffer_reg_n_0_[52] ;
  wire \skid_buffer_reg_n_0_[53] ;
  wire \skid_buffer_reg_n_0_[54] ;
  wire \skid_buffer_reg_n_0_[55] ;
  wire \skid_buffer_reg_n_0_[56] ;
  wire \skid_buffer_reg_n_0_[57] ;
  wire \skid_buffer_reg_n_0_[58] ;
  wire \skid_buffer_reg_n_0_[59] ;
  wire \skid_buffer_reg_n_0_[5] ;
  wire \skid_buffer_reg_n_0_[61] ;
  wire \skid_buffer_reg_n_0_[6] ;
  wire \skid_buffer_reg_n_0_[7] ;
  wire \skid_buffer_reg_n_0_[8] ;
  wire \skid_buffer_reg_n_0_[9] ;
  wire \state_reg[0]_rep ;
  wire \state_reg[0]_rep_0 ;
  wire [1:0]\state_reg[1] ;
  wire \state_reg[1]_rep ;
  wire \state_reg[1]_rep_0 ;
  wire \wrap_boundary_axaddr_r[3]_i_2__0_n_0 ;
  wire [6:0]\wrap_boundary_axaddr_r_reg[6] ;
  wire \wrap_second_len_r_reg[3] ;

  LUT1 #(
    .INIT(2'h1)) 
    areset_d1_i_1
       (.I0(aresetn),
        .O(\aresetn_d_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \aresetn_d_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\aresetn_d_reg[0]_0 ),
        .Q(\aresetn_d_reg_n_0_[1] ),
        .R(\aresetn_d_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h0F000F000F00606F)) 
    \axaddr_incr[0]_i_1__0 
       (.I0(Q[0]),
        .I1(\state_reg[1]_rep_0 ),
        .I2(sel_first_0),
        .I3(\axaddr_incr_reg[10] [0]),
        .I4(Q[43]),
        .I5(Q[44]),
        .O(\axaddr_incr_reg[11] [0]));
  LUT6 #(
    .INIT(64'h6A006AFF6AFF6A00)) 
    \axaddr_incr[10]_i_1 
       (.I0(Q[10]),
        .I1(\axaddr_incr_reg[11]_0 ),
        .I2(Q[9]),
        .I3(sel_first_0),
        .I4(\axaddr_incr_reg[10] [4]),
        .I5(\axaddr_incr_reg[9] ),
        .O(\axaddr_incr_reg[11] [4]));
  LUT6 #(
    .INIT(64'h6AAAFFFF6AAA0000)) 
    \axaddr_incr[11]_i_2 
       (.I0(Q[11]),
        .I1(Q[9]),
        .I2(\axaddr_incr_reg[11]_0 ),
        .I3(Q[10]),
        .I4(sel_first_0),
        .I5(\axaddr_incr_reg[11]_1 ),
        .O(\axaddr_incr_reg[11] [5]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \axaddr_incr[11]_i_3 
       (.I0(Q[8]),
        .I1(Q[6]),
        .I2(\axaddr_incr_reg[5] ),
        .I3(Q[4]),
        .I4(Q[5]),
        .I5(Q[7]),
        .O(\axaddr_incr_reg[11]_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B88B8B8BB8)) 
    \axaddr_incr[1]_i_1__0 
       (.I0(\axaddr_incr[1]_i_2__0_n_0 ),
        .I1(sel_first_0),
        .I2(\axaddr_incr_reg[10] [1]),
        .I3(Q[43]),
        .I4(\axaddr_incr_reg[10] [0]),
        .I5(Q[44]),
        .O(\axaddr_incr_reg[11] [1]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h003700C8)) 
    \axaddr_incr[1]_i_2__0 
       (.I0(Q[0]),
        .I1(\state_reg[1]_rep_0 ),
        .I2(Q[43]),
        .I3(Q[44]),
        .I4(Q[1]),
        .O(\axaddr_incr[1]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h000F3F7F00F0C080)) 
    \axaddr_incr[2]_i_3__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(\state_reg[1]_rep_0 ),
        .I3(Q[43]),
        .I4(Q[44]),
        .I5(Q[2]),
        .O(\axaddr_incr_reg[2] ));
  LUT6 #(
    .INIT(64'h9F90909F909F9F90)) 
    \axaddr_incr[3]_i_1 
       (.I0(Q[3]),
        .I1(\axaddr_incr[3]_i_2_n_0 ),
        .I2(sel_first_0),
        .I3(\axaddr_incr_reg[2]_0 ),
        .I4(\axaddr_incr_reg[3] ),
        .I5(\axaddr_incr_reg[10] [2]),
        .O(\axaddr_incr_reg[11] [2]));
  LUT6 #(
    .INIT(64'h01FF0FFF3FFF3FFF)) 
    \axaddr_incr[3]_i_2 
       (.I0(Q[0]),
        .I1(Q[43]),
        .I2(Q[44]),
        .I3(\state_reg[1]_rep_0 ),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(\axaddr_incr[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \axaddr_incr[3]_i_4 
       (.I0(Q[44]),
        .I1(Q[43]),
        .O(\axaddr_incr_reg[3] ));
  LUT6 #(
    .INIT(64'h6A006AFF6AFF6A00)) 
    \axaddr_incr[5]_i_1__0 
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(\axaddr_incr_reg[5] ),
        .I3(sel_first_0),
        .I4(\axaddr_incr_reg[10] [3]),
        .I5(\axaddr_incr_reg[4] ),
        .O(\axaddr_incr_reg[11] [3]));
  LUT2 #(
    .INIT(4'h2)) 
    \axaddr_incr[5]_i_2 
       (.I0(Q[3]),
        .I1(\axaddr_incr[3]_i_2_n_0 ),
        .O(\axaddr_incr_reg[5] ));
  LUT3 #(
    .INIT(8'h80)) 
    \axaddr_incr[6]_i_2 
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(\axaddr_incr_reg[5] ),
        .O(\axaddr_incr_reg[6] ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \axaddr_incr[7]_i_2__0 
       (.I0(Q[6]),
        .I1(\axaddr_incr_reg[5] ),
        .I2(Q[4]),
        .I3(Q[5]),
        .O(\axaddr_incr_reg[7] ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \axaddr_incr[8]_i_2__0 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(Q[4]),
        .I3(\axaddr_incr_reg[5] ),
        .I4(Q[6]),
        .O(\axaddr_incr_reg[8] ));
  LUT6 #(
    .INIT(64'hAAAAA8080000A808)) 
    \axaddr_offset_r[0]_i_2__0 
       (.I0(\axaddr_offset_r[0]_i_3__0_n_0 ),
        .I1(Q[0]),
        .I2(Q[43]),
        .I3(Q[1]),
        .I4(Q[44]),
        .I5(\axaddr_offset_r[0]_i_4__0_n_0 ),
        .O(\axaddr_offset_r_reg[0] ));
  LUT4 #(
    .INIT(16'h0020)) 
    \axaddr_offset_r[0]_i_3__0 
       (.I0(Q[47]),
        .I1(\state_reg[1]_rep ),
        .I2(\axaddr_offset_r_reg[2] ),
        .I3(\state_reg[0]_rep_0 ),
        .O(\axaddr_offset_r[0]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_offset_r[0]_i_4__0 
       (.I0(Q[3]),
        .I1(Q[43]),
        .I2(Q[2]),
        .O(\axaddr_offset_r[0]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axaddr_offset_r[1]_i_3__0 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[44]),
        .I3(Q[2]),
        .I4(Q[43]),
        .I5(Q[1]),
        .O(\axaddr_offset_r_reg[1] ));
  LUT6 #(
    .INIT(64'hFFFFF8FF00000800)) 
    \axaddr_offset_r[2]_i_1__0 
       (.I0(\axaddr_offset_r[2]_i_2__0_n_0 ),
        .I1(Q[49]),
        .I2(\state_reg[1] [0]),
        .I3(\axaddr_offset_r_reg[2] ),
        .I4(\state_reg[1] [1]),
        .I5(\axaddr_offset_r_reg[2]_1 ),
        .O(\axaddr_offset_r_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axaddr_offset_r[2]_i_2__0 
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(Q[44]),
        .I3(Q[3]),
        .I4(Q[43]),
        .I5(Q[2]),
        .O(\axaddr_offset_r[2]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    \axaddr_offset_r[3]_i_2__0 
       (.I0(\axlen_cnt_reg[3] ),
        .I1(\axaddr_offset_r[3]_i_3__0_n_0 ),
        .I2(Q[44]),
        .I3(Q[5]),
        .I4(Q[43]),
        .I5(Q[6]),
        .O(\wrap_second_len_r_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_offset_r[3]_i_3__0 
       (.I0(Q[4]),
        .I1(Q[43]),
        .I2(Q[3]),
        .O(\axaddr_offset_r[3]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \axaddr_wrap[0]_i_2__0 
       (.I0(Q[44]),
        .I1(Q[43]),
        .O(\axaddr_wrap_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h54)) 
    \axaddr_wrap[1]_i_2__0 
       (.I0(Q[44]),
        .I1(\axaddr_wrap_reg[0]_0 ),
        .I2(Q[43]),
        .O(\axaddr_wrap_reg[1] ));
  LUT4 #(
    .INIT(16'h0020)) 
    \axlen_cnt[3]_i_2__0 
       (.I0(Q[50]),
        .I1(\state_reg[1] [1]),
        .I2(\axaddr_offset_r_reg[2] ),
        .I3(\state_reg[1] [0]),
        .O(\axlen_cnt_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[0]_i_1__1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[0] ),
        .O(\m_payload_i[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[10]_i_1__0 
       (.I0(s_axi_araddr[10]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[10] ),
        .O(\m_payload_i[10]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[11]_i_1__0 
       (.I0(s_axi_araddr[11]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[11] ),
        .O(\m_payload_i[11]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[12]_i_1__0 
       (.I0(s_axi_araddr[12]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[12] ),
        .O(\m_payload_i[12]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[13]_i_1__0 
       (.I0(s_axi_araddr[13]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[13] ),
        .O(\m_payload_i[13]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[14]_i_1__0 
       (.I0(s_axi_araddr[14]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[14] ),
        .O(\m_payload_i[14]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[15]_i_1__0 
       (.I0(s_axi_araddr[15]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[15] ),
        .O(\m_payload_i[15]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[16]_i_1__0 
       (.I0(s_axi_araddr[16]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[16] ),
        .O(\m_payload_i[16]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[17]_i_1__0 
       (.I0(s_axi_araddr[17]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[17] ),
        .O(\m_payload_i[17]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[18]_i_1__0 
       (.I0(s_axi_araddr[18]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[18] ),
        .O(\m_payload_i[18]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[19]_i_1__0 
       (.I0(s_axi_araddr[19]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[19] ),
        .O(\m_payload_i[19]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[1]_i_1__1 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[1] ),
        .O(\m_payload_i[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[20]_i_1__0 
       (.I0(s_axi_araddr[20]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[20] ),
        .O(\m_payload_i[20]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[21]_i_1__0 
       (.I0(s_axi_araddr[21]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[21] ),
        .O(\m_payload_i[21]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[22]_i_1__0 
       (.I0(s_axi_araddr[22]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[22] ),
        .O(\m_payload_i[22]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[23]_i_1__0 
       (.I0(s_axi_araddr[23]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[23] ),
        .O(\m_payload_i[23]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[24]_i_1__0 
       (.I0(s_axi_araddr[24]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[24] ),
        .O(\m_payload_i[24]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[25]_i_1__0 
       (.I0(s_axi_araddr[25]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[25] ),
        .O(\m_payload_i[25]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[26]_i_1__0 
       (.I0(s_axi_araddr[26]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[26] ),
        .O(\m_payload_i[26]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[27]_i_1__0 
       (.I0(s_axi_araddr[27]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[27] ),
        .O(\m_payload_i[27]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[28]_i_1__0 
       (.I0(s_axi_araddr[28]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[28] ),
        .O(\m_payload_i[28]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[29]_i_1__0 
       (.I0(s_axi_araddr[29]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[29] ),
        .O(\m_payload_i[29]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[2]_i_1__1 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[2] ),
        .O(\m_payload_i[2]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[30]_i_1__0 
       (.I0(s_axi_araddr[30]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[30] ),
        .O(\m_payload_i[30]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[31]_i_1__0 
       (.I0(s_axi_araddr[31]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[31] ),
        .O(\m_payload_i[31]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[32]_i_1__0 
       (.I0(s_axi_araddr[32]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[32] ),
        .O(\m_payload_i[32]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[33]_i_1__0 
       (.I0(s_axi_araddr[33]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[33] ),
        .O(\m_payload_i[33]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[34]_i_1__0 
       (.I0(s_axi_araddr[34]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[34] ),
        .O(\m_payload_i[34]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[35]_i_1__1 
       (.I0(s_axi_araddr[35]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[35] ),
        .O(\m_payload_i[35]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[36]_i_1__0 
       (.I0(s_axi_araddr[36]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[36] ),
        .O(\m_payload_i[36]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[37]_i_1__0 
       (.I0(s_axi_araddr[37]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[37] ),
        .O(\m_payload_i[37]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[38]_i_1__0 
       (.I0(s_axi_araddr[38]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[38] ),
        .O(\m_payload_i[38]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[39]_i_2__0 
       (.I0(s_axi_araddr[39]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[39] ),
        .O(\m_payload_i[39]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[3]_i_1__0 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[3] ),
        .O(\m_payload_i[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[40]_i_1__0 
       (.I0(s_axi_arprot[0]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[40] ),
        .O(\m_payload_i[40]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[41]_i_1__0 
       (.I0(s_axi_arprot[1]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[41] ),
        .O(\m_payload_i[41]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[42]_i_1__0 
       (.I0(s_axi_arprot[2]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[42] ),
        .O(\m_payload_i[42]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[43]_i_1__0 
       (.I0(s_axi_arsize[0]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[43] ),
        .O(\m_payload_i[43]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[44]_i_1__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[44] ),
        .O(\m_payload_i[44]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[46]_i_1__0 
       (.I0(s_axi_arburst[0]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[46] ),
        .O(\m_payload_i[46]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[47]_i_1__0 
       (.I0(s_axi_arburst[1]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[47] ),
        .O(\m_payload_i[47]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[4]_i_1__0 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[4] ),
        .O(\m_payload_i[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[52]_i_1__0 
       (.I0(s_axi_arlen[0]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[52] ),
        .O(\m_payload_i[52]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[53]_i_1__0 
       (.I0(s_axi_arlen[1]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[53] ),
        .O(\m_payload_i[53]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[54]_i_1__0 
       (.I0(s_axi_arlen[2]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[54] ),
        .O(\m_payload_i[54]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[55]_i_1__0 
       (.I0(s_axi_arlen[3]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[55] ),
        .O(\m_payload_i[55]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[56]_i_1__0 
       (.I0(s_axi_arlen[4]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[56] ),
        .O(\m_payload_i[56]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[57]_i_1__0 
       (.I0(s_axi_arlen[5]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[57] ),
        .O(\m_payload_i[57]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[58]_i_1__0 
       (.I0(s_axi_arlen[6]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[58] ),
        .O(\m_payload_i[58]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[59]_i_1__0 
       (.I0(s_axi_arlen[7]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[59] ),
        .O(\m_payload_i[59]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[5]_i_1__0 
       (.I0(s_axi_araddr[5]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[5] ),
        .O(\m_payload_i[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[61]_i_1__0 
       (.I0(s_axi_arid),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[61] ),
        .O(\m_payload_i[61]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[6]_i_1__0 
       (.I0(s_axi_araddr[6]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[6] ),
        .O(\m_payload_i[6]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[7]_i_1__0 
       (.I0(s_axi_araddr[7]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[7] ),
        .O(\m_payload_i[7]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[8]_i_1__0 
       (.I0(s_axi_araddr[8]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[8] ),
        .O(\m_payload_i[8]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[9]_i_1__0 
       (.I0(s_axi_araddr[9]),
        .I1(s_axi_arready),
        .I2(\skid_buffer_reg_n_0_[9] ),
        .O(\m_payload_i[9]_i_1__0_n_0 ));
  FDRE \m_payload_i_reg[0] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[0]_i_1__1_n_0 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \m_payload_i_reg[10] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[10]_i_1__0_n_0 ),
        .Q(Q[10]),
        .R(1'b0));
  FDRE \m_payload_i_reg[11] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[11]_i_1__0_n_0 ),
        .Q(Q[11]),
        .R(1'b0));
  FDRE \m_payload_i_reg[12] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[12]_i_1__0_n_0 ),
        .Q(Q[12]),
        .R(1'b0));
  FDRE \m_payload_i_reg[13] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[13]_i_1__0_n_0 ),
        .Q(Q[13]),
        .R(1'b0));
  FDRE \m_payload_i_reg[14] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[14]_i_1__0_n_0 ),
        .Q(Q[14]),
        .R(1'b0));
  FDRE \m_payload_i_reg[15] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[15]_i_1__0_n_0 ),
        .Q(Q[15]),
        .R(1'b0));
  FDRE \m_payload_i_reg[16] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[16]_i_1__0_n_0 ),
        .Q(Q[16]),
        .R(1'b0));
  FDRE \m_payload_i_reg[17] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[17]_i_1__0_n_0 ),
        .Q(Q[17]),
        .R(1'b0));
  FDRE \m_payload_i_reg[18] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[18]_i_1__0_n_0 ),
        .Q(Q[18]),
        .R(1'b0));
  FDRE \m_payload_i_reg[19] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[19]_i_1__0_n_0 ),
        .Q(Q[19]),
        .R(1'b0));
  FDRE \m_payload_i_reg[1] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[1]_i_1__1_n_0 ),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \m_payload_i_reg[20] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[20]_i_1__0_n_0 ),
        .Q(Q[20]),
        .R(1'b0));
  FDRE \m_payload_i_reg[21] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[21]_i_1__0_n_0 ),
        .Q(Q[21]),
        .R(1'b0));
  FDRE \m_payload_i_reg[22] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[22]_i_1__0_n_0 ),
        .Q(Q[22]),
        .R(1'b0));
  FDRE \m_payload_i_reg[23] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[23]_i_1__0_n_0 ),
        .Q(Q[23]),
        .R(1'b0));
  FDRE \m_payload_i_reg[24] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[24]_i_1__0_n_0 ),
        .Q(Q[24]),
        .R(1'b0));
  FDRE \m_payload_i_reg[25] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[25]_i_1__0_n_0 ),
        .Q(Q[25]),
        .R(1'b0));
  FDRE \m_payload_i_reg[26] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[26]_i_1__0_n_0 ),
        .Q(Q[26]),
        .R(1'b0));
  FDRE \m_payload_i_reg[27] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[27]_i_1__0_n_0 ),
        .Q(Q[27]),
        .R(1'b0));
  FDRE \m_payload_i_reg[28] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[28]_i_1__0_n_0 ),
        .Q(Q[28]),
        .R(1'b0));
  FDRE \m_payload_i_reg[29] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[29]_i_1__0_n_0 ),
        .Q(Q[29]),
        .R(1'b0));
  FDRE \m_payload_i_reg[2] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[2]_i_1__1_n_0 ),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \m_payload_i_reg[30] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[30]_i_1__0_n_0 ),
        .Q(Q[30]),
        .R(1'b0));
  FDRE \m_payload_i_reg[31] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[31]_i_1__0_n_0 ),
        .Q(Q[31]),
        .R(1'b0));
  FDRE \m_payload_i_reg[32] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[32]_i_1__0_n_0 ),
        .Q(Q[32]),
        .R(1'b0));
  FDRE \m_payload_i_reg[33] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[33]_i_1__0_n_0 ),
        .Q(Q[33]),
        .R(1'b0));
  FDRE \m_payload_i_reg[34] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[34]_i_1__0_n_0 ),
        .Q(Q[34]),
        .R(1'b0));
  FDRE \m_payload_i_reg[35] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[35]_i_1__1_n_0 ),
        .Q(Q[35]),
        .R(1'b0));
  FDRE \m_payload_i_reg[36] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[36]_i_1__0_n_0 ),
        .Q(Q[36]),
        .R(1'b0));
  FDRE \m_payload_i_reg[37] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[37]_i_1__0_n_0 ),
        .Q(Q[37]),
        .R(1'b0));
  FDRE \m_payload_i_reg[38] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[38]_i_1__0_n_0 ),
        .Q(Q[38]),
        .R(1'b0));
  FDRE \m_payload_i_reg[39] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[39]_i_2__0_n_0 ),
        .Q(Q[39]),
        .R(1'b0));
  FDRE \m_payload_i_reg[3] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[3]_i_1__0_n_0 ),
        .Q(Q[3]),
        .R(1'b0));
  FDRE \m_payload_i_reg[40] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[40]_i_1__0_n_0 ),
        .Q(Q[40]),
        .R(1'b0));
  FDRE \m_payload_i_reg[41] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[41]_i_1__0_n_0 ),
        .Q(Q[41]),
        .R(1'b0));
  FDRE \m_payload_i_reg[42] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[42]_i_1__0_n_0 ),
        .Q(Q[42]),
        .R(1'b0));
  FDRE \m_payload_i_reg[43] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[43]_i_1__0_n_0 ),
        .Q(Q[43]),
        .R(1'b0));
  FDRE \m_payload_i_reg[44] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[44]_i_1__0_n_0 ),
        .Q(Q[44]),
        .R(1'b0));
  FDRE \m_payload_i_reg[46] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[46]_i_1__0_n_0 ),
        .Q(Q[45]),
        .R(1'b0));
  FDRE \m_payload_i_reg[47] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[47]_i_1__0_n_0 ),
        .Q(Q[46]),
        .R(1'b0));
  FDRE \m_payload_i_reg[4] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[4]_i_1__0_n_0 ),
        .Q(Q[4]),
        .R(1'b0));
  FDRE \m_payload_i_reg[52] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[52]_i_1__0_n_0 ),
        .Q(Q[47]),
        .R(1'b0));
  FDRE \m_payload_i_reg[53] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[53]_i_1__0_n_0 ),
        .Q(Q[48]),
        .R(1'b0));
  FDRE \m_payload_i_reg[54] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[54]_i_1__0_n_0 ),
        .Q(Q[49]),
        .R(1'b0));
  FDRE \m_payload_i_reg[55] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[55]_i_1__0_n_0 ),
        .Q(Q[50]),
        .R(1'b0));
  FDRE \m_payload_i_reg[56] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[56]_i_1__0_n_0 ),
        .Q(Q[51]),
        .R(1'b0));
  FDRE \m_payload_i_reg[57] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[57]_i_1__0_n_0 ),
        .Q(Q[52]),
        .R(1'b0));
  FDRE \m_payload_i_reg[58] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[58]_i_1__0_n_0 ),
        .Q(Q[53]),
        .R(1'b0));
  FDRE \m_payload_i_reg[59] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[59]_i_1__0_n_0 ),
        .Q(Q[54]),
        .R(1'b0));
  FDRE \m_payload_i_reg[5] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[5]_i_1__0_n_0 ),
        .Q(Q[5]),
        .R(1'b0));
  FDRE \m_payload_i_reg[61] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[61]_i_1__0_n_0 ),
        .Q(Q[55]),
        .R(1'b0));
  FDRE \m_payload_i_reg[6] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[6]_i_1__0_n_0 ),
        .Q(Q[6]),
        .R(1'b0));
  FDRE \m_payload_i_reg[7] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[7]_i_1__0_n_0 ),
        .Q(Q[7]),
        .R(1'b0));
  FDRE \m_payload_i_reg[8] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[8]_i_1__0_n_0 ),
        .Q(Q[8]),
        .R(1'b0));
  FDRE \m_payload_i_reg[9] 
       (.C(aclk),
        .CE(m_valid_i_reg_1),
        .D(\m_payload_i[9]_i_1__0_n_0 ),
        .Q(Q[9]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    m_valid_i_i_1__0
       (.I0(\aresetn_d_reg_n_0_[1] ),
        .O(m_valid_i_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    m_valid_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(m_valid_i0),
        .Q(\axaddr_offset_r_reg[2] ),
        .R(m_valid_i_reg_0));
  LUT4 #(
    .INIT(16'h0001)) 
    next_pending_r_i_2__2
       (.I0(Q[52]),
        .I1(Q[53]),
        .I2(Q[51]),
        .I3(Q[54]),
        .O(next_pending_r_reg_0));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    next_pending_r_i_3__1
       (.I0(\state_reg[0]_rep ),
        .I1(Q[50]),
        .I2(Q[48]),
        .I3(Q[47]),
        .I4(Q[49]),
        .O(next_pending_r_reg));
  FDRE #(
    .INIT(1'b0)) 
    s_ready_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_ready_i0),
        .Q(s_axi_arready),
        .R(\aresetn_d_reg[0] ));
  FDRE \skid_buffer_reg[0] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[0]),
        .Q(\skid_buffer_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[10] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[10]),
        .Q(\skid_buffer_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[11] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[11]),
        .Q(\skid_buffer_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[12] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[12]),
        .Q(\skid_buffer_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[13] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[13]),
        .Q(\skid_buffer_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[14] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[14]),
        .Q(\skid_buffer_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[15] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[15]),
        .Q(\skid_buffer_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[16] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[16]),
        .Q(\skid_buffer_reg_n_0_[16] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[17] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[17]),
        .Q(\skid_buffer_reg_n_0_[17] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[18] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[18]),
        .Q(\skid_buffer_reg_n_0_[18] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[19] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[19]),
        .Q(\skid_buffer_reg_n_0_[19] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[1] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[1]),
        .Q(\skid_buffer_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[20] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[20]),
        .Q(\skid_buffer_reg_n_0_[20] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[21] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[21]),
        .Q(\skid_buffer_reg_n_0_[21] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[22] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[22]),
        .Q(\skid_buffer_reg_n_0_[22] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[23] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[23]),
        .Q(\skid_buffer_reg_n_0_[23] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[24] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[24]),
        .Q(\skid_buffer_reg_n_0_[24] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[25] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[25]),
        .Q(\skid_buffer_reg_n_0_[25] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[26] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[26]),
        .Q(\skid_buffer_reg_n_0_[26] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[27] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[27]),
        .Q(\skid_buffer_reg_n_0_[27] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[28] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[28]),
        .Q(\skid_buffer_reg_n_0_[28] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[29] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[29]),
        .Q(\skid_buffer_reg_n_0_[29] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[2] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[2]),
        .Q(\skid_buffer_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[30] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[30]),
        .Q(\skid_buffer_reg_n_0_[30] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[31] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[31]),
        .Q(\skid_buffer_reg_n_0_[31] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[32] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[32]),
        .Q(\skid_buffer_reg_n_0_[32] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[33] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[33]),
        .Q(\skid_buffer_reg_n_0_[33] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[34] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[34]),
        .Q(\skid_buffer_reg_n_0_[34] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[35] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[35]),
        .Q(\skid_buffer_reg_n_0_[35] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[36] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[36]),
        .Q(\skid_buffer_reg_n_0_[36] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[37] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[37]),
        .Q(\skid_buffer_reg_n_0_[37] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[38] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[38]),
        .Q(\skid_buffer_reg_n_0_[38] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[39] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[39]),
        .Q(\skid_buffer_reg_n_0_[39] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[3] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[3]),
        .Q(\skid_buffer_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[40] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arprot[0]),
        .Q(\skid_buffer_reg_n_0_[40] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[41] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arprot[1]),
        .Q(\skid_buffer_reg_n_0_[41] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[42] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arprot[2]),
        .Q(\skid_buffer_reg_n_0_[42] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[43] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arsize[0]),
        .Q(\skid_buffer_reg_n_0_[43] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[44] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arsize[1]),
        .Q(\skid_buffer_reg_n_0_[44] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[46] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arburst[0]),
        .Q(\skid_buffer_reg_n_0_[46] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[47] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arburst[1]),
        .Q(\skid_buffer_reg_n_0_[47] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[4] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[4]),
        .Q(\skid_buffer_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[52] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arlen[0]),
        .Q(\skid_buffer_reg_n_0_[52] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[53] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arlen[1]),
        .Q(\skid_buffer_reg_n_0_[53] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[54] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arlen[2]),
        .Q(\skid_buffer_reg_n_0_[54] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[55] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arlen[3]),
        .Q(\skid_buffer_reg_n_0_[55] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[56] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arlen[4]),
        .Q(\skid_buffer_reg_n_0_[56] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[57] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arlen[5]),
        .Q(\skid_buffer_reg_n_0_[57] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[58] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arlen[6]),
        .Q(\skid_buffer_reg_n_0_[58] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[59] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arlen[7]),
        .Q(\skid_buffer_reg_n_0_[59] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[5] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[5]),
        .Q(\skid_buffer_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[61] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_arid),
        .Q(\skid_buffer_reg_n_0_[61] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[6] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[6]),
        .Q(\skid_buffer_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[7] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[7]),
        .Q(\skid_buffer_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[8] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[8]),
        .Q(\skid_buffer_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[9] 
       (.C(aclk),
        .CE(s_axi_arready),
        .D(s_axi_araddr[9]),
        .Q(\skid_buffer_reg_n_0_[9] ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hAA8A)) 
    \wrap_boundary_axaddr_r[0]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[43]),
        .I2(Q[47]),
        .I3(Q[44]),
        .O(\wrap_boundary_axaddr_r_reg[6] [0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \wrap_boundary_axaddr_r[1]_i_1__0 
       (.I0(Q[1]),
        .I1(Q[44]),
        .I2(Q[47]),
        .I3(Q[43]),
        .I4(Q[48]),
        .O(\wrap_boundary_axaddr_r_reg[6] [1]));
  LUT6 #(
    .INIT(64'hFF0F553300000000)) 
    \wrap_boundary_axaddr_r[2]_i_1__0 
       (.I0(Q[48]),
        .I1(Q[49]),
        .I2(Q[47]),
        .I3(Q[43]),
        .I4(Q[44]),
        .I5(Q[2]),
        .O(\wrap_boundary_axaddr_r_reg[6] [2]));
  LUT6 #(
    .INIT(64'h020202A2A2A202A2)) 
    \wrap_boundary_axaddr_r[3]_i_1__0 
       (.I0(Q[3]),
        .I1(\wrap_boundary_axaddr_r[3]_i_2__0_n_0 ),
        .I2(Q[44]),
        .I3(Q[48]),
        .I4(Q[43]),
        .I5(Q[47]),
        .O(\wrap_boundary_axaddr_r_reg[6] [3]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_boundary_axaddr_r[3]_i_2__0 
       (.I0(Q[49]),
        .I1(Q[43]),
        .I2(Q[50]),
        .O(\wrap_boundary_axaddr_r[3]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h500030F050F030F0)) 
    \wrap_boundary_axaddr_r[4]_i_1__0 
       (.I0(Q[48]),
        .I1(Q[49]),
        .I2(Q[4]),
        .I3(Q[44]),
        .I4(Q[43]),
        .I5(Q[50]),
        .O(\wrap_boundary_axaddr_r_reg[6] [4]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h2A222AAA)) 
    \wrap_boundary_axaddr_r[5]_i_1__0 
       (.I0(Q[5]),
        .I1(Q[44]),
        .I2(Q[49]),
        .I3(Q[43]),
        .I4(Q[50]),
        .O(\wrap_boundary_axaddr_r_reg[6] [5]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h2AAA)) 
    \wrap_boundary_axaddr_r[6]_i_1__0 
       (.I0(Q[6]),
        .I1(Q[50]),
        .I2(Q[43]),
        .I3(Q[44]),
        .O(\wrap_boundary_axaddr_r_reg[6] [6]));
endmodule

(* ORIG_REF_NAME = "axi_register_slice_v2_1_17_axic_register_slice" *) 
module streaming_auto_pc_0_axi_register_slice_v2_1_17_axic_register_slice_0
   (s_axi_awready,
    s_ready_i_reg_0,
    m_valid_i_reg_0,
    \aresetn_d_reg[1] ,
    \axaddr_incr_reg[6] ,
    Q,
    \axaddr_wrap_reg[1] ,
    \axaddr_offset_r_reg[0] ,
    axaddr_offset,
    \axaddr_offset_r_reg[3] ,
    \axlen_cnt_reg[3] ,
    D,
    \axaddr_incr_reg[3] ,
    \axaddr_incr_reg[9] ,
    \axaddr_incr_reg[10] ,
    \axaddr_incr_reg[11] ,
    \axaddr_incr_reg[4] ,
    \axaddr_incr_reg[2] ,
    next_pending_r_reg,
    next_pending_r_reg_0,
    \axaddr_offset_r_reg[1] ,
    \wrap_boundary_axaddr_r_reg[6] ,
    \axaddr_wrap_reg[0] ,
    aclk,
    \aresetn_d_reg[1]_0 ,
    aresetn,
    \cnt_read_reg[0]_rep ,
    \axaddr_wrap_reg[0]_0 ,
    \axaddr_incr_reg[8] ,
    b_push,
    s_axi_awvalid,
    \state_reg[1] ,
    \axaddr_offset_r_reg[2] ,
    \state_reg[0]_rep ,
    \state_reg[1]_rep ,
    sel_first,
    \axaddr_incr_reg[5] ,
    \axaddr_incr_reg[6]_0 ,
    \axaddr_incr_reg[7] ,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awsize,
    s_axi_awprot,
    s_axi_awaddr,
    E);
  output s_axi_awready;
  output s_ready_i_reg_0;
  output m_valid_i_reg_0;
  output \aresetn_d_reg[1] ;
  output \axaddr_incr_reg[6] ;
  output [55:0]Q;
  output \axaddr_wrap_reg[1] ;
  output \axaddr_offset_r_reg[0] ;
  output [0:0]axaddr_offset;
  output \axaddr_offset_r_reg[3] ;
  output \axlen_cnt_reg[3] ;
  output [4:0]D;
  output \axaddr_incr_reg[3] ;
  output \axaddr_incr_reg[9] ;
  output \axaddr_incr_reg[10] ;
  output \axaddr_incr_reg[11] ;
  output \axaddr_incr_reg[4] ;
  output \axaddr_incr_reg[2] ;
  output next_pending_r_reg;
  output next_pending_r_reg_0;
  output \axaddr_offset_r_reg[1] ;
  output [6:0]\wrap_boundary_axaddr_r_reg[6] ;
  output \axaddr_wrap_reg[0] ;
  input aclk;
  input \aresetn_d_reg[1]_0 ;
  input aresetn;
  input \cnt_read_reg[0]_rep ;
  input [0:0]\axaddr_wrap_reg[0]_0 ;
  input [4:0]\axaddr_incr_reg[8] ;
  input b_push;
  input s_axi_awvalid;
  input [1:0]\state_reg[1] ;
  input [0:0]\axaddr_offset_r_reg[2] ;
  input \state_reg[0]_rep ;
  input \state_reg[1]_rep ;
  input sel_first;
  input \axaddr_incr_reg[5] ;
  input \axaddr_incr_reg[6]_0 ;
  input \axaddr_incr_reg[7] ;
  input [0:0]s_axi_awid;
  input [7:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awsize;
  input [2:0]s_axi_awprot;
  input [39:0]s_axi_awaddr;
  input [0:0]E;

  wire [4:0]D;
  wire [0:0]E;
  wire [55:0]Q;
  wire aclk;
  wire aresetn;
  wire \aresetn_d_reg[1] ;
  wire \aresetn_d_reg[1]_0 ;
  wire \axaddr_incr[1]_i_2_n_0 ;
  wire \axaddr_incr[1]_i_3_n_0 ;
  wire \axaddr_incr[4]_i_3_n_0 ;
  wire \axaddr_incr[7]_i_2_n_0 ;
  wire \axaddr_incr[7]_i_4_n_0 ;
  wire \axaddr_incr[8]_i_2_n_0 ;
  wire \axaddr_incr[8]_i_4_n_0 ;
  wire \axaddr_incr[8]_i_5_n_0 ;
  wire \axaddr_incr_reg[10] ;
  wire \axaddr_incr_reg[11] ;
  wire \axaddr_incr_reg[2] ;
  wire \axaddr_incr_reg[3] ;
  wire \axaddr_incr_reg[4] ;
  wire \axaddr_incr_reg[5] ;
  wire \axaddr_incr_reg[6] ;
  wire \axaddr_incr_reg[6]_0 ;
  wire \axaddr_incr_reg[7] ;
  wire [4:0]\axaddr_incr_reg[8] ;
  wire \axaddr_incr_reg[9] ;
  wire [0:0]axaddr_offset;
  wire \axaddr_offset_r[0]_i_3_n_0 ;
  wire \axaddr_offset_r[0]_i_4_n_0 ;
  wire \axaddr_offset_r[2]_i_2_n_0 ;
  wire \axaddr_offset_r[3]_i_3_n_0 ;
  wire \axaddr_offset_r_reg[0] ;
  wire \axaddr_offset_r_reg[1] ;
  wire [0:0]\axaddr_offset_r_reg[2] ;
  wire \axaddr_offset_r_reg[3] ;
  wire \axaddr_wrap_reg[0] ;
  wire [0:0]\axaddr_wrap_reg[0]_0 ;
  wire \axaddr_wrap_reg[1] ;
  wire \axlen_cnt_reg[3] ;
  wire b_push;
  wire \cnt_read_reg[0]_rep ;
  wire m_valid_i0;
  wire m_valid_i_reg_0;
  wire next_pending_r_reg;
  wire next_pending_r_reg_0;
  wire [39:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire [2:0]s_axi_awprot;
  wire s_axi_awready;
  wire [1:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_ready_i0;
  wire s_ready_i_reg_0;
  wire sel_first;
  wire [61:0]skid_buffer;
  wire \skid_buffer_reg_n_0_[0] ;
  wire \skid_buffer_reg_n_0_[10] ;
  wire \skid_buffer_reg_n_0_[11] ;
  wire \skid_buffer_reg_n_0_[12] ;
  wire \skid_buffer_reg_n_0_[13] ;
  wire \skid_buffer_reg_n_0_[14] ;
  wire \skid_buffer_reg_n_0_[15] ;
  wire \skid_buffer_reg_n_0_[16] ;
  wire \skid_buffer_reg_n_0_[17] ;
  wire \skid_buffer_reg_n_0_[18] ;
  wire \skid_buffer_reg_n_0_[19] ;
  wire \skid_buffer_reg_n_0_[1] ;
  wire \skid_buffer_reg_n_0_[20] ;
  wire \skid_buffer_reg_n_0_[21] ;
  wire \skid_buffer_reg_n_0_[22] ;
  wire \skid_buffer_reg_n_0_[23] ;
  wire \skid_buffer_reg_n_0_[24] ;
  wire \skid_buffer_reg_n_0_[25] ;
  wire \skid_buffer_reg_n_0_[26] ;
  wire \skid_buffer_reg_n_0_[27] ;
  wire \skid_buffer_reg_n_0_[28] ;
  wire \skid_buffer_reg_n_0_[29] ;
  wire \skid_buffer_reg_n_0_[2] ;
  wire \skid_buffer_reg_n_0_[30] ;
  wire \skid_buffer_reg_n_0_[31] ;
  wire \skid_buffer_reg_n_0_[32] ;
  wire \skid_buffer_reg_n_0_[33] ;
  wire \skid_buffer_reg_n_0_[34] ;
  wire \skid_buffer_reg_n_0_[35] ;
  wire \skid_buffer_reg_n_0_[36] ;
  wire \skid_buffer_reg_n_0_[37] ;
  wire \skid_buffer_reg_n_0_[38] ;
  wire \skid_buffer_reg_n_0_[39] ;
  wire \skid_buffer_reg_n_0_[3] ;
  wire \skid_buffer_reg_n_0_[40] ;
  wire \skid_buffer_reg_n_0_[41] ;
  wire \skid_buffer_reg_n_0_[42] ;
  wire \skid_buffer_reg_n_0_[43] ;
  wire \skid_buffer_reg_n_0_[44] ;
  wire \skid_buffer_reg_n_0_[46] ;
  wire \skid_buffer_reg_n_0_[47] ;
  wire \skid_buffer_reg_n_0_[4] ;
  wire \skid_buffer_reg_n_0_[52] ;
  wire \skid_buffer_reg_n_0_[53] ;
  wire \skid_buffer_reg_n_0_[54] ;
  wire \skid_buffer_reg_n_0_[55] ;
  wire \skid_buffer_reg_n_0_[56] ;
  wire \skid_buffer_reg_n_0_[57] ;
  wire \skid_buffer_reg_n_0_[58] ;
  wire \skid_buffer_reg_n_0_[59] ;
  wire \skid_buffer_reg_n_0_[5] ;
  wire \skid_buffer_reg_n_0_[61] ;
  wire \skid_buffer_reg_n_0_[6] ;
  wire \skid_buffer_reg_n_0_[7] ;
  wire \skid_buffer_reg_n_0_[8] ;
  wire \skid_buffer_reg_n_0_[9] ;
  wire \state_reg[0]_rep ;
  wire [1:0]\state_reg[1] ;
  wire \state_reg[1]_rep ;
  wire \wrap_boundary_axaddr_r[3]_i_2_n_0 ;
  wire [6:0]\wrap_boundary_axaddr_r_reg[6] ;

  FDRE #(
    .INIT(1'b0)) 
    \aresetn_d_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(1'b1),
        .Q(\aresetn_d_reg[1] ),
        .R(aresetn));
  LUT6 #(
    .INIT(64'h0F000F000F00909F)) 
    \axaddr_incr[0]_i_1 
       (.I0(Q[0]),
        .I1(\cnt_read_reg[0]_rep ),
        .I2(sel_first),
        .I3(\axaddr_incr_reg[8] [0]),
        .I4(Q[44]),
        .I5(Q[43]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hAA6AAAAAAAAAAAAA)) 
    \axaddr_incr[10]_i_3 
       (.I0(Q[10]),
        .I1(Q[8]),
        .I2(Q[6]),
        .I3(\axaddr_incr[7]_i_2_n_0 ),
        .I4(Q[7]),
        .I5(Q[9]),
        .O(\axaddr_incr_reg[10] ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \axaddr_incr[11]_i_4 
       (.I0(Q[11]),
        .I1(Q[9]),
        .I2(Q[7]),
        .I3(\axaddr_incr[8]_i_2_n_0 ),
        .I4(Q[8]),
        .I5(Q[10]),
        .O(\axaddr_incr_reg[11] ));
  LUT6 #(
    .INIT(64'h2D002DFF2DFF2D00)) 
    \axaddr_incr[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[44]),
        .I2(\axaddr_incr[1]_i_2_n_0 ),
        .I3(sel_first),
        .I4(\axaddr_incr_reg[8] [1]),
        .I5(\axaddr_incr[1]_i_3_n_0 ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'hFAFB)) 
    \axaddr_incr[1]_i_2 
       (.I0(\cnt_read_reg[0]_rep ),
        .I1(Q[43]),
        .I2(Q[44]),
        .I3(Q[0]),
        .O(\axaddr_incr[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'h54)) 
    \axaddr_incr[1]_i_3 
       (.I0(Q[44]),
        .I1(\axaddr_incr_reg[8] [0]),
        .I2(Q[43]),
        .O(\axaddr_incr[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00F0F0F0000F5A78)) 
    \axaddr_incr[2]_i_3 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[43]),
        .I4(Q[44]),
        .I5(\cnt_read_reg[0]_rep ),
        .O(\axaddr_incr_reg[2] ));
  LUT6 #(
    .INIT(64'hAA8FCFCF55703030)) 
    \axaddr_incr[3]_i_3 
       (.I0(\cnt_read_reg[0]_rep ),
        .I1(\axaddr_incr[4]_i_3_n_0 ),
        .I2(Q[2]),
        .I3(Q[43]),
        .I4(Q[44]),
        .I5(Q[3]),
        .O(\axaddr_incr_reg[3] ));
  LUT6 #(
    .INIT(64'hF3FF80FFF7FFF7FF)) 
    \axaddr_incr[4]_i_2 
       (.I0(Q[43]),
        .I1(Q[44]),
        .I2(\cnt_read_reg[0]_rep ),
        .I3(Q[3]),
        .I4(\axaddr_incr[4]_i_3_n_0 ),
        .I5(Q[2]),
        .O(\axaddr_incr_reg[4] ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT5 #(
    .INIT(32'hFFF1FFFF)) 
    \axaddr_incr[4]_i_3 
       (.I0(Q[0]),
        .I1(Q[43]),
        .I2(\cnt_read_reg[0]_rep ),
        .I3(Q[44]),
        .I4(Q[1]),
        .O(\axaddr_incr[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA600A6FFA6FFA600)) 
    \axaddr_incr[6]_i_1 
       (.I0(Q[6]),
        .I1(Q[5]),
        .I2(\axaddr_incr_reg[6] ),
        .I3(sel_first),
        .I4(\axaddr_incr_reg[8] [2]),
        .I5(\axaddr_incr_reg[5] ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h71777777FFFFFFFF)) 
    \axaddr_incr[6]_i_2__0 
       (.I0(\axaddr_incr[8]_i_4_n_0 ),
        .I1(Q[3]),
        .I2(\cnt_read_reg[0]_rep ),
        .I3(Q[44]),
        .I4(Q[43]),
        .I5(Q[4]),
        .O(\axaddr_incr_reg[6] ));
  LUT6 #(
    .INIT(64'h9A009AFF9AFF9A00)) 
    \axaddr_incr[7]_i_1 
       (.I0(Q[7]),
        .I1(\axaddr_incr[7]_i_2_n_0 ),
        .I2(Q[6]),
        .I3(sel_first),
        .I4(\axaddr_incr_reg[8] [3]),
        .I5(\axaddr_incr_reg[6]_0 ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h55F7F7FFFFFFFFFF)) 
    \axaddr_incr[7]_i_2 
       (.I0(Q[4]),
        .I1(\axaddr_incr[7]_i_4_n_0 ),
        .I2(\cnt_read_reg[0]_rep ),
        .I3(Q[3]),
        .I4(\axaddr_incr[8]_i_4_n_0 ),
        .I5(Q[5]),
        .O(\axaddr_incr[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \axaddr_incr[7]_i_4 
       (.I0(Q[44]),
        .I1(Q[43]),
        .O(\axaddr_incr[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h6A006AFF6AFF6A00)) 
    \axaddr_incr[8]_i_1 
       (.I0(Q[8]),
        .I1(\axaddr_incr[8]_i_2_n_0 ),
        .I2(Q[7]),
        .I3(sel_first),
        .I4(\axaddr_incr_reg[8] [4]),
        .I5(\axaddr_incr_reg[7] ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'h8880800000000000)) 
    \axaddr_incr[8]_i_2 
       (.I0(Q[6]),
        .I1(Q[5]),
        .I2(\axaddr_incr[8]_i_4_n_0 ),
        .I3(Q[3]),
        .I4(\axaddr_incr[8]_i_5_n_0 ),
        .I5(Q[4]),
        .O(\axaddr_incr[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h030E030000000000)) 
    \axaddr_incr[8]_i_4 
       (.I0(Q[0]),
        .I1(Q[43]),
        .I2(\cnt_read_reg[0]_rep ),
        .I3(Q[44]),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(\axaddr_incr[8]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \axaddr_incr[8]_i_5 
       (.I0(Q[43]),
        .I1(Q[44]),
        .I2(\cnt_read_reg[0]_rep ),
        .O(\axaddr_incr[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hA6AAAAAAAAAAAAAA)) 
    \axaddr_incr[9]_i_3 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(\axaddr_incr_reg[6] ),
        .I3(Q[5]),
        .I4(Q[6]),
        .I5(Q[8]),
        .O(\axaddr_incr_reg[9] ));
  LUT6 #(
    .INIT(64'hAAAAA8080000A808)) 
    \axaddr_offset_r[0]_i_2 
       (.I0(\axaddr_offset_r[0]_i_3_n_0 ),
        .I1(Q[0]),
        .I2(Q[43]),
        .I3(Q[1]),
        .I4(Q[44]),
        .I5(\axaddr_offset_r[0]_i_4_n_0 ),
        .O(\axaddr_offset_r_reg[0] ));
  LUT4 #(
    .INIT(16'h0020)) 
    \axaddr_offset_r[0]_i_3 
       (.I0(Q[47]),
        .I1(\state_reg[1] [0]),
        .I2(m_valid_i_reg_0),
        .I3(\state_reg[1] [1]),
        .O(\axaddr_offset_r[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_offset_r[0]_i_4 
       (.I0(Q[3]),
        .I1(Q[43]),
        .I2(Q[2]),
        .O(\axaddr_offset_r[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axaddr_offset_r[1]_i_3 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[44]),
        .I3(Q[2]),
        .I4(Q[43]),
        .I5(Q[1]),
        .O(\axaddr_offset_r_reg[1] ));
  LUT6 #(
    .INIT(64'hFFFFF8FF00000800)) 
    \axaddr_offset_r[2]_i_1 
       (.I0(\axaddr_offset_r[2]_i_2_n_0 ),
        .I1(Q[49]),
        .I2(\state_reg[1] [1]),
        .I3(m_valid_i_reg_0),
        .I4(\state_reg[1] [0]),
        .I5(\axaddr_offset_r_reg[2] ),
        .O(axaddr_offset));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axaddr_offset_r[2]_i_2 
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(Q[44]),
        .I3(Q[3]),
        .I4(Q[43]),
        .I5(Q[2]),
        .O(\axaddr_offset_r[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    \axaddr_offset_r[3]_i_2 
       (.I0(\axlen_cnt_reg[3] ),
        .I1(\axaddr_offset_r[3]_i_3_n_0 ),
        .I2(Q[44]),
        .I3(Q[5]),
        .I4(Q[43]),
        .I5(Q[6]),
        .O(\axaddr_offset_r_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axaddr_offset_r[3]_i_3 
       (.I0(Q[4]),
        .I1(Q[43]),
        .I2(Q[3]),
        .O(\axaddr_offset_r[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \axaddr_wrap[0]_i_2 
       (.I0(Q[44]),
        .I1(Q[43]),
        .O(\axaddr_wrap_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h54)) 
    \axaddr_wrap[1]_i_2 
       (.I0(Q[44]),
        .I1(\axaddr_wrap_reg[0]_0 ),
        .I2(Q[43]),
        .O(\axaddr_wrap_reg[1] ));
  LUT4 #(
    .INIT(16'h0020)) 
    \axlen_cnt[3]_i_2 
       (.I0(Q[50]),
        .I1(\state_reg[0]_rep ),
        .I2(m_valid_i_reg_0),
        .I3(\state_reg[1]_rep ),
        .O(\axlen_cnt_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[0]_i_1__0 
       (.I0(s_axi_awaddr[0]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[0] ),
        .O(skid_buffer[0]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[10]_i_1 
       (.I0(s_axi_awaddr[10]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[10] ),
        .O(skid_buffer[10]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[11]_i_1 
       (.I0(s_axi_awaddr[11]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[11] ),
        .O(skid_buffer[11]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[12]_i_1 
       (.I0(s_axi_awaddr[12]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[12] ),
        .O(skid_buffer[12]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[13]_i_1 
       (.I0(s_axi_awaddr[13]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[13] ),
        .O(skid_buffer[13]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[14]_i_1 
       (.I0(s_axi_awaddr[14]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[14] ),
        .O(skid_buffer[14]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[15]_i_1 
       (.I0(s_axi_awaddr[15]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[15] ),
        .O(skid_buffer[15]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[16]_i_1 
       (.I0(s_axi_awaddr[16]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[16] ),
        .O(skid_buffer[16]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[17]_i_1 
       (.I0(s_axi_awaddr[17]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[17] ),
        .O(skid_buffer[17]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[18]_i_1 
       (.I0(s_axi_awaddr[18]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[18] ),
        .O(skid_buffer[18]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[19]_i_1 
       (.I0(s_axi_awaddr[19]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[19] ),
        .O(skid_buffer[19]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[1]_i_1__0 
       (.I0(s_axi_awaddr[1]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[1] ),
        .O(skid_buffer[1]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[20]_i_1 
       (.I0(s_axi_awaddr[20]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[20] ),
        .O(skid_buffer[20]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[21]_i_1 
       (.I0(s_axi_awaddr[21]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[21] ),
        .O(skid_buffer[21]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[22]_i_1 
       (.I0(s_axi_awaddr[22]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[22] ),
        .O(skid_buffer[22]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[23]_i_1 
       (.I0(s_axi_awaddr[23]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[23] ),
        .O(skid_buffer[23]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[24]_i_1 
       (.I0(s_axi_awaddr[24]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[24] ),
        .O(skid_buffer[24]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[25]_i_1 
       (.I0(s_axi_awaddr[25]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[25] ),
        .O(skid_buffer[25]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[26]_i_1 
       (.I0(s_axi_awaddr[26]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[26] ),
        .O(skid_buffer[26]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[27]_i_1 
       (.I0(s_axi_awaddr[27]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[27] ),
        .O(skid_buffer[27]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[28]_i_1 
       (.I0(s_axi_awaddr[28]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[28] ),
        .O(skid_buffer[28]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[29]_i_1 
       (.I0(s_axi_awaddr[29]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[29] ),
        .O(skid_buffer[29]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[2]_i_1__0 
       (.I0(s_axi_awaddr[2]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[2] ),
        .O(skid_buffer[2]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[30]_i_1 
       (.I0(s_axi_awaddr[30]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[30] ),
        .O(skid_buffer[30]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[31]_i_1 
       (.I0(s_axi_awaddr[31]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[31] ),
        .O(skid_buffer[31]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[32]_i_1 
       (.I0(s_axi_awaddr[32]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[32] ),
        .O(skid_buffer[32]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[33]_i_1 
       (.I0(s_axi_awaddr[33]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[33] ),
        .O(skid_buffer[33]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[34]_i_1 
       (.I0(s_axi_awaddr[34]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[34] ),
        .O(skid_buffer[34]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[35]_i_1__0 
       (.I0(s_axi_awaddr[35]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[35] ),
        .O(skid_buffer[35]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[36]_i_1 
       (.I0(s_axi_awaddr[36]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[36] ),
        .O(skid_buffer[36]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[37]_i_1 
       (.I0(s_axi_awaddr[37]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[37] ),
        .O(skid_buffer[37]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[38]_i_1 
       (.I0(s_axi_awaddr[38]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[38] ),
        .O(skid_buffer[38]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[39]_i_2 
       (.I0(s_axi_awaddr[39]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[39] ),
        .O(skid_buffer[39]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[3]_i_1 
       (.I0(s_axi_awaddr[3]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[3] ),
        .O(skid_buffer[3]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[40]_i_1 
       (.I0(s_axi_awprot[0]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[40] ),
        .O(skid_buffer[40]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[41]_i_1 
       (.I0(s_axi_awprot[1]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[41] ),
        .O(skid_buffer[41]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[42]_i_1 
       (.I0(s_axi_awprot[2]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[42] ),
        .O(skid_buffer[42]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[43]_i_1 
       (.I0(s_axi_awsize[0]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[43] ),
        .O(skid_buffer[43]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[44]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[44] ),
        .O(skid_buffer[44]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[46]_i_1 
       (.I0(s_axi_awburst[0]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[46] ),
        .O(skid_buffer[46]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[47]_i_1 
       (.I0(s_axi_awburst[1]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[47] ),
        .O(skid_buffer[47]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[4]_i_1 
       (.I0(s_axi_awaddr[4]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[4] ),
        .O(skid_buffer[4]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[52]_i_1 
       (.I0(s_axi_awlen[0]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[52] ),
        .O(skid_buffer[52]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[53]_i_1 
       (.I0(s_axi_awlen[1]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[53] ),
        .O(skid_buffer[53]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[54]_i_1 
       (.I0(s_axi_awlen[2]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[54] ),
        .O(skid_buffer[54]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[55]_i_1 
       (.I0(s_axi_awlen[3]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[55] ),
        .O(skid_buffer[55]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[56]_i_1 
       (.I0(s_axi_awlen[4]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[56] ),
        .O(skid_buffer[56]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[57]_i_1 
       (.I0(s_axi_awlen[5]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[57] ),
        .O(skid_buffer[57]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[58]_i_1 
       (.I0(s_axi_awlen[6]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[58] ),
        .O(skid_buffer[58]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[59]_i_1 
       (.I0(s_axi_awlen[7]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[59] ),
        .O(skid_buffer[59]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[5]_i_1 
       (.I0(s_axi_awaddr[5]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[5] ),
        .O(skid_buffer[5]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[61]_i_1 
       (.I0(s_axi_awid),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[61] ),
        .O(skid_buffer[61]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[6]_i_1 
       (.I0(s_axi_awaddr[6]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[6] ),
        .O(skid_buffer[6]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[7]_i_1 
       (.I0(s_axi_awaddr[7]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[7] ),
        .O(skid_buffer[7]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[8]_i_1 
       (.I0(s_axi_awaddr[8]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[8] ),
        .O(skid_buffer[8]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[9]_i_1 
       (.I0(s_axi_awaddr[9]),
        .I1(s_axi_awready),
        .I2(\skid_buffer_reg_n_0_[9] ),
        .O(skid_buffer[9]));
  FDRE \m_payload_i_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \m_payload_i_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[10]),
        .Q(Q[10]),
        .R(1'b0));
  FDRE \m_payload_i_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[11]),
        .Q(Q[11]),
        .R(1'b0));
  FDRE \m_payload_i_reg[12] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[12]),
        .Q(Q[12]),
        .R(1'b0));
  FDRE \m_payload_i_reg[13] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[13]),
        .Q(Q[13]),
        .R(1'b0));
  FDRE \m_payload_i_reg[14] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[14]),
        .Q(Q[14]),
        .R(1'b0));
  FDRE \m_payload_i_reg[15] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[15]),
        .Q(Q[15]),
        .R(1'b0));
  FDRE \m_payload_i_reg[16] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[16]),
        .Q(Q[16]),
        .R(1'b0));
  FDRE \m_payload_i_reg[17] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[17]),
        .Q(Q[17]),
        .R(1'b0));
  FDRE \m_payload_i_reg[18] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[18]),
        .Q(Q[18]),
        .R(1'b0));
  FDRE \m_payload_i_reg[19] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[19]),
        .Q(Q[19]),
        .R(1'b0));
  FDRE \m_payload_i_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \m_payload_i_reg[20] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[20]),
        .Q(Q[20]),
        .R(1'b0));
  FDRE \m_payload_i_reg[21] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[21]),
        .Q(Q[21]),
        .R(1'b0));
  FDRE \m_payload_i_reg[22] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[22]),
        .Q(Q[22]),
        .R(1'b0));
  FDRE \m_payload_i_reg[23] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[23]),
        .Q(Q[23]),
        .R(1'b0));
  FDRE \m_payload_i_reg[24] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[24]),
        .Q(Q[24]),
        .R(1'b0));
  FDRE \m_payload_i_reg[25] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[25]),
        .Q(Q[25]),
        .R(1'b0));
  FDRE \m_payload_i_reg[26] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[26]),
        .Q(Q[26]),
        .R(1'b0));
  FDRE \m_payload_i_reg[27] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[27]),
        .Q(Q[27]),
        .R(1'b0));
  FDRE \m_payload_i_reg[28] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[28]),
        .Q(Q[28]),
        .R(1'b0));
  FDRE \m_payload_i_reg[29] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[29]),
        .Q(Q[29]),
        .R(1'b0));
  FDRE \m_payload_i_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \m_payload_i_reg[30] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[30]),
        .Q(Q[30]),
        .R(1'b0));
  FDRE \m_payload_i_reg[31] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[31]),
        .Q(Q[31]),
        .R(1'b0));
  FDRE \m_payload_i_reg[32] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[32]),
        .Q(Q[32]),
        .R(1'b0));
  FDRE \m_payload_i_reg[33] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[33]),
        .Q(Q[33]),
        .R(1'b0));
  FDRE \m_payload_i_reg[34] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[34]),
        .Q(Q[34]),
        .R(1'b0));
  FDRE \m_payload_i_reg[35] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[35]),
        .Q(Q[35]),
        .R(1'b0));
  FDRE \m_payload_i_reg[36] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[36]),
        .Q(Q[36]),
        .R(1'b0));
  FDRE \m_payload_i_reg[37] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[37]),
        .Q(Q[37]),
        .R(1'b0));
  FDRE \m_payload_i_reg[38] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[38]),
        .Q(Q[38]),
        .R(1'b0));
  FDRE \m_payload_i_reg[39] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[39]),
        .Q(Q[39]),
        .R(1'b0));
  FDRE \m_payload_i_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE \m_payload_i_reg[40] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[40]),
        .Q(Q[40]),
        .R(1'b0));
  FDRE \m_payload_i_reg[41] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[41]),
        .Q(Q[41]),
        .R(1'b0));
  FDRE \m_payload_i_reg[42] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[42]),
        .Q(Q[42]),
        .R(1'b0));
  FDRE \m_payload_i_reg[43] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[43]),
        .Q(Q[43]),
        .R(1'b0));
  FDRE \m_payload_i_reg[44] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[44]),
        .Q(Q[44]),
        .R(1'b0));
  FDRE \m_payload_i_reg[46] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[46]),
        .Q(Q[45]),
        .R(1'b0));
  FDRE \m_payload_i_reg[47] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[47]),
        .Q(Q[46]),
        .R(1'b0));
  FDRE \m_payload_i_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE \m_payload_i_reg[52] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[52]),
        .Q(Q[47]),
        .R(1'b0));
  FDRE \m_payload_i_reg[53] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[53]),
        .Q(Q[48]),
        .R(1'b0));
  FDRE \m_payload_i_reg[54] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[54]),
        .Q(Q[49]),
        .R(1'b0));
  FDRE \m_payload_i_reg[55] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[55]),
        .Q(Q[50]),
        .R(1'b0));
  FDRE \m_payload_i_reg[56] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[56]),
        .Q(Q[51]),
        .R(1'b0));
  FDRE \m_payload_i_reg[57] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[57]),
        .Q(Q[52]),
        .R(1'b0));
  FDRE \m_payload_i_reg[58] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[58]),
        .Q(Q[53]),
        .R(1'b0));
  FDRE \m_payload_i_reg[59] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[59]),
        .Q(Q[54]),
        .R(1'b0));
  FDRE \m_payload_i_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE \m_payload_i_reg[61] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[61]),
        .Q(Q[55]),
        .R(1'b0));
  FDRE \m_payload_i_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE \m_payload_i_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[7]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE \m_payload_i_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[8]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE \m_payload_i_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[9]),
        .Q(Q[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hF4FF)) 
    m_valid_i_i_1__2
       (.I0(b_push),
        .I1(m_valid_i_reg_0),
        .I2(s_axi_awvalid),
        .I3(s_axi_awready),
        .O(m_valid_i0));
  FDRE #(
    .INIT(1'b0)) 
    m_valid_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(m_valid_i0),
        .Q(m_valid_i_reg_0),
        .R(\aresetn_d_reg[1]_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFD)) 
    next_pending_r_i_2
       (.I0(next_pending_r_reg_0),
        .I1(Q[52]),
        .I2(Q[51]),
        .I3(Q[54]),
        .I4(Q[53]),
        .O(next_pending_r_reg));
  LUT4 #(
    .INIT(16'h0001)) 
    next_pending_r_i_2__0
       (.I0(Q[49]),
        .I1(Q[47]),
        .I2(Q[48]),
        .I3(Q[50]),
        .O(next_pending_r_reg_0));
  LUT1 #(
    .INIT(2'h1)) 
    s_ready_i_i_1__1
       (.I0(\aresetn_d_reg[1] ),
        .O(s_ready_i_reg_0));
  LUT4 #(
    .INIT(16'hBFBB)) 
    s_ready_i_i_2
       (.I0(b_push),
        .I1(m_valid_i_reg_0),
        .I2(s_axi_awvalid),
        .I3(s_axi_awready),
        .O(s_ready_i0));
  FDRE #(
    .INIT(1'b0)) 
    s_ready_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_ready_i0),
        .Q(s_axi_awready),
        .R(s_ready_i_reg_0));
  FDRE \skid_buffer_reg[0] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[0]),
        .Q(\skid_buffer_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[10] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[10]),
        .Q(\skid_buffer_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[11] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[11]),
        .Q(\skid_buffer_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[12] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[12]),
        .Q(\skid_buffer_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[13] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[13]),
        .Q(\skid_buffer_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[14] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[14]),
        .Q(\skid_buffer_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[15] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[15]),
        .Q(\skid_buffer_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[16] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[16]),
        .Q(\skid_buffer_reg_n_0_[16] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[17] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[17]),
        .Q(\skid_buffer_reg_n_0_[17] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[18] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[18]),
        .Q(\skid_buffer_reg_n_0_[18] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[19] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[19]),
        .Q(\skid_buffer_reg_n_0_[19] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[1] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[1]),
        .Q(\skid_buffer_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[20] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[20]),
        .Q(\skid_buffer_reg_n_0_[20] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[21] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[21]),
        .Q(\skid_buffer_reg_n_0_[21] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[22] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[22]),
        .Q(\skid_buffer_reg_n_0_[22] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[23] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[23]),
        .Q(\skid_buffer_reg_n_0_[23] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[24] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[24]),
        .Q(\skid_buffer_reg_n_0_[24] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[25] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[25]),
        .Q(\skid_buffer_reg_n_0_[25] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[26] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[26]),
        .Q(\skid_buffer_reg_n_0_[26] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[27] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[27]),
        .Q(\skid_buffer_reg_n_0_[27] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[28] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[28]),
        .Q(\skid_buffer_reg_n_0_[28] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[29] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[29]),
        .Q(\skid_buffer_reg_n_0_[29] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[2] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[2]),
        .Q(\skid_buffer_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[30] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[30]),
        .Q(\skid_buffer_reg_n_0_[30] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[31] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[31]),
        .Q(\skid_buffer_reg_n_0_[31] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[32] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[32]),
        .Q(\skid_buffer_reg_n_0_[32] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[33] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[33]),
        .Q(\skid_buffer_reg_n_0_[33] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[34] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[34]),
        .Q(\skid_buffer_reg_n_0_[34] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[35] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[35]),
        .Q(\skid_buffer_reg_n_0_[35] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[36] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[36]),
        .Q(\skid_buffer_reg_n_0_[36] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[37] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[37]),
        .Q(\skid_buffer_reg_n_0_[37] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[38] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[38]),
        .Q(\skid_buffer_reg_n_0_[38] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[39] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[39]),
        .Q(\skid_buffer_reg_n_0_[39] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[3] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[3]),
        .Q(\skid_buffer_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[40] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awprot[0]),
        .Q(\skid_buffer_reg_n_0_[40] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[41] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awprot[1]),
        .Q(\skid_buffer_reg_n_0_[41] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[42] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awprot[2]),
        .Q(\skid_buffer_reg_n_0_[42] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[43] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awsize[0]),
        .Q(\skid_buffer_reg_n_0_[43] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[44] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awsize[1]),
        .Q(\skid_buffer_reg_n_0_[44] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[46] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awburst[0]),
        .Q(\skid_buffer_reg_n_0_[46] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[47] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awburst[1]),
        .Q(\skid_buffer_reg_n_0_[47] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[4] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[4]),
        .Q(\skid_buffer_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[52] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awlen[0]),
        .Q(\skid_buffer_reg_n_0_[52] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[53] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awlen[1]),
        .Q(\skid_buffer_reg_n_0_[53] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[54] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awlen[2]),
        .Q(\skid_buffer_reg_n_0_[54] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[55] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awlen[3]),
        .Q(\skid_buffer_reg_n_0_[55] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[56] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awlen[4]),
        .Q(\skid_buffer_reg_n_0_[56] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[57] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awlen[5]),
        .Q(\skid_buffer_reg_n_0_[57] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[58] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awlen[6]),
        .Q(\skid_buffer_reg_n_0_[58] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[59] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awlen[7]),
        .Q(\skid_buffer_reg_n_0_[59] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[5] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[5]),
        .Q(\skid_buffer_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[61] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awid),
        .Q(\skid_buffer_reg_n_0_[61] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[6] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[6]),
        .Q(\skid_buffer_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[7] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[7]),
        .Q(\skid_buffer_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[8] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[8]),
        .Q(\skid_buffer_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[9] 
       (.C(aclk),
        .CE(s_axi_awready),
        .D(s_axi_awaddr[9]),
        .Q(\skid_buffer_reg_n_0_[9] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'hAA8A)) 
    \wrap_boundary_axaddr_r[0]_i_1 
       (.I0(Q[0]),
        .I1(Q[43]),
        .I2(Q[47]),
        .I3(Q[44]),
        .O(\wrap_boundary_axaddr_r_reg[6] [0]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \wrap_boundary_axaddr_r[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[44]),
        .I2(Q[47]),
        .I3(Q[43]),
        .I4(Q[48]),
        .O(\wrap_boundary_axaddr_r_reg[6] [1]));
  LUT6 #(
    .INIT(64'hFF0F553300000000)) 
    \wrap_boundary_axaddr_r[2]_i_1 
       (.I0(Q[48]),
        .I1(Q[49]),
        .I2(Q[47]),
        .I3(Q[43]),
        .I4(Q[44]),
        .I5(Q[2]),
        .O(\wrap_boundary_axaddr_r_reg[6] [2]));
  LUT6 #(
    .INIT(64'h020202A2A2A202A2)) 
    \wrap_boundary_axaddr_r[3]_i_1 
       (.I0(Q[3]),
        .I1(\wrap_boundary_axaddr_r[3]_i_2_n_0 ),
        .I2(Q[44]),
        .I3(Q[48]),
        .I4(Q[43]),
        .I5(Q[47]),
        .O(\wrap_boundary_axaddr_r_reg[6] [3]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_boundary_axaddr_r[3]_i_2 
       (.I0(Q[49]),
        .I1(Q[43]),
        .I2(Q[50]),
        .O(\wrap_boundary_axaddr_r[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h500030F050F030F0)) 
    \wrap_boundary_axaddr_r[4]_i_1 
       (.I0(Q[48]),
        .I1(Q[49]),
        .I2(Q[4]),
        .I3(Q[44]),
        .I4(Q[43]),
        .I5(Q[50]),
        .O(\wrap_boundary_axaddr_r_reg[6] [4]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT5 #(
    .INIT(32'h2A222AAA)) 
    \wrap_boundary_axaddr_r[5]_i_1 
       (.I0(Q[5]),
        .I1(Q[44]),
        .I2(Q[49]),
        .I3(Q[43]),
        .I4(Q[50]),
        .O(\wrap_boundary_axaddr_r_reg[6] [5]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'h2AAA)) 
    \wrap_boundary_axaddr_r[6]_i_1 
       (.I0(Q[6]),
        .I1(Q[50]),
        .I2(Q[43]),
        .I3(Q[44]),
        .O(\wrap_boundary_axaddr_r_reg[6] [6]));
endmodule

(* ORIG_REF_NAME = "axi_register_slice_v2_1_17_axic_register_slice" *) 
module streaming_auto_pc_0_axi_register_slice_v2_1_17_axic_register_slice__parameterized1
   (s_axi_bvalid,
    \skid_buffer_reg[0]_0 ,
    UNCONN_OUT,
    \aresetn_d_reg[1] ,
    aclk,
    \aresetn_d_reg[0] ,
    si_rs_bvalid,
    s_axi_bready,
    out,
    \s_bresp_acc_reg[1] );
  output s_axi_bvalid;
  output \skid_buffer_reg[0]_0 ;
  output [2:0]UNCONN_OUT;
  input \aresetn_d_reg[1] ;
  input aclk;
  input \aresetn_d_reg[0] ;
  input si_rs_bvalid;
  input s_axi_bready;
  input [0:0]out;
  input [1:0]\s_bresp_acc_reg[1] ;

  wire [2:0]UNCONN_OUT;
  wire aclk;
  wire \aresetn_d_reg[0] ;
  wire \aresetn_d_reg[1] ;
  wire m_valid_i0;
  wire [0:0]out;
  wire p_1_in;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [1:0]\s_bresp_acc_reg[1] ;
  wire s_ready_i0;
  wire si_rs_bvalid;
  wire [2:0]skid_buffer;
  wire \skid_buffer_reg[0]_0 ;
  wire \skid_buffer_reg_n_0_[0] ;
  wire \skid_buffer_reg_n_0_[1] ;
  wire \skid_buffer_reg_n_0_[2] ;

  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[0]_i_1 
       (.I0(\s_bresp_acc_reg[1] [0]),
        .I1(\skid_buffer_reg[0]_0 ),
        .I2(\skid_buffer_reg_n_0_[0] ),
        .O(skid_buffer[0]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[1]_i_1 
       (.I0(\s_bresp_acc_reg[1] [1]),
        .I1(\skid_buffer_reg[0]_0 ),
        .I2(\skid_buffer_reg_n_0_[1] ),
        .O(skid_buffer[1]));
  LUT2 #(
    .INIT(4'hB)) 
    \m_payload_i[2]_i_1 
       (.I0(s_axi_bready),
        .I1(s_axi_bvalid),
        .O(p_1_in));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[2]_i_2 
       (.I0(out),
        .I1(\skid_buffer_reg[0]_0 ),
        .I2(\skid_buffer_reg_n_0_[2] ),
        .O(skid_buffer[2]));
  FDRE \m_payload_i_reg[0] 
       (.C(aclk),
        .CE(p_1_in),
        .D(skid_buffer[0]),
        .Q(UNCONN_OUT[0]),
        .R(1'b0));
  FDRE \m_payload_i_reg[1] 
       (.C(aclk),
        .CE(p_1_in),
        .D(skid_buffer[1]),
        .Q(UNCONN_OUT[1]),
        .R(1'b0));
  FDRE \m_payload_i_reg[2] 
       (.C(aclk),
        .CE(p_1_in),
        .D(skid_buffer[2]),
        .Q(UNCONN_OUT[2]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hF4FF)) 
    m_valid_i_i_2__0
       (.I0(s_axi_bready),
        .I1(s_axi_bvalid),
        .I2(si_rs_bvalid),
        .I3(\skid_buffer_reg[0]_0 ),
        .O(m_valid_i0));
  FDRE #(
    .INIT(1'b0)) 
    m_valid_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(m_valid_i0),
        .Q(s_axi_bvalid),
        .R(\aresetn_d_reg[1] ));
  LUT4 #(
    .INIT(16'hF4FF)) 
    s_ready_i_i_1
       (.I0(si_rs_bvalid),
        .I1(\skid_buffer_reg[0]_0 ),
        .I2(s_axi_bready),
        .I3(s_axi_bvalid),
        .O(s_ready_i0));
  FDRE #(
    .INIT(1'b0)) 
    s_ready_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_ready_i0),
        .Q(\skid_buffer_reg[0]_0 ),
        .R(\aresetn_d_reg[0] ));
  FDRE \skid_buffer_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(skid_buffer[0]),
        .Q(\skid_buffer_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(skid_buffer[1]),
        .Q(\skid_buffer_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(skid_buffer[2]),
        .Q(\skid_buffer_reg_n_0_[2] ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_register_slice_v2_1_17_axic_register_slice" *) 
module streaming_auto_pc_0_axi_register_slice_v2_1_17_axic_register_slice__parameterized2
   (s_axi_rvalid,
    \cnt_read_reg[3] ,
    UNCONN_OUT,
    \aresetn_d_reg[1] ,
    aclk,
    \aresetn_d_reg[0] ,
    \cnt_read_reg[4] ,
    s_axi_rready,
    r_push_r_reg,
    \cnt_read_reg[4]_0 );
  output s_axi_rvalid;
  output \cnt_read_reg[3] ;
  output [35:0]UNCONN_OUT;
  input \aresetn_d_reg[1] ;
  input aclk;
  input \aresetn_d_reg[0] ;
  input \cnt_read_reg[4] ;
  input s_axi_rready;
  input [1:0]r_push_r_reg;
  input [33:0]\cnt_read_reg[4]_0 ;

  wire [35:0]UNCONN_OUT;
  wire aclk;
  wire \aresetn_d_reg[0] ;
  wire \aresetn_d_reg[1] ;
  wire \cnt_read_reg[3] ;
  wire \cnt_read_reg[4] ;
  wire [33:0]\cnt_read_reg[4]_0 ;
  wire \m_payload_i[0]_i_1__2_n_0 ;
  wire \m_payload_i[10]_i_1__1_n_0 ;
  wire \m_payload_i[11]_i_1__1_n_0 ;
  wire \m_payload_i[12]_i_1__1_n_0 ;
  wire \m_payload_i[13]_i_1__1_n_0 ;
  wire \m_payload_i[14]_i_1__1_n_0 ;
  wire \m_payload_i[15]_i_1__1_n_0 ;
  wire \m_payload_i[16]_i_1__1_n_0 ;
  wire \m_payload_i[17]_i_1__1_n_0 ;
  wire \m_payload_i[18]_i_1__1_n_0 ;
  wire \m_payload_i[19]_i_1__1_n_0 ;
  wire \m_payload_i[1]_i_1__2_n_0 ;
  wire \m_payload_i[20]_i_1__1_n_0 ;
  wire \m_payload_i[21]_i_1__1_n_0 ;
  wire \m_payload_i[22]_i_1__1_n_0 ;
  wire \m_payload_i[23]_i_1__1_n_0 ;
  wire \m_payload_i[24]_i_1__1_n_0 ;
  wire \m_payload_i[25]_i_1__1_n_0 ;
  wire \m_payload_i[26]_i_1__1_n_0 ;
  wire \m_payload_i[27]_i_1__1_n_0 ;
  wire \m_payload_i[28]_i_1__1_n_0 ;
  wire \m_payload_i[29]_i_1__1_n_0 ;
  wire \m_payload_i[2]_i_1__2_n_0 ;
  wire \m_payload_i[30]_i_1__1_n_0 ;
  wire \m_payload_i[31]_i_1__1_n_0 ;
  wire \m_payload_i[32]_i_1__1_n_0 ;
  wire \m_payload_i[33]_i_1__1_n_0 ;
  wire \m_payload_i[34]_i_1__1_n_0 ;
  wire \m_payload_i[35]_i_2_n_0 ;
  wire \m_payload_i[3]_i_1__1_n_0 ;
  wire \m_payload_i[4]_i_1__1_n_0 ;
  wire \m_payload_i[5]_i_1__1_n_0 ;
  wire \m_payload_i[6]_i_1__1_n_0 ;
  wire \m_payload_i[7]_i_1__1_n_0 ;
  wire \m_payload_i[8]_i_1__1_n_0 ;
  wire \m_payload_i[9]_i_1__1_n_0 ;
  wire m_valid_i_i_1__1_n_0;
  wire p_1_in;
  wire [1:0]r_push_r_reg;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire s_ready_i_i_1__2_n_0;
  wire si_rs_rready;
  wire \skid_buffer_reg_n_0_[0] ;
  wire \skid_buffer_reg_n_0_[10] ;
  wire \skid_buffer_reg_n_0_[11] ;
  wire \skid_buffer_reg_n_0_[12] ;
  wire \skid_buffer_reg_n_0_[13] ;
  wire \skid_buffer_reg_n_0_[14] ;
  wire \skid_buffer_reg_n_0_[15] ;
  wire \skid_buffer_reg_n_0_[16] ;
  wire \skid_buffer_reg_n_0_[17] ;
  wire \skid_buffer_reg_n_0_[18] ;
  wire \skid_buffer_reg_n_0_[19] ;
  wire \skid_buffer_reg_n_0_[1] ;
  wire \skid_buffer_reg_n_0_[20] ;
  wire \skid_buffer_reg_n_0_[21] ;
  wire \skid_buffer_reg_n_0_[22] ;
  wire \skid_buffer_reg_n_0_[23] ;
  wire \skid_buffer_reg_n_0_[24] ;
  wire \skid_buffer_reg_n_0_[25] ;
  wire \skid_buffer_reg_n_0_[26] ;
  wire \skid_buffer_reg_n_0_[27] ;
  wire \skid_buffer_reg_n_0_[28] ;
  wire \skid_buffer_reg_n_0_[29] ;
  wire \skid_buffer_reg_n_0_[2] ;
  wire \skid_buffer_reg_n_0_[30] ;
  wire \skid_buffer_reg_n_0_[31] ;
  wire \skid_buffer_reg_n_0_[32] ;
  wire \skid_buffer_reg_n_0_[33] ;
  wire \skid_buffer_reg_n_0_[34] ;
  wire \skid_buffer_reg_n_0_[35] ;
  wire \skid_buffer_reg_n_0_[3] ;
  wire \skid_buffer_reg_n_0_[4] ;
  wire \skid_buffer_reg_n_0_[5] ;
  wire \skid_buffer_reg_n_0_[6] ;
  wire \skid_buffer_reg_n_0_[7] ;
  wire \skid_buffer_reg_n_0_[8] ;
  wire \skid_buffer_reg_n_0_[9] ;

  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt_read[3]_i_2 
       (.I0(si_rs_rready),
        .I1(\cnt_read_reg[4] ),
        .O(\cnt_read_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[0]_i_1__2 
       (.I0(\cnt_read_reg[4]_0 [0]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[0] ),
        .O(\m_payload_i[0]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[10]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [10]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[10] ),
        .O(\m_payload_i[10]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[11]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [11]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[11] ),
        .O(\m_payload_i[11]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[12]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [12]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[12] ),
        .O(\m_payload_i[12]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[13]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [13]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[13] ),
        .O(\m_payload_i[13]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[14]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [14]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[14] ),
        .O(\m_payload_i[14]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[15]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [15]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[15] ),
        .O(\m_payload_i[15]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[16]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [16]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[16] ),
        .O(\m_payload_i[16]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[17]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [17]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[17] ),
        .O(\m_payload_i[17]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[18]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [18]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[18] ),
        .O(\m_payload_i[18]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[19]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [19]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[19] ),
        .O(\m_payload_i[19]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[1]_i_1__2 
       (.I0(\cnt_read_reg[4]_0 [1]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[1] ),
        .O(\m_payload_i[1]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[20]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [20]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[20] ),
        .O(\m_payload_i[20]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[21]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [21]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[21] ),
        .O(\m_payload_i[21]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[22]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [22]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[22] ),
        .O(\m_payload_i[22]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[23]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [23]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[23] ),
        .O(\m_payload_i[23]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[24]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [24]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[24] ),
        .O(\m_payload_i[24]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[25]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [25]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[25] ),
        .O(\m_payload_i[25]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[26]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [26]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[26] ),
        .O(\m_payload_i[26]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[27]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [27]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[27] ),
        .O(\m_payload_i[27]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[28]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [28]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[28] ),
        .O(\m_payload_i[28]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[29]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [29]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[29] ),
        .O(\m_payload_i[29]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[2]_i_1__2 
       (.I0(\cnt_read_reg[4]_0 [2]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[2] ),
        .O(\m_payload_i[2]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[30]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [30]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[30] ),
        .O(\m_payload_i[30]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[31]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [31]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[31] ),
        .O(\m_payload_i[31]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[32]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [32]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[32] ),
        .O(\m_payload_i[32]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[33]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [33]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[33] ),
        .O(\m_payload_i[33]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[34]_i_1__1 
       (.I0(r_push_r_reg[0]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[34] ),
        .O(\m_payload_i[34]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \m_payload_i[35]_i_1 
       (.I0(s_axi_rready),
        .I1(s_axi_rvalid),
        .O(p_1_in));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[35]_i_2 
       (.I0(r_push_r_reg[1]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[35] ),
        .O(\m_payload_i[35]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[3]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [3]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[3] ),
        .O(\m_payload_i[3]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[4]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [4]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[4] ),
        .O(\m_payload_i[4]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[5]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [5]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[5] ),
        .O(\m_payload_i[5]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[6]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [6]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[6] ),
        .O(\m_payload_i[6]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[7]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [7]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[7] ),
        .O(\m_payload_i[7]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[8]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [8]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[8] ),
        .O(\m_payload_i[8]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_payload_i[9]_i_1__1 
       (.I0(\cnt_read_reg[4]_0 [9]),
        .I1(si_rs_rready),
        .I2(\skid_buffer_reg_n_0_[9] ),
        .O(\m_payload_i[9]_i_1__1_n_0 ));
  FDRE \m_payload_i_reg[0] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[0]_i_1__2_n_0 ),
        .Q(UNCONN_OUT[0]),
        .R(1'b0));
  FDRE \m_payload_i_reg[10] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[10]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[10]),
        .R(1'b0));
  FDRE \m_payload_i_reg[11] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[11]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[11]),
        .R(1'b0));
  FDRE \m_payload_i_reg[12] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[12]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[12]),
        .R(1'b0));
  FDRE \m_payload_i_reg[13] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[13]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[13]),
        .R(1'b0));
  FDRE \m_payload_i_reg[14] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[14]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[14]),
        .R(1'b0));
  FDRE \m_payload_i_reg[15] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[15]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[15]),
        .R(1'b0));
  FDRE \m_payload_i_reg[16] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[16]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[16]),
        .R(1'b0));
  FDRE \m_payload_i_reg[17] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[17]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[17]),
        .R(1'b0));
  FDRE \m_payload_i_reg[18] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[18]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[18]),
        .R(1'b0));
  FDRE \m_payload_i_reg[19] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[19]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[19]),
        .R(1'b0));
  FDRE \m_payload_i_reg[1] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[1]_i_1__2_n_0 ),
        .Q(UNCONN_OUT[1]),
        .R(1'b0));
  FDRE \m_payload_i_reg[20] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[20]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[20]),
        .R(1'b0));
  FDRE \m_payload_i_reg[21] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[21]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[21]),
        .R(1'b0));
  FDRE \m_payload_i_reg[22] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[22]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[22]),
        .R(1'b0));
  FDRE \m_payload_i_reg[23] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[23]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[23]),
        .R(1'b0));
  FDRE \m_payload_i_reg[24] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[24]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[24]),
        .R(1'b0));
  FDRE \m_payload_i_reg[25] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[25]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[25]),
        .R(1'b0));
  FDRE \m_payload_i_reg[26] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[26]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[26]),
        .R(1'b0));
  FDRE \m_payload_i_reg[27] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[27]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[27]),
        .R(1'b0));
  FDRE \m_payload_i_reg[28] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[28]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[28]),
        .R(1'b0));
  FDRE \m_payload_i_reg[29] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[29]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[29]),
        .R(1'b0));
  FDRE \m_payload_i_reg[2] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[2]_i_1__2_n_0 ),
        .Q(UNCONN_OUT[2]),
        .R(1'b0));
  FDRE \m_payload_i_reg[30] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[30]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[30]),
        .R(1'b0));
  FDRE \m_payload_i_reg[31] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[31]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[31]),
        .R(1'b0));
  FDRE \m_payload_i_reg[32] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[32]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[32]),
        .R(1'b0));
  FDRE \m_payload_i_reg[33] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[33]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[33]),
        .R(1'b0));
  FDRE \m_payload_i_reg[34] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[34]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[34]),
        .R(1'b0));
  FDRE \m_payload_i_reg[35] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[35]_i_2_n_0 ),
        .Q(UNCONN_OUT[35]),
        .R(1'b0));
  FDRE \m_payload_i_reg[3] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[3]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[3]),
        .R(1'b0));
  FDRE \m_payload_i_reg[4] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[4]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[4]),
        .R(1'b0));
  FDRE \m_payload_i_reg[5] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[5]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[5]),
        .R(1'b0));
  FDRE \m_payload_i_reg[6] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[6]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[6]),
        .R(1'b0));
  FDRE \m_payload_i_reg[7] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[7]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[7]),
        .R(1'b0));
  FDRE \m_payload_i_reg[8] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[8]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[8]),
        .R(1'b0));
  FDRE \m_payload_i_reg[9] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\m_payload_i[9]_i_1__1_n_0 ),
        .Q(UNCONN_OUT[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT4 #(
    .INIT(16'hF4FF)) 
    m_valid_i_i_1__1
       (.I0(s_axi_rready),
        .I1(s_axi_rvalid),
        .I2(\cnt_read_reg[4] ),
        .I3(si_rs_rready),
        .O(m_valid_i_i_1__1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    m_valid_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(m_valid_i_i_1__1_n_0),
        .Q(s_axi_rvalid),
        .R(\aresetn_d_reg[1] ));
  LUT4 #(
    .INIT(16'hF4FF)) 
    s_ready_i_i_1__2
       (.I0(\cnt_read_reg[4] ),
        .I1(si_rs_rready),
        .I2(s_axi_rready),
        .I3(s_axi_rvalid),
        .O(s_ready_i_i_1__2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_ready_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_ready_i_i_1__2_n_0),
        .Q(si_rs_rready),
        .R(\aresetn_d_reg[0] ));
  FDRE \skid_buffer_reg[0] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [0]),
        .Q(\skid_buffer_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[10] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [10]),
        .Q(\skid_buffer_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[11] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [11]),
        .Q(\skid_buffer_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[12] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [12]),
        .Q(\skid_buffer_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[13] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [13]),
        .Q(\skid_buffer_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[14] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [14]),
        .Q(\skid_buffer_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[15] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [15]),
        .Q(\skid_buffer_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[16] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [16]),
        .Q(\skid_buffer_reg_n_0_[16] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[17] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [17]),
        .Q(\skid_buffer_reg_n_0_[17] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[18] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [18]),
        .Q(\skid_buffer_reg_n_0_[18] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[19] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [19]),
        .Q(\skid_buffer_reg_n_0_[19] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[1] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [1]),
        .Q(\skid_buffer_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[20] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [20]),
        .Q(\skid_buffer_reg_n_0_[20] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[21] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [21]),
        .Q(\skid_buffer_reg_n_0_[21] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[22] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [22]),
        .Q(\skid_buffer_reg_n_0_[22] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[23] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [23]),
        .Q(\skid_buffer_reg_n_0_[23] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[24] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [24]),
        .Q(\skid_buffer_reg_n_0_[24] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[25] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [25]),
        .Q(\skid_buffer_reg_n_0_[25] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[26] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [26]),
        .Q(\skid_buffer_reg_n_0_[26] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[27] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [27]),
        .Q(\skid_buffer_reg_n_0_[27] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[28] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [28]),
        .Q(\skid_buffer_reg_n_0_[28] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[29] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [29]),
        .Q(\skid_buffer_reg_n_0_[29] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[2] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [2]),
        .Q(\skid_buffer_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[30] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [30]),
        .Q(\skid_buffer_reg_n_0_[30] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[31] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [31]),
        .Q(\skid_buffer_reg_n_0_[31] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[32] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [32]),
        .Q(\skid_buffer_reg_n_0_[32] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[33] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [33]),
        .Q(\skid_buffer_reg_n_0_[33] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[34] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(r_push_r_reg[0]),
        .Q(\skid_buffer_reg_n_0_[34] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[35] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(r_push_r_reg[1]),
        .Q(\skid_buffer_reg_n_0_[35] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[3] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [3]),
        .Q(\skid_buffer_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[4] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [4]),
        .Q(\skid_buffer_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[5] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [5]),
        .Q(\skid_buffer_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[6] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [6]),
        .Q(\skid_buffer_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[7] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [7]),
        .Q(\skid_buffer_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[8] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [8]),
        .Q(\skid_buffer_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \skid_buffer_reg[9] 
       (.C(aclk),
        .CE(si_rs_rready),
        .D(\cnt_read_reg[4]_0 [9]),
        .Q(\skid_buffer_reg_n_0_[9] ),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "streaming_auto_pc_1,axi_protocol_converter_v2_1_17_axi_protocol_converter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axi_protocol_converter_v2_1_17_axi_protocol_converter,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module streaming_auto_pc_0
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awregion,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arregion,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awprot,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arprot,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rvalid,
    m_axi_rready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK, FREQ_HZ 99990000, PHASE 0.000, CLK_DOMAIN streaming_zynq_ultra_ps_e_0_0_pl_clk0, ASSOCIATED_BUSIF S_AXI:M_AXI, ASSOCIATED_RESET ARESETN" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST, POLARITY ACTIVE_LOW, TYPE INTERCONNECT" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) input [39:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLEN" *) input [7:0]s_axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE" *) input [2:0]s_axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWBURST" *) input [1:0]s_axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK" *) input [0:0]s_axi_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE" *) input [3:0]s_axi_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]s_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREGION" *) input [3:0]s_axi_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWQOS" *) input [3:0]s_axi_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *) input s_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [39:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLEN" *) input [7:0]s_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE" *) input [2:0]s_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARBURST" *) input [1:0]s_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK" *) input [0:0]s_axi_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE" *) input [3:0]s_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]s_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREGION" *) input [3:0]s_axi_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARQOS" *) input [3:0]s_axi_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *) output s_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 99990000, ID_WIDTH 0, ADDR_WIDTH 40, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN streaming_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *) input s_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *) output [39:0]m_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWPROT" *) output [2:0]m_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *) output m_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *) input m_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *) output [31:0]m_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *) output [3:0]m_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *) output m_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *) input m_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *) input [1:0]m_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *) input m_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *) output m_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *) output [39:0]m_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARPROT" *) output [2:0]m_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *) output m_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *) input m_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *) input [31:0]m_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RRESP" *) input [1:0]m_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *) input m_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 99990000, ID_WIDTH 0, ADDR_WIDTH 40, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN streaming_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *) output m_axi_rready;

  wire aclk;
  wire aresetn;
  wire [39:0]m_axi_araddr;
  wire [2:0]m_axi_arprot;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire [39:0]m_axi_awaddr;
  wire [2:0]m_axi_awprot;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [31:0]m_axi_rdata;
  wire m_axi_rready;
  wire [1:0]m_axi_rresp;
  wire m_axi_rvalid;
  wire [31:0]m_axi_wdata;
  wire m_axi_wready;
  wire [3:0]m_axi_wstrb;
  wire m_axi_wvalid;
  wire [39:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire s_axi_arready;
  wire [3:0]s_axi_arregion;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [39:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [7:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire s_axi_awready;
  wire [3:0]s_axi_awregion;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire NLW_inst_m_axi_wlast_UNCONNECTED;
  wire [1:0]NLW_inst_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_inst_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_arlock_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_inst_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_aruser_UNCONNECTED;
  wire [1:0]NLW_inst_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_inst_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awlock_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_inst_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awuser_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_wid_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_wuser_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_bid_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_buser_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_rid_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_ruser_UNCONNECTED;

  (* C_AXI_ADDR_WIDTH = "40" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "32" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_SUPPORTS_READ = "1" *) 
  (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) 
  (* C_AXI_SUPPORTS_WRITE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_FAMILY = "zynquplus" *) 
  (* C_IGNORE_ID = "1" *) 
  (* C_M_AXI_PROTOCOL = "2" *) 
  (* C_S_AXI_PROTOCOL = "0" *) 
  (* C_TRANSLATION_MODE = "2" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* P_AXI3 = "1" *) 
  (* P_AXI4 = "0" *) 
  (* P_AXILITE = "2" *) 
  (* P_AXILITE_SIZE = "3'b010" *) 
  (* P_CONVERSION = "2" *) 
  (* P_DECERR = "2'b11" *) 
  (* P_INCR = "2'b01" *) 
  (* P_PROTECTION = "1" *) 
  (* P_SLVERR = "2'b10" *) 
  streaming_auto_pc_0_axi_protocol_converter_v2_1_17_axi_protocol_converter inst
       (.aclk(aclk),
        .aresetn(aresetn),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arburst(NLW_inst_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_inst_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_inst_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_inst_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_inst_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(m_axi_arprot),
        .m_axi_arqos(NLW_inst_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(m_axi_arready),
        .m_axi_arregion(NLW_inst_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_inst_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_inst_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(NLW_inst_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_inst_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_inst_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_inst_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_inst_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awqos(NLW_inst_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(m_axi_awready),
        .m_axi_awregion(NLW_inst_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_inst_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_inst_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_bid(1'b0),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_rdata(m_axi_rdata),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b1),
        .m_axi_rready(m_axi_rready),
        .m_axi_rresp(m_axi_rresp),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(m_axi_rvalid),
        .m_axi_wdata(m_axi_wdata),
        .m_axi_wid(NLW_inst_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_inst_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(m_axi_wready),
        .m_axi_wstrb(m_axi_wstrb),
        .m_axi_wuser(NLW_inst_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(m_axi_wvalid),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arcache(s_axi_arcache),
        .s_axi_arid(1'b0),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arlock(s_axi_arlock),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arqos(s_axi_arqos),
        .s_axi_arready(s_axi_arready),
        .s_axi_arregion(s_axi_arregion),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awid(1'b0),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos(s_axi_awqos),
        .s_axi_awready(s_axi_awready),
        .s_axi_awregion(s_axi_awregion),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(NLW_inst_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_buser(NLW_inst_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(NLW_inst_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_ruser(NLW_inst_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wid(1'b0),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(s_axi_wvalid));
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
