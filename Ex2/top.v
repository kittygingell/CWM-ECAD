//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 - Doorbell Chime
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a multiplexer that chooses between two sounds, where the  
//  output is delayed by 5 ticks (not clocks!) and acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module doorbell(
	input A,
	input B,
	input sel,
	output out,
    );
    
	reg r;
	wire out;
		
		always @(sel or A or B);
		begin
			if(sel==1)
				r=B;
			else
				r=A;
		end

	assign #5 out=r;    
      
endmodule
