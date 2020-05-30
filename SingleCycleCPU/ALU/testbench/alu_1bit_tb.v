`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2020 02:15:07 PM
// Module Name: alu_1bit_tb
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


module alu_1bit_tb();

reg a, b, cin, ainvert, bnegate, less;
reg[1:0] op;

wire result;
wire cout;

initial 
$monitor ("a = %b, b = %b, cin = %b, cout = %b, op1 = %b, op0 = %b, ainvert = %b, bnegate = %b, less = %b",
a, b, cin, cout, op[1], op[0], ainvert, bnegate, less);


initial
begin
//AND
#0 a=0; b=0; cin=0; ainvert=0; bnegate=0; less=0; op[1]=0; op[0]=0; //r=0 cout=0
#10 a=1; b=0; cin=0; ainvert=0; bnegate=0; less=0; op[1]=0; op[0]=0;//r=0 cout=0
#10 a=1; b=1; cin=0; ainvert=0; bnegate=0; less=0; op[1]=0; op[0]=0;//r=1 cout=0
//OR
#10 a=0; b=0; cin=0; ainvert=0; bnegate=0; less=0; op[1]=0; op[0]=1;//r=0 cout=0
#10 a=1; b=0; cin=0; ainvert=0; bnegate=0; less=0; op[1]=0; op[0]=1;//r=1 cout=0
#10 a=1; b=1; cin=0; ainvert=0; bnegate=0; less=0; op[1]=0; op[0]=1;//r=1 cout=0
//ADD
#10 a=0; b=0; cin=0; ainvert=0; bnegate=0; less=0; op[1]=1; op[0]=0;//r=0 cout=0
#10 a=1; b=0; cin=0; ainvert=0; bnegate=0; less=0; op[1]=1; op[0]=0;//r=1 cout=0
#10 a=1; b=1; cin=0; ainvert=0; bnegate=0; less=0; op[1]=1; op[0]=0;//r=0 cout=1
#10 a=1; b=1; cin=1; ainvert=0; bnegate=0; less=0; op[1]=1; op[0]=0;//r=1 cout=1
//SUB
#10 a=0; b=0; cin=1; ainvert=0; bnegate=1; less=0; op[1]=1; op[0]=0;//r=1 cout=0
#10 a=0; b=1; cin=1; ainvert=0; bnegate=1; less=0; op[1]=1; op[0]=0;//r=1 cout=0
#10 a=1; b=0; cin=1; ainvert=0; bnegate=1; less=0; op[1]=1; op[0]=0;//r=1 cout=0
#10 a=1; b=1; cin=1; ainvert=0; bnegate=1; less=0; op[1]=1; op[0]=0;//r=0 cout=0
//NOR
//not (a OR b) 
#10 a=1; b=1; cin=0; ainvert=1; bnegate=0; less=0; op[1]=1; op[0]=0;//r=0 cout=0
#10 $stop;
end

alu_1bit a1(a, b, cin, ainvert, bnegate, less, op, result, cout);

endmodule
