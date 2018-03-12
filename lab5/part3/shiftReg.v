module shiftReg(input[10:0] parLoad, input load, clock, reset, output light);
	
	wire [9:0] w;

	singleBitRotatingRegister r10(.clk(clock), .reset(reset), .loadIn(load), .dataIn(parLoad[0]), .Qin(1'b0), .Q(w[0]));
	singleBitRotatingRegister r9(.clk(clock), .reset(reset), .loadIn(load), .dataIn(parLoad[1]), .Qin(w[0]), .Q(w[1]));
	singleBitRotatingRegister r8(.clk(clock), .reset(reset), .loadIn(load), .dataIn(parLoad[2]), .Qin(w[1]), .Q(w[2]));
	singleBitRotatingRegister r7(.clk(clock), .reset(reset), .loadIn(load), .dataIn(parLoad[3]), .Qin(w[2]), .Q(w[3]));
	singleBitRotatingRegister r6(.clk(clock), .reset(reset), .loadIn(load), .dataIn(parLoad[4]), .Qin(w[3]), .Q(w[4]));
	singleBitRotatingRegister r5(.clk(clock), .reset(reset), .loadIn(load), .dataIn(parLoad[5]), .Qin(w[4]), .Q(w[5]));
	singleBitRotatingRegister r4(.clk(clock), .reset(reset), .loadIn(load), .dataIn(parLoad[6]), .Qin(w[5]), .Q(w[6]));
	singleBitRotatingRegister r3(.clk(clock), .reset(reset), .loadIn(load), .dataIn(parLoad[7]), .Qin(w[6]), .Q(w[7]));
	singleBitRotatingRegister r2(.clk(clock), .reset(reset), .loadIn(load), .dataIn(parLoad[8]), .Qin(w[7]), .Q(w[8]));
	singleBitRotatingRegister r1(.clk(clock), .reset(reset), .loadIn(load), .dataIn(parLoad[9]), .Qin(w[8]), .Q(w[9]));
	singleBitRotatingRegister r0(.clk(clock), .reset(reset), .loadIn(load), .dataIn(parLoad[10]), .Qin(w[9]), .Q(light));
	
endmodule