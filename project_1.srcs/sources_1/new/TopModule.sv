`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2017 12:37:51 PM
// Design Name: 
// Module Name: TopModule
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


module TopModule(
    input logic clk,
    input logic reset,
    input start,
    output logic [3:0]phases,
    output logic a, b, c, d, e, f, g,dp, 
    output logic [3:0]an,
    output logic [3:0] keyb_row,
    input  logic [3:0] keyb_col 
    );
    
    logic [3:0]score= 4'b00_00;
    logic [3:0]outRandom;
    logic [1:0]outDuration;
    logic [1:0]outDirection;
    logic [3:0]keyb_value;
    logic keyb_valid;
    
    logic [3:0]next_key;//mapping key 
 
    logic [3:0] in0 = 4'b00_00; //initial value
    logic [3:0] in1 = 4'b00_00; //initial value
    logic [3:0] in2 = 4'b00_00; //initial value
    logic [3:0] in3 = 4'b00_00;
    logic [3:0] randomN;
    
    RandomGenerator rasdom(clk ,reset, outRandom);
    Mapping map(clk, keyb_value, next_key);
    Duration duration(clk, randomN ,outDuration);
    Direction direction(clk,randomN , outDirection);
    steppermotor_wrapper steppermotor(clk , outDirection , outDuration , phases , start|keyb_valid);
    SevSeg_4digit seven1(clk, in0, in1 ,in2 ,in3, a, b, c, d, e, f, g,dp, an);
   // Comparator comp(clk, reset, keyb_value, outRandom, score);
    keypad4X4 keypad(clk, keyb_row, keyb_col, keyb_value, keyb_valid);
    
    always_ff@(posedge clk, posedge reset) begin
            if (reset)
                randomN = 4'b0;
            else if (keyb_valid)
                randomN = outRandom;
         end
    

    //SevSeg_4digit sevseg(clk,in0, in1, in2, in3,a, b, c, d, e, f, g, dp, an);
     always@(posedge clk)
     begin
     if(!reset) 
     begin
         if (keyb_valid==1'b1)
         begin
             if(next_key == randomN)
             begin
                 score<= score + 4'b0001;
                 in3<=score;
                 in1<=next_key;
                 in0<=outRandom;
  
             end
             else
             begin
                 score<= score - 4'b0001;
                 in3<=score;
                 in1<=next_key;
                 in0<=outRandom; 
             end
         end
end//if
     else
     begin
         score<=4'b0000;
         in3<=score;
         in1<=4'b0000;
         in0<=4'b0000; 
     end
     end
         
endmodule
