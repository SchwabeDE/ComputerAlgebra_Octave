source("../opt.m");
disp("\n*********************************************************************");
#Ex 5.4 a)
disp("***Ex 5.4 a)\n");

function [ret] = pNorm(x, p)
  ret = 0;
  for n = 1 : columns(x)
    ret += (abs(x(n)) ** p);
  end;
  ret = ret ** (1/p);
end;

x = [1,2,3,4,5]

for p = 1 : 50
  printf("p = %d -> %f\n", p, pNorm(x,p));
end;