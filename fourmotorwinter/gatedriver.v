`timescale 1ns / 1ps



module gatedriver(pwm,a,b,c,h,d);



input [2:0]h;
input pwm;
input d;
output [1:0]a;
output [1:0]b;
output [1:0]c;

reg [1:0]k;
reg [1:0]l;
reg [1:0]m;

wire e=h[0];
wire f=h[1];
wire g=h[2];

always@(h or pwm) begin

if(pwm) begin


k[0]=((~d&~f)|(e&f)|(d&~e));
k[1]=((~d&e&~f)|(d&~e&f));
l[0]=((~d&~g)|(f&g)|(d&~f));
l[1]=((~d&f&~g)|(d&~f&g));
m[0]=((~d&~e)|(e&g)|(d&~g));
m[1]=((~d&~e&g)|(d&e&~g));

end
else begin
k=2'b01;
l=2'b01;
m=2'b01;
end
end
assign a=k;
assign b=l;
assign c=m;
endmodule