module register (input[7:0] D, input Reset_b, Clock, output reg[7:0] q);	
	always @(posedge Clock)
	begin 
		if (Reset_b == 1'b0)
			q <= 0;
		else
			q <= D;
	end	
endmodule