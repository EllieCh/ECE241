`timescale 1ps/1ps

module link(SW, HEX0, CLOCK_50);
	input [1:0]SW;
	input CLOCK_50;
	output [6:0] HEX0;
	wire [3:0] display;

	wire enable;
	wire [32:0] downCountOut, downCountIn;

	parLoad par1(.sel(SW), .out(downCountIn));
	downCounter d1(.d(downCountIn), .clock(CLOCK_50), .out(downCountOut));
	norGate g1(.in(downCountOut), .enable(enable));
	counter out(.clock(CLOCK_50), .enable(enable), .out(display));
	seg7 u0(.i(display), .hex(HEX0));

endmodule