module up_counter(input clock, output reg out, preout);
reg [3:0] count = 4'b0;
always@(posedge clock)
begin
	
	if(count == 4'd15)
		begin
		out <= 1;
		count <= 0;
		preout <= 0;
		end
	else
		begin
		if(count == 4'd12)
			preout <= 1;
		else begin
			preout <=0;
		end
		count <= count+1;
		out <= 0;
		end
end
endmodule