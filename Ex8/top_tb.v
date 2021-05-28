//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name: Katrina Gingell
// Date: 28.05.21
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps
module top_tb(

    );

      //Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    reg clk_p;
    wire clk_n;
    reg err;
    reg rst;
    reg [4:0] temperature;
    wire heating;
    wire cooling;
    reg t;



//CLOCK
    initial
    begin
       clk_p = 1'b0;
       forever
         #(CLK_PERIOD/2) clk_p=~clk_p;
     end

    assign clk_n(=~clk_p);

//Logic
initial begin
	temperature=0;
	err=0;
	t=1;   
	rst=1;
	#(CLK_PERIOD)
	//Check reset
	if (clk_n!=0)
		begin
			err=1;
		end
	else
		begin
			err=0;
		end
	rst=0;
	forever begin
	#(CLK_PERIOD)
	if (((cooling) && (temperature<=20))||((!cooling)&&(temperature>=22)))
		begin
			err=1;
		end
		else
		begin
			err<=err;
		end
	if (((heating) && (temperature>=20))||((!heating)&&(temperature<=18)))
		begin
			err=1;
		end
		else
		begin
			err<=err;
		end
	forever begin
        #(CLK_PERIOD)
	       t=(temperature==1)?1:(temperature==31)?0:t;
	       temperature=t?temperature+1:temperature-1;
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


top test(.clk_p(clk_p),.clk_n(clk_n),.rst_n(rst),.temperature_0(temperature[0]),.temperature_1(temperature[1]),.temperature_2(temperature[2]),.temperature_3(temperature[3]),.temperature_4(temperature[4]),.heating(heating),.cooling(cooling));


endmodule
