
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2017 12:39:48 PM
// Design Name: 
// Module Name: Duration
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


module Duration(
    input clk,
    
    input [3:0] in,
    output logic [1:0] out
    );
    
            always_ff @ (posedge clk)
            begin
                case(in)
                4'b0000: out<= 2'b11;
                4'b0001: out<= 2'b00;
                4'b0010: out<= 2'b00;
                4'b0011: out<= 2'b11;
                4'b0100: out<= 2'b01;
                4'b0101: out<= 2'b00;
                4'b0110: out<= 2'b10;
                4'b0111: out<= 2'b11;
                4'b1000: out<= 2'b01;
                4'b1001: out<= 2'b00;
                4'b1010: out<= 2'b10;
                4'b1011: out<= 2'b01;
                4'b1100: out<= 2'b10;
                4'b1101: out<= 2'b01;
                4'b1110: out<= 2'b10;
                4'b1111: out<= 2'b11;
                default: out<= 2'b00;

         endcase
        end

endmodule
