`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Router.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
//////////////////////////////////////////////////////////////////////////////////
/*

// Parameters: Packet Length, Dx, Dy, Buffer Size

Router #(
    // Parameters:
    .PACKET_SIZE(30),
    .DX_WIDTH(9),
    .DY_WIDTH(9),
    .FIFO_SIZE(4),
	.ADDRESS_SIZE(2)
)(
    // Inputs:
    .Clock(),
    .Reset(),
    
    .CSRAM_Packet(),
    .TC_Spike(),
    
    .WestInEastOut(),
    .EastInWestOut(),
    .NorthInSouthOut(),
    .SouthInNorthOut(),
    
    .WestInValid(),
    .EastInValid(),
    .NorthInValid(),
    .SouthInValid(),
    
    .NextWestFull(),
    .NextEastFull(),
    .NextNorthFull(),
    .NextSouthFull(),
    
    .NextWestCapture(),
    .NextEastCapture(),
    .NextNorthCapture(),
    .NextSouthCapture(),
    
    // Outputs:
    .WestOutEastIn(),
    .EastOutWestIn(),
    .NorthOutSouthIn(),
    .SouthOutNorthIn(),
    
    .WestOutValid(),
    .EastOutValid(),
    .NorthOutValid(),
    .SouthOutValid(),
    
    .ToScheduler(),
    .SchedulerWrite(),
    
    .ForwardEastFull(),
    .ForwardWestFull(),
    .ForwardNorthFull(),
    .ForwardSouthFull(),
    
    .ForwardEastCapture(),
    .ForwardWestCapture(),
    .ForwardNorthCapture(),
    .ForwardSouthCapture()
);

*/

module Router#(
    // Parameters:
    parameter PACKET_SIZE = 30,
    parameter DX_WIDTH = 9,
    parameter DY_WIDTH = 9,
    parameter FIFO_SIZE = 4,
    parameter ADDRESS_SIZE = 2
)(
    // Inputs:
    input Clock,
    input Reset,
    
    input [PACKET_SIZE-1:0] CSRAM_Packet,
    input TC_Spike,
    
    input [PACKET_SIZE-1:0] WestInEastOut,
    input [PACKET_SIZE-1:0] EastInWestOut,
    input [PACKET_SIZE-DX_WIDTH-1:0] NorthInSouthOut,
    input [PACKET_SIZE-DX_WIDTH-1:0] SouthInNorthOut,
    
    input WestInValid,
    input EastInValid,
    input NorthInValid,
    input SouthInValid,
    
    input NextWestFull,
    input NextEastFull,
    input NextNorthFull,
    input NextSouthFull,
    
    input NextWestCapture,
    input NextEastCapture,
    input NextNorthCapture,
    input NextSouthCapture,
    
    // Outputs:
    output [PACKET_SIZE-1:0] WestOutEastIn,
    output [PACKET_SIZE-1:0] EastOutWestIn,
    output [PACKET_SIZE-DX_WIDTH-1:0] NorthOutSouthIn,
    output [PACKET_SIZE-DX_WIDTH-1:0] SouthOutNorthIn,
    
    output WestOutValid,
    output EastOutValid,
    output NorthOutValid,
    output SouthOutValid,
    
    output [PACKET_SIZE-DX_WIDTH-DY_WIDTH-1:0] ToScheduler,
    output SchedulerWrite,
    
    output ForwardEastFull,
    output ForwardWestFull,
    output ForwardNorthFull,
    output ForwardSouthFull,
    
    output ForwardEastCapture,
    output ForwardWestCapture,
    output ForwardNorthCapture,
    output ForwardSouthCapture,
    output ForwardEastContention
);
    
    
    // Wires:
    wire CSRAM_DX;
    wire NorthCapturedEast, NorthCapturedWest, SouthCapturedEast, SouthCapturedWest;
    
    wire [PACKET_SIZE-DX_WIDTH-1:0] EastToNorth, WestToNorth, EastToSouth, WestToSouth;
    wire EastToNorthValid, WestToNorthValid, EastToSouthValid, WestToSouthValid;
    
    wire [PACKET_SIZE-DX_WIDTH-DY_WIDTH-1:0] SouthToLocal, NorthToLocal;
    wire SouthToLocalValid, NorthToLocalValid, LocalCaptureSouth, LocalCaptureNorth;
///////////////////////////////////////////////////////////////////////////////////
// MODULES:
Comp #(DX_WIDTH) CSRAM_Comp(
    .a(CSRAM_Packet[29:21]),
    .b(9'd0),
    .gt(),
    .eq(),
    .lt(CSRAM_DX)
);

ForwardEast #(PACKET_SIZE, DX_WIDTH, DY_WIDTH, FIFO_SIZE, ADDRESS_SIZE) ForwardEast(
    // Inputs:
    .Clock(Clock),
    .Reset(Reset),
    .WestToEast(WestInEastOut),
    .WestToEastValid(WestInValid),
    .LocalToEast(CSRAM_Packet),
    .LocalToEastValid((TC_Spike & !CSRAM_DX)),
    .NextEastFull(NextEastFull),
    .NextEastCaptured(NextEastCapture),
    .ForwardNorthCapture(NorthCapturedEast),
    .ForwardSouthCapture(SouthCapturedEast),
    .ForwardNorthFull(ForwardNorthFull),
    .ForwardSouthFull(ForwardSouthFull),
    
    // Outputs:
    .EastToWestIn(EastOutWestIn),
    .EastToWestInValid(EastOutValid),
    .EastToNorth(EastToNorth),
    .EastToNorthValid(EastToNorthValid),
    .EastToSouth(EastToSouth),
    .EastToSouthValid(EastToSouthValid),
    .ForwardEastFull(ForwardEastFull),
    .PastEastCaptured(ForwardEastCapture),
    .Contention(ForwardEastContention)
);

ForwardWest #(PACKET_SIZE, DX_WIDTH, DY_WIDTH, FIFO_SIZE, ADDRESS_SIZE) ForwardWest(
// Inputs:
    .Clock(Clock),
    .Reset(Reset),
    .EastToWest(EastInWestOut),
    .EastToWestValid(EastInValid),
    .LocalToWest(CSRAM_Packet),
    .LocalToWestValid((TC_Spike & CSRAM_DX)),
    .NextWestFull(NextWestFull),
    .NextWestCapture(NextWestCapture),
    .ForwardNorthCapture(NorthCapturedWest),
    .ForwardSouthCapture(SouthCapturedWest),
    .ForwardNorthFull(ForwardNorthFull),
    .ForwardSouthFull(ForwardSouthFull),
    
    // Outputs:
    .WestToEastIn(WestOutEastIn),
    .WestToEastInValid(WestOutValid),
    .WestToNorth(WestToNorth),
    .WestToNorthValid(WestToNorthValid),
    .WestToSouth(WestToSouth),
    .WestToSouthValid(WestToSouthValid),
    .ForwardWestFull(ForwardWestFull),
    .PastWestCaptured(ForwardWestCapture)
);

ForwardNorth #(PACKET_SIZE-DX_WIDTH, DY_WIDTH, FIFO_SIZE, ADDRESS_SIZE) ForwardNorth(
// Inputs:
    .Clock(~Clock),
    .Reset(Reset),
    .EastToNorth(EastToNorth),
    .EastToNorthValid(EastToNorthValid),
    .WestToNorth(WestToNorth),
    .WestToNorthValid(WestToNorthValid),
    .SouthInNorthOut(SouthInNorthOut),
    .SouthInNorthOutValid(SouthInValid),
    .NextNorthFull(NextNorthFull),
    .NextNorthCapture(NextNorthCapture),
    .ToLocalCapture(LocalCaptureNorth),
    
    // Outputs:
    .NorthOutSouthIn(NorthOutSouthIn),
    .NorthOutSouthInValid(NorthOutValid),
    .NorthToLocal(NorthToLocal),
    .NorthToLocalValid(NorthToLocalValid),
    .ForwardNorthFull(ForwardNorthFull),
    .NorthCapturedEast(NorthCapturedEast),
    .NorthCapturedWest(NorthCapturedWest),
    .NorthCapturedSouth(ForwardNorthCapture)
);

ForwardSouth #(PACKET_SIZE-DX_WIDTH, DY_WIDTH, FIFO_SIZE, ADDRESS_SIZE) ForwardSouth(
// Inputs:
    .Clock(~Clock),
    .Reset(Reset),
    .EastToSouth(EastToSouth),
    .EastToSouthValid(EastToSouthValid),
    .WestToSouth(WestToSouth),
    .WestToSouthValid(WestToSouthValid),
    .NorthInSouthOut(NorthInSouthOut),
    .NorthInSouthOutValid(NorthInValid),
    .NextSouthFull(NextSouthFull),
    .NextSouthCapture(NextSouthCapture),
    .ToLocalCapture(LocalCaptureSouth),
    
    // Outputs:
    .SouthOutNorthIn(SouthOutNorthIn),
    .SouthOutNorthInValid(SouthOutValid),
    .SouthToLocal(SouthToLocal),
    .SouthToLocalValid(SouthToLocalValid),
    .ForwardSouthFull(ForwardSouthFull),
    .SouthCapturedEast(SouthCapturedEast),
    .SouthCapturedWest(SouthCapturedWest),
    .SouthCapturedNorth(ForwardSouthCapture)
);

NonDetMergeTop #(PACKET_SIZE-DX_WIDTH-DY_WIDTH) ForwardLocal(
    // Inputs:
    .Clock(Clock),
    .Reset(Reset),
    .DataIn1(NorthToLocal),
    .DataIn1Valid(NorthToLocalValid),
    .DataIn2(SouthToLocal),
    .DataIn2Valid(SouthToLocalValid),
    .Full(1'b0),
    
    // Outputs:
    .DataOut(ToScheduler),
    .Write(SchedulerWrite),
    .Data1Captured(LocalCaptureNorth),
    .Data2Captured(LocalCaptureSouth)
);
endmodule
