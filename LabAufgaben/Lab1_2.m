source("../opt.m");
disp("\n*********************************************************************");
#Lab Ex 1.2 a)
disp("***Lab Ex 1.2 a)\n");

A = rand(5,4)
B = rand(4,5)

if(columns(A) != rows(B))
  error("Dimensions of A and B are not the same!");
end;

sum = 0;
for i = 1 : rows(A)
  for j = 1 : columns(B)
    for k = 1 : columns(A)
      sum += A(i,k) * B(k,j);
    end;
    C(i,j) = sum;
    sum = 0;
  end;
end;

C

checkC = A * B


disp("\n*********************************************************************");
#Lab Ex 1.2 b)
disp("***Lab Ex 1.2 b)\n");


for i = 1 : rows(A)
  for j = 1 : columns(A)
    T(j,i) = A(i,j);
  end;
end;

T