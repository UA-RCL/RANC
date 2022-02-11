`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// NotDetMerge3Top.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
//////////////////////////////////////////////////////////////////////////////////
/*

NonDetMerge3Top_Valid NDM3VT_TEST(
// Inputs:
    .Clock(),
    .Reset(),
    .DataIn1(),
    .DataIn1Valid(),
    .DataIn2(),
    .DataIn2Valid(),
    .DataIn3(),
    .DataIn3Valid(),
    .Full(),
    
    // Outputs:
    .DataOut(),
    .Write(),
    .Data1Captured(),
    .Data2Captured(),
    .Data3Captured()
);

*/

module NonDetMerge3Top #(
	// Parameters:
	parameter PACKET_SIZE = 30
)(
// Inputs:
    input Clock,
    input Reset,
    input [PACKET_SIZE-1:0] DataIn1,
    input DataIn1Valid,
    input [PACKET_SIZE-1:0] DataIn2,
    input DataIn2Valid,
    input [PACKET_SIZE-1:0] DataIn3,
    input DataIn3Valid,
    input Full,
    
    // Outputs:
    output [PACKET_SIZE-1:0] DataOut,
    output Write,
    output Data1Captured,
    output Data2Captured,
    output Data3Captured
);
    
    // Wires:
    wire NDMV_Cap1, NDMV_Cap2, NDMV_Cap3;
    
    wire [PACKET_SIZE-1:0] inReg1Out, inReg2Out, inReg3Out;
    wire inReg1Valid, inReg2Valid, inReg3Valid;
    // MODULES:
    
    InputRegister #(PACKET_SIZE) EastInReg(
    // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataValid(DataIn1Valid),
        .DataIn(DataIn1),
        .Captured(NDMV_Cap1),
        .Full(Full),
        
        // Outputs:
        .DataOut(inReg1Out),
        .DataOutValid(inReg1Valid),
        .DataCaptured(Data1Captured)
    );
    
    InputRegister #(PACKET_SIZE) WestInReg(
    // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataValid(DataIn2Valid),
        .DataIn(DataIn2),
        .Captured(NDMV_Cap2),
        .Full(Full),
        
        // Outputs:
        .DataOut(inReg2Out),
        .DataOutValid(inReg2Valid),
        .DataCaptured(Data2Captured)
    );
    
    InputRegister #(PACKET_SIZE) NorthSouthInReg(
    // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataValid(DataIn3Valid),
        .DataIn(DataIn3),
        .Captured(NDMV_Cap3),
        .Full(Full),
        
        // Outputs:
        .DataOut(inReg3Out),
        .DataOutValid(inReg3Valid),
        .DataCaptured(Data3Captured)
    );
    
    NonDetMerge3 #(PACKET_SIZE) NonDetMerge(
    // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .Data1(inReg1Out),
        .Data2(inReg2Out),
        .Data3(inReg3Out),
        .Data1Valid(inReg1Valid),
        .Data2Valid(inReg2Valid),
        .Data3Valid(inReg3Valid),
        .Full(Full),
        
        // Outputs:
        .DataOut(DataOut),
        .Write(Write),
        .Captured1(NDMV_Cap1),
        .Captured2(NDMV_Cap2),
        .Captured3(NDMV_Cap3)
    );
endmodule
