//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name: Katrina Gingell
// Date: 26.05.21
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module ac(
	input clk, 
	input [4:0]temperature,
	output reg heating, 
	output reg cooling);

always @(posedge clk)
	begin
	//cooling
	if (temperature>22)
		begin
		cooling<=1;
		end
	else if (temperature<=20)
		begin
		cooling<=0;
		end
	else 
		begin
		cooling<=cooling;
		end

	//heating
	if (temperature<18)
		begin
		heating<=1;
		end
	else if (temperature>=20)
		begin
		heating<=0;
		end
	else 
		begin
		heating<=heating;
		end
	end
endmodule
	
