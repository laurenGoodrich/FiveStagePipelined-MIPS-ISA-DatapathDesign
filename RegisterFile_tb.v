`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - RegisterFile.v
// Description - Test the register_file
// Suggested test case - First write arbitrary values into 
// the saved and temporary registers (i.e., register 8 through 25). Then, 2-by-2, 
// read values from these registers.
////////////////////////////////////////////////////////////////////////////////


module RegisterFile_tb();

	reg [4:0] ReadRegister1;
	reg [4:0] ReadRegister2;
	reg	[4:0] WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite;
	reg Clk;

	wire [31:0] ReadData1;
	wire [31:0] ReadData2;


	RegisterFile u0(
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.Clk(Clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
    #50 RegWrite <= 0;
    WriteRegister <= 4;
    WriteData <= 2;
    
    #50 RegWrite <= 1;
    WriteRegister <= 4;
    WriteData <= 2;
    
    #50 RegWrite <= 0;
    ReadRegister1 <= 4;
    ReadRegister2 <= 8;

    #50 RegWrite <= 1;
    WriteRegister <= 10;
    WriteData <= 25;
    ReadRegister1 <= 10;

    #50
    ReadRegister1 <= 10;
    WriteRegister <= 3;
    WriteData <= 1;
    WriteRegister <= 20;
    WriteData <= 100;
    #50
    ReadRegister1 <= 3;
    ReadRegister2 <= 20;
    
	
	end

endmodule
