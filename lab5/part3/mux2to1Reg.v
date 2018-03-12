`timescale 1ns/1ns
module mux2to1Reg(input sel, clock, a, b, output reg out);
	initial out = 0;
	always@(posedge sel, negedge clock)
	begin
		if((sel == 1))
		begin
			if(out == 1)
				out <= 0;
			else 
				out <= 1;	
		end	
		else if ((sel == 1) && (clock == 1))
			out <= 1;
		else if(!sel)
			out<= 0;
	end
endmodule
