`timescale 1ns / 1ps



module test_NeuronBlock;

reg [`leak_width-1:0] leak;
reg [`weight_width*`num_weights-1:0] weights;
reg [`threshold_width-1:0] positive_threshold, negative_threshold;
reg [`potential_width-1:0] reset_potential, current_potential;
reg [$clog2(`num_weights)-1:0] neuron_instruction;
reg [$clog2(`num_reset_modes)-1:0] reset_mode;
reg next_neuron, clk, integrator_reg_en, write_current_potential;
output [`potential_width-1:0] write_potential;
output spike_out;

initial begin
    $from_myhdl(leak, weights, positive_threshold, negative_threshold, reset_potential, current_potential, neuron_instruction, reset_mode, next_neuron, clk, integrator_reg_en, write_current_potential);
    $to_myhdl(write_potential, spike_out);
end

NeuronBlock NeuronBlock_tb(
    .clk                        (clk                        ),
    .leak                       (leak                       ),
    .weights                    (weights                    ),
    .positive_threshold         (positive_threshold         ),
    .negative_threshold         (negative_threshold         ),
    .reset_potential            (reset_potential            ),
    .current_potential          (current_potential          ),
    .neuron_instruction         (neuron_instruction         ),
    .reset_mode                 (reset_mode                 ),
    .next_neuron                (next_neuron                ),
    .integrator_reg_en          (integrator_reg_en          ),
    .write_current_potential    (write_current_potential    ),
    .write_potential            (write_potential            ),
    .spike_out                  (spike_out                  )
);

defparam NeuronBlock_tb.LEAK_WIDTH = `leak_width;
defparam NeuronBlock_tb.WEIGHT_WIDTH = `weight_width;
defparam NeuronBlock_tb.THRESHOLD_WIDTH = `threshold_width;
defparam NeuronBlock_tb.POTENTIAL_WIDTH = `potential_width;
defparam NeuronBlock_tb.NUM_WEIGHTS = `num_weights;
defparam NeuronBlock_tb.NUM_RESET_MODES = `num_reset_modes;

endmodule
