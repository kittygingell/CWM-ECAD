//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name: Katrina Gingell
// Date: 25.05.21
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module lighting(
	input clk,
	input rst,
	input button,
	output reg [2:0]colour);

initial begin
	colour=1;
end

always @(posedge clk)
	begin
	if (rst)
		colour=0;
	else if ((button==1)&&(colour!=7)&&(colour!=6)) //steady loop for 1-5
		colour=colour+1;
	else if ((button==0)&&(colour!=7)&&(colour!=0)) //constant if button is not pressed
			colour=colour;
	else
		colour=1;
	end

endmodule




