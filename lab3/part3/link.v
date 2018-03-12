`timescale 1ns/1ns

module link(SW, KEY, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	input [7:0] SW;
	input [2:0] KEY;
	output [7:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	reg [3:0] zero = 4'b0000;
	
	wire [7:0] w8;
	wire [3:0] w1, w2;
	
	ALU main(
		.A(SW[7:4]),
		.B(SW[3:0]),
		.key(KEY),
		.ALUout(w8)
	);
	
	assign LEDR = w8;
	assign {w1, w2} = w8;	
	
	seg7 hex0(
		.i(SW[3:0]),
		.hex(HEX0)
	);
	seg7 hex1(
		.i(zero),
		.hex(HEX1)
	);
	seg7 hex2(
		.i(SW[7:4]),
		.hex(HEX2)
	);
	seg7 hex3(
		.i(zero),
		.hex(HEX3)
	);
	seg7 hex4(
		.i(w2),
		.hex(HEX4)
	);
	seg7 hex5(
		.i(w1),
		.hex(HEX5)
	);
endmodule