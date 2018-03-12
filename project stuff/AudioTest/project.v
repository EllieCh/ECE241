`timescale 1 ps / 1 ps
module Project(
	input [3:0] KEY,
	input [9:0] SW,
	input CLOCK_50,
	input AUD_ADCDAT,  // external_interface.ADCDAT
	input AUD_ADCLRCK, //ADCLRCK
	input AUD_BCLK,
	input AUD_DACLRCK,

	output [9:0] LEDR,
	output [6:0] HEX0, HEX1, HEX2, HEX3
	);


	AudioConfig aud_conf(
		.clk         (CLOCK_50),         //                    clk.clk
		.reset       (reset),       //                  reset.reset
		.address     (address),     // avalon_av_config_slave.address
		.byteenable  (write),  //                       .byteenable
		.read        (read),        //                       .read
		.write       (write),       //                       .write
		.writedata   (writedata),   //                       .writedata
		.readdata    (readdata),    //                       .readdata
		.waitrequest (LEDR[5]), //                       .waitrequest
		.I2C_SDAT    (I2C_SDAT),    //     external_interface.export
		.I2C_SCLK    (I2C_SCLK)     //                       .export

		);

	wire reset;
	assign reset = !KEY[0];
	assign LEDR[0] = reset;

	wire [1:0] address = SW[1:0];

	wire read, write; 

	assign read = SW[2];
	assign write = SW[3];

	assign LEDR[4:3] = address;

	wire[31:0] writedata, readdata;
	assign writedata = readdata;
	assign LEDR[9:6] = writedata[12:9];	
	seg7 seg1(readdata[3:0], HEX0);
	seg7 seg2(readdata[7:4], HEX1);
	seg7 seg3(readdata[11:8], HEX2);
	seg7 seg4(readdata[15:12], HEX3);


	
	wire chipselect;
	assign chipselect = 1;

	AudioIO in_out(
		.clk         (CLOCK_50),    //                clk.clk
		.reset       (reset),       //              reset.reset
		.address     (address),     // avalon_audio_slave.address
		.chipselect  (chipselect),  //                   .chipselect
		.read        (read),        //                   .read
		.write       (write),       //                   .write
		.writedata   (writedata),   //                   .writedata
		.readdata    (readdata),    //                   .readdata
		.irq         (LEDR[1]),         //          interrupt.irq
		.AUD_ADCDAT  (AUD_ADCDAT),  // external_interface.export
		.AUD_ADCLRCK (AUD_ADCLRCK), //                   .export
		.AUD_BCLK    (AUD_BCLK),    //                   .export
		.AUD_DACDAT  (LEDR[2]),  //                   	 .export
		.AUD_DACLRCK (AUD_DACLRCK)
		);

endmodule