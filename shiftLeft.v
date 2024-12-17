`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2023 04:14:05 PM
// Design Name: 
// Module Name: Shift_Left_2
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


module Shift_Left_2(signExtendResult, outData);

    input [31:0] signExtendResult;
    output reg [31:0] outData;

    always @(signExtendResult) begin
        outData <= signExtendResult << 2;
    end
endmodule
