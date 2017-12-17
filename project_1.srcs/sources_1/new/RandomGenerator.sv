`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2017 12:42:03 PM
// Design Name: 
// Module Name: RandomGenerator
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


module RandomGenerator(
    input clk,
    input reset,
    output logic [3:0] out 
    );
    logic[15:0] random; 
    //random_next, count1;
    //logic[3:0] count, count_next; 
    logic feedback;    
    always@(posedge clk)
        begin
             if(reset)
             begin
                  random<= 16'b1101_1110_0010_1101;
                  //out<=0;
             end
             else
             begin
                feedback  <= random[15]^random[14]^random[12]^ random[13];
                random <= {random[14:0], feedback};
                out <= random[3:0];            
            end
        end
        //assign out = random[3:0];
endmodule
