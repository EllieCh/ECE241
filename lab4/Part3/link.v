`timescale 1ns/1ns

module link(SW, KEY, LEDR);
	input [9:0] SW;
	input [3:0] KEY;
	output [7:0] LEDR;

	rotatingRegister r1(
						.clock(KEY[0]),
						.reset(SW[9]),
						.parallelLoadIn(KEY[1]),
						.rotateRight(KEY[2]),
						.ASright(KEY[3]),
						.dataIn(SW[7:0]),
						.Q(LEDR[7:0])
					   );
	
endmodule