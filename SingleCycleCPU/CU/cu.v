`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2020 02:59:29 PM
// Module Name: cu
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


module cu(input  [1:0] opcode, output reg RegDst, output reg ALUSrc, output reg MemToReg , output reg RegWrite , output reg MemRead , output reg MemWrite, output reg ALUOp);


always @(opcode)
begin
case(opcode)
2'b00: //R format
begin 
assign RegDst = 1; 
assign ALUSrc = 0; 
assign MemToReg = 0; 
assign RegWrite = 1; 
assign MemRead = 0; 
assign MemWrite = 0; 
assign ALUOp = 1; 
end

2'b10: // LW
begin 
assign RegDst = 0; 
assign ALUSrc = 1; 
assign MemToReg = 1; 
assign RegWrite = 1; 
assign MemRead = 1; 
assign MemWrite = 0; 
assign ALUOp = 0; 

end

2'b11: // SW
begin 
assign RegDst = 0; 
assign ALUSrc = 1; 
assign MemToReg = 0; 
assign RegWrite = 0; 
assign MemRead = 0; 
assign MemWrite = 1; 
assign ALUOp = 0; 
end

2'b01: // ADDI
begin 
assign RegDst = 0; 
assign ALUSrc = 1; 
assign MemToReg = 0; 
assign RegWrite = 1; 
assign MemRead = 0; 
assign MemWrite = 0; 
assign ALUOp = 1; 
end

endcase
end

endmodule
