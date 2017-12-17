clc;
clear;

A = rand(5,10)

function [avg] = avg(A)
  avg = [];
  for i = 1 : columns(A)
    avg = [avg sum(A(:,i)) / rows(A)];
  end;
end;
avg(A)
mean(A)

function [s] = standardDev(A)
  s = [];
  t_avg = avg(A);
  for n = 1 : columns(A)
    sum = 0;
    for m = 1 : rows(A)
      sum += (A(m,n) - t_avg(n))**2;
    end;
    s = [s sqrt(sum/(rows(A) - 1))];
  end;
end;



std(A)
standardDev(A)