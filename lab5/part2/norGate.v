module norGate(input[32:0] in, output reg enable);
always@(*)
begin
	if(in == 0)
	enable <= 1;
	else
		enable <= 0;
end
endmodule