module y_counter(move, y_in, y_out);
	input move;
	input [6:0] y_in;

	reg direction = 1'b0;	//0 = down, 1 = up

	output reg [6:0] y_out;

	always@(posedge move)
	begin
		if(!direction) begin
			if(y_in >= 7'd116) begin
				direction <= 1'b1;
				y_out <= y_in - 1'b1;
			end
			else begin
				y_out <= y_in + 1'b1;
			end
		end
		else begin
			if(y_in == 7'd0) begin
				direction <= 1'b0;
				y_out <= y_in + 1'b1;
			end
			else begin
				y_out <= y_in - 1'b1;
			end
		end
	end
	
endmodule