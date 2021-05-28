`timescale 1ns / 100ps

module aircon(
	input clk, 
	input [4:0]temperature,
	output reg heating, 
	output reg cooling);

always @(posedge clk)
	begin
	//cooling
	if (temperature>22)
		begin
		cooling<=1;
		end
	else if (temperature<=20)
		begin
		cooling<=0;
		end
	else 
		begin
		cooling<=cooling;
		end

	//heating
	if (temperature<18)
		begin
		heating<=1;
		end
	else if (temperature>=20)
		begin
		heating<=0;
		end
	else 
		begin
		heating<=heating;
		end
	end
endmodule
