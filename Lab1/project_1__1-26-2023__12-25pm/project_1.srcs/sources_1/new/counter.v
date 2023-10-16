`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2023 11:33:15 AM
// Design Name: 
// Module Name: counter
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


module counter(
    input wire CLOCK,
    input Reset, //BTN3
    input BTN0,
    input BTN1,
    output wire [3:0] LEDS
    );
    
    reg [26:0] count;
    
    always@(posedge CLOCK)
    begin
        if(BTN0)
            count <= count + 1;
        if(BTN1)
            count <= count - 1;
        if(BTN3)
            count = count - count;
    end
    assign LEDS = count[26:23];
endmodule
