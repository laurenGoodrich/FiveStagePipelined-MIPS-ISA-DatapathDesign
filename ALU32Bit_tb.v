`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg [3:0] ALUControl;   // control bits for ALU operation
	reg [31:0] A, B;	        // inputs

	wire [31:0] ALUResult;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .ALUResult(ALUResult), 
        .Zero(Zero)
    );

	initial begin
	
    #50 A <= 2; B <= 3;
    #50 ALUControl <= 0;
    #50 ALUControl <= 1;
    #50 ALUControl <= 2;
    #50 ALUControl <= 3;
    #50 ALUControl <= 4;
    #50 ALUControl <= 5;
    #50 ALUControl <= 6;
    #50 ALUControl <= 7;
    #50 ALUControl <= 8;
    #50 ALUControl <= 9;
    #50 A <= 1; B <= 1;
    #50 ALUControl <= 6;
    #50 A <= 0;
    #50 ALUControl <= 9;
    #50 A <= 4; B <= 2;
    #50 ALUControl <= 3;
    #50 A <= -1;
    #50 #50 ALUControl <= 8;
	
	end

endmodule

