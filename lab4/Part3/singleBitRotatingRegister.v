`timescale 1ns/1ns

module singleBitRotatingRegister(input clk, reset, loadIn, rotateRight, dataIn, Qleft, Qright, output Q);
	wire w1, Win;

	mux2to1 rotate  (.sel(rotateRight), .a(Qleft), .b(Qright), .out(w1));
	mux2to1 load    (.sel(loadIn), .a(w1), .b(dataIn), .out(Win));

	D_ff flipflop(.D(Win), .reset(reset), .clk(clk), .Q(Q));
endmodule