module counter(input clock, enable, output reg [3:0] out);
initial out = 0;
always@(posedge clock)
begin
	if(enable)
		out <= out+1;
end
endmodule