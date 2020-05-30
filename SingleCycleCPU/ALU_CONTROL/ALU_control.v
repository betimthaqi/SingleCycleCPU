`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: alu_control
// 
//////////////////////////////////////////////////////////////////////////////////
module alu_control( ALU_Cnt, ALUOp, Opcode);
 output reg[3:0] ALU_Cnt;
 input [1:0] ALUOp;
 input [3:0] Opcode;
 wire [5:0] ALUControlIn;
 assign ALUControlIn = {ALUOp,Opcode};
 always @(ALUControlIn)
 casex (ALUControlIn)
//  ALUOp|funct ||  Bnegate:OP
//   10|x8421     ||      B|OP
//   1 per R type | functioni 
   6'b10xxxx: ALU_Cnt=4'b0000; 
   6'b01xxxx: ALU_Cnt=4'b0001;  
   6'b100001: ALU_Cnt=4'b0000; // and
   6'b100010: ALU_Cnt=4'b0010; // or
   6'b100011: ALU_Cnt=4'b0011; // xor
   6'b100100: ALU_Cnt=4'b0100; // add //addi spo di qysh
   6'b100111: ALU_Cnt=4'b1100; // sub
   6'b101000: ALU_Cnt=4'b0001; // sll
   6'b101001: ALU_Cnt=4'b0110; // srl
   6'b110000: ALU_Cnt=4'b0111; // mult
   
  default: ALU_Cnt=4'b0000;
  endcase
endmodule