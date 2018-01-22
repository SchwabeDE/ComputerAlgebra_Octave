source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");

disp("***Ex 7.2 a)\n");

function [area, error] = T(f, a, b, n)
  h = (b-a)/n
  xValues = [a+h : h : b-h];
  area = h * ( (f(a)+f(b))/2 + sum(f(xValues)) );
  
  error = ((b-a)*h**2)/12;
end;

f = @(x) x.**2;
a = 0;
b = 6;
n = 10;

T(f, a, b, n)

disp("***Ex 7.2 b)\n");

function [area, error] = Richardson(f, a, b, n)
  [t_1, e_1] = T(f, a, b, n);
  [t_2, e_2] = T(f, a, b, n*2);
  
  area = (4/3) * t_1 - (1/3) * t_2;
  error = e_2;
end;

Richardson(f, a, b, n)

disp("***Ex 7.2 c)\n");

f = @(x) e.**(-x.**2);

a = 0
b = 1

results = [];
for n = 1 : 20
  [T_area, T_error] = T(f, a, b, n);
  [R_area, R_error] = Richardson(f, a, b, n);
  results = [results; T_area, R_area, T_error, R_error, T_error/R_error];
end;
results