`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2023 04:07:48 PM
// Design Name: 
// Module Name: adder
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


module adder(PCAdderResult, sllResult, adderResult);
    input [31:0] PCAdderResult;
    input [31:0] sllResult;
    output reg [31:0] adderResult;

    always @(*) begin
        adderResult <= PCAdderResult + sllResult;
    end




endmodule
