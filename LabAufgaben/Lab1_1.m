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




