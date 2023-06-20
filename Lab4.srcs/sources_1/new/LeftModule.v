`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2023 18:57:24
// Design Name: 
// Module Name: LeftModule
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


module LeftModule(input clkdiv, input clkpwm,  input [1:0] state_n, input left, input reset, output [1:0] state_p,output LA,output LB,output LC);

reg[1:0] state;
reg [3:0] LA_w = 4'b0;
reg [3:0] LB_w = 4'b0;
reg [3:0] LC_w = 4'b0;

//reg[3:0] brightness;

Pwm(clkpwm, LA_w, LA);
Pwm(clkpwm, LB_w, LB);
//Pwm(clkpwm, LC_w, LC);


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
        if (left) state <= 2'b01;
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
           LA_w <= 0;
           LB_w <= 0; 
           LC_w <= 0; 
           end 
     2'b01: begin
           //PWM(clkpwm, 3, reset, pwmwire);
           //brightness <= 4'b0001;
           LA_w <= 4'b0100;
           LB_w <= 0; 
           LC_w <= 0; 
           end 
     2'b10: begin
           //PWM(clkpwm, 2, reset, pwmwire);
           //brightness <= 4'b0100;
           LA_w <= 4'b0100;
           LB_w <= 4'b1100; 
           LC_w <= 0; 
           end
     2'b11: begin
           //PWM(clkpwm, 1, reset, pwmwire);
           //brightness <= 4'b1110;
           LA_w <= 4'b0100;
           LB_w <= 4'b1100; 
           LC_w <= 1; 
           end
           
    endcase
end
/*assign LA = LA_w;
assign LB = LB_w;*/
assign LC = LC_w;

assign state_p = state;

endmodule
