`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2020 01:52:15 PM
// Module Name: ALU_control
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

module alu_control( ALUOp, Funct, ALU_Cnt);
 output reg[2:0] ALU_Cnt;
 input ALUOp;
 input [4:0] Funct;
 wire [5:0] ALUControlIn;
 assign ALUControlIn = {ALUOp,Funct};
 always @(ALUControlIn)
 casex (ALUControlIn)
//  ALUOp|funct ||  Bnegate:OP
//   10|x8421     ||      B|OP
//   1 per R type | functioni 
   6'b0xxxxx: ALU_Cnt=3'b010; // formati I
   6'b100001: ALU_Cnt=3'b000; // and
   6'b100010: ALU_Cnt=3'b001; // or
   6'b100011: ALU_Cnt=3'b011; // xor
   6'b100100: ALU_Cnt=3'b010; // add
   6'b100111: ALU_Cnt=3'b110; // sub
  default: ALU_Cnt=3'b000;
  endcase
endmodule