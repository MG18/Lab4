`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2023 18:57:10
// Design Name: 
// Module Name: RightModule
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


module RightModule(input clkdiv,input clkpwm,  input [1:0] state_n, input right, input reset, output [1:0] state_p,output RA,output RB,output RC);

reg[1:0] state;
reg RA_w,RB_w,RC_w;
wire pwmwire;


always @(posedge clkdiv, posedge reset)
begin
state <= state_n;
if (reset)
state <= 2'b00;
else
    begin
    case (state) 
    2'b00:
        begin
        if (right) state <= 2'b01;
        else state <= 2'b00;
        end
    2'b01: state <= 2'b10;
    2'b10: state <= 2'b11;
    2'b11: state <= 2'b00;
    
    endcase
    end
end

always @*
begin
    case (state) 
    2'b00: begin
           RA_w <= 0;
           RB_w <= 0; 
           RC_w <= 0; 
           end 
     2'b01: begin
           Pwm(clkpwm, 3, reset, pwmwire);
           RA_w <= pwmwire;
           RB_w <= 0; 
           RC_w <= 0; 
           end 
     2'b10: begin
           Pwm(clkpwm, 2, reset, pwmwire);
           RA_w <= pwmwire;
           RB_w <= pwmwire; 
           RC_w <= 0; 
           end
     2'b11: begin
           Pwm(clkpwm, 1, reset, pwmwire);
           RA_w <= pwmwire;
           RB_w <= pwmwire; 
           RC_w <= pwmwire; 
           end
           
    endcase
end
assign RA = RA_w;
assign RB = RB_w;
assign RC = RC_w;

assign state_p = state;

endmodule
