source("../opt.m");
graphics_toolkit gnuplot
disp("\n*********************************************************************");
#Ex 3.23
disp("***Ex 3.23\n");

[x, y] = meshgrid([-1:.1:1], [-1:.1:1])

f = zeros(columns(x), rows(x))

for i = 1 : columns(x) * rows(x),
  if abs(y(i)) > abs(x(i))
    f(i) = y(i) * (1 + cos( (pi * x(i)) / y(i)));
  else
    f(i) = 0;
  end;
end;
  
f

hold on;
plot3(x, y, f)
contour(x, y, f);
hold off;

grid on
xlabel("x")
ylabel("y")
