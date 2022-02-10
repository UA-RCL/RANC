`timescale 1ns / 1ps


module test_TokenController;

    // Inputs to Token Controller.
    reg clk, rst, tick, spike_in, CSRAM_complete, local_buffers_full;
    reg [`num_axons-1:0] axon_spikes, synapses;

    // Outputs from Token Controller
    wire error, CSRAM_init, scheduler_set, scheduler_clr, CSRAM_set, CSRAM_write, spike_out, neuron_reg_en, next_neuron, write_current_potential;
    wire [$clog2(`num_weights)-1:0] neuron_instruction;

    // Creating the interface to bind with Python unittest
    initial begin
        $from_myhdl(clk, rst, tick, axon_spikes, synapses, spike_in, CSRAM_complete, local_buffers_full);
        $to_myhdl(error, CSRAM_init, scheduler_set, scheduler_clr, CSRAM_set, CSRAM_write, neuron_instruction, spike_out, neuron_reg_en, next_neuron, write_current_potential);
    end


    TokenController TokenController_tb(
        .clk                        (clk                    ),
        .rst                        (rst                    ),
        .tick                       (tick                   ),
        .axon_spikes                (axon_spikes            ),
        .synapses                   (synapses               ),
        .spike_in                   (spike_in               ),
        .CSRAM_complete             (CSRAM_complete         ),
        .local_buffers_full         (local_buffers_full     ),
        .error                      (error                  ),
        .CSRAM_init                 (CSRAM_init             ),
        .scheduler_set              (scheduler_set          ),
        .scheduler_clr              (scheduler_clr          ),
        .CSRAM_set                  (CSRAM_set              ),
        .CSRAM_write                (CSRAM_write            ),
        .neuron_instruction         (neuron_instruction     ),
        .spike_out                  (spike_out              ),
        .neuron_reg_en              (neuron_reg_en          ),
        .next_neuron                (next_neuron            ),
        .write_current_potential    (write_current_potential)
    );

    defparam TokenController_tb.NUM_AXONS = `num_axons;
    defparam TokenController_tb.NUM_NEURONS = `num_neurons;
    defparam TokenController_tb.NUM_WEIGHTS = `num_weights;
    defparam TokenController_tb.FILENAME = `filename;


endmodule
