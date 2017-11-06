clc;
format short;
#Ex 2.7 
##GLOBAL VARIABLES
a = 0.01
b = 1.00
e = 10 ** -9

#Ex 2.7 a)
printf ("***Ex 2.7 a)\n");

#Number of cleaning iterations
# Poison concentration: (a*v) / ((a * v) + ((b - a) * v))
# Poisen concentration short -> a / b

function [cleaningIteration] = calcCleaningIterations(a, b, e)
  poisCon = 1;
  cleaningIteration = 0;
  if b <= a
    error('Error: b must be bigger than a!');
  end;
  while poisCon > e
    poisCon = (a / b) ** cleaningIteration;
    cleaningIteration++;
  end;
endfunction
cleanIterationSum = calcCleaningIterations(a, b, e)

#Ex 2.7 b)
printf ("***Ex 2.7 b)\n");

function [waterVolume] = calcRequiredWaterVolume(a, b, iterations)
  waterVolume = (b - a) * iterations;
endfunction

requiredWaterVolume = calcRequiredWaterVolume(a, b, cleanIterationSum)

#Ex 2.7 c)
#TODO

#Ex 2.7 d)
#TODO

#Ex 2.7 r)
#TODO