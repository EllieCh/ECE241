`timescale 1ns/1ns

module part1(SW, KEY, HEX0, HEX2, HEX4, HEX5);
	input [9:0] SW;
	input [4:0] KEY;
	output [6:0] HEX0, HEX2, HEX4, HEX5;

	wire [3:0] data_out;

	ram32x4 ram1(.address(SW[8:4]), .clock(KEY[0]), .data(SW[3:0]), .wren(SW[9]), .q(data_out));

	seg7 disp0(.i(data_out), .hex(HEX0));
	seg7 disp2(.i(SW[3:0]), .hex(HEX2));
	seg7 disp4(.i(SW[7:4]), .hex(HEX4));
	seg7 disp5(.i({3'b0, SW[8]}), .hex(HEX5));

endmodule
