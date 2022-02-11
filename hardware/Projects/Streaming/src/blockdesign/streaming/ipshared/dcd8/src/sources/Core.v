`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Core.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Contains all the modules for a single RANC core.
//////////////////////////////////////////////////////////////////////////////////

module Core #(
    parameter PACKET_WIDTH = 30,
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
    parameter CSRAM_FILE = "csram_000.mem",
    parameter TC_FILE = "tc_000.mem"
)(
    input clk,                              // Clock
    input router_clk,                       // Clock for Router
    input tick,                             // Tick
    input rst,                              // Global Reset
    input [PACKET_WIDTH-1:0] east_in,       // East In From Next East's West Out
    input [PACKET_WIDTH-1:0] west_in,       // West In From Next West's East Out
    input [PACKET_WIDTH-DX_WIDTH-1:0] north_in,      // North In From Next North's South Out
    input [PACKET_WIDTH-DX_WIDTH-1:0] south_in,      // South In From Next South's North Out
    input east_in_valid,                    // East In Valid
    input west_in_valid,                    // West In Valid
    input north_in_valid,                   // North In Valid
    input south_in_valid,                   // South In Valid
    input east_out_captured,                // Next East Capture
    input west_out_captured,                // Next West Capture
    input north_out_captured,               // Next North Capture
    input south_out_captured,               // Next South Capture
    input east_out_full,                    // Next East's Buffers Full
    input west_out_full,                    // Next West's Buffers Full
    input north_out_full,                   // Next North's Buffers Full
    input south_out_full,                   // Next South's Buffers Full
    output [PACKET_WIDTH-1:0] east_out,     // East Out, Next East's West In
    output [PACKET_WIDTH-1:0] west_out,     // West Out, Next West's East In
    output [PACKET_WIDTH-DX_WIDTH-1:0] north_out,    // North Out, Next North's South In
    output [PACKET_WIDTH-DX_WIDTH-1:0] south_out,    // South Out, Next South's North In
    output east_out_valid,                  // East Out Valid
    output west_out_valid,                  // West Out Valid
    output north_out_valid,                 // North Out Valid
    output south_out_valid,                 // South Out Valid
    output east_in_captured,                // East Capture
    output east_in_contention,              // East Contention
    output west_in_captured,                // West Capture
    output north_in_captured,               // North Capture
    output south_in_captured,               // South Capture
    output forward_east_full,               // Forward East Full, Goes to Next West's Forward East
    output forward_west_full,               // Forward West Full, Goes to Next East's Forward West
    output forward_north_full,              // Forward North Full, Goes to Next South's Forward North
    output forward_south_full,              // Forward South Full, Goes to Next North's Forward South
    output token_controller_error,          // Token Controller Error Signal
    output scheduler_error                  // Error from Scheduler
);

    localparam CSRAM_WIDTH = NUM_AXONS + POTENTIAL_WIDTH + POTENTIAL_WIDTH + WEIGHT_WIDTH*NUM_WEIGHTS + LEAK_WIDTH + THRESHOLD_WIDTH + THRESHOLD_WIDTH + DX_WIDTH + DY_WIDTH + $clog2(NUM_AXONS) + $clog2(NUM_TICKS);
    localparam CSRAM_SYNAPTIC_CONNECTIONS_BOTTOM_INDEX = CSRAM_WIDTH - NUM_AXONS;
    localparam CSRAM_CURRENT_POTENTIAL_BOTTOM_INDEX = CSRAM_SYNAPTIC_CONNECTIONS_BOTTOM_INDEX - POTENTIAL_WIDTH;
    localparam CSRAM_RESET_POTENTIAL_BOTTOM_INDEX = CSRAM_CURRENT_POTENTIAL_BOTTOM_INDEX - POTENTIAL_WIDTH;
    // FIXME: Make the weights one bus to work with a variable number of weights
    localparam CSRAM_WEIGHT_0_BOTTOM_INDEX = CSRAM_RESET_POTENTIAL_BOTTOM_INDEX - WEIGHT_WIDTH;
    localparam CSRAM_WEIGHT_1_BOTTOM_INDEX = CSRAM_WEIGHT_0_BOTTOM_INDEX - WEIGHT_WIDTH;
    localparam CSRAM_WEIGHT_2_BOTTOM_INDEX = CSRAM_WEIGHT_1_BOTTOM_INDEX - WEIGHT_WIDTH;
    localparam CSRAM_WEIGHT_3_BOTTOM_INDEX = CSRAM_WEIGHT_2_BOTTOM_INDEX - WEIGHT_WIDTH;
    localparam CSRAM_LEAK_BOTTOM_INDEX = CSRAM_WEIGHT_3_BOTTOM_INDEX - LEAK_WIDTH;
    localparam CSRAM_THRESHOLD_BOTTOM_INDEX = CSRAM_LEAK_BOTTOM_INDEX - THRESHOLD_WIDTH;
    localparam CSRAM_FLOOR_BOTTOM_INDEX = CSRAM_THRESHOLD_BOTTOM_INDEX - THRESHOLD_WIDTH;
    localparam CSRAM_DX_BOTTOM_INDEX = CSRAM_FLOOR_BOTTOM_INDEX - DX_WIDTH;
    localparam CSRAM_DY_BOTTOM_INDEX = CSRAM_DX_BOTTOM_INDEX - DY_WIDTH;
    localparam CSRAM_AXON_DESTINATION_BOTTOM_INDEX = CSRAM_DY_BOTTOM_INDEX - $clog2(NUM_AXONS);
    localparam CSRAM_SPIKE_DELIVERY_TICK_BOTTOM_INDEX = CSRAM_AXON_DESTINATION_BOTTOM_INDEX - $clog2(NUM_AXONS);
    
    // Scheduler
    wire [NUM_AXONS-1:0] axon_spikes;
    
    // CSRAM
    wire [CSRAM_WIDTH-1:0] CSRAM_data;
    wire CSRAM_complete;
    wire [$clog2(NUM_NEURONS)-1:0] CSRAM_counter;
    
    // Token Controller
    wire CSRAM_write, CSRAM_read, CSRAM_set, CSRAM_init;
    wire scheduler_set, scheduler_clr, router_spike;
    wire neuron_block_en, neuron_block_leak, neuron_block_next_neuron;
    wire [$clog2(NUM_WEIGHTS)-1:0] neuron_instruction;
    
    // Nueron Block
    wire [POTENTIAL_WIDTH-1:0] neuron_potential;
    wire neuron_block_spike;
    
    wire [11:0] scheduler_packet;
    wire scheduler_wen;
    
    // Debugging with ILAs
    wire [15:0] tick_count;
    
Scheduler #(
    .NUM_AXONS(NUM_AXONS),
    .NUM_TICKS(NUM_TICKS)
) Scheduler (
    .clk(clk),
    .router_clk(router_clk),
    .rst(rst),
    .wen(scheduler_wen),
    .set(scheduler_set),
    .clr(scheduler_clr),
    .packet(scheduler_packet),
    .axon_spikes(axon_spikes),
    .error(scheduler_error)
);

c_counter_binary_0 tick_counter(
  .CLK(clk),  // input wire CLK
  .CE(tick),    // input wire CE
  .Q(tick_count)      // output wire [15 : 0] Q
);

ila_0 ila_0_inst (
	.clk(clk),                     // input wire clk
    .probe0(axon_spikes),          // input wire [255:0]  probe0  
    .probe1(tick_count),           // input wire [15:0]  probe1 
    .probe2(west_in_valid),        // input wire [0:0]  probe2 
    .probe3(east_in_valid),        // input wire [0:0]  probe3 
    .probe4(router_spike),         // input wire [0:0]  probe4 
    .probe5(west_in),              // input wire [29:0]  probe5 
    .probe6(CSRAM_data[29:0]),     // input wire [29:0]  probe6 
    .probe7(east_in_contention),   // input wire [0:0]  probe7 
    .probe8(west_out),             // input wire [29:0]  probe8 
	.probe9(west_out_valid)        // input wire [0:0]  probe9
);

/* Addressing:
    ~ NUM_AXONS - Synaptic Connections
    ~ POTENTIAL_WIDTH - Current Potential
    ~ POTENTIAL_WIDTH - Reset Potential
    ~ WEIGHT_WIDTH - Weight 0
    ~ WEIGHT_WIDTH - Weight 1
    ~ WEIGHT_WIDTH - Weight 2
    ~ WEIGHT_WIDTH - Weight 3
    ~ LEAK_WIDTH - Leak
    ~ THRESHOLD_WIDTH - Threshold
    ~ THRESHOLD_WIDTH - Floor
    ~ DX_WIDTH - Destination X
    ~ DY_WIDTH - Destination Y
    ~ $clog2(NUM_AXONS) - Axon Destination
    ~ $clog2(NUM_TICKS) - Spike Delivery Tick */
CSRAM #(
    .FILENAME(CSRAM_FILE),
    .NUM_NEURONS(NUM_NEURONS),
    .WIDTH(CSRAM_WIDTH),
    .WRITE_INDEX(CSRAM_CURRENT_POTENTIAL_BOTTOM_INDEX),
    .WRITE_WIDTH(POTENTIAL_WIDTH)
) CSRAM (
    .clk(clk),
    .wen(CSRAM_write),  
    .address(CSRAM_counter),
    .data_in({CSRAM_data[CSRAM_WIDTH-1:CSRAM_SYNAPTIC_CONNECTIONS_BOTTOM_INDEX], neuron_potential, CSRAM_data[CSRAM_CURRENT_POTENTIAL_BOTTOM_INDEX-1:0]}),
    .data_out(CSRAM_data)
);

CSRAMController #(
    .NUM_NEURONS(NUM_NEURONS)
) CSRAMController (
    .clk(clk),
    .set(CSRAM_set),
    .initialize(CSRAM_init),
    .mem_write(CSRAM_write),
    .complete(CSRAM_complete),
    .counter(CSRAM_counter)
);

TokenController #(
    .NUM_AXONS(NUM_AXONS),
    .NUM_NEURONS(NUM_NEURONS),
    .NUM_WEIGHTS(NUM_WEIGHTS),
    .FILENAME(TC_FILE)
) TokenController (
    .clk(clk),
    .rst(rst),
    .tick(tick),
    .axon_spikes(axon_spikes),
    .synapses(CSRAM_data[CSRAM_SYNAPTIC_CONNECTIONS_BOTTOM_INDEX +: NUM_AXONS]),
    .spike_in(neuron_block_spike),
    .complete(CSRAM_complete),
    .west_in_valid(west_in_valid),
    .east_in_valid(east_in_valid),
    .east_in_contention(east_in_contention),
    .init(CSRAM_init),
    .scheduler_set(scheduler_set),
    .scheduler_clr(scheduler_clr),
    .CSRAM_set(CSRAM_set),
    .CSRAM_read(CSRAM_read),
    .CSRAM_write(CSRAM_write),
    .neuron_instruction(neuron_instruction),
    .spike_out(router_spike),
    .error(token_controller_error),
    .leak_en(neuron_block_leak),
    .neuron_reg_en(neuron_block_en),
    .next_neuron(neuron_block_next_neuron)
);

// FIXME: Make weights a bus to work with multiple weights
NeuronBlock #(
    .LEAK_WIDTH(LEAK_WIDTH),
    .WEIGHT_WIDTH(WEIGHT_WIDTH),
    .THRESHOLD_WIDTH(THRESHOLD_WIDTH),
    .POTENTIAL_WIDTH(POTENTIAL_WIDTH),
    .NUM_WEIGHTS(NUM_WEIGHTS)
) NeuronBlock (
     .leak(CSRAM_data[CSRAM_LEAK_BOTTOM_INDEX +: LEAK_WIDTH]),
     .weight_0(CSRAM_data[CSRAM_WEIGHT_0_BOTTOM_INDEX +: WEIGHT_WIDTH]),
     .weight_1(CSRAM_data[CSRAM_WEIGHT_1_BOTTOM_INDEX +: WEIGHT_WIDTH]),
     .weight_2(CSRAM_data[CSRAM_WEIGHT_2_BOTTOM_INDEX +: WEIGHT_WIDTH]),
     .weight_3(CSRAM_data[CSRAM_WEIGHT_3_BOTTOM_INDEX +: WEIGHT_WIDTH]),
     .threshold(CSRAM_data[CSRAM_THRESHOLD_BOTTOM_INDEX +: THRESHOLD_WIDTH]),
     .floor(CSRAM_data[CSRAM_FLOOR_BOTTOM_INDEX +: THRESHOLD_WIDTH]),
     .reset_potential(CSRAM_data[CSRAM_RESET_POTENTIAL_BOTTOM_INDEX +: POTENTIAL_WIDTH]),
     .current_potential(CSRAM_data[CSRAM_CURRENT_POTENTIAL_BOTTOM_INDEX +: POTENTIAL_WIDTH]),
     .neuron_instruction(neuron_instruction),
     .leak_en(neuron_block_leak),
     .clk(clk),
     .next_neuron(neuron_block_next_neuron),
     .integrator_reg_en(neuron_block_en),
     .write_potential(neuron_potential),
     .spike_out(neuron_block_spike)
);

Router Routing(
    // Inputs:
    .Clock(router_clk),
    .Reset(rst),
    
    .CSRAM_Packet(CSRAM_data[29:0]),
    .TC_Spike(router_spike),
    
    .WestInEastOut(west_in),
    .EastInWestOut(east_in),
    .NorthInSouthOut(north_in[20:0]),
    .SouthInNorthOut(south_in[20:0]),
    
    .WestInValid(west_in_valid),
    .EastInValid(east_in_valid),
    .NorthInValid(north_in_valid),
    .SouthInValid(south_in_valid),
    
    .NextWestFull(west_out_full),
    .NextEastFull(east_out_full),
    .NextNorthFull(north_out_full),
    .NextSouthFull(south_out_full),
    
    .NextWestCapture(west_out_captured),
    .NextEastCapture(east_out_captured),
    .NextNorthCapture(north_out_captured),
    .NextSouthCapture(south_out_captured),
    
    // Outputs:
    .WestOutEastIn(west_out),
    .EastOutWestIn(east_out),
    .NorthOutSouthIn(north_out),
    .SouthOutNorthIn(south_out),
    
    .WestOutValid(west_out_valid),
    .EastOutValid(east_out_valid),
    .NorthOutValid(north_out_valid),
    .SouthOutValid(south_out_valid),
    
    .ToScheduler(scheduler_packet),
    .SchedulerWrite(scheduler_wen),
    
    .ForwardEastFull(forward_east_full),
    .ForwardWestFull(forward_west_full),
    .ForwardNorthFull(forward_north_full),
    .ForwardSouthFull(forward_south_full),
    
    .ForwardEastCapture(east_in_captured),
    .ForwardWestCapture(west_in_captured),
    .ForwardNorthCapture(north_in_captured),
    .ForwardSouthCapture(south_in_captured),
    
    .ForwardEastContention(east_in_contention)
);

endmodule
