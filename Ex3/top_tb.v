//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name: Katrina Gingell
// Date: 25.05.21
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb();
    
//Set up
parameter CLK_PERIOD = 10;


reg rst;
reg clk;
reg change;
reg on_off;
reg err;
reg [7:0]t;
wire [7:0]counter_out;


//Clock
	initial
	begin
		clk=1'b0;   
		forever
			#(CLK_PERIOD/2) clk=~clk;
	end

//Reset test
	initial begin
	rst=1;
	clk=0;
	change=0;    
	on_off=1;
	err=0;
	t=0;
	
	#(CLK_PERIOD) if (counter_out!= 0)
		begin err=1;
		end
	
	
	


//Change test
	rst = 0; 
	#(CLK_PERIOD) if (counter_out != 0)
		begin err=1;
		end
change = 1;
	forever
	begin
	#(CLK_PERIOD)
	t = on_off?t+1:t-1;
 		if (t!=counter_out)
		begin
		err=1;
		end
	end


//Success check
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

//Instantiate counter module
monitor top(rst,clk,change,on_off,counter_out);

endmodule
