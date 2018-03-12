module downCounter(input clock, output reg out);
reg [24:0] count = 0;
always@(posedge clock)
begin
	if(count >= 25'd24999999)
		begin
		out <= 1;
		count <= 0;
		end
	else
		begin
		count <= count+1;
		out <= 0;
		end
end
endmodule