`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2020 02:03:22 PM
// Module Name: mux_2to1
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


module mux_2to1(s, d0, d1, z);

input s, d0, d1;
output z;

assign z = s ? d1 : d0;
endmodule
