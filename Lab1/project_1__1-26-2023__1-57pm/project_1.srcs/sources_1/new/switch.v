`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student Name: Samuel Fafel
// Create Date: 01/26/2023 11:08:01 AM
// Module Name: switch
//////////////////////////////////////////////////////////////////////////////////

module switch(
    input [3:0] SWITCHES,   // create input
    output [3:0] LEDS       // create output
    );
    assign LEDS[3:0] = SWITCHES[3:0]; // set output equal to input
endmodule





