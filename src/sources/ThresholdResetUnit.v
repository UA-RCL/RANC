`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ThresholdResetUnit.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Resets a neuron's threshold if necessary
//////////////////////////////////////////////////////////////////////////////////
module ThresholdResetUnit #(
    parameter THRESHOLD_WIDTH = 9,
    parameter POTENTIAL_WIDTH = 9,
    parameter NUM_RESET_MODES = 2
)(
    input signed [POTENTIAL_WIDTH-1:0] potential_in,
    input signed [THRESHOLD_WIDTH-1:0] positive_threshold,
    input signed [THRESHOLD_WIDTH-1:0] negative_threshold,
    input signed [POTENTIAL_WIDTH-1:0] reset_potential,
    input [$clog2(NUM_RESET_MODES)-1:0] reset_mode,
    output signed [POTENTIAL_WIDTH-1:0] potential_out,
    output spike
); 

    assign spike = potential_in >= positive_threshold;

    wire potential_in_lt_negative_threshold;
    assign potential_in_lt_negative_threshold = potential_in < negative_threshold;
    
    reg signed [POTENTIAL_WIDTH-1:0] positive_reset_value;
    reg signed [POTENTIAL_WIDTH-1:0] negative_reset_value;

    // If spike, reset to positive_reset_potential. Otherwise, if less than negative_threshold, reset to  negative_reset_potential. Otherwise keep current potential.
    assign potential_out = spike ? positive_reset_value : potential_in_lt_negative_threshold ? negative_reset_value : potential_in;

    always@(*) begin
        case(reset_mode)
            // Hard reset
            0: begin
                positive_reset_value = reset_potential;
                negative_reset_value = -reset_potential;
            end
            // Linear reset
            1: begin
                positive_reset_value = potential_in - positive_threshold;
                negative_reset_value = potential_in - negative_threshold;
            end
            default: begin
                positive_reset_value = 0;
                negative_reset_value = 0;
            end
        endcase
    end
    
endmodule
