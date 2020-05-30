`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2020 02:00:05 PM
// Module Name: mux_4to1
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


module mux_4to1 (s0, s1, d0, d1, d2, d3, z1);
//define inputs and output
input s0, s1, d0, d1, d2, d3;
output z1;
//use the nested conditional operator
assign z1 = s1 ? (s0 ? d3 : d2) : (s0 ? d1 : d0);
endmodule