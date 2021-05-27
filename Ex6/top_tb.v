//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name: Katrina Gingell
// Date: 27.05.21
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb();

parameter CLK_PERIOD = 10;

reg clka;
reg [2:0]colour;
reg err;
reg ena;
reg [23:0]t;
wire [23:0]rgb;

//CLOCK
initial
begin
clka = 1'b0;
	forever
        #(CLK_PERIOD/2) clka=~clka;
end


//Testing
initial
begin
//Specific value test
ena=1;
err=0;
colour=0;
	forever
	begin
	#(CLK_PERIOD) if (rgb!=0)
		begin
		err=1;
		end
	else
		begin
		err=0;
		end
	end

//Enable test
ena=0;
colour=1;
	forever
	begin
	#(CLK_PERIOD) if (rgb!=0)
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

RGB top(clka, colour, ena, rgb);

endmodule
