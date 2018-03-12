module select(input[2:0] sel, output reg [10:0] out);
	always@(*)
	begin
		case(sel)
		3'd0: out = 11'b10111000000;
		3'd1: out = 11'b11101010100;
		3'd2: out = 11'b11101011101;
		3'd3: out = 11'b11101010000;
		3'd4: out = 11'b10000000000;
		3'd5: out = 11'b10101110100;
		3'd6: out = 11'b11101110100;
		3'd7: out = 11'b10101010000;
		default: out = 11'b0;
		endcase
	end
endmodule