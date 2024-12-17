`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - SignExtension.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module SignExtension(in, out);

    /* A 16-Bit input word */
    input [15:0] in;
        reg [31:0] out;
    /* A 32-Bit output word */
    output [31:0] out;
       
    always @(in) begin
      if (in[15] == 0) begin
            out <= {16'h0000, in};
        end
        else begin
            if (in[15] == 1) begin
                out <= {16'hffff, in};
            end
            else begin
                out <= in;
            end
        end
   end
endmodule
