source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Lab Ex 3.2 a)
disp("***Lab Ex 3.2 a)\n");

sum = 0;
for k = 0 : 20
  sum += 1 / factorial(k);
end;
sum
e
#plot((0:20), sum)

disp("\n*********************************************************************");
#Lab Ex 3.2 b)
disp("***Lab Ex 3.2 b)\n");

derivations = [sin(0) cos(0) -sin(0) -cos(0)]

function [y] = taylor(x, der, degree)
  y = 0;
  for n = 0 : degree
    y += (der(mod(n,4)+1)/ factorial(n)) * (x ** n);
  end;
end;

taylorResult = [];
sinResult = [];
xStepsize = [];
for x = -2 * pi : 0.1 : 2 * pi
  taylorResult = [taylorResult taylor(x, derivations, 6)];
  sinResult = [sinResult sin(x)];
  xStepsize = [xStepsize x];
end;

close all;

plot(xStepsize, taylorResult, 'r');
hold on;
plot(xStepsize, sinResult, 'b');
axis([-2 * pi, 2 * pi, -2, 2], "normal");
hold off;