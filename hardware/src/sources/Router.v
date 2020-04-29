`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Router.v
//
// The top module for the router of a core
//
//////////////////////////////////////////////////////////////////////////////////


module Router #(
    parameter PACKET_WIDTH = 30, // This is the largest width that the packet can have while going through the routers, not counting when bits are stripped away
    parameter DX_MSB = 29,       // Index of the MSB of the dx component, used so additional fields can be added to the packets without breaking logic
    parameter DX_LSB = 21,       // Index of the LSB of the dx component, used so additional fields can be added to the packets without breaking logic
    parameter DY_MSB = 20,       // Index of the MSB of the dy component, used so additional fields can be added to the packets without breaking logic
    parameter DY_LSB = 12,       // Index of the LSB of the dy component, used so additional fields can be added to the packets without breaking logic
    parameter BUFFER_DEPTH = 4   // The depth of all buffers in the router
)(
    input clk, // This is that tic-toc-clock boi
    input rst,
    input [PACKET_WIDTH-1:0] din_local,
    input din_local_wen,
    input [PACKET_WIDTH-1:0] din_west,
    input [PACKET_WIDTH-1:0] din_east,
    input [PACKET_WIDTH-1-(DX_MSB-DY_MSB):0] din_north,
    input [PACKET_WIDTH-1-(DX_MSB-DY_MSB):0] din_south,
    input ren_in_west,
    input ren_in_east,
    input ren_in_north,
    input ren_in_south,
    input empty_in_west,
    input empty_in_east,
    input empty_in_north,
    input empty_in_south,
    output [PACKET_WIDTH-1:0] dout_west,
    output [PACKET_WIDTH-1:0] dout_east,
    output [PACKET_WIDTH-1-(DX_MSB-DY_MSB):0] dout_north,
    output [PACKET_WIDTH-1-(DX_MSB-DY_MSB):0] dout_south,
    output [PACKET_WIDTH-1-(DX_MSB-(DY_LSB-1)):0] dout_local,
    output dout_wen_local,
    output ren_out_west,
    output ren_out_east,
    output ren_out_north,
    output ren_out_south,
    output empty_out_west,
    output empty_out_east,
    output empty_out_north,
    output empty_out_south,
    output local_buffers_full
);


    // Read enable signals
    wire ren_east_to_local, ren_west_to_local, ren_local_to_north, ren_north_to_east, ren_south_to_east, ren_north_to_west, ren_south_to_west, ren_local_to_south;
    
    // Empty signals    
    wire empty_local_to_east, empty_local_to_west, empty_north_to_local, empty_east_to_north, empty_east_to_south, empty_west_to_north, empty_west_to_south, empty_south_to_local;

    // Data signals
    wire [PACKET_WIDTH-1:0] data_local_to_east, data_local_to_west;
    wire [PACKET_WIDTH-1-(DX_MSB-(DY_LSB-1)):0] data_north_to_local, data_south_to_local;
    wire [PACKET_WIDTH-1-(DX_MSB-DY_MSB):0] data_east_to_north, data_east_to_south, data_west_to_north, data_west_to_south;

    // Full Signals
    wire full_local_to_west, full_local_to_east;
    
    
    
    // This goes back to the Token Controller saying that the buffer it is writing to is full and it should halt
    assign local_buffers_full = full_local_to_east | full_local_to_west;

    FromLocal #(
        .PACKET_WIDTH(PACKET_WIDTH),
        .BUFFER_DEPTH(BUFFER_DEPTH),
        .DX_MSB(DX_MSB),
        .DX_LSB(DX_LSB)
    ) from_local (
        .clk(clk),
        .rst(rst),
        .din(din_local),                    // Input  -- Neuron's destination information, from csram
        .din_wen(din_local_wen),            // Input  -- If the packet should be sent into router, from token controller
        .ren_east(ren_east_to_local),       // Input  -- Read enable from merge in forward east
        .ren_west(ren_west_to_local),       // Input  -- Read enable from merge in forward west
        .dout_east(data_local_to_east),     // Output -- Output bus from local to forward east
        .dout_west(data_local_to_west),     // Output -- Output bus from local to forward west
        .empty_east(empty_local_to_east),   // Output -- Lets merge in forward east know if the buffer going to it is empty
        .empty_west(empty_local_to_west),   // Output -- Lets merge in forward west know if the buffer going to it is empty
        .full_east(full_local_to_east),     // Output -- If the buffer going to forward east is full, used to halt token controller
        .full_west(full_local_to_west)      // Output -- If the buffer going to forward west is full, used to halt token controller
    );
    
    
    ForwardEastWest #(
        .PACKET_WIDTH(PACKET_WIDTH),
        .DX_MSB(DX_MSB),
        .DX_LSB(DX_LSB),
        .DY_MSB(DY_MSB),
        .DY_LSB(DY_LSB),
        .BUFFER_DEPTH(BUFFER_DEPTH),
        .EAST(1)
    ) forward_east (
        .clk(clk),
        .rst(rst),
        .din_routing(din_west),                         // Input  -- Packet from the router of the core to the west
        .din_token_controller(data_local_to_east),      // Input  -- Packet from the from local module of this core
        .empty_routing(empty_in_west),                  // Input  -- Lets merge know if the buffer in the west core is empty
        .ren_in_north(ren_north_to_east),               // Input  -- Read enable from the merge in forward north
        .empty_token_controller(empty_local_to_east),   // Input  -- Lets merge know if the buffer in the from local module is empty
        .ren_in_routing(ren_in_east),                   // Input  -- Read enable from the merge in the forward east module of the core to the east
        .ren_in_south(ren_south_to_east),               // Input  -- Read enable from the merge in forward south
        .ren_out_routing(ren_out_west),                 // Output -- Read enable to the buffer in the forward east module of the core to the west
        .ren_out_token_controller(ren_east_to_local),   // Output -- Read enable to the buffer in the from local module
        .dout_routing(dout_east),                       // Output -- Output bus to the forward east module of the core to the east
        .routing_buffer_empty(empty_out_east),          // Output -- Lets the forward east module of the core to the east know if the buffer going to it is empty
        .dout_north(data_east_to_north),                // Output -- Output bus to the forward north module
        .north_buffer_empty(empty_east_to_north),       // Output -- Lets the forward north module know if the buffer going to it is empty
        .dout_south(data_east_to_south),                // Output -- Output bus to the forward south module
        .south_buffer_empty(empty_east_to_south)        // Output -- Lets the forward south module know if the buffer going to it is empty
    );
    

    
    ForwardEastWest #(
        .PACKET_WIDTH(PACKET_WIDTH),
        .DX_MSB(DX_MSB),
        .DX_LSB(DX_LSB),
        .DY_MSB(DY_MSB),
        .DY_LSB(DY_LSB),
        .BUFFER_DEPTH(BUFFER_DEPTH),
        .EAST(0)
    ) forward_west (
        .clk(clk),
        .rst(rst),
        .din_routing(din_east),                         // Input  -- Packet from the router of the core to the east
        .din_token_controller(data_local_to_west),      // Input  -- Packet from the from local module of this core                                              
        .empty_routing(empty_in_east),                  // Input  -- Lets merge know if the buffer in the east core is empty                                     
        .ren_in_north(ren_north_to_west),               // Input  -- Read enable from the merge in forward north                                                 
        .empty_token_controller(empty_local_to_west),   // Input  -- Lets merge know if the buffer in the from local module is empty                             
        .ren_in_routing(ren_in_west),                   // Input  -- Read enable from the merge in the forward west module of the core to the west
        .ren_in_south(ren_south_to_west),               // Input  -- Read enable from the merge in forward south
        .ren_out_routing(ren_out_east),                 // Output -- Read enable to the buffer in the forward west module of the core to the east
        .ren_out_token_controller(ren_west_to_local),   // Output -- Read enable to the buffer in the from local module                                          
        .dout_routing(dout_west),                       // Output -- Output bus to the forward west module of the core to the west
        .routing_buffer_empty(empty_out_west),          // Output -- Lets the forward west module of the core to the west know if the buffer going to it is empty
        .dout_north(data_west_to_north),                // Output -- Output bus to the forward north module
        .north_buffer_empty(empty_west_to_north),       // Output -- Lets the forward north module know if the buffer going to it is empty
        .dout_south(data_west_to_south),                // Output -- Output bus to the forward south module                                                      
        .south_buffer_empty(empty_west_to_south)        // Output -- Lets the forward south module know if the buffer going to it is empty                       
    );
    
    

    
    ForwardNorthSouth #(
        .PACKET_WIDTH(PACKET_WIDTH-(DX_MSB-DY_MSB)),
        .DY_MSB(DY_MSB),
        .DY_LSB(DY_LSB),
        .BUFFER_DEPTH(BUFFER_DEPTH),
        .NORTH(1)
    ) forward_north (
        .clk(clk),
        .rst(rst),
        .din_routing(din_south),                        // Input  -- Packet from the router of the core to the south
        .din_east(data_east_to_north),                  // Input  -- Packet from the forward east module of this core
        .din_west(data_west_to_north),                  // Input  -- Packet from the forward west module of this core
        .empty_routing(empty_in_south),                 // Input  -- Lets merge know if the buffer in the south core is empty
        .empty_east(empty_east_to_north),               // Input  -- Lets merge know if the buffer in the forward east module of this core is empty
        .empty_west(empty_west_to_north),               // Input  -- Lets merge know if the buffer in the forward west module of this core is empty
        .ren_in_local(ren_local_to_north),              // Input  -- Read enable from this core's local in module
        .ren_in_routing(ren_in_north),                  // Input  -- Read enable from the merge in the forward north module of the core to the north
        .ren_out_routing(ren_out_south),                // Output -- Read enable to the buffer in the forward north module of the core to the south
        .ren_out_east(ren_north_to_east),               // Output -- Read enable to the buffer in the forward east module
        .ren_out_west(ren_north_to_west),               // Output -- Read enable to the buffer in the forward west module
        .dout_routing(dout_north),                      // Output -- Output bus to the forward north module of the core to the north
        .dout_local(data_north_to_local),               // Output -- Output bus to the local in module of this core
        .routing_buffer_empty(empty_out_north),         // Output -- Lets the forward north module of the core to the north know if the buffer going to it is empty
        .local_buffer_empty(empty_north_to_local)       // Output -- Lets the local in module of this core know if the buffer going to it is empty
    );
    

    
    ForwardNorthSouth #(
        .PACKET_WIDTH(PACKET_WIDTH-(DX_MSB-DY_MSB)),
        .DY_MSB(DY_MSB),
        .DY_LSB(DY_LSB),
        .BUFFER_DEPTH(BUFFER_DEPTH),
        .NORTH(0)
    ) forward_south (
        .clk(clk),
        .rst(rst),
        .din_routing(din_north),                        // Input  -- Packet from the router of the core to the north
        .din_east(data_east_to_south),                  // Input  -- Packet from the forward east module of this core                                              
        .din_west(data_west_to_south),                  // Input  -- Packet from the forward west module of this core                                              
        .empty_routing(empty_in_north),                 // Input  -- Lets merge know if the buffer in the north core is empty                                      
        .empty_east(empty_east_to_south),               // Input  -- Lets merge know if the buffer in the forward east module of this core is empty                
        .empty_west(empty_west_to_south),               // Input  -- Lets merge know if the buffer in the forward west module of this core is empty              
        .ren_in_local(ren_local_to_south),              // Input  -- Read enable from this core's local in module                                                  
        .ren_in_routing(ren_in_south),                  // Input  -- Read enable from the merge in the forward south module of the core to the south
        .ren_out_routing(ren_out_north),                // Output -- Read enable to the buffer in the forward south module of the core to the north
        .ren_out_east(ren_south_to_east),               // Output -- Read enable to the buffer in the forward east module                                          
        .ren_out_west(ren_south_to_west),               // Output -- Read enable to the buffer in the forward west module                                          
        .dout_routing(dout_south),                      // Output -- Output bus to the forward south module of the core to the south
        .dout_local(data_south_to_local),               // Output -- Output bus to the local in module of this core                                                
        .routing_buffer_empty(empty_out_south),         // Output -- Lets the forward south module of the core to the south know if the buffer going to it is empty
        .local_buffer_empty(empty_south_to_local)       // Output -- Lets the local in module of this core know if the buffer going to it is empty
    );
    
    LocalIn #(
        .PACKET_WIDTH(PACKET_WIDTH-(DX_MSB-(DY_LSB-1)))
    ) local_in (
        .clk(clk),
        .rst(rst),
        .din_north(data_north_to_local),                // Input  -- Packet from the forward north module of this core
        .din_south(data_south_to_local),                // Input  -- Packet from the forward south module of this core
        .empty_north(empty_north_to_local),             // Input  -- Lets merge know if the buffer in the forward north module of this core is empty
        .empty_south(empty_south_to_local),             // Input  -- Lets merge know if the buffer in the forward south module of this core is empty
        .ren_north(ren_local_to_north),                 // Output -- Read enable to the forward north module
        .ren_south(ren_local_to_south),                 // Output -- Read enable to the forward south module
        .dout(dout_local),                              // Output -- Output bus to the scheduler of this core
        .dout_wen(dout_wen_local)                       // Output -- Write enable to the scheduler of this core
    );
    
    
    
    
endmodule
