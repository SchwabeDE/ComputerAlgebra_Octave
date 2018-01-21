source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Ex 7.4
disp("***Ex 7.4\n");

function [y_list] = rungeKutta(f, a, b, h, y_0)
  xValues = [a : h : b];
  n = length(xValues);
  
  y_list = [y_0];
  
  for i = 1 : n
    k_1 = h * f(xValues(i), y_list(end, :));
    k_2 = h * f(xValues(i) + (1/2) * h, y_list(end, :) + (1/2) * k_1);
    k_3 = h * f(xValues(i) + (1/2) * h, y_list(end, :) + (1/2) * k_2);
    k_4 = h * f(xValues(i) + h, y_list(end, :) + k_3);
    y_new = y_list(end, :) + (1/6) * (k_1 + 2*k_2 + 2*k_3 + k_4);
    y_list = [y_list; y_new];
  end;
end;

function f = f(t, y)
  a = 10;
  f(1) = a * y(1) * (1 - y(2));
  f(2) = y(2) * (y(1) - 1);
end;


y_0 = [3 1];
a = 0;
b = 5;
h = 0.05;
targetVar = 1

rK = rungeKutta(@f, a, b, h, y_0, targetVar)

plot(rK(:,1), "r-")
hold on;
plot(rK(:,2), "k-")
hold off;