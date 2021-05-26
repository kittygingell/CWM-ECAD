//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name: Katrina Gingell
// Date: 26.05.21
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb();

parameter CLK_PERIOD = 10;

reg clk;
reg err;
wire heating;
wire cooling;
reg [4:0]temperature;

//CLOCK
initial
begin
clk = 1'b0;
	forever
        #(CLK_PERIOD/2) clk=~clk;
end


initial
begin
//Low temperature test
temperature = 17;

forever begin
	#(CLK_PERIOD) if ((cooling==1&&temperature<20)||(heating==1&&temperature>20))
		begin err=1;
		end
		else
		begin err=0;
		end
end

//High temperature test
temperature = 23;	
forever begin
	#(CLK_PERIOD) if ((heating==1&&temperature>20)||(cooling==1&&temperature<20)) 
		begin err=1;
		end
		else
		begin err=0;
		end

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


ac top(clk,temperature,heating,cooling);

endmodule




