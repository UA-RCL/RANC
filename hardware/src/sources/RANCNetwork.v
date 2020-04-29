`timescale 1 ns / 1 ps

//////////////////////////////////////////////////////////////////////////////////
// RANCNetwork.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// A wrapper around the RANCNetworkGrid which allows communication via the AXIS 
// protocol.
//////////////////////////////////////////////////////////////////////////////////

module RANCNetwork #
(
    // RANC parameters
    parameter GRID_DIMENSION_X = 5,
    parameter GRID_DIMENSION_Y = 1,
    parameter MAX_DIMENSION_X = 512,
    parameter MAX_DIMENSION_Y = 512,
    parameter OUTPUT_CORE_X_COORDINATE = 4,
    parameter OUTPUT_CORE_Y_COORDINATE = 0,
    parameter NUM_OUTPUTS = 256,
    parameter NUM_NEURONS = 256,
    parameter NUM_AXONS = 256,
    parameter NUM_TICKS = 16,
    parameter NUM_WEIGHTS = 4,
    parameter NUM_RESET_MODES = 2,
    parameter POTENTIAL_WIDTH = 9,
    parameter WEIGHT_WIDTH = 9,
    parameter LEAK_WIDTH = 9,
    parameter THRESHOLD_WIDTH = 9,
    parameter INPUT_BUFFER_DEPTH = 512,
    parameter ROUTER_BUFFER_DEPTH = 4,
    parameter MEMORY_FILEPATH = "C:/",
    parameter MAXIMUM_NUMBER_OF_PACKETS = 200,
    parameter C_S00_AXIS_TDATA_WIDTH = 32
)(
    // RANC ports
    input clk,
    input rst,
    input tick,
    output [$clog2(NUM_OUTPUTS)-1:0] packet_out,
    output packet_out_valid,
    output token_controller_error,
    output scheduler_error,
    output packet_read_error,
    output fifo_write_error,

    // Ports of Axi Slave Bus Interface S00_AXIS
    input wire  s00_axis_aclk,
    input wire  s00_axis_aresetn,
    output wire  s00_axis_tready,
    input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
    input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
    input wire  s00_axis_tlast,
    input wire  s00_axis_tvalid
);

    // This assumes that the dx and dy components are the most significant bits of the packet
    localparam DX_MSB = $clog2(MAX_DIMENSION_X) + $clog2(MAX_DIMENSION_Y) + $clog2(NUM_AXONS) + $clog2(NUM_TICKS) - 1;
    localparam DX_LSB = $clog2(MAX_DIMENSION_Y) + $clog2(NUM_AXONS) + $clog2(NUM_TICKS);
    localparam DY_MSB = $clog2(MAX_DIMENSION_Y) + $clog2(NUM_AXONS) + $clog2(NUM_TICKS) - 1;
    localparam DY_LSB = $clog2(NUM_AXONS) + $clog2(NUM_TICKS);
	
    // bit_num gives the minimum number of bits needed to address 'NUMBER_OF_INPUT_WORDS' size of FIFO.
    localparam bit_num  = $clog2(MAXIMUM_NUMBER_OF_PACKETS-1);
	localparam DX_WIDTH = DX_MSB - DX_LSB + 1;
	localparam DY_WIDTH = DY_MSB - DY_LSB + 1;
	localparam PACKET_WIDTH = DX_WIDTH+DY_WIDTH+$clog2(NUM_AXONS)+$clog2(NUM_TICKS);
	
	// axi wires
	wire writes_done;
	wire [C_S00_AXIS_TDATA_WIDTH-1:0] data;
	wire [bit_num-1:0] addr;
	wire [bit_num-1:0] num_packets;
	// RANC wires
	wire [PACKET_WIDTH-1:0] packet_axi_to_buffer, packet_buffer_to_RANC;
	wire packet_axi_to_buffer_valid;
	wire ren_to_input_buffer;
	wire buffer_empty, buffer_full;

	assign packet_axi_to_buffer = data[PACKET_WIDTH-1:0];
	
    // Instantiation of Axi Bus Interface S00_AXIS
	RANCNetwork_S00_AXIS # ( 
	    .NUMBER_OF_INPUT_WORDS(MAXIMUM_NUMBER_OF_PACKETS),
		.C_S_AXIS_TDATA_WIDTH(C_S00_AXIS_TDATA_WIDTH)
	) RANCNetwork_S00_AXIS_inst (
	    .tick(tick),
        .writes_done_out(writes_done),
        .dout(data),
        .addr(addr),
        .num_packets(num_packets),
        .fifo_write_error(fifo_write_error),
		.S_AXIS_ACLK(s00_axis_aclk),
		.S_AXIS_ARESETN(s00_axis_aresetn),
		.S_AXIS_TREADY(s00_axis_tready),
		.S_AXIS_TDATA(s00_axis_tdata),
		.S_AXIS_TSTRB(s00_axis_tstrb),
		.S_AXIS_TLAST(s00_axis_tlast),
		.S_AXIS_TVALID(s00_axis_tvalid)
	);
	
	PacketFetch #(
	   .NUMBER_OF_INPUT_WORDS(MAXIMUM_NUMBER_OF_PACKETS)
	) PacketFetch_inst (
	   .clk(clk),
	   .tick(tick),
	   .rst(rst),
	   .num_packets(num_packets),
	   .data_valid(s00_axis_tvalid & s00_axis_tready),
	   .buffer_full(buffer_full), // FIXME: Replace this with the FULL signal from the buffer
	   .addr(addr),
	   .packet_valid(packet_axi_to_buffer_valid),
	   .packet_read_error(packet_read_error)
	);
	
	/*
	FIXME: There is a buffer in the RANCNetwork_S00_AXIS module and this module, can we combine them so 
	RANCNetwork_S00_AXIS works with the read enable of the merge of the cores?
	*/
	buffer#(
        .DATA_WIDTH(PACKET_WIDTH), // FIXME: Hardcoding these for now, will fix them when router is working
        .BUFFER_DEPTH(INPUT_BUFFER_DEPTH)
    ) buffer_inst (
        .clk(clk),
        .rst(rst),
        .din(packet_axi_to_buffer),
        .din_valid(packet_axi_to_buffer_valid),
        .read_en(ren_to_input_buffer),
        .dout(packet_buffer_to_RANC),
        .empty(buffer_empty),
        .full(buffer_full)
    );

	
	RANCNetworkGrid #(
        .GRID_DIMENSION_X(GRID_DIMENSION_X),
        .GRID_DIMENSION_Y(GRID_DIMENSION_Y),
        .OUTPUT_CORE_X_COORDINATE(OUTPUT_CORE_X_COORDINATE),
        .OUTPUT_CORE_Y_COORDINATE(OUTPUT_CORE_Y_COORDINATE),
        .NUM_OUTPUTS(NUM_OUTPUTS),
        .NUM_NEURONS(NUM_NEURONS),
        .NUM_AXONS(NUM_AXONS),
        .NUM_TICKS(NUM_TICKS),
        .NUM_WEIGHTS(NUM_WEIGHTS),
        .NUM_RESET_MODES(NUM_RESET_MODES),
        .POTENTIAL_WIDTH(POTENTIAL_WIDTH),
        .WEIGHT_WIDTH(WEIGHT_WIDTH),
        .LEAK_WIDTH(LEAK_WIDTH),
        .THRESHOLD_WIDTH(THRESHOLD_WIDTH),
        .DX_MSB(DX_MSB),
        .DX_LSB(DX_LSB),
        .DY_MSB(DY_MSB),
        .DY_LSB(DY_LSB),
        .ROUTER_BUFFER_DEPTH(ROUTER_BUFFER_DEPTH),
        .MEMORY_FILEPATH(MEMORY_FILEPATH),
        .PACKET_WIDTH(PACKET_WIDTH)
    ) RANCNetworkGrid_inst (
        .clk(clk),
        .rst(rst),
        .tick(tick),
        .input_buffer_empty(buffer_empty),
        .packet_in(packet_buffer_to_RANC),
        .packet_out(packet_out),
        .packet_out_valid(packet_out_valid),
        .ren_to_input_buffer(ren_to_input_buffer),
        .token_controller_error(token_controller_error),
        .scheduler_error(scheduler_error)
    );
    
endmodule
