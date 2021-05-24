//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a counter of active IoT devices, where 
//  if the rst=1, the counter should be set to zero. If event=0, the value
//  should stay constant. If on-off=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, change, on_off
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module monitor (
   	input clk,
	input rst,
	input change,
	input on_off,
	output counter_out[7:0]);
                    
    reg[7:0] t;
	assign counter_out=t;

    always @(posedge clk or posedge rst)
	if(rst)
	t<=0;
	else
		if(change)
		assign t <= on_off?t+1:t-1;
		else t<=t;

      
endmodule
