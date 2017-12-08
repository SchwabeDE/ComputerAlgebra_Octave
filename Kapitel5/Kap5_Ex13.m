source("../opt.m");
disp("\n*********************************************************************");
#Ex 5.13
disp("***Ex 5.13 a)\n");


function [ret, xVal] = fixedPointIteration(f, initVal, threshold)
  x = initVal;
  currentRounds = 0;
  xVal = [];
  while(currentRounds < threshold)
    x = f(x);
    xVal = [xVal x];
    currentRounds += 1;
  end;
  ret = x;
end;

function [x] = f(x)
  x = atan(cos(x));
end;

[result, xVal] = fixedPointIteration(@f, 5, 10)


#Ex 5.13 c)
disp("***Ex 5.13 c)\n");


L = 0.471;
precision = 10**-3;
k = 0;

function [ret] = determineAPrioriEstimate(L, k, x1, x0)
  ret = ((L**k) / (1-L)) * abs(x1 - x0);
end;  
  
while determineAPrioriEstimate(L, k, xVal(2), xVal(1)) > precision,
  k += 1;
end
printf("The required k to achieve a minimum precision of %f is k = %d\n",precision,k);


#Ex 5.13 d)
disp("***Ex 5.13 d)\n");
[result, xVal] = fixedPointIteration(@f, pi/4, 10)

#Ex 5.13 e)
disp("***Ex 5.13 e)\n");
function [ret] = determineAPosterioriEstimate(L, xK, xKPrev)
  ret = (L / (1-L)) * abs(xK - xKPrev);
end;

aPosterioriEstimate = determineAPosterioriEstimate(L, xVal(8), xVal(7))

printf("Interval for a posteriori estimation after 8 steps: [%f : %f]", xVal(8) - aPosterioriEstimate, xVal(8) + aPosterioriEstimate);

#x = 1;
#for i = 1 : 10
#  x = f(x)
#end;

#fplot (@tan, [-10, 10]);
#set (gca, 'ylim', [-10 10])
