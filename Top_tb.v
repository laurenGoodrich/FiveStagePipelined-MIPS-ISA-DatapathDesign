`timescale 1ns / 1ps

module Top_tb();

  reg Clk, reset;

  wire [31:0] PCResult;
  wire [31:0] WriteData_WB;
  
  Top t(Clk, reset, PCResult, WriteData_WB);
  
 
  initial begin
    Clk <= 1;
    forever #10 Clk <= ~Clk;
  end

  initial begin
    reset <= 1;
    #10 reset <= 0;
  end

endmodule