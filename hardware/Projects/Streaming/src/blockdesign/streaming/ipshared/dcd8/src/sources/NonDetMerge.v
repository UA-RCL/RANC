`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// NonDetMerge.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
//////////////////////////////////////////////////////////////////////////////////
/*

NonDetMerge_Valid NDMV_TEST(
// Inputs:
    .Clock(),
    .Reset(),
    .Data1(),
    .Data2(),
    .Data1Valid(),
    .Data2Valid(),
    .Full(),
    
    // Outputs:
    .DataOut(),
    .Write(),
    .Captured1(),
    .Captured2()
);

*/

module NonDetMerge #(
	// Parameter
	parameter PACKET_SIZE = 30
)(
// Inputs:
    input Clock,
    input Reset,
    input [PACKET_SIZE-1:0] Data1,
    input [PACKET_SIZE-1:0] Data2,
    input Data1Valid,
    input Data2Valid,
    input Full,
    
    // Outputs:
    output reg [PACKET_SIZE-1:0] DataOut,
    output reg Write,
    output reg Captured1,
    output reg Captured2,
    output reg flag
);
    
    reg fullFlag;
    reg ch1, ch2;
    
    always@(negedge Clock)begin
        if(Reset)begin
            Write <= 0;
            DataOut <= 0;
            flag <= 0;
            fullFlag <= 0;
            ch1 <= 0;
            ch2 <= 0;
            Captured1 <= 0;
            Captured2 <= 0;
        end
        else begin
            if(Full)begin
                fullFlag <= 1;
                ch1 <= Data1Valid;
                ch2 <= Data2Valid;
                Write <= 0;
            end
            
            else if(fullFlag && !Full)begin
                if(ch1)begin
                    DataOut <= Data1;
                    Write <= 1;
                    ch1 <= 0;
                    Captured1 <= 1;
                    Captured2 <= 0;
                end
                else if(ch2)begin
                    DataOut <= Data2;
                    Write <= 1;
                    ch2 <= 0;
                    Captured1 <= 0;
                    Captured2 <= 1;
                end
                else begin
                    fullFlag <= 0;
                    Captured1 <= 0;
                    Captured2 <= 0;
                    Write <= 0;
                end
            end
            
            /*else if(flag && !Full)begin
                DataOut <= Data2;
                Write <= 1;
                flag <= 0;
                Captured1 <= 0;
                Captured2 <= 1;
            end*/
            
            else if(Data1Valid && Data2Valid && !Full)begin
                flag <= 1;
                DataOut <= Data1;
                Write <= 1;
                Captured1 <= 1;
                Captured2 <= 0;
            end
            
            else if(Data1Valid && !Full)begin
                DataOut <= Data1;
                Write <= 1;
                Captured1 <= 1;
                Captured2 <= 0;
                flag <= 0;
            end
            
            else if(Data2Valid && !Full)begin
                DataOut <= Data2;
                Write <= 1;
                Captured1 <= 0;
                Captured2 <= 1;
                flag <= 0;
            end
            
            else begin
                Write <= 0;
                Captured1 <= 0;
                Captured2 <= 0;
            end
        end
    end
endmodule
