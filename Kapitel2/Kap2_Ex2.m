clc;

#Ex 2.2 a)
printf ("***Ex 2.2 a)\n")

function [ret] = multiplyMatrices(X, Y)
    if columns(X) != rows(Y),
        disp("Matrix dimensions do not match!");
    else
        ret = zeros(rows(X), columns(Y));
        
        for Xm = 1 : rows(X),
          for Yn = 1 : columns(Y),
            sum = 0;
            for n = 1 : columns(X),
              sum += X(Xm, n) * Y(n, Yn);
            end;
            ret(Xm, Yn) = sum;
          end;
        end;
    end;
endfunction;

A = [1,3; 5,7]
B = [2,4; 6,8]
C = multiplyMatrices(A, B)
checkC = A * B

#Ex 2.2 b)
printf ("***Ex 2.2 b)\n")

function [ret] = transposeMatrix(X)
    ret = zeros(columns(X), rows(X));
    for Xm = 1 : rows(X),
      for Xn = 1 : columns(X),
        ret(Xn,Xm) = X(Xm,Xn);
      end;
    end;        
endfunction;

A = [1,3,5,7,11; 9,9,1,91,88]
C = transposeMatrix(A)
checkC = A'