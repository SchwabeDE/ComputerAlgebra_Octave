clc;
clear;
# Ex 2.1 a)

function [x] = iterativeFac(n)
  x = n;
  for i = n-1:-1:1
    x *= i;
  end;
end;

function [x] = recursiveFac(n)
  x = n;
  if(n > 1)
    x *= recursiveFac(n-1);
  elseif(n == 1)
    x = 1;
  end;
end;
  
NUMBER = 6
iterativeFac(NUMBER)
recursiveFac(NUMBER)
factorial(NUMBER)

function [x] = Fib(n)
  if(n > 1)
    x = Fib(n-1) + Fib(n-2);
  elseif(n == 0 || n == 1)
    x = 1;
  end;
end;

for i = 1 : 20
  Fib(i)
end;
    