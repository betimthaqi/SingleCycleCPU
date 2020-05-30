`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2020 02:20:35 AM
// Module Name: CPU
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


module CPU(input clk);
//wire clk;
wire RegDst;
wire AluSrc;
wire MemToReg;
wire RegWrite;
wire MemRead;
wire MemWrite;
wire AluOP;
wire PcFill = 16'd10;
wire [1:0] opcode;

Datapath CPU_DP(clk, RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, ALUop, PcFill, opcode);
cu CPU_CU(opcode, RegDst, ALUSrc, MemToReg , RegWrite , MemRead , MemWrite, ALUOp);

endmodule
