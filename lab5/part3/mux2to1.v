module mux2to1(input sel, a, b, output out);
	assign out = sel?b:a;
endmodule