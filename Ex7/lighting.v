`timescale 1ns / 100ps

module lighting(
	input rst,
	input clk,
	input button,
	output reg [2:0]colour);

initial begin
	colour=1;
end

always @(posedge clk)
	begin
	if (rst)
		colour=0;
	else if ((button==1)&&(colour!=7)&&(colour!=6)) //steady loop for 1-5
		colour=colour+1;
	else if ((button==0)&&(colour!=7)&&(colour!=0)) //constant if button is not pressed
			colour<=colour;
	else
		colour=1;
	end

endmodule

