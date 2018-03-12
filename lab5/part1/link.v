`timescale 1ns/1ns

module link(KEY, SW, HEX0, HEX1);
	input KEY;
	input [1:0]SW;
	output [6:0] HEX0, HEX1;
	wire [7:0] out;

	eightBitCounter counter(.enable(SW[1]), .clock(KEY), .clear(SW[0]), .Q(out));

	seg7 u0(.i(out[3:0]), .hex(HEX0));
	seg7 u1(.i(out[7:4]), .hex(HEX1));

endmodule