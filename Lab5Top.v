`timescale 1ns / 1ps

module Lab5Top(Clk, Reset, out7, en_out);
  input Clk;
  input Reset;
  output [6:0] out7;
  output [7:0] en_out;

  wire ClkOut;
  wire [31:0] jalMuxOut;
  wire [31:0] PCResult;


  Top topLab4(ClkOut, Reset, PCResult, jalMuxOut);

  Two4DigitDisplay TDD(Clk, PCResult[15:0], jalMuxOut[15:0], out7, en_out);

  ClkDiv CD(Clk, 0, ClkOut);


endmodule
