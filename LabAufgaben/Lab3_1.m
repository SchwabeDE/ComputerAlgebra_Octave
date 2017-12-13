source("../opt.m");
disp("\n*********************************************************************");
#Lab Ex 3.1 a)
disp("***Lab Ex 3.1 a)\n");

function [x] = iterativeFac(x)
  for i = x - 1:-1:1
    x *= i;
  end;
end;

function [x] = recursiveFac(x)
  if x >= 1
    x *= recursiveFac(x-1);
  else
    x = 1;
  end;
end;

number = 15
result1 = iterativeFac(number)
result2 = recursiveFac(number)