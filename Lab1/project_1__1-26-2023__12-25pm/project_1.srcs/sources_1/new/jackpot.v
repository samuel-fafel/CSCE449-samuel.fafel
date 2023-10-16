`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2023 12:03:50 PM
// Design Name: 
// Module Name: jackpot
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


module jackpot(
    input [0:0] CLOCK,
    input Reset,
    input [3:0] SWITCHES,
    output [3:0] LEDS
    );
    reg [3:0] count;
     always@(posedge CLOCK)
       begin
           count = count + 1;
           /*
           if(SWITCHES[0] && LEDS[0]) // switches landed on LED
               LEDS = 1111;
           if(SWITCHES[1] && LEDS[1])
               LEDS = 1111;
           if(SWITCHES[2] && LEDS[2])
               LEDS = 1111;
           if(SWITCHES[3] && LEDS[3])
               LEDS = 1111;   
           */        
       end
     assign LEDS[3:0] = count[3:0];
endmodule
