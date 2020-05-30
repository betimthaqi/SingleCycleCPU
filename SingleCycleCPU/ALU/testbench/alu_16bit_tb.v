`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2020 06:33:01 PM
// Module Name: alu_32bit_tb
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


module alu_32bit_tb(

    );
    
reg[15:0] a, b;
reg cin, ainvert, bnegate;
reg[1:0] op;

wire[15:0] result;
wire cout;

initial 
$monitor ("a = %d, b = %d, cin = %b, cout = %b, op1 = %b, op0 = %b, ainvert = %b, bnegate = %b, less = %b, zero=%b, result=%d, overflow=%b",
a, b, cin, cout, op[1], op[0], ainvert, bnegate, zero, result, overflow);


initial
begin

//AND
#0 a=0; b=0; cin=0; ainvert=0; bnegate=0;  op[1]=0; op[0]=0; //r=0 cout=0
#10 a=1; b=0; cin=0; ainvert=0; bnegate=0;  op[1]=0; op[0]=0;//r=0 cout=0
#10 a=1; b=1; cin=0; ainvert=0; bnegate=0;  op[1]=0; op[0]=0;//r=1 cout=0
//OR
#10 a=0; b=0; cin=0; ainvert=0; bnegate=0;  op[1]=0; op[0]=1;//r=0 cout=0
#10 a=1; b=0; cin=0; ainvert=0; bnegate=0;  op[1]=0; op[0]=1;//r=1 cout=0
#10 a=1; b=1; cin=0; ainvert=0; bnegate=0;  op[1]=0; op[0]=1;//r=1 cout=0

//ADD
#10 a=16'd1001; b=16'd1234;cin=0; ainvert=0; bnegate=0;  op[1]=1; op[0]=0;//r=0 cout=0
#10 a=16'd1001; b=16'd1234;cin=0; ainvert=0; bnegate=0;  op[1]=1; op[0]=0;//r=0 cout=0

//SUB
#10 a=16'd1001; b=16'd1234; cin=1; ainvert=0; bnegate=1;  op[1]=1; op[0]=0;//r=1 cout=0
#10 a=16'd1001; b=16'd1234; cin=1; ainvert=0; bnegate=1;  op[1]=1; op[0]=0;//r=0 cout=0

#10 $stop;
end

alu_32bit a32(a, b, cin, ainvert, bnegate, op, result, cout, zero);
endmodule
