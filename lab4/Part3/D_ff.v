module D_ff (input D, reset, clk, output reg Q);	
	always @(posedge clk)
	begin 
		if (reset == 1'b1)
			Q <= 0;
		else
			Q <= D;
	end	
endmodule