`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Student Name: Samuel Fafel
// Create Date: 01/26/2023 11:33:15 AM 
// Module Name: counter
//////////////////////////////////////////////////////////////////////////////////

module counter(
    input wire clk,
    input BTN3, // Reset
    input BTN0, // Increment
    input BTN1, // Decrement
    output wire [3:0] LEDS
    );
    reg [3:0] count;
    
    always@(posedge clk)
    begin
        if (BTN3) begin
            count <= 4'b0000; // reset
            end
        else if (BTN0) begin
            count <= count + 1; // increment
            end
        else if (BTN1) begin
            count <= count - 1; // decrement
            end
    end
    
    assign LEDS = count[3:0];
endmodule





