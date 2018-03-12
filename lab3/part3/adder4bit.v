module adder4bit(input [3:0] A, B, input Cin, output [3:0] S, output Cout);
	wire w1, w2, w3;
	fullAdder add1(.a(A[0]), .b(B[0]), .Cin(Cin), .s(S[0]), .Cout(w1));
	fullAdder add2(.a(A[1]), .b(B[1]), .Cin(w1), .s(S[1]), .Cout(w2));
	fullAdder add3(.a(A[2]), .b(B[2]), .Cin(w2), .s(S[2]), .Cout(w3));
	fullAdder add4(.a(A[3]), .b(B[3]), .Cin(w3), .s(S[3]), .Cout(Cout));

endmodule

module fullAdder (input a, b, Cin, output s, Cout);
	assign s = Cin^a^b;
	assign Cout = (a & b)|
				  (Cin & a)|
				  (Cin & b);
endmodule