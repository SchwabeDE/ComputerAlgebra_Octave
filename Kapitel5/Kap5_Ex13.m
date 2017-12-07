source("../opt.m");
disp("\n*********************************************************************");
#Ex 5.13 a)
disp("***Ex 5.13 a)\n");

function [ret] = fixedPointIteration(f, initVal, threshold)
  x = initVal;
  currentRounds = 0;
  while(currentRounds < threshold)
    x = f(x);
    currentRounds += 1;
  end;
  ret = x;
end;

function [x] = f(x)
  x = atan(cos(x));
end;

result = fixedPointIteration(@f, 1, 100)

#x = 1;
#for i = 1 : 10
#  x = f(x)
#end;