`timescale 1ns/1ns

module t_FF(input clk, clear, enable, t, output reg Q);	
	always @(posedge clk, negedge clear)
	begin 
		if (!clear)
			Q <= 0;
		else
			Q <= enable^t;
	end	
endmodule