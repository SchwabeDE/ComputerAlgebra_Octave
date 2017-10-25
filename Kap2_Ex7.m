clc;
format long;
#Ex 2.7 a)
printf ("***Ex 2.7 a)\n");

#Number of cleaning iterations
# Poison concentration: (a*v) / ((a * v) + ((b - a) * v))
# Poisen concentration short -> a / b

function [cleaningIteration] = calcCleaningIterations(a, b, e)
  poisCon = 1;
  cleaningIteration = 0;
  while poisCon > e
    poisCon = (a / b) ** cleaningIteration;
    cleaningIteration++;
  end;
endfunction
calcCleaningIterations(0.01, 1, 10**-9)