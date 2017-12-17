clc;
more off;
format short;

function [sum] = finiteGeometricSeries(q,n)
  sum = 0;
  for i = 0 : n
    sum += (1-q**(n+1)) / (1-q)
  end;
end;

finiteGeometricSeries(2,2)


function [sum] = infiniteGeometricSeries(q, n)
  f = @(q) 1 / (1-q);
  
  q0 = q;
  q1 = f(q0);
  quotienCriteria = abs(q1 / q0)
  if(quotienCriteria >= 1)
    error("SERIES DIVERGES!");
  end;
  
  sum = 0;
  for i = 0 : n
    sum += f(q)
  end;
end;

infiniteGeometricSeries(8,50)