`timescale 1ns / 100ps

//Defining the module

module doorbell(
	input a,
	input b,
	input sel,
	output out);
 
//Registers and wires
  
	wire out;
	
//Logic
			
	assign #5 out = sel?b:a;
      
endmodule
