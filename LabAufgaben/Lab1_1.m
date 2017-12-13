source("../opt.m");
disp("\n*********************************************************************");
#Lab Ex 1.1
disp("***Lab Ex 1.1 \n");
file = fopen ("inputLab1_1.txt", "r");
data = dlmread(file);

disp("Fileinput:\n");
data

A = data(:,1:end - 1)
b = data(:,end)

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

fclose(file);