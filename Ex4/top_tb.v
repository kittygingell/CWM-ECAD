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
reg [2:0]t;
wire [2:0]colour;

//CLOCK
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end


initial begin
rst=0;
button=0;
err=0;
	
	//Testing case of 0 or 7
	#(CLK_PERIOD) if (colour==7 || colour==0)
		begin 
		$display("FAILED 0or7buttonoff");
		$finish;
		err=1;
		end
	button=1; 
	#(CLK_PERIOD) if (colour==7 || colour==0)
		begin 
		$display("FAILED 0or7buttonon");
		$finish;
		err=1;
		end
	//Testing change
	button=1;
	t=colour;
	#(2*CLK_PERIOD) if (colour==t)
		begin 
		$display("FAILED change");
		$finish;
		err=1;
		end

end



//Success check
initial begin
#(3*CLK_PERIOD)
	if (err==0) begin
       		$display("PASSED");
       		$finish;
	end
	else
 		begin
		$display("FAILED");
		$finish;
	end
end


lighting top(clk,rst,button,colour);

endmodule












