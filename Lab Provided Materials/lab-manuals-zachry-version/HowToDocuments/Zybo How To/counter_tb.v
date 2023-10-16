`timescale 1ns / 1ps   /* Timestep is 1ns */
`default_nettype none
module counter_tb;

	reg clk;   			/* Input */
	wire [3:0] count;   /* Output */

	/* Instantiate the Unit Under Test (UUT) */
	counter uut (
		.clk(clk), 
		.count(count)
	);

	/*generate 100MHz Clk signal*/
	always
		#10 clk <= ~clk;   /* #10 causes 10-timestep delay between each execution of the line */
	
	initial begin
		clk = 0;   /* Initialize Inputs */
		#20;       /* Every 20ns is one clock cycle */
		if(count != 1)
		  $display("Error: Count does not equal 1!");
		else
		  $display("Test 1 passed!");
		#20;
		if(count != 2)
		  $display("Error: Count does not equal 2!");
		else
		  $display("Test 2 passed!");
		#20;
		if(count != 3)
		  $display("Error: Count does not equal 3!");
		else
		  $display("Test 3 passed!");
        $stop;   /* When we are done, let's stop the simulation */
	end   
endmodule


