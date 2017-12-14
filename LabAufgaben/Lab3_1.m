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


##TODO
#Lab Ex 3.1 b)
disp("***Lab Ex 3.1 a)\n");

function [res, error] = definiteIntegral(z)
  f = @(t)((log(1 ./ t)) .** (z-1));
  [res, ~, ~, error] = quad(f, 0, 1);
end;

for i = 1 : 15
  [definiteIntResult, error] = definiteIntegral(i);
  printf("%d. Definite integral output: %f (Error: %f)\n", i, definiteIntResult, error);
  printf("%d. Factorial (n - 1) output: %f\n\n", i, factorial(i - 1));
end;
  


#Lab Ex 3.1 c)
disp("***Lab Ex 3.1 c)\n");

function [ret] = fib(n)
  if n > 1
    ret = fib(n-1) + fib(n-2);
  elseif (n = 0) || (n = 1)
    ret = 1;
  else
    ret = 0;
  end;
end;

computingTime = []
tic()
for n = 1 : 20
  fib(n)
  computingTime = [computingTime toc];
end;


computingTime
#plot(computingTime)
