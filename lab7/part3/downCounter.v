module downCounter(input clock, output reg out);
reg [19:0] count = 20'b0;
always@(posedge clock)
begin
	if(count == 20'd60)//833_333)
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