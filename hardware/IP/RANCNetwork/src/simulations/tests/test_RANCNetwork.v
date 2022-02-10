
`timescale 1ns / 1ps


module test_RANCNetwork;

reg clk, rst, tick, s00_axis_aclk, s00_axis_aresetn;
reg [`c_s00_axis_tdata_width-1:0] s00_axis_tdata;
reg [(`c_s00_axis_tdata_width/8)-1:0] s00_axis_tstrb;
reg s00_axis_tlast, s00_axis_tvalid;

wire [$clog2(`num_outputs)-1:0] packet_out;
wire packet_out_valid, token_controller_error, scheduler_error, packet_read_error, fifo_write_error, s00_axis_tready;

initial begin
    $from_myhdl(clk, rst, tick, s00_axis_aclk, s00_axis_aresetn, s00_axis_tdata, s00_axis_tstrb, s00_axis_tlast, s00_axis_tvalid);
    $to_myhdl(packet_out, packet_out_valid, token_controller_error, scheduler_error, packet_read_error, fifo_write_error, s00_axis_tready);
    $dumpfile("test.vcd");
    $dumpvars(0, test_RANCNetwork);
end

RANCNetwork RANCNetwork_tb(
    .clk                    (clk                    ),
    .rst                    (rst                    ),
    .tick                   (tick                   ),
    .s00_axis_aclk          (s00_axis_aclk          ),
    .s00_axis_aresetn       (s00_axis_aresetn       ),
    .s00_axis_tdata         (s00_axis_tdata         ),
    .s00_axis_tstrb         (s00_axis_tstrb         ),
    .s00_axis_tlast         (s00_axis_tlast         ),
    .s00_axis_tvalid        (s00_axis_tvalid        ),
    .packet_out             (packet_out             ),
    .packet_out_valid       (packet_out_valid       ),
    .token_controller_error (token_controller_error ),
    .scheduler_error        (scheduler_error        ),
    .packet_read_error      (packet_read_error      ),
    .fifo_write_error       (fifo_write_error       ),
    .s00_axis_tready        (s00_axis_tready        )
);

defparam RANCNetwork_tb.GRID_DIMENSION_X = `grid_dimension_x;
defparam RANCNetwork_tb.GRID_DIMENSION_Y = `grid_dimension_y;
defparam RANCNetwork_tb.OUTPUT_CORE_X_COORDINATE = `output_core_x_coordinate;
defparam RANCNetwork_tb.OUTPUT_CORE_Y_COORDINATE = `output_core_y_coordinate;
defparam RANCNetwork_tb.NUM_OUTPUTS = `num_outputs;
defparam RANCNetwork_tb.NUM_NEURONS = `num_neurons;
defparam RANCNetwork_tb.NUM_AXONS = `num_axons;
defparam RANCNetwork_tb.NUM_TICKS = `num_ticks;
defparam RANCNetwork_tb.NUM_WEIGHTS = `num_weights;
defparam RANCNetwork_tb.NUM_RESET_MODES = `num_reset_modes;
defparam RANCNetwork_tb.POTENTIAL_WIDTH = `potential_width;
defparam RANCNetwork_tb.WEIGHT_WIDTH = `weight_width;
defparam RANCNetwork_tb.LEAK_WIDTH = `leak_width;
defparam RANCNetwork_tb.THRESHOLD_WIDTH = `threshold_width;
defparam RANCNetwork_tb.MAX_DIMENSION_X = `max_dimension_x;
defparam RANCNetwork_tb.MAX_DIMENSION_Y = `max_dimension_y;
defparam RANCNetwork_tb.INPUT_BUFFER_DEPTH = `input_buffer_depth;
defparam RANCNetwork_tb.ROUTER_BUFFER_DEPTH = `router_buffer_depth;
defparam RANCNetwork_tb.MEMORY_FILEPATH = `memory_filepath;
defparam RANCNetwork_tb.MAXIMUM_NUMBER_OF_PACKETS = `maximum_number_of_packets;
defparam RANCNetwork_tb.C_S00_AXIS_TDATA_WIDTH = `c_s00_axis_tdata_width;

endmodule
