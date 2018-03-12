module x_counter(move, x_in, x_out);
	input move;
	input [7:0] x_in;

	reg direction = 1'b0;	//0 = right, 1 = left

	output reg [7:0] x_out;

	always@(posedge move)
	begin
		if(!direction) begin
			if(x_in >= 8'd156) begin
				direction <= 1'b1;
				x_out <= x_in - 1'b1;
			end
			else begin
				x_out <= x_in + 1'b1;
			end
		end
		else begin
			if(x_in == 8'd0) begin
				direction <= 1'b0;
				x_out <= x_in + 1'b1;
			end
			else begin
				x_out <= x_in - 1'b1;
			end
		end
	end
	
endmodule