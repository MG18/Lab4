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


module StateRegister(input clk, input [1:0] state_n, input left, input right, input reset, output [1:0] state_p,output RA,output RB,output RC,output LA,output LB,output LC);

reg[1:0] state;
reg RA_w,RB_w,RC_w,LA_w,LB_w,LC_w;


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
        if (right) state <= 2'b01;
        
        //if (left) state <= 2'b101;
        else state <= 2'b00;
        end
    2'b01: state <= 2'b10;
    2'b10: state <= 2'b11;
    2'b11: state <= 2'b00;
    
    /*2'b101: state <= 2'b110;
    2'b110: state <= 2'b111;
    2'b111: state <= 2'b000;*/
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
           RA_w <= 1;
           RB_w <= 0; 
           RC_w <= 0; 
           end 
     2'b10: begin
           RA_w <= 1;
           RB_w <= 1; 
           RC_w <= 0; 
           end
     2'b11: begin
           RA_w <= 1;
           RB_w <= 1; 
           RC_w <= 1; 
           end
           

     /*2'b101: begin
           LA_w <= 1;
           LB_w <= 0; 
           LC_w <= 0; 
           end 
     2'b110: begin
           LA_w <= 1;
           LB_w <= 1; 
           LC_w <= 0; 
           end
     2'b111: begin
           LA_w <= 1;
           LB_w <= 1; 
           LC_w <= 1; 
           end*/
           
    endcase
end
assign RA = RA_w;
assign RB = RB_w;
assign RC = RC_w;

/*assign LA = LA_w;
assign LB = LB_w;
assign LC = LC_w;*/

assign state_p = state;

endmodule
