module parLoad(input [1:0] sel, output reg [32:0] out);
always@(*)
begin
	case(sel)
		2'b00: out = 0;
		2'b01: out = 50000000;
		2'b10: out = 100000000;
		2'b11: out = 200000000;
		default: out = 2'bx;
	endcase
end
endmodule
//took 3 zeros off thing to test