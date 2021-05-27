//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name: Katrina Gingell
// Date: 27.05.21
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module selector(
	input clka,
	input sel,
	input rst,
	input button,
	output [23:0]light);

wire [2:0]colour;
wire [23:0]rgb;
wire [23:0]white;
wire ena;

assign white=24'hFFFFFF;
assign ena=1;
lighting lighting(.rst (rst), .clk (clka), .button (button), .colour (colour));
RGB RGB(.clka (clka), .colour (colour), .ena (ena), .rgb (rgb));
doorbell doorbell(.a (white), .b (rgb), .sel (sel), .out (light));

endmodule





	
