`timescale 1ns / 100ps

module RGB(
	input clka,
	input [2:0]colour,
	input ena,
	output [23:0]rgb);


mybram your_instance_name (
  .clka(clka),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [3 : 0] addra
  .dina(dina),    // input wire [15 : 0] dina
  .douta(douta)  // output wire [15 : 0] douta
);



endmodule
