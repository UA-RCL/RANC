`timescale 1ns / 1ns

//////////////////////////////////////////////////////////////////////////////////
// TokenController.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
// at the University of Arizona
// 
// Handles communication between the Scheduler, CSRAM and Neuron Block to facilitate all neuron computation.
//
// ABBREVIATIONS:
// TC = Token Controller
// NB = Neuron Block
// SSRAM = Scheduler SRAM
// CSRAM = Core SRAM
//
// NOTES:
// ROW: A row refers to an AXON.
// NEURON: A neuron refers to the DENDRITE / NEURON itself. If used in conjunction with a ROW then we mean the DENDRITE.
//////////////////////////////////////////////////////////////////////////////////

module TokenController #(
    parameter NUM_AXONS = 256,
    parameter NUM_NEURONS = 256,
    parameter NUM_WEIGHTS = 4,
    parameter FILENAME = "tc_000.mem"
)(
    input clk, 
    input rst,
    input tick,
    input [NUM_AXONS-1:0] axon_spikes, 
    input [NUM_AXONS-1:0] synapses, 
    input spike_in,
    input local_buffers_full,
    output reg error,
    output reg scheduler_set, 
    output reg scheduler_clr,
    output reg CSRAM_write,
    output reg [$clog2(NUM_NEURONS)-1:0] CSRAM_addr,
    output reg [$clog2(NUM_WEIGHTS)-1:0] neuron_instruction, 
    output reg spike_out,
    output reg neuron_reg_en, 
    output reg next_neuron,
    output reg write_current_potential
);


    reg [$clog2(NUM_WEIGHTS)-1:0] neuron_instructions [0:NUM_AXONS-1];  // Stores all neuron instructions
    reg [3:0] state;                                                    // state of FSM
    reg [$clog2(NUM_AXONS):0] row_count;                                // Stores the axon that we are currently analyzing
    

    // Naming the possible states of the FSM
    localparam IDLE = 0, SET_SCHED_INIT_CSRAM = 1, FIRST_AXON = 2, SPIKE_IN = 3, WRITE_CSRAM = 4, NEURON_CHECK = 5, CLR_SCHED = 6;
    
    // Report Token Controller error if we get a tick when we are not in the IDLE state 

    initial begin
        neuron_reg_en <= 0;
        write_current_potential <= 0;
        next_neuron <= 0;
        row_count <= 0;
        error <= 0;
        scheduler_set <= 0;
        scheduler_clr <= 0;
        CSRAM_write <= 0;
        CSRAM_addr <= 0;
        spike_out <= 0;
        neuron_instruction <= 0;
        $readmemb(FILENAME, neuron_instructions);
    end
    
    /*
    Incrementing the row_count on the negative edge makes it so
    we won't try to increment row_count while we are using it
    to index into a word.
    */
    always@(negedge clk) begin
        if (rst) begin
            row_count <= 0;
        end
        
        case(state)
            SPIKE_IN: row_count <= row_count + 1;
            default: row_count <= 0;
        endcase
    end
    
    /*
    Token controller functionality is implemented as a FSM.
    On the positive edge it will send out control signals to
    the other modules and update its internal state.
    */
    always@(posedge clk)begin
        if(rst) begin
            scheduler_clr <= 0;
            state <= 0;
            error <= 0;
        end
        
        // Reporting the token controller error if receives a tick when not in IDLE state
        if ((error == 0) && (state != IDLE) && tick)
            error <= 1;

        case(state)
            /*
            In this state the TC waits for the 'tick' signal
            */
            IDLE: begin
                scheduler_clr <= 0;
                if (tick)
                    state <= SET_SCHED_INIT_CSRAM;
            end

            
            /*
            In this state the TC sends out a signal to set the scheduler and initialize the CSRAM. 
            scheduler_set increments the address counter in the scheduler so the scheduler reads 
            from the correct tick. Initializes the address counter in the CSRAM so
            it reads the data from the first neuron.
            */
            SET_SCHED_INIT_CSRAM: begin
                scheduler_set <= 1;
                CSRAM_addr <= 0;
                state <= FIRST_AXON;
            end
            

            /*
            This is the first of two states where we can process a spike. This state sets next_neuron
            high so the NB knows to use the current potential of the neuron as the starting point for
            the running sum. If there is no spike and synapse on the first axon, it sets 
            write_current_potential high which will write the current potential of the neuron in 
            the register of the neuron block. If there is a spike and synapse on the first axon,
            it integrates the spike into the potential.
            */
            FIRST_AXON: begin
                scheduler_set <= 0;
                if (axon_spikes[row_count] && synapses[row_count])
                    neuron_instruction <= neuron_instructions[row_count];
                else
                    write_current_potential <= 1;
                next_neuron <= 1;
                state <= SPIKE_IN;
                neuron_reg_en <= 1;
            end

            /*
            Once we get past the first axon we know that the value in the register in
            the neuron block is valid. We can then set next_neuron and write_current_potential
            low so the neuron block will integrate spikes for the remaining axons.
            */
            SPIKE_IN: begin
                next_neuron <= 0;
                write_current_potential <= 0;
                neuron_reg_en <= axon_spikes[row_count] & synapses[row_count];
                neuron_instruction <= neuron_instructions[row_count];
                
                // If we are on the NUM_AXONS-1 axon we are done processing the neuron
                if (row_count == NUM_AXONS - 1)
                    state <= WRITE_CSRAM;
                else
                    state <= SPIKE_IN;
                
            end

            /*
            When we are done processing a single neuron setting CSRAM_write 
            high so we can write the updated potential back to the CSRAM.
            In this state we also check to see if the neuron spiked.
            If the neuron spiked but the local buffers in the router are 
            full, we wait in this state until they are not full. If the 
            buffers aren't full we output a spike and move onto the 
            next state.
            */
            WRITE_CSRAM: begin
                neuron_reg_en <= 0;
                if(spike_in) begin
				    if(local_buffers_full) begin
				        spike_out <= 0;
				        state <= WRITE_CSRAM;
				    end
				    else begin
				        spike_out <= 1;
                        CSRAM_write <= 1;
				        state <= NEURON_CHECK;
				    end
				end
				else begin
				    spike_out <= 0;
                    CSRAM_write <= 1;
				    state <= NEURON_CHECK;
				end
            end


            /*
            Setting spike low, if CSRAM has gone through every 
            neuron then we are done. If CSRAM still has neurons
            to go we go back to state 3 and process the next neuron
            */
            NEURON_CHECK: begin
                spike_out <= 0;
                CSRAM_write <= 0;
                if (CSRAM_addr == NUM_NEURONS - 1) begin
                   state <= CLR_SCHED;
                end
                else begin
                   CSRAM_addr <= CSRAM_addr + 1;
                   state <= FIRST_AXON;
                end
            end

            /*
            Clearing the scheduler so it deletes all of the spikes that were
            just processed. Then goes back to IDLE state until we receive
            another tick.
            */
            CLR_SCHED: begin
                scheduler_clr <= 1;
				state <= IDLE;
            end

            default: begin
                state <= IDLE;
            end
        endcase
    end

endmodule
