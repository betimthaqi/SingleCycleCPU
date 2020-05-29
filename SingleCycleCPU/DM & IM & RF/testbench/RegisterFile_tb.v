`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2020 02:06:00 PM
// Module Name: RegisterFile_tb
// Project Name: Single-Cycle CPU
// Members: Aurel, Betim, Durajet.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RegisterFile_tb(

    );
reg[2:0] RS;
reg[2:0] RT;
reg[2:0] RD;
reg[15:0] WD;
reg we;
reg clk;
wire[15:0] RD1;
wire[15:0] RD2;    
//wire[31:0] Registers[31:0];
    
initial $monitor("RS=%d, RT=%d, RD=%d", RS, RT, RD);

initial
begin
//clock-u 0; vendosim vlerat per RD, te dhenat ne WD dhe WriteEnable=1; shkruajme ne regjistrin 5
#10 clk=0; 
    RD=3'd5; WD=16'd100; we=1'b1;
//Te dhenat e mesiperme shkruhen ne tehun pozitiv te clockut
#5  clk=1;    
#5  clk=0;
//clock-u 0; vendosim vlerat per RD, te dhenat ne WD dhe WriteEnable=1; shkruajme ne regjistrin 6
#5  RD=3'd6; WD=16'd101; we=1'b1;
//Te dhenat e mesiperme shkruhen ne tehun pozitiv te clockut
#5  clk=1;    
#5  clk=0;
//Duke ofruar adresat per regjistrin e 5 dhe te 6 lexojme vlerat e tyre te deponuara me pare
#10 RS=3'd5; RT=3'd6;
#10 $stop;
end 
    
   
RegisterFile RF (RS, RT, RD, WD,  we, 
clk, RD1, RD2);
endmodule
