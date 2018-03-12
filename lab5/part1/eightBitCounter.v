`timescale 1ns/1ns

module eightBitCounter(input enable, clock, clear, output [7:0] Q);
	wire [6:0] w;

	t_FF t0(.clk(clock), .clear(clear), .enable(enable), .t(Q[0]), .Q(Q[0]));

	andGate a0(.a(enable), .b(Q[0]), .d(w[0]));
	t_FF t1(.clk(clock), .clear(clear), .enable(w[0]), .t(Q[1]), .Q(Q[1]));

	andGate a1(.a(w[0]), .b(Q[1]), .d(w[1]));
	t_FF t2(.clk(clock), .clear(clear), .enable(w[1]), .t(Q[2]), .Q(Q[2]));

	andGate a2(.a(w[1]), .b(Q[2]), .d(w[2]));
	t_FF t3(.clk(clock), .clear(clear), .enable(w[2]), .t(Q[3]), .Q(Q[3]));

	andGate a3(.a(w[2]), .b(Q[3]), .d(w[3]));
	t_FF t4(.clk(clock), .clear(clear), .enable(w[3]), .t(Q[4]), .Q(Q[4]));

	andGate a4(.a(w[3]), .b(Q[4]), .d(w[4]));
	t_FF t5(.clk(clock), .clear(clear), .enable(w[4]), .t(Q[5]), .Q(Q[5]));

	andGate a5(.a(w[4]), .b(Q[5]), .d(w[5]));
	t_FF t6(.clk(clock), .clear(clear), .enable(w[5]), .t(Q[6]), .Q(Q[6]));

	andGate a6(.a(w[5]), .b(Q[6]), .d(w[6]));
	t_FF t7(.clk(clock), .clear(clear), .enable(w[6]), .t(Q[7]), .Q(Q[7]));

endmodule