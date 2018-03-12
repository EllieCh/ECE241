`timescale 1ns/1ns

module link(SW, KEY, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	input [9:0] SW;
	input [3:0] KEY;
	output [7:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	reg [3:0] zero = 4'b0000;
	wire [7:0] aluOut, regOut;
	//wire [3:0] aluOut1, aluOut2, regOut1, regOut2;
	
	ALU main(
		.A(SW[3:0]),
		.register(regOut),
		.key(KEY[3:1]),
		.out(aluOut)
	);
		
	//assign {aluOut1, aluOut2} = aluOut;
	assign LEDR = regOut;
	
	register reg1(
		.D(aluOut),
		.Reset_b(SW[9]),
		.Clock(KEY[0]),
		.q(regOut)
	);
	
	seg7 hex0(
		.i(SW[3:0]),
		.hex(HEX0)
	);
	seg7 hex1(
		.i(zero),
		.hex(HEX1)
	);
	seg7 hex2(
		.i(zero),
		.hex(HEX2)
	);
	seg7 hex3(
		.i(zero),
		.hex(HEX3)
	);
	seg7 hex4(
		.i(regOut[3:0]),
		.hex(HEX4)
	);
	seg7 hex5(
		.i(regOut[7:4]),
		.hex(HEX5)
	);
endmodule