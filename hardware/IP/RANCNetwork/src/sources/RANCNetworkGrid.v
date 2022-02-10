`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// RANCNetworkGrid.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Generates a grid of RANC cores.
//////////////////////////////////////////////////////////////////////////////////

module RANCNetworkGrid #(
    parameter GRID_DIMENSION_X = 5,
    parameter GRID_DIMENSION_Y = 1,
    parameter OUTPUT_CORE_X_COORDINATE = 4,
    parameter OUTPUT_CORE_Y_COORDINATE = 0,
    parameter NUM_OUTPUTS = 256,
    parameter NUM_NEURONS = 256,
    parameter NUM_AXONS = 256,
    parameter NUM_TICKS = 16,
    parameter NUM_WEIGHTS = 4,
    parameter NUM_RESET_MODES = 2,
    parameter POTENTIAL_WIDTH = 9,
    parameter WEIGHT_WIDTH = 9,
    parameter LEAK_WIDTH = 9,
    parameter THRESHOLD_WIDTH = 9,
    parameter DX_MSB = 29,
    parameter DX_LSB = 21,
    parameter DY_MSB = 20,
    parameter DY_LSB = 12,
    parameter ROUTER_BUFFER_DEPTH = 4,
    parameter MEMORY_FILEPATH = "C:/", 
    parameter PACKET_WIDTH = (DX_MSB - DX_LSB + 1)+(DY_MSB - DY_LSB + 1)+$clog2(NUM_AXONS)+$clog2(NUM_TICKS)
)(
    input clk,
    input rst,
    input tick,
    input input_buffer_empty,
    input [PACKET_WIDTH-1:0] packet_in,
    output [$clog2(NUM_OUTPUTS)-1:0] packet_out,
    output packet_out_valid,
    output ren_to_input_buffer,
    output token_controller_error,
    output scheduler_error
);
    localparam DX_WIDTH = DX_MSB - DX_LSB + 1;
	localparam DY_WIDTH = DY_MSB - DY_LSB + 1;
    localparam NUM_CORES = GRID_DIMENSION_X * GRID_DIMENSION_Y;
    localparam OUTPUT_CORE = OUTPUT_CORE_X_COORDINATE + OUTPUT_CORE_Y_COORDINATE * GRID_DIMENSION_X;
    localparam STRING_LENGTH = 3;
    localparam MAX_NUM_CORES = 999;

    localparam [0:MAX_NUM_CORES*STRING_LENGTH*8] STRING_INDICES = {
        "999","998","997","996","995","994","993","992","991","990","989","988","987","986","985","984","983","982","981","980","979","978","977","976","975","974","973","972","971","970","969","968","967","966","965","964","963","962","961","960","959","958","957","956","955","954","953","952","951","950","949","948","947","946","945","944","943","942","941","940","939","938","937","936","935","934","933","932","931","930","929","928","927","926","925","924","923","922","921","920","919","918","917","916","915","914","913","912","911","910","909","908","907","906","905","904","903","902","901","900","899","898","897","896","895","894","893","892","891","890","889","888","887","886","885","884","883","882","881","880","879","878","877","876","875","874","873","872","871","870","869","868","867","866","865","864","863","862","861","860","859","858","857","856","855","854","853","852","851","850","849","848","847","846","845","844","843","842","841","840","839","838","837","836","835","834","833","832","831","830","829","828","827","826","825","824","823","822","821","820","819","818","817","816","815","814","813","812","811","810","809","808","807","806","805","804","803","802","801","800","799","798","797","796","795","794","793","792","791","790","789","788","787","786","785","784","783","782","781","780","779","778","777","776","775","774","773","772","771","770","769","768","767","766","765","764","763","762","761","760","759","758","757","756","755","754","753","752","751","750","749","748","747","746","745","744","743","742","741","740","739","738","737","736","735","734","733","732","731","730","729","728","727","726","725","724","723","722","721","720","719","718","717","716","715","714","713","712","711","710","709","708","707","706","705","704","703","702","701","700","699","698","697","696","695","694","693","692","691","690","689","688","687","686","685","684","683","682","681","680","679","678","677","676","675","674","673","672","671","670","669","668","667","666","665","664","663","662","661","660","659","658","657","656","655","654","653","652","651","650","649","648","647","646","645","644","643","642","641","640","639","638","637","636","635","634","633","632","631","630","629","628","627","626","625","624","623","622","621","620","619","618","617","616","615","614","613","612","611","610","609","608","607","606","605","604","603","602","601","600","599","598","597","596","595","594","593","592","591","590","589","588","587","586","585","584","583","582","581","580","579","578","577","576","575","574","573","572","571","570","569","568","567","566","565","564","563","562","561","560","559","558","557","556","555","554","553","552","551","550","549","548","547","546","545","544","543","542","541","540","539","538","537","536","535","534","533","532","531","530","529","528","527","526","525","524","523","522","521","520","519","518","517","516","515","514","513","512","511","510","509","508","507","506","505","504","503","502","501","500","499","498","497","496","495","494","493","492","491","490","489","488","487","486","485","484","483","482","481","480","479","478","477","476","475","474","473","472","471","470","469","468","467","466","465","464","463","462","461","460","459","458","457","456","455","454","453","452","451","450","449","448","447","446","445","444","443","442","441","440","439","438","437","436","435","434","433","432","431","430","429","428","427","426","425","424","423","422","421","420","419","418","417","416","415","414","413","412","411","410","409","408","407","406","405","404","403","402","401","400","399","398","397","396","395","394","393","392","391","390","389","388","387","386","385","384","383","382","381","380","379","378","377","376","375","374","373","372","371","370","369","368","367","366","365","364","363","362","361","360","359","358","357","356","355","354","353","352","351","350","349","348","347","346","345","344","343","342","341","340","339","338","337","336","335","334","333","332","331","330","329","328","327","326","325","324","323","322","321","320","319","318","317","316","315","314","313","312","311","310","309","308","307","306","305","304","303","302","301","300","299","298","297","296","295","294","293","292","291","290","289","288","287","286","285","284","283","282","281","280","279","278","277","276","275","274","273","272","271","270","269","268","267","266","265","264","263","262","261","260","259","258","257","256","255","254","253","252","251","250","249","248","247","246","245","244","243","242","241","240","239","238","237","236","235","234","233","232","231","230","229","228","227","226","225","224","223","222","221","220","219","218","217","216","215","214","213","212","211","210","209","208","207","206","205","204","203","202","201","200","199","198","197","196","195","194","193","192","191","190","189","188","187","186","185","184","183","182","181","180","179","178","177","176","175","174","173","172","171","170","169","168","167","166","165","164","163","162","161","160","159","158","157","156","155","154","153","152","151","150","149","148","147","146","145","144","143","142","141","140","139","138","137","136","135","134","133","132","131","130","129","128","127","126","125","124","123","122","121","120","119","118","117","116","115","114","113","112","111","110","109","108","107","106","105","104","103","102","101","100","099","098","097","096","095","094","093","092","091","090","089","088","087","086","085","084","083","082","081","080","079","078","077","076","075","074","073","072","071","070","069","068","067","066","065","064","063","062","061","060","059","058","057","056","055","054","053","052","051","050","049","048","047","046","045","044","043","042","041","040","039","038","037","036","035","034","033","032","031","030","029","028","027","026","025","024","023","022","021","020","019","018","017","016","015","014","013","012","011","010","009","008","007","006","005","004","003","002","001","000"
    };
    
    // Wires for Errors:
    wire [NUM_CORES - 1:0] token_controller_errors;
    wire [NUM_CORES - 1:0] scheduler_errors;
    
    // Wires for Eastward Routing Communication
    wire [NUM_CORES - 1:0] ren_east_bus;
    wire [NUM_CORES - 1:0] empty_east_bus;
    
    // Wires for Westward Routing Communication
    wire [NUM_CORES - 1:0] ren_west_bus;
    wire [NUM_CORES - 1:0] empty_west_bus;
    
    // Wires for Northward Routing Communication
    wire [NUM_CORES - 1:0] ren_north_bus;
    wire [NUM_CORES - 1:0] empty_north_bus;
    
    // Wires for Southward Routing Communication
    wire [NUM_CORES - 1:0] ren_south_bus;
    wire [NUM_CORES - 1:0] empty_south_bus;
    
    // Wires for packets
    wire [PACKET_WIDTH-1:0] east_out_packets [NUM_CORES - 1:0];
    wire [PACKET_WIDTH-1:0] west_out_packets [NUM_CORES - 1:0];
    wire [PACKET_WIDTH-DX_WIDTH-1:0] north_out_packets [NUM_CORES - 1:0];
    wire [PACKET_WIDTH-DX_WIDTH-1:0] south_out_packets [NUM_CORES - 1:0];
    
    genvar curr_core;
    
    assign token_controller_error = | token_controller_errors;  // OR all TC errors to get final token_controller_error
    assign scheduler_error = | scheduler_errors;                // OR all SCH errors to get final scheduler error
    assign ren_to_input_buffer = ren_west_bus[0];               // Read enable to the buffer that stores the input packets
    
    for (curr_core = 0; curr_core < GRID_DIMENSION_X * GRID_DIMENSION_Y; curr_core = curr_core + 1) begin : gencore
        localparam right_edge = curr_core % GRID_DIMENSION_X == (GRID_DIMENSION_X - 1);
        localparam left_edge = curr_core % GRID_DIMENSION_X == 0;
        localparam top_edge = curr_core / GRID_DIMENSION_X == (GRID_DIMENSION_Y - 1);
        localparam bottom_edge = curr_core / GRID_DIMENSION_X == 0;
        
        if (curr_core != OUTPUT_CORE) begin
            Core #(
                .PACKET_WIDTH(PACKET_WIDTH),
                .NUM_NEURONS(NUM_NEURONS),
                .NUM_AXONS(NUM_AXONS),
                .NUM_TICKS(NUM_TICKS),
                .NUM_WEIGHTS(NUM_WEIGHTS),
                .NUM_RESET_MODES(NUM_RESET_MODES),
                .POTENTIAL_WIDTH(POTENTIAL_WIDTH),
                .WEIGHT_WIDTH(WEIGHT_WIDTH),
                .LEAK_WIDTH(LEAK_WIDTH),
                .THRESHOLD_WIDTH(THRESHOLD_WIDTH),
                .DX_MSB(DX_MSB),
                .DX_LSB(DX_LSB),
                .DY_MSB(DY_MSB),
                .DY_LSB(DY_LSB),
                .ROUTER_BUFFER_DEPTH(ROUTER_BUFFER_DEPTH),
                .CSRAM_FILE({MEMORY_FILEPATH, "csram_", STRING_INDICES[(MAX_NUM_CORES - curr_core)*STRING_LENGTH*8-:STRING_LENGTH*8], ".mem"}), 
                .TC_FILE({MEMORY_FILEPATH, "tc_", STRING_INDICES[(MAX_NUM_CORES - curr_core)*STRING_LENGTH*8-:STRING_LENGTH*8], ".mem"})
            ) Core (
                .clk(clk),
                .tick(tick),
                .rst(rst),
                .ren_in_west(left_edge ? 1'b0 : ren_east_bus[curr_core - 1]),
                .ren_in_east(right_edge ? 1'b0 : ren_west_bus[curr_core + 1]),
                .ren_in_north(top_edge ? 1'b0 : ren_south_bus[curr_core + GRID_DIMENSION_X]),
                .ren_in_south(bottom_edge ? 1'b0 : ren_north_bus[curr_core - GRID_DIMENSION_X]),
                .empty_in_west(curr_core == 0 ? input_buffer_empty : left_edge ? 1'b1 : empty_east_bus[curr_core - 1]),
                .empty_in_east(right_edge ? 1'b1 : empty_west_bus[curr_core + 1]),
                .empty_in_north(top_edge ? 1'b1 : empty_south_bus[curr_core + GRID_DIMENSION_X]),
                .empty_in_south(bottom_edge ? 1'b1 : empty_north_bus[curr_core - GRID_DIMENSION_X]),
                .east_in(right_edge ? {PACKET_WIDTH{1'b0}} : west_out_packets[curr_core + 1]),
                .west_in(curr_core == 0 ? packet_in : left_edge ? {PACKET_WIDTH{1'b0}} : east_out_packets[curr_core - 1]),
                .north_in(top_edge ? {PACKET_WIDTH-DX_WIDTH{1'b0}} : south_out_packets[curr_core + GRID_DIMENSION_X]),
                .south_in(bottom_edge ? {PACKET_WIDTH-DX_WIDTH{1'b0}}: north_out_packets[curr_core - GRID_DIMENSION_X]),
                .ren_out_west(ren_west_bus[curr_core]),
                .ren_out_east(ren_east_bus[curr_core]),
                .ren_out_north(ren_north_bus[curr_core]),
                .ren_out_south(ren_south_bus[curr_core]),
                .empty_out_west(empty_west_bus[curr_core]),
                .empty_out_east(empty_east_bus[curr_core]),
                .empty_out_north(empty_north_bus[curr_core]),
                .empty_out_south(empty_south_bus[curr_core]),
                .east_out(east_out_packets[curr_core]),
                .west_out(west_out_packets[curr_core]),
                .north_out(north_out_packets[curr_core]),
                .south_out(south_out_packets[curr_core]),
                .token_controller_error(token_controller_errors[curr_core]),
                .scheduler_error(scheduler_errors[curr_core])
            );
        end
        else begin
            OutputBus #(
                .PACKET_WIDTH(PACKET_WIDTH),
                .NUM_OUTPUTS(NUM_OUTPUTS),
                .NUM_AXONS(NUM_AXONS),
                .NUM_TICKS(NUM_TICKS),
                .DX_MSB(DX_MSB),
                .DX_LSB(DX_LSB),
                .DY_MSB(DY_MSB),
                .DY_LSB(DY_LSB),
                .ROUTER_BUFFER_DEPTH(ROUTER_BUFFER_DEPTH)
            ) OutputBus (
                .clk(clk),
                .rst(rst),
                .ren_in_west(left_edge ? 1'b0 : ren_east_bus[curr_core - 1]),
                .ren_in_east(right_edge ? 1'b0 : ren_west_bus[curr_core + 1]),
                .ren_in_north(top_edge ? 1'b0 : ren_south_bus[curr_core + GRID_DIMENSION_X]),
                .ren_in_south(bottom_edge ? 1'b0 : ren_north_bus[curr_core - GRID_DIMENSION_X]),
                .empty_in_west(curr_core == 0 ? input_buffer_empty : left_edge ? 1'b1 : empty_east_bus[curr_core - 1]),
                .empty_in_east(right_edge ? 1'b1 : empty_west_bus[curr_core + 1]),
                .empty_in_north(top_edge ? 1'b1 : empty_south_bus[curr_core + GRID_DIMENSION_X]),
                .empty_in_south(bottom_edge ? 1'b1 : empty_north_bus[curr_core - GRID_DIMENSION_X]),
                .ren_out_west(ren_west_bus[curr_core]),
                .ren_out_east(ren_east_bus[curr_core]),
                .ren_out_north(ren_north_bus[curr_core]),
                .ren_out_south(ren_south_bus[curr_core]),
                .empty_out_west(empty_west_bus[curr_core]),
                .empty_out_east(empty_east_bus[curr_core]),
                .empty_out_north(empty_north_bus[curr_core]),
                .empty_out_south(empty_south_bus[curr_core]),
                .east_in(right_edge ? {PACKET_WIDTH{1'b0}} : west_out_packets[curr_core + 1]),
                .west_in(curr_core == 0 ? packet_in : left_edge ? {PACKET_WIDTH{1'b0}} : east_out_packets[curr_core - 1]),
                .north_in(top_edge ? {PACKET_WIDTH-DX_WIDTH{1'b0}} : south_out_packets[curr_core + GRID_DIMENSION_X]),      // North In From Next North's South Out
                .south_in(bottom_edge ? {PACKET_WIDTH-DX_WIDTH{1'b0}} : north_out_packets[curr_core - GRID_DIMENSION_X]),      // South In From Next South's North Out
                .east_out(east_out_packets[curr_core]),     // East Out, Next East's West In
                .west_out(west_out_packets[curr_core]),     // West Out, Next West's East In
                .north_out(north_out_packets[curr_core]),    // North Out, Next North's South In
                .south_out(south_out_packets[curr_core]),    // South Out, Next South's North In
                .packet_out(packet_out),
                .packet_out_valid(packet_out_valid),
                .token_controller_error(token_controller_errors[curr_core]),
                .scheduler_error(scheduler_errors[curr_core])
            );
        end
    end     
    
endmodule