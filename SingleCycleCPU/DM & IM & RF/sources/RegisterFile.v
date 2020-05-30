`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2020 01:49:36 PM
// Design Name: 
// Module Name: RegisterFile
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RegisterFile(input RS, input RT, input RD, input WD, input we, 
input clk, output RD1, output RD2);

//8 regjistra 16 bitesh
reg[15:0] Registers[7:0];
//hyrja per RS 3 biteshe per percaktim te regjistrit
wire[2:0] RS;
wire[2:0] RT;
wire[2:0] RD;
//Te dhenat per tu shkruar ne RegisterFile
wire[15:0] WD;
//WriteEnable
wire we;
//Clock
wire clk;
//Dy daljet e Register File ReadData1 dhe ReadData2
wire[15:0] RD1;
wire[15:0] RD2;

always @ (posedge clk)
begin
if(we)
    Registers[RD] = WD;
end

assign RD1 = Registers[RS];
assign RD2 = Registers[RT];

endmodule
