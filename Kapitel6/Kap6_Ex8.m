source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Ex 6.8
disp("***Ex 6.8\n");

#Tridiagonal algorithm
function [x] = tridiagonalAlgorithm(A, d)

  b = diag(A)
  c = diag(A, 1)

  n = rows(b)
  #x = zeros(n)(:,1)

  for k = 2 : n
    m = c(k-1) / b(k-1);
    b(k) = b(k) - m * c(k-1);
    d(k) = d(k) - m * d(k-1);
  end;

  x(n) = d(n) / b(n);  #Addition to the skript algorithm
  for k = n - 1 : -1 : 1
    d(n) = d(n) / b(n);
    d(k) = (d(k) - c(k)*d(k+1)) / b(k);
    x(k) = d(k);
  end;
  x = x';
end;


A = [4 1 0; 1 4 1; 0 1 4]
d = [-12; 12; 12]

#A = [4 1; 1 4]
#d = [-12; 12]

#A = [4]
#d = [12]

tridiagSol = tridiagonalAlgorithm(A, d)

sol = A \ d