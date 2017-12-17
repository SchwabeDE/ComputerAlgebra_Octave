clc;
clear;
more off;

A = rand(8,5)
B = rand(5,8)

if(rows(A) != columns(B))
  error("DIMENSIONS DO NOT MATCH!");
end;


for i = 1 : rows(A)
  for j = 1 : columns(B)
    C(i,j) = A(i,:) * B(:,j);
  end;
end;

C == (A * B)




for i = 1 : rows(A)
  for j = 1 : columns(A)
    T(j,i) = A(i,j);
  end;
end;
T == A'