`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2023 18:51:47
// Design Name: 
// Module Name: PWM
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


module Pwm(input clk, input [1:0]dim, input reset, output out);

reg [4:0] counter;
reg [4:0] width;
reg out2; 


initial begin
    counter = 0;
    width = 0;
    out2 = 0;
end

always@(posedge clk) begin
    if(reset)
    counter <= 0;  
    
    else
    counter <= counter + 1; 
    
    if (counter < width)
    out2 <= 1;
    
    else
    out2 <= 0;
         
end 

always @ (*) begin

case(dim)
    2'b00 : width = 5'd0;
    2'b01 : width = 5'd8;
    2'b10 : width = 5'd16;
    2'b11 : width = 5'd24;
    default : width = 5'd0;

endcase
end

assign out = out2;

endmodule
