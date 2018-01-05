source("../opt.m");
disp("\n*********************************************************************");
graphics_toolkit gnuplot;
#Ex 6.11 a)
disp("***Ex 6.11 a)\n");

function [x, y] = IFS(n, a, b, c, d)
  x = [1];
  y = [1];
  for i = 1 : n 
    x(end+1) = a * y(end) + b;
    y(end+1) = c * x(end) + d;
  end;
end;

n = 20;
[x, y] = IFS(n, 0.9, -0,9, -0.9, 0.9)

a = min(x);
b = max(x);
stepSize = abs(a-b) / (n-1);
x_f = [a:stepSize:b]

y_f = interp1(x, y, x_f, "spline")

plot(x, y)
hold on;
plot(x_f, y_f)
hold off;