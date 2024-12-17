`timescale 1ns / 1ps

module IF_ID_Register(Clk, PCValNowIn, instructionIn,instructionOut, PCValNowOut, IF_ID_Write, Flush);
  input [31:0] PCValNowIn;
  input [31:0] instructionIn;
  input Clk;
  input IF_ID_Write;
  input Flush;
  output reg [31:0] instructionOut;
  output reg [31:0] PCValNowOut;
  //registers to store the input values




  always @(posedge Clk) begin

//      instructionOut <= instructionIn;
//      PCValNowOut <= PCValNowIn;
      
      if (IF_ID_Write == 0) begin
        instructionOut <= instructionOut;
        PCValNowOut <= PCValNowIn; //?
      end
      else if (Flush == 1) begin
        instructionOut <= 0;
        PCValNowOut <= PCValNowIn; //?
      end
      else begin
        instructionOut <= instructionIn;
        PCValNowOut <= PCValNowIn;
      end

  end






endmodule