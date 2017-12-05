source("../opt.m");
disp("\n*********************************************************************");
#Kap 5. Gaussian Elemination Method
disp("***Kap 5. Gaussian Elemination Method\n");

#A = [1, 3, 5, 9, 17; 3, 5, 7, 9, 3; 11, 17, 19, 7, 19; 11, 17, 19, 5, 19; 1, 3, 5, 9, 17]

A = [-1, 3, -3; 0, -6, 5; -5, -3, 1]

n = rows(A)
m = columns(A)


for k = 1 : n
  [max_values a_mk] = max(abs(A(k:m, k)))
  if A(i_max, k) == 0
    error("Matrix singular");
  end;
  A([k i_max], :) = A([i_max k], :);
  
  for i = k + 1 : n
    f = A(i, k) / A(k, k);
    for j = k + 1 : n
      A(i, j) = A(i, j) - A(k, j) * f;
    end;
    A(i, k) = 0;
  end;
end;

A