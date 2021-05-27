//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name: Katrina Gingell
// Date: 27.05.21
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb();

parameter CLK_PERIOD = 10;

reg sel;
reg clka;
wire [23:0]light;
reg rst;
reg button;
reg err;


//CLOCK
initial
begin
clka = 1'b0;
	forever
        #(CLK_PERIOD/2) clka=~clka;
end

initial
begin
//SEL=0 CHECK
sel = 0;
rst = 0;
button = 1;
err = 0;
	forever
	begin
	#(CLK_PERIOD) if (light!=24'hFFFFFF)
		begin
		err=1;
		end
	else
		begin
		err=0;
		end
	end

//RESET CHECK
sel = 1;
rst = 1;
	forever
	begin
	#(CLK_PERIOD) if (light!=0)
		begin
		err=1;
		end
	else
		begin
		err=err;
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

//Instantiating selector top:
selector top(clka, sel, rst, button, light);

endmodule



