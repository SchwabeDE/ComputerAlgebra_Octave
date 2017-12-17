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
initVal = 5;
[result, xVal] = fixedPointIteration(@f, initVal, 10)


#Ex 5.13 c)
disp("***Ex 5.13 c)\n");


L = 0.471;
epsilon = 10**-3;
k = log( (epsilon ** (1-L)) / (xVal(1) - initVal) ) / log(L);


printf("The required k to achieve a minimum precision of %f is k = %d\n",epsilon,k);


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

#Ex 5.13 g)
disp("***Ex 5.13 g)\n");

fPI = @(x) atan(cos(x));
fPI_array = [5];
for i = 1 : 10
  fPI_array = [fPI_array fPI(fPI_array(end))];
end
fPI_array


