`timescale 1ns / 1ps
module counter(
    input wire clk,
    input wire btn0,   /* We will connect btn0 to a push button port */
    output wire [3:0] leds
    );
    
    reg [26:0] count;
    /* As long as bttn1 is high, our counter will count.
    Whenever bttn1 goes low, the counter starts over. */
    always@(posedge clk)
    begin
        if(btn0)
            count <= count + 1;
        else
            count <= 0;
    end
    
    assign leds = count[26:23];
    
    /* We no longer need our initial block. In fact,
    this would not synthesize even if we tried. */
endmodule