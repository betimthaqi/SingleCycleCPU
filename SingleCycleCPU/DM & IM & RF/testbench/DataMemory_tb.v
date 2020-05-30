`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2020 04:51:56 PM
// Design Name: 
// Module Name: DataMemory_tb
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


module DataMemory_tb(
    );
reg clk;
reg MemWrite, MemRead;
reg[15:0] WriteData;
reg[15:0] AdresaNeHyrje;
wire[15:0] ReadData;
reg[15:0] DataMemory[127:0];

initial $monitor("ReadData=%d, AdresanNeHyrje=%d", ReadData, AdresaNeHyrje);

initial
begin
//lexojme vleren nga memoria ne adresen 12
#0 clk = 1'b0;
#5 AdresaNeHyrje=16'd12; MemRead=1'b1;
#5 clk=1'b1;
#5 clk = 1'b0;
//shkruajme ne memorie ne adresen 15 vleren decimale 200
#5 AdresaNeHyrje=16'd15; MemWrite=1'b1; WriteData=16'd200;
#5 clk=1'b0;
//lexojme vleren e shkruar
#5 AdresaNeHyrje=16'd15; MemRead=1'b1;
#5 clk=1'b1;
#10 $stop;
end 

DataMemory dataMem(AdresaNeHyrje, WriteData, MemWrite, MemRead, clk, ReadData);
endmodule
