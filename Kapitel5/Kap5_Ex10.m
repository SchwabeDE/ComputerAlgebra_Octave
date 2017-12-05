source("../opt.m");
disp("\n*********************************************************************");
#Ex 5.10 a)
disp("***Ex 5.10 a)\n");



function [x] = squareRoot(a, xInit, iterations)
  if a <= 0 || xInit <= 0
    error("Parameters must be positive!");
  end;
  x = [xInit];
  for i = 1 : iterations,
    xNew = a / x(end);
    x = [x xNew];
  end;
end;

#endresult = squareRoot(1342,4,20)

endresult = squareRoot(rand(1)*1000,rand(1)*10,20)

plot(endresult, "r");

