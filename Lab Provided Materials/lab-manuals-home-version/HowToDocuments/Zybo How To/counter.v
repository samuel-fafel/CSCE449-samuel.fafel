`timescale 1ns / 1ps
module counter(
	/* Define inputs and outputs to the module */
    input wire clk,
    output reg [3:0] count
    );
    /* Every time the clk input rises, add one to count */
    always@(posedge clk)
    begin
        count = count + 1;
    end
	/* This initial block will run before any other code, 
	and initializes count to zero, for the purposes of simulation */
    initial 
    begin
        count <= 0;
    end
endmodule
