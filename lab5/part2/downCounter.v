module downCounter(input clock, output reg out);
reg [19:0] count;
always@(posedge clock)
begin
	if(count == 25'd833_333)
		begin
		out <= 1;
		count <= 0;
		end
	else
		begin
		count <= count+1;
		out <= 0;
		end;
end
endmodule