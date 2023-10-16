`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student Name: Samuel Fafel
// Create Date: 01/26/2023 12:03:50 PM 
// Module Name: jackpot
//////////////////////////////////////////////////////////////////////////////////

module jackpot(
    input [0:0] clk,
    input [3:0] SWITCHES,
    output reg [3:0] LEDS
    );
    reg [1:0] count;
     always@(posedge clk) begin // Increment count each clock cycle
        if (count == 2'b11)
            count <= 2'b00;
        else
            count <= count + 1;
            
        case (count) // one LED is lit at a time.
            2'b00: LEDS = 4'b0001;
            2'b01: LEDS = 4'b0010;
            2'b10: LEDS = 4'b0100;
            2'b11: LEDS = 4'b1000;
        endcase
        
        if (SWITCHES == LEDS)
            LEDS = 4'b1111; // JACKPOT!!
     end
endmodule






