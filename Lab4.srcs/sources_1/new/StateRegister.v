`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2023 15:22:52
// Design Name: 
// Module Name: StateRegister
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


module StateRegister(input clkdiv,input clkpwm, input [2:0] state_n, input left, input right, input reset, output [2:0] state_p,output RA,output RB,output RC,output LA,output LB,output LC);

wire right_w, left_w;

RightModule(clkdiv,clkpwm, right_w, right, reset, right_w, RA, RB, RC);
LeftModule(clkdiv,clkpwm, left_w, left, reset, left_w, LA, LB, LC);

endmodule
