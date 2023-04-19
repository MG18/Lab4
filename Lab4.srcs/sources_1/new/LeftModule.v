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


module LeftModule(input clk, input [1:0] state_n, input left, input reset, output [1:0] state_p,output LA,output LB,output LC);

reg[1:0] state;
reg LA_w,LB_w,LC_w;


always @(posedge clk, posedge reset)
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
           LA_w <= 1;
           LB_w <= 0; 
           LC_w <= 0; 
           end 
     2'b10: begin
           LA_w <= 1;
           LB_w <= 1; 
           LC_w <= 0; 
           end
     2'b11: begin
           LA_w <= 1;
           LB_w <= 1; 
           LC_w <= 1; 
           end
           
    endcase
end
assign LA = LA_w;
assign LB = LB_w;
assign LC = LC_w;

assign state_p = state;

endmodule