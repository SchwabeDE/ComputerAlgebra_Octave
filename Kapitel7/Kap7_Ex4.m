source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");

disp("***Ex 7.4 a)\n");

function [deriv] = symmetricDifference(f, a, h)
  deriv = ( f(a+h) - f(a-h) ) / (2*h);
end;

f = @(x) cos(x)/x;
a = 2;
h = 0.1;

sD = symmetricDifference(f, a, h)

disp("***Ex 7.4 b)\n");

function [T, delta] = richardsonExtrapolation(f, a, h, Tdegree)
  #symmetricDifference = @(f, a, h) ( f(a+h) - f(a-h) ) / (2*h);
  deltaFunc = @(k) 2**(2*k) - 1;
  
  T = zeros(Tdegree);
  
  for n = 1 : Tdegree
    h_curr = h * 2** (n-1);
    T(n,1) = symmetricDifference(f, a, h_curr);
  end;
  T = flipud(T);
  
  for n = 1 : Tdegree-1
    for i = 1 : Tdegree - n
      delta(i,n) = (T(i+1,n) - T(i,n)) / deltaFunc(n);
    end;
    
    for i = 1 : Tdegree - n
      T(i,n) = T(i+1,n) + delta(i,n);
    end;
    
    TODO
  end;
end;
  
  
Tdegree = 4
[T, delta] = richardsonExtrapolation(f, a, h, Tdegree)