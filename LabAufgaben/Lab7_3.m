source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Ex 7.3 a)
disp("***Ex 7.3 a)\n");


function [y_list] = eulerMethod(f, a, b, h, y_0)
  xValues = [a : h : b];
  n = length(xValues);
  
  y_list = [y_0];
  for i = 1 : n
    y_new = y_list(end) + h*f(xValues(i),y_list(end));
    y_list = [y_list; y_new];
  end;
end;

function [y_list] = heunMethod(f, a, b, h, y_0)
  xValues = [a : h : b];
  n = length(xValues);
  
  y_list = [y_0];
  
  for i = 1 : n
    k_1 = h * f(xValues(i), y_list(end));
    k_2 = h * f(xValues(i) + h, y_list(end) + k_1);
    y_new = y_list(end) + (1/2) * (k_1 + k_2);
    y_list = [y_list; y_new];
  end;
end;

function [y_list] = rungeKutta(f, a, b, h, y_0)
  xValues = [a : h : b];
  n = length(xValues);
  
  y_list = [y_0];
  
  for i = 1 : n
    k_1 = h * f(xValues(i), y_list(end));
    k_2 = h * f(xValues(i) + (1/2) * h, y_list(end) + (1/2) * k_1);
    k_3 = h * f(xValues(i) + (1/2) * h, y_list(end) + (1/2) * k_2);
    k_4 = h * f(xValues(i) + h, y_list(end) + k_3);
    y_new = y_list(end) + (1/6) * (k_1 + 2*k_2 + 2*k_3 + k_4);
    y_list = [y_list; y_new];
  end;
end;
  
  
f = @(x,y) sin(x*y);

y_0 = 1;
a = 0;
b = 10;
h = 0.1;


eM = eulerMethod(f, a, b, h, y_0)

hM = heunMethod(f, a, b, h, y_0)

rK = rungeKutta(f, a, b, h, y_0)


plot(eM, "k-");
hold on;
plot(hM, "r-");
plot(rK, "y-");
hold off;

