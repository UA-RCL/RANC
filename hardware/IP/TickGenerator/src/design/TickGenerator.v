`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// TickGenerator.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Generates a tick signal which goes high on the negative edge of the input clk
// and is high for one clk cycle.
//////////////////////////////////////////////////////////////////////////////////

module TickGenerator(
    input clk, 
    input en,
    output reg tick,
    output reg intr
);

    parameter INPUT_FREQUENCY = 100000000;
    parameter TICK_FREQUENCY = 50;
    parameter ASSERT_INTR_CYCLES = 5;
    
    // The count that the counter needs to count to.
    localparam COUNT = INPUT_FREQUENCY / TICK_FREQUENCY;
    
    reg [$clog2(COUNT):0] counter;
    
    initial begin
        tick <= 0;
        counter <= 0;
    end
    
    always @(negedge clk) begin
        if (en) begin
            if (counter == COUNT) begin
                tick <= 1;
                intr <= 1;
                counter <= 0;
            end
            else begin
                tick <= 0;
                counter <= counter + 1;
                if (counter == ASSERT_INTR_CYCLES)
                    intr <= 0;
            end
        end
        else begin
            tick <= 0;
            counter <= 0;
        end
    end

endmodule
