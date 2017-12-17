source("../opt.m");
disp("\n*********************************************************************");
#Lab Ex 1.1 a)
disp("***Lab Ex 1.1 a)\n");

file = fopen ("inputLab1_1.txt", "r");
data = dlmread(file);
fclose(file);

disp("Fileinput:\n");
data

A = data(:,1:end - 1)
b = data(:,end)

disp("Properties of matrix A:\n");

rankA = rank(A)

if(issymmetric(A) == 1)
  disp("A is symmetric!\n");
else
  disp("A is NOT symmetric!\n");
end;

#Check for square matrix
if(issquare(A))
  detA = det(A)
  invA = inverse(A)

  [eigenvectorA, eigenvalueA] = eig(A)

  [~,isPosDefinite] = chol(A);
  if(isPosDefinite == 0)
    disp("A is positive definite!\n");
  else
    disp("A is NOT positive definite!\n");
  end;
else
  disp("Determinant, inverse, eigenvector, eigenvalue\
  and wheather the matrix is positive definite\
  cannot be determined because it is NO square matrix!\n");
end;  

#Lab Ex 1.1 b)
disp("***Lab Ex 1.1 b)\n");

#Solve A * x = b
x = A \ b


#Lab Ex 1.1 c)
disp("***Lab Ex 1.1 c)\n");
clear;
format short;

A = round(rand(2,2) .* 100)
b = round(rand(2,1) .* 100)

x = A \ b

function [A, x, b] = gaussianElimination(A, b, usePivoting)

  [m, n] = size(A)
  for k = 1 : min(m, n)
    
    if(usePivoting == true)
      [i, i_max] = max( abs(A(k:m,k)) );
      i_max += k - 1;
      if(i == 0)
        error("MATRIX IS SINGULAR!");
      end;
      temp = A(i_max,:);
      A(i_max,:) = A(k,:);
      A(k,:) = temp;
      
      temp = b(i_max);
      b(i_max) = b(k);
      b(k) = temp;
      
      #A([i_max k],:) = A([k i_max],:);
      #b([i_max k],:) = b([k i_max],:);
    end;
    for i = k + 1 : m
      q_ik = A(i,k) / A(k,k);
      for j = k + 1 : n
        A(i,j) = A(i,j) - q_ik * A(k,j);
      end;
      b(i) = b(i) - q_ik * b(k);
      A(i,k) = 0;
    end;
  end;
  
  x = A \ b;
end;

A_withoutPiv = A;
A_withPiv = A;
[A_withoutPiv, x, b] = gaussianElimination(A, b, false)

[A_withPiv, x, b] = gaussianElimination(A, b, true)


