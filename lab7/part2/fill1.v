// Part 2 skeleton

module fill
	(
		CLOCK_50,						//	On Board 50 MHz
		// Your inputs and outputs here
		SW,
		KEY,
		//LEDR,
		// The ports below are for the VGA output.  Do not change.
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK_N,						//	VGA BLANK
		VGA_SYNC_N,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B   						//	VGA Blue[9:0]
	);

	input			CLOCK_50;				//	50 MHz
	// Declare your inputs and outputs here
	input [9:0] SW;
	input [3:0] KEY;
	// Do not change the following outputs
	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK_N;				//	VGA BLANK
	output			VGA_SYNC_N;				//	VGA SYNC
	output	[9:0]	VGA_R;   				//	VGA Red[9:0]
	output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
	output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
	//output  [9:0]   LEDR;
	
	wire resetn;
	assign resetn = KEY[0];
	
	// Create the colour, x, y and writeEn wires that are inputs to the controller.

	wire [2:0] colour;
	wire [7:0] x;
	wire [6:0] y;
	wire writeEn;

	wire ld_x, ld_y, ld_colour;

	// Create an Instance of a VGA controller - there can be only one!
	// Define the number of colours as well as the initial background
	// image file (.MIF) for the controller.
	// vga_adapter VGA(
	// 		.resetn(resetn),
	// 		.clock(CLOCK_50),
	// 		.colour(colour),
	// 		.x(x),
	// 		.y(y),
	// 		.plot(writeEn),
	// 		/* Signals for the DAC to drive the monitor. */
	// 		.VGA_R(VGA_R),
	// 		.VGA_G(VGA_G),
	// 		.VGA_B(VGA_B),
	// 		.VGA_HS(VGA_HS),
	// 		.VGA_VS(VGA_VS),
	// 		.VGA_BLANK(VGA_BLANK_N),
	// 		.VGA_SYNC(VGA_SYNC_N),
	// 		.VGA_CLK(VGA_CLK));
	// 	defparam VGA.RESOLUTION = "160x120";
	// 	defparam VGA.MONOCHROME = "FALSE";
	// 	defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
	// 	defparam VGA.BACKGROUND_IMAGE = "black.mif";

	// Put your code here. Your code should produce signals x,y,colour and writeEn
	// for the VGA controller, in addition to any other functionality your design may require.
	control c1(
		.go(KEY[3]), 
		.plot(KEY[1]), 
		.reset(resetn), 
		.clock(CLOCK_50), 
		.ld_x(ld_x), 
		.ld_y(ld_y), 
		.ld_colour(ld_colour), 
		.writeEn(writeEn)
		);

	datapath d1(
		.clock(CLOCK_50), 
		.reset(resetn), 
		.ld_x(ld_x), 
		.ld_y(ld_y), 
		.ld_colour(ld_colour), 
		.data_in(SW[9:0]), 
		.x(X), 
		.y(Y), 
		.colour(colour)
		);
	
endmodule

module control(go, plot, reset, clock, ld_x, ld_y, ld_colour, writeEn);
	input go, plot, clock, reset;
	output reg ld_x, ld_y, ld_colour, writeEn;

	reg [2:0] current_state, next_state;

	localparam	S_LOAD_X 		= 3'd0,
				S_LOAD_X_WAIT   = 3'd1,
				S_LOAD_Y		= 3'd2,
				S_LOAD_Y_WAIT 	= 3'd3,
				S_LOAD_COLOUR 	= 3'd4,
				S_PLOT 			= 3'd5;

	always@(*)
	begin: state_table
		case(current_state)
			S_LOAD_X: next_state = go ? S_LOAD_X : S_LOAD_X_WAIT;
			S_LOAD_X_WAIT: next_state = go ? S_LOAD_Y : S_LOAD_X_WAIT;
			S_LOAD_Y: next_state = go ? S_LOAD_Y : S_LOAD_Y_WAIT;
			S_LOAD_Y_WAIT: next_state = go ? S_LOAD_COLOUR : S_LOAD_Y_WAIT;
			S_LOAD_COLOUR: next_state = plot ? S_LOAD_COLOUR : S_PLOT;
			S_PLOT: next_state = go ? S_LOAD_X : S_PLOT;
			default: next_state = S_LOAD_X;
		endcase
	end

	always@(*)
	begin: enable_signals
		ld_x = 1'b0;
		ld_y = 1'b0;
		ld_colour = 1'b0;
		writeEn = 1'b0;

		case(current_state)
			S_LOAD_X:
			begin
				ld_x = 1;
			end
			S_LOAD_X_WAIT:
			begin
				
			end
			S_LOAD_Y:
			begin
				ld_y = 1;
			end
			S_LOAD_Y_WAIT:
			begin
				
			end
			S_LOAD_COLOUR:
			begin
				ld_colour = 1;
			end
			S_PLOT:
			begin
				writeEn = 1;
			end
		endcase
	end

	always@(posedge clock)
    begin: state_FFs
        if(!reset)
            current_state <= S_LOAD_X;
		  else 
            current_state <= next_state; 
    end
endmodule

module datapath(clock, reset, ld_x, ld_y, ld_colour, data_in, x, y, colour);
	input clock, reset, ld_x, ld_y, ld_colour;
	input [9:0] data_in;

	output reg [7:0] x;
	output reg [6:0] y;
	output reg [2:0] colour;

	always@(posedge clock)
	begin
		if(!reset)
		begin
			x <= 8'b0;
			y <= 7'b0;
			colour <= 3'b0;
		end
		else begin
			if(ld_x)
			begin
				x <= {1'b0, data_in[6:0]};
			end
			if(ld_y)
			begin
				y <= data_in[6:0];
			end
			if(ld_colour)
			begin
				colour <= data_in[9:7];
			end
		end
	end
endmodule








