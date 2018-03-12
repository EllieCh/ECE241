module ALU (input [3:0] A, input [7:0] register, input [2:0] key, output reg [7:0] out);
wire [3:0] B;
assign B = register[3:0];

wire [3:0] tempSum;
wire carry;
adder4bit adder(.A(A), .B(B), .Cin(1'b0), .S(tempSum), .Cout(carry)); 

always @(*)
begin
	case(~key)
		3'd0: out = {3'b000, carry, tempSum};
		3'd1: out =  A + B;
		3'd2: out = {A|B, A^B};
		3'd3: out = (A||B)?8'b00011000:8'd0;
		3'd4: out = ((&A)&&(&B))?8'b11100111:8'd0;
		3'd5: out = A * (2**B);	//left shift A by B bits
		3'd6: out = A*B;
		3'd7: out = register;
		default: out = 8'd0;
	endcase
end
endmodule