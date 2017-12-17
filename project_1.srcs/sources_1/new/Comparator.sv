`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2017 12:38:44 PM
// Design Name: 
// Module Name: Comparator
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


module Comparator(
    input logic clk,
    input logic reset,
    input logic key_valid,
    input logic[3:0] key_value,
    input logic[3:0] random,
    output logic[3:0] score
    );
    
    always_ff @(posedge clk)
    begin
        if (key_valid)
        begin
            if(key_value == random)
            begin
                score<= score + 4'b0001; 
            end
            else
            begin
                score<= score - 4'b0001; 
            end
        end

    end
endmodule