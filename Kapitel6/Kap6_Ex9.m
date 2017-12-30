source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Ex 6.9
disp("***Ex 6.9\n");

#Tridiagonal algorithm (b -> maindiagonal)
function [x] = tridiagonalAlgorithm(b, c, d)

  n = length(b);
  
  #Elimination
  for k = 2 : n
    m = c(k-1) / b(k-1);
    b(k) = b(k) - m * c(k-1);
    d(k) = d(k) - m * d(k-1);
  end;

  x(n) = d(n) / b(n);  #Addition to the skript algorithm
  #Backward substitution
  for k = n - 1 : -1 : 1
    d(n) = d(n) / b(n);
    d(k) = (d(k) - c(k)*d(k+1)) / b(k);
    x(k) = d(k);
  end;
  x = x';
end;


function [a,b,c,d] = naturalSplineInterpolation(valueTable_xy)
  
  i = rows(valueTable_xy)
  n = i - 1
  
  x = valueTable_xy(:,1)
  y = valueTable_xy(:,2)
  
  for i = 1 : rows(valueTable_xy) - 1
    h(i) = x(i+1) - x(i);
  end;
  
  for i = 1 : n - 1
    b_diag(i) = 2 * (h(i) + h(i+1));
  end;
  c_diag = h(2:end-1);
  
  for i = 2 : n
    r(i) = (6/h(i)) * (y(i+1) - y(i)) - (6/h(i-1)) * (y(i) - y(i-1));
  end;
  r = r(2:end)
  
  tridiagonalAlgorithm(b_diag, c_diag, r)
  
end;

valueTable_xy = [0 0; 1 1; 2 0; 3 1]
naturalSplineInterpolation(valueTable_xy)

#TODO Seite 129 a,b,c,d Parameter bestimmen..