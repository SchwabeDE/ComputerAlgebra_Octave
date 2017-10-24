clc;
format short;
#Ex 2.4 a)
printf ("***Ex 2.4 a)\n");

A = double(int16(rand(5, 10) * 100))

#Ex 2.4 b)
printf ("***Ex 2.4 b)\n");

function [avg] = calcAvg(X)
  avg = [];
  for n = 1 : columns(X),
    sum = 0;
    for m = 1 : rows(X),
      sum += X(m,n);
    end;
    mean = sum / rows(X);
    avg = [avg mean];
  end;
endfunction

avg = calcAvg(A)

#Ex 2.4 c)
printf ("***Ex 2.4 c)\n");

function [stdDev] = calcStdDev(X)
  stdDev = [];
  for n = 1 : columns(X),
    sum = 0;
    for m = 1 : rows(X),
      avg = calcAvg(X(:,n));
      sum += (X(m,n) - avg) ** 2;
    end;
    stdDev = [stdDev sqrt((sum / (rows(X) - 1)))];
  end;
endfunction

s = calcStdDev(A)