`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// OutcomeCoreProcessor.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Decodes spikes out of a RANC network assuming a classification based
// network and an alternating population output coding.
//////////////////////////////////////////////////////////////////////////////////


module OutcomeCoreProcessor #(
    parameter integer PACKET_WIDTH = 30,
    parameter integer NUM_CLASSES = 10,
    parameter integer OUTCOME_WIDTH = 32
)(
    // Inputs:
    input clk,
    input rst,
    input tick,
    input [PACKET_WIDTH-1:0] packet,
    input packet_valid,
    
    output packet_captured,
    output reg [OUTCOME_WIDTH-1:0] winner,
    output reg valid,
    // If the tick is raised before the outcome core was done resetting
    // 01 => tick occured during RESET
    // 10 => tick occured during TRANSFER_BUFFER
    // 11 => tick occured during COUNT_PACKETS
    output reg [1:0] outcome_error
);

    reg [$clog2(NUM_CLASSES)-1:0] curr_class;
    reg [OUTCOME_WIDTH-1:0] class [NUM_CLASSES-1:0];
    reg [$clog2(NUM_CLASSES)-1:0] curr_max;
    reg [OUTCOME_WIDTH-1:0] curr_max_val;
    // Buffer to collect packets while class accumulator is being reset
    reg [OUTCOME_WIDTH-1:0] class_buffer [NUM_CLASSES-1:0];

    // FIXME: Why is this a thing?
    assign packet_captured = packet_valid ? 1'b1 : 1'b0;

    // State machine 
    localparam [1:0] RESET = 2'b00,             // Resets all class counts
                     TRANSFER_BUFFER = 2'b01,   // Transfers data from buffer to class
                     IDLE = 2'b10,              // Waits for tick
                     COUNT_PACKETS = 2'b11;     // Counts packets recieved for each class
                     
    reg [1:0] mst_exec_state;          
    
    initial begin
        winner <= 0;
        curr_class <= 0;
        curr_max_val <= 0;
        curr_max <= 0;
        mst_exec_state <= RESET;
    end
    
    // Main state machine
    always@(negedge clk) begin
        if (rst) begin
            winner <= 0;
            curr_class <= 0;
            curr_max <= 0;
            curr_max_val <= 0;
            outcome_error <= 0;
            mst_exec_state <= RESET;
        end
        else begin
            case (mst_exec_state)
                RESET: begin
                    valid <= 0;
                    winner <= 0;
                    // A tick occurred during the resetting of the outcome core
                    if (tick)
                        outcome_error <= 2'b01;
                    // Buffer packets while resetting
                    if (packet_valid) begin
                        if (class_buffer[packet[11:4]] > 0)
                            class_buffer[packet[11:4]] <= class_buffer[packet[11:4]] + 1;
                        else
                            class_buffer[packet[11:4]] <= 1;
                    end
                    // Reset
                    if (curr_class < NUM_CLASSES) begin
                        class[curr_class] = 0;
                        curr_class = curr_class + 1;
                    end
                    // Reset done, go to idle
                    else begin
                        curr_class <= 0;
                        mst_exec_state <= TRANSFER_BUFFER;
                    end
                end
                TRANSFER_BUFFER: begin
                    valid <= 0;
                    winner <= 0;
                    // A tick occured while transferring buffer
                    if (tick)
                        outcome_error <= 2'b10;
                    // This logic assumes that we'll be in TRANSFER_BUFFER for at least NUM_CLASSES worth of clock cycles.
                    // Transfer packets from buffer
                    if (curr_class < NUM_CLASSES) begin
                        if (class_buffer[curr_class] > 0)
                            class[curr_class] = class[curr_class] + class_buffer[curr_class];
                        class_buffer[curr_class] = 0;
                        curr_class = curr_class + 1;
                    end
                    // Packets transfered, go to idle
                    else begin
                        curr_class <= 0;
                        mst_exec_state <= IDLE;
                    end
                    // Watch for packets
                    if (packet_valid) begin
                        class[packet[11:4]] = class[packet[11:4]] + 1;
                    end
                end
                IDLE: begin
                    // If tick, begin counting classes
                    if (tick) begin
                        mst_exec_state <= COUNT_PACKETS;
                    end
                    // Otherwise, keep track of packets
                    else if (packet_valid) begin
                        class[packet[11:4]] <= class[packet[11:4]] + 1;
                    end
                end
                COUNT_PACKETS: begin
                    // A tick occured while counting packets
                    if (tick)
                        outcome_error <= 2'b11;
                    // Buffer packets while determining winner
                    if (packet_valid) begin
                        class_buffer[packet[11:4]] <= class_buffer[packet[11:4]] + 1;
                    end
                    // Determine winner
                    if (curr_class < NUM_CLASSES) begin
                        if (curr_max_val < class[curr_class]) begin
                            curr_max = curr_class;
                            curr_max_val = class[curr_class];
                        end
                        class[curr_class] = 0;
                        curr_class = curr_class + 1;
                    end
                    // Winner found, go to reset
                    else begin
                        winner = curr_max;
                        curr_max = 0;
                        curr_max_val <= 0;
                        valid <= 1;
                        curr_class <= 0;
                        mst_exec_state <= TRANSFER_BUFFER;
                    end
                end
           endcase
        end
    end
 
endmodule
