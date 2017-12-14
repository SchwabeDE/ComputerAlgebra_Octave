source("../opt.m");
disp("\n*********************************************************************");
#Lab Ex 4.1 a)
disp("***Lab Ex 4.1 a)\n");

function [ret] = lcg(x, a, b, m)
  ret = mod(a * x + b, m);
end;

a = 7141;
b = 54773;
m = 259200;

output = [88];

for i = 1 : 1000
  output = [output lcg(output(end), a, b, m)];
end;

output