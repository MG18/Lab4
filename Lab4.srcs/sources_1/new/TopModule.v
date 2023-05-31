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


module TopModule(input left, input right, input reset, input clk, output RA, RB, RC, LA,LB, LC);
    
    wire clkdiv_wire, next_state;
    clk_div(clk, reset, clkdiv_wire);
    StateRegister(clkdiv_wire, clk, next_state, left,  right, reset, next_state, RA, RB, RC, LA,LB, LC);
endmodule
