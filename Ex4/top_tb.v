//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name: Katrina Gingell	
// Date: 25.05.21
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
);

parameter CLK_PERIOD = 10;

reg clk;
reg rst;
reg button;
reg err;
wire [2:0]colour;

//CLOCK
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end


initial begin
rst=1;
button=0;
err=0;
forever begin
	//Testing reset
	#(CLK_PERIOD) if (colour!=0)
		begin
		err=1;
		end
	
	//Testing case of 0 or 7
	rst=0;
	#(CLK_PERIOD) if (colour==7 | colour==0)
		begin 
		err=1;
		end
	button=1; 
	#(CLK_PERIOD) if (colour==7 | colour==0)
		begin 
		err=1;
		end
	end
end



//Success check
initial begin
#(300*CLK_PERIOD)
	if (err==0) begin
       		$display("PASS");
       		$finish;
	end
	else
 		begin
		$display("FAIL");
		$finish;
	end
end


lighting top(clk,rst,button,colour);

endmodule












