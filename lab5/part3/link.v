`timescale 1ps/1ps

module link(SW, KEY, CLOCK_50, LEDR);
	input [2:0] SW;
	input [1:0] KEY;
	input CLOCK_50;
	output [9:0] LEDR;

	wire [10:0] letter;
	wire pulse;
	wire zero;

	mux2to1Reg m1(.sel(~KEY[1]), .clock(pulse), .a(1'b0), .b(1'b1), .out(zero));


	select s1(.sel(SW), .out(letter));
	downCounter c1(.clock(CLOCK_50), .out(pulse));
	shiftReg r1(.parLoad(letter), .load(zero), .clock(pulse), .reset(~KEY[0]), .light(LEDR[0]));
endmodule