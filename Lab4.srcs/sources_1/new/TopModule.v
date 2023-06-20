`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2023 15:22:52
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


module TopModule(input left, input right, input reset, input clk, input clk2, output RA, RB, RC, LA,LB, LC);
    /*Pwm(clk2, 4'b0100, reset, RA);
    Pwm(clk2, 4'b1100, reset, RB);
    Pwm(clk2, 4'b1111, reset, RC); 
    
    Pwm(clk2, 4'b0100, reset, LA);
    Pwm(clk2, 4'b1100, reset, LB);
    Pwm(clk2, 4'b1111, reset, LC); */
    
    wire clkdiv_wire, next_state;
   clk_div(clk, reset, clkdiv_wire);
    StateRegister(clkdiv_wire, clk, next_state, left,  right, reset, next_state, RA, RB, RC, LA,LB, LC);
endmodule
