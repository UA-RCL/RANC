`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// TokenController.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Handles communication between the CSRAM and Neuron Block to facilitate the neuron computation.
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
    input complete,
    input west_in_valid,
    input east_in_valid,
    input east_in_contention,
    output reg init, 
    output reg scheduler_set, 
    output reg scheduler_clr, 
    output reg CSRAM_set,
    output reg CSRAM_read, 
    output reg CSRAM_write, 
    output reg [$clog2(NUM_WEIGHTS)-1:0] neuron_instruction, 
    output reg spike_out,
    output reg error, 
    output reg leak_en,
    output reg neuron_reg_en, 
    output reg next_neuron
);
    reg [1:0] counter; // Used to tell us that we are done and time to move on.
    reg [1:0] neuron_instructions [0:NUM_AXONS-1]; // Stores all neuron instructions
    reg [3:0] state;
    reg [$clog2(NUM_NEURONS):0] row_count;
    
    initial begin
        neuron_reg_en <= 0;
        next_neuron <= 0;
        counter <= 3;
        row_count <= 0;
        init <= 0;
        scheduler_set <= 0;
        scheduler_clr <= 0;
        CSRAM_set <= 0;
        CSRAM_read <= 0;
        CSRAM_write <= 0;
        error <= 0;
        leak_en <= 0;
        neuron_instruction <= 0;
        spike_out <= 0;
        $readmemb(FILENAME, neuron_instructions);
    end
    
    // State Machine - States:
    always@(posedge clk)begin
        if(rst)begin
            counter <= 3;
            scheduler_clr <= 0;
            row_count <= 0;
            error <= 0;
            state <= 4'd0;
        end
        // Token Controller State Machine:
        case(state)
            /*
                State 0: - WAIT STATE -
                    In this state the Token Controller waits for the 'tick' signal, which represents our 1Hz clock signal.
            */
            4'd0: begin
                scheduler_clr <= 0;
                if (tick)
                    state <= 4'd1;
            end
            /*
                State 1: - INIT STATE -
                    This state represents Stage 0 of the IBM Token Controller. In this state the TC sends out
                    and 'initialize' signal. As far as we can tell this signal is designed to alert the SSRAM, CSRAM, and NB 
                    that the TC is beginning its work, and to tick listening for its respective signals.
                    
                    It is unclear if this is a pulsed signal, or a maintained signal. For these purposes we are coing to assume it is pulsed.
                    For a single state this signal will go high, then turn off. It should switch the SSRAM, CSRAM, and NB from any - WAIT - setting
                    they may be in, to a state that listens to their incomming signals.
            */
            4'd1: begin
                init <= 1;
                
                state <= 4'd2;
				
				if (tick)
					error <= 1;
            end
            /*
                State 2: - SSRAM SET -
                    This state the TC turns off its init signal, and pulses the Schedueler Set (scheduler_set) signal. This tells the SSRAM to - SET - itself and
                    be prepared to send out the ROW information.
                    
                    In the normal TC it remains in this state until all the ROW information is received. To represent this, we wait for a sched_done signal.
            */
            4'd2: begin    
                init <= 0;
                scheduler_set <= 1;
                state <= 4'd3;
				
				if (tick)
					error <= 1;
            end
            /*
                State 3: - CSRAM SET -
                    This set the TC turns off the scheduler_set signal, and pulses the Core Set (CSRAM_set) signal. This tells the CSRAM to - SET - itself and be prepared
                    to send out the NEURON information.
                    
                    In the normal TC it remains in this state just long enough to pulse this signal.
            */
            4'd3: begin
                scheduler_set <= 0;
                CSRAM_set <= 1;
                state <= 4'd4;
				
				if (tick)
					error <= 1;
            end
            /*
                State 4: - CSRAM CLEAR -
                    This state the TC turns off the CSRAM_set signal. 
            */
            4'd4: begin
                CSRAM_set <= 0;
                state <= 4'd5;
				
				if (tick)
					error <= 1;
            end
            /*
                State 5: - CSRAM READ -
                    This state pulses the Core Read (CSRAM_read) signal.
                    
                    In the normal TC it remains in this state until all NEURON information is received. To represent this we will wait for the core_done signal.
            */
            4'd5: begin
                CSRAM_read <= 1;
                state <= 4'd6;
				
				if (tick)
					error <= 1;
            end
            /*
                State 6: - UNKNOWN -
                    We are not entirely sure what the purpose of this state is entirely for. It is used in some method for controlling the Neuron Instruction, but
                    until we fully understand it, this state is blank. It will be used to simply move on to the next state.
                    
                    Currently is used to let CSRAM_read return to 0 and ensure we have the csram data before going to the neuron checks.
                    
                    Also using this state to set new_neuron to high. New neuron makes it so when we are sending computations to the neuron block, that we are ticking
                    off the running sum with the current potential of the neuron.
            */
            4'd6: begin
                CSRAM_read <= 0;
                state <= 4'd7;
				next_neuron <= 1;
				if (tick)
					error <= 1;
            end
            /*
                State 7 -> 262: - NEURONS -
                    This is the CORE of the entire TC. It is the point where we look at the ROW and NEURON information to see if the current ROW and NEURON are both active
                    and / or connected. If they are, then we need to activate the Neuron. If it is not, then we move on.
                    
                    In the normal TC there are 256 of these states. For this TC we will repeat this state 256 times. Each time comparing a different bit in our row and neuron
                    input registers.
            */
			4'd7: begin
                if (row_count > NUM_NEURONS-1) begin
                    row_count <= 0;
                    state <= 4'd8;
                end
                else if(counter == 0)begin
                    counter <= 3;
                    row_count <= row_count + 1;
                end
                else if(counter == 1) begin
                    neuron_reg_en <= 0;
                    next_neuron <= 0;
                    counter <= counter - 1;
                end
                else if(counter == 2) begin
                    neuron_reg_en <= 1;
                    counter <= counter - 1;
                end
                else begin
                    neuron_reg_en <= 0;
                    if((axon_spikes[row_count] && synapses[row_count]))begin
                        neuron_instruction <= neuron_instructions[row_count];
                        counter <= counter-1;
                    end
                    else begin
                        row_count <= row_count + 1; 
                    end  
                end
                
                            
                if (tick)
                    error <= 1;
            end
            
            4'd8: begin
                leak_en <= 1;
                neuron_reg_en <= 0;
                state <= 4'd9;
                               
                if(tick)begin
                    error <= 1;
                end
            end
			/*
				State 265: - CSRAM WRITE -
					In this state the TC will pulse the CSRAM Write signal (CSRAM_write). This informs the CSRAM to overwrite the current Neuron Information with the new information.
			*/
			4'd9: begin
			    neuron_reg_en <= 1;
			    leak_en <= 1;
				CSRAM_write <= 1;
				state <= 4'd10;
				if(tick)begin
					error <= 1;
				end
			end
			
			/*	State 266: - SPIKE -
					In this state, if the Neuron breached its' threshold then a spike will occur. At this state if the Neuron Block has launched the Spike Signal, then we TC will send the
					Spike information to the Router via the spike_out signal. There is also halting logic in this state. If there are currently valid bits being routed to either
					the west or east, the Token Controller will wait until those packets have been routed before outputting spike_out. This is necessary because otherwise the spikes
					coming from local were overwriting packets coming from the east/west. While this fix works, it should only be temporary as the router should be made to handle this 
					type of congestion.
					
					In this state the TC will also shut off the CSRAM_write signal.
			*/
			4'd10: begin
			    neuron_reg_en <= 0;
                leak_en <= 0;
				CSRAM_write <= 0;
				leak_en <= 0;
				if(spike_in) begin
				    if(west_in_valid | east_in_valid) begin
				        spike_out <= 0;
				        state <= 4'd10;
				    end
				    else begin
				        spike_out <= 1;
				        state <= 4'd11;
				    end
				end
				else begin
				    spike_out <= 0;
				    state <= 4'd11;
				end
				
				if(tick) begin
					error <= 1;
				end
			end
			/*
				State 267: - COMPLETION CHECK -
					In this state the TC checks to see if it has gone through all 256 Neurons. This is accomplished via the completion signal received via the CSRAM.
					If this signal is 0, then we return to the - CSRAM SET - state. Otherwise we continue to the final state.
			*/
			4'd11: begin
			    /*
			    If there is contention, we need to keep the spike_out high until there is no more contention.
			    This is because the router is going to prioritize the external traffic so while there 
			    is contention local spikes will not be output.
			    */ 
			    if(east_in_contention) begin
			         spike_out <= 1;
			         state <= 4'd11;
			    end
			    else begin
			         spike_out <= 0;
			         if(complete) begin
                        state <= 4'd12;
                     end
                     else begin
                        state <= 4'd3;
                     end
			    end
			    
				if(tick)begin
					error <= 1;
				end
			end
			/*
				State 268: - FINALIZE -
					In this state the TC sends the sch_clear signal, and returns to the - WAIT - state. 
			*/
			4'd12: begin
				scheduler_clr <= 1;
				state <= 4'd0;
				
				if(tick)begin
					error <= 1;
				end
			end
         
            default: begin
                if(tick)begin
                    state <= 4'd1;
                end
                else begin
                    state <= 4'd0;
                end
            end
        endcase
    end
endmodule
