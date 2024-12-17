`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2023 10:03:49 AM
// Design Name: 
// Module Name: FiveBitMux2to1
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


module FiveBitMux2to1(out, inA, inB, sel);
// FiveBitMux2To1 muxRegDst(.out(RegDest), .inA(RtData_EX), .inB(RdData_EX), .sel(RegDst_EX));

    output reg [4:0] out;

    input [4:0] inA;
    input [4:0] inB;
    input sel;

    always @(*) begin
        if (sel == 0) begin
            out <= inA;
        end
        else begin
            out <= inB;
        end
    end


endmodule
