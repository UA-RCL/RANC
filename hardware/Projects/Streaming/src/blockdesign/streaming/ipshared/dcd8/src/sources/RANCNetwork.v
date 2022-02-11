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
    parameter OUTPUT_CORE_X_COORDINATE = 4,
    parameter OUTPUT_CORE_Y_COORDINATE = 0,
    parameter NUM_NEURONS = 256,
    parameter NUM_AXONS = 256,
    parameter NUM_TICKS = 16,
    parameter NUM_WEIGHTS = 4,
    parameter POTENTIAL_WIDTH = 9,
    parameter WEIGHT_WIDTH = 9,
    parameter LEAK_WIDTH = 9,
    parameter THRESHOLD_WIDTH = 9,
    parameter DX_WIDTH = 9,
    parameter DY_WIDTH = 9,
    parameter MEMORY_FILEPATH = "C:/",
    parameter MAXIMUM_NUMBER_OF_PACKETS = 200,
    parameter C_S00_AXIS_TDATA_WIDTH = 32,
    parameter PACKET_WIDTH = DX_WIDTH+DY_WIDTH+$clog2(NUM_AXONS)+$clog2(NUM_TICKS)
)(
    // RANC ports
    input clk,
    input rst,
    input tick,
    input outcome_capture,
    output [PACKET_WIDTH-1:0] packet_out,
    output packet_out_valid,
    output packet_in_capture,
    output forward_east_full,
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

    function integer clogb2 (input integer bit_depth);                                   
      begin                                                                              
        for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                                      
          bit_depth = bit_depth >> 1;                                                    
      end                                                                                
    endfunction  
	
    // bit_num gives the minimum number of bits needed to address 'NUMBER_OF_INPUT_WORDS' size of FIFO.
    localparam bit_num  = clogb2(MAXIMUM_NUMBER_OF_PACKETS-1);
	
	// axi wires
	wire writes_done;
	wire [C_S00_AXIS_TDATA_WIDTH-1:0] data;
	wire [bit_num-1:0] addr;
	wire [bit_num-1:0] num_packets;
	// RANC wires
	wire [PACKET_WIDTH-1:0] packet;
	wire packet_valid;
	wire packet_in_contention;

	assign packet = data[PACKET_WIDTH-1:0];
	
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
	   .packet_in_contention(packet_in_contention),
	   .addr(addr),
	   .packet_valid(packet_valid),
	   .packet_read_error(packet_read_error)
	);

	
	RANCNetworkGrid #(
        .GRID_DIMENSION_X(GRID_DIMENSION_X),
        .GRID_DIMENSION_Y(GRID_DIMENSION_Y),
        .OUTPUT_CORE_X_COORDINATE(OUTPUT_CORE_X_COORDINATE),
        .OUTPUT_CORE_Y_COORDINATE(OUTPUT_CORE_Y_COORDINATE),
        .NUM_NEURONS(NUM_NEURONS),
        .NUM_AXONS(NUM_AXONS),
        .NUM_TICKS(NUM_TICKS),
        .NUM_WEIGHTS(NUM_WEIGHTS),
        .POTENTIAL_WIDTH(POTENTIAL_WIDTH),
        .WEIGHT_WIDTH(WEIGHT_WIDTH),
        .LEAK_WIDTH(LEAK_WIDTH),
        .THRESHOLD_WIDTH(THRESHOLD_WIDTH),
        .DX_WIDTH(DX_WIDTH),
        .DY_WIDTH(DY_WIDTH),
        .MEMORY_FILEPATH(MEMORY_FILEPATH),
        .PACKET_WIDTH(PACKET_WIDTH)
    ) RANCNetworkGrid_inst (
        .clk(clk),
        .rst(rst),
        .tick(tick),
        .packet_in(packet),
        .packet_in_valid(packet_valid),
        .packet_in_contention(packet_in_contention),
        .outcome_capture(outcome_capture),
        .packet_out(packet_out),
        .packet_out_valid(packet_out_valid),
        .packet_in_capture(packet_in_capture),
        .forward_east_full(forward_east_full),
        .token_controller_error(token_controller_error),
        .scheduler_error(scheduler_error)
    );
    
    /*ila_0 input_packet_ila_inst (
        .clk(clk), // input wire clk
        .probe0(packet_valid), // input wire [0:0]  probe0  
        .probe1(packet), // input wire [29:0]  probe1 
        .probe2(num_packets), // input wire [9:0]  probe2 
        .probe3(addr), // input wire [9:0]  probe3 
        .probe4(packet_in_contention) // input wire [0:0]  probe4
    );*/

endmodule
