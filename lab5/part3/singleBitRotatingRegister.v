`timescale 1ns/1ns

module singleBitRotatingRegister(input clk, reset, loadIn, dataIn, Qin, output Q);
	wire Win;

	mux2to1 load(.sel(loadIn), .a(Qin), .b(dataIn), .out(Win));

	D_ff flipflop(.D(Win), .reset(reset), .clk(clk), .Q(Q));

endmodule