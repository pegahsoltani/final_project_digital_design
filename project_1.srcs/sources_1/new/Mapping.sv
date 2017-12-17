`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2017 12:41:11 PM
// Design Name: 
// Module Name: Mapping
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

module Mapping(
    input clk,
    input[3:0] in,
    output logic[3:0] out
    );
    
    always_comb
        case(in)
            4'b0000: out<= 4'b1101; 
            4'b0001: out<= 4'b1111; 
            4'b0010: out<= 4'b0011; 
            4'b0011: out<= 4'b0110;
            4'b0100: out<= 4'b0001; 
            4'b0101: out<= 4'b1011; 
            4'b0110: out<= 4'b1110; 
            4'b0111: out<= 4'b0100; 
            4'b1000: out<= 4'b1000; 
            4'b1001: out<= 4'b1100; 
            4'b1010: out<= 4'b0000; 
            4'b1011: out<= 4'b0111;
            4'b1100: out<= 4'b1010;
            4'b1101: out<= 4'b0101;
            4'b1110: out<= 4'b1001;
            4'b1111: out<= 4'b0010;
            default: out<= 4'b0000;
        endcase
    
endmodule
