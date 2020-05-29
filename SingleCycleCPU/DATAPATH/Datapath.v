`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2020 05:12:53 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(
input clk, 
input RegDst, 
input ALUSrc, 
input MemToReg, 
input RegWrite, 
input MemRead, 
input MemWrite, 
input ALUop,
input PcFill,
output opcode
    );

//wire clk;
//wire RegDst;
wire AluSrc;
//wire MemToReg;
//wire RegWrite;
//wire MemRead;
//wire MemWrite;
wire AluOP;
//wire PcFill;
reg  [15:0] pc;
wire [15:0] instruksioni;
//wire [1:0] opcode;
wire [2:0] RS;
wire [2:0] RD;
wire [2:0] RT;
wire [4:0]funct;
wire [7:0]immediate;
wire [15:0] WD;
wire RFwe;
wire [15:0] RD1;
wire [15:0] RD2;
reg s;
wire [15:0] alu2;
wire [15:0] imm_long;
wire [4:0] ALU_Cnt;
reg binvert;
reg cin;
wire ainvert;
// PC 
 initial begin
    assign pc = 16'd0;
 end
 
 always @(posedge clk)
 begin 
    assign pc = PcFill;
 end
 

InstrMemory DPIM (clk, pc, instruksioni);

assign opcode = instruksioni[15:14];
assign RS = instruksioni[13:11];
assign RT = instruksioni[10:8];
assign RD = instruksioni[7:5];
assign funct = instruksioni[4:0];
assign immediate = instruksioni[7:0];

always @(opcode)
begin 
    if(opcode == 2'd0)
        s = 0;
    else
        s = 1;
end



mux_2to1 M21HyrjeDM(MemToReg, result, ReadData, WD);
DataMemory DM(result, RD2, MemWrite, MemRead, clk, ReadData);

mux_2to1 M21HyrjeRF(s, RD, RT, z);
RegisterFile RF(RS, RT, RD, WD, RFwe, clk, RD1, RD2);

assign imm_long = {{8{immediate[7]}}, immediate[7:0]};
mux_2to1 M21HyrjeALU(AluSrc, RD2, imm_long, alu2);

// ALU control unit
alu_control ACU(AluOP, funct, ALU_Cnt);

always @(ALU_Cnt)
begin 
    if(ALU_Cnt[2] == 1'b1)
        begin
            binvert = 1;
            cin = 1;
        end
    else
        begin
            binvert = 0;
            cin = 0;
        end
end


assign ainvert = 0;
alu_16bit aluRF(RD1, alu2, cin, ainvert, binvert, ALU_Cnt[1:0], result, cout);

endmodule