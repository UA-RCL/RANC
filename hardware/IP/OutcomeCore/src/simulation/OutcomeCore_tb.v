`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2019 09:26:34 AM
// Design Name: 
// Module Name: OutcomeCore_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module OutcomeCore_tb();

    parameter CLOCK_PERIOD_NS_tb = 20;

    parameter PACKET_WIDTH_tb = 30;
    parameter CLASS_WIDTH_tb = 8;
    parameter NUM_CLASSES_tb = 10;
    parameter FIFO_DEPTH_tb = 16;
    parameter STREAM_DEPTH_tb = 8;
    parameter C_M00_AXIS_TDATA_WIDTH_tb = 32;
    parameter C_M00_AXIS_START_COUNT_tb = 32;
    
    reg clk_tb, rst_tb, tick_tb;
    wire [PACKET_WIDTH_tb-1:0] packet_tb;
    reg packet_valid_tb;
    
    wire packet_captured_tb;
    
    reg m00_axis_aresetn_tb;
    wire m00_axis_tvalid_tb;
    wire [C_M00_AXIS_TDATA_WIDTH_tb-1:0] m00_axis_tdata_tb;
    wire [(C_M00_AXIS_TDATA_WIDTH_tb/8)-1:0] m00_axis_tstrb_tb;
    wire m00_axis_tlast_tb;
    reg m00_axis_tready_tb;

    OutcomeCore #(
        .PACKET_WIDTH(PACKET_WIDTH_tb),
        .CLASS_WIDTH(CLASS_WIDTH_tb),
        .NUM_CLASSES(NUM_CLASSES_tb),
        .FIFO_DEPTH(FIFO_DEPTH_tb),
        .STREAM_DEPTH(STREAM_DEPTH_tb),
        // Parameters of Axi Master Bus Interface M00_AXIS
        .C_M00_AXIS_TDATA_WIDTH(C_M00_AXIS_TDATA_WIDTH_tb),
        .C_M00_AXIS_START_COUNT(C_M00_AXIS_START_COUNT_tb)
    ) OtcomeCore_tb (
        // Inputs:
        .clk(clk_tb),
        .rst(rst_tb),
        .tick(tick_tb),
        .packet(packet_tb),
        .packet_valid(packet_valid_tb),
        
        .packet_captured(packet_captured_tb),
    
        // Ports of Axi Master Bus Interface M00_AXIS
        .m00_axis_aclk(clk_tb),
        .m00_axis_aresetn(m00_axis_aresetn_tb),
        .m00_axis_tvalid(m00_axis_tvalid_tb),
        .m00_axis_tdata(m00_axis_tdata_tb),
        .m00_axis_tstrb(m00_axis_tstrb_tb),
        .m00_axis_tlast(m00_axis_tlast_tb),
        .m00_axis_tready(m00_axis_tready_tb)
    );
    
    integer counter_tb = 0;
    integer num_ticks_tb = 0;
    
    always begin
        clk_tb = ~clk_tb;
        #(CLOCK_PERIOD_NS_tb / 2);
    end
    
    integer i;
    
    /*Packet Organization (30 bits):
    [         dx       ] [         dy       ] [ destination axon index ] [  delivery tick ]
    [       9 bits     ] [       9 bits     ] [        8 bits          ] [      4 bits    ]*/
    reg [8:0] dx_tb, dy_tb;
    reg [7:0] dest_axon_index_tb;
    reg [3:0] delivery_tick_tb;
    
    assign packet_tb = {dx_tb, dy_tb, dest_axon_index_tb, delivery_tick_tb};
    
    initial begin
        dx_tb = 9'd0;
        dy_tb = 9'd0;
        dest_axon_index_tb = 8'd0;
        delivery_tick_tb = 4'd0;
        clk_tb <= 0;
        rst_tb <= 1;
        tick_tb <= 0;
        packet_valid_tb <= 0;
        m00_axis_aresetn_tb <= 0;
        m00_axis_tready_tb <= 0;
        @(posedge clk_tb);
        @(posedge clk_tb);
        @(posedge clk_tb) #2;
        rst_tb <= 0;
        m00_axis_aresetn_tb <= 1;
        m00_axis_tready_tb <= 1;
        
        // Send a 1
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 1;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 2;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 1;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;     
        @(posedge clk_tb); 
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end 
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb; i = i + 1) begin
            @(posedge clk_tb);
        end 
        // Send a 2
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 2;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 2;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        // Send a 3
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 3;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 3;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end 
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end 
        // Send a 4
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 4;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 4;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;
        @(posedge clk_tb);
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end 
        // Send a 5
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 5;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 5;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;
        @(posedge clk_tb);
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end 
        // Send a 6
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 6;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 6;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;
        @(posedge clk_tb);  
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end 
        // Send a 7
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 7;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 7;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;
        @(posedge clk_tb);
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end 
        // Send a 8
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 8;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 8;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;
        @(posedge clk_tb);
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end 
        // Send a 9
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 9;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 9;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;
        @(posedge clk_tb);  
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end 
        // Send a 1
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 1;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 1;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;
        @(posedge clk_tb);
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end
        // Send a 2
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 2;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 2;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        // Send a 3
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 3;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 3;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end 
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end 
        // Send a 4
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 4;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 4;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;
        @(posedge clk_tb);
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end 
        // Send a 5
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 5;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 5;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;
        @(posedge clk_tb);
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end 
        // Send a 6
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 6;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 6;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;
        @(posedge clk_tb);  
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end 
        // Send a 7
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 7;
        packet_valid_tb <= 1;
        @(posedge clk_tb) #2;
        dest_axon_index_tb = 7;
        @(posedge clk_tb) #2;
        packet_valid_tb <= 0;
        @(posedge clk_tb);
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        for (i = 0; i < NUM_CLASSES_tb*2; i = i + 1) begin
            @(posedge clk_tb);
        end
    end

endmodule
