source("../opt.m");
graphics_toolkit gnuplot
disp("\n*********************************************************************");
#Ex 3.18 a)
disp("***Ex 3.18 a)\n");
#x = [-10:.1:10];
#y = [-10:.1:10];
[x, y] = meshgrid([-1:.1:1], [-1:.1:1]);
f = x .** 2 + y .**3;

#{
plot3(x, y, f)
hold on
contour(x, y, f)

#x
#y
#f
grid on
xlabel("x")
ylabel("y")

#}
disp("\n*********************************************************************");
#Ex 3.18 b)
disp("***Ex 3.18 b)\n");

#{
[x, y] = meshgrid([-1:1:1], [-1:1:1])
f = (x .** 2) .+ e .** -(10 .* x) .** 2
plot3(x, y, f)
hold on
contour(x, y, f);

grid on
xlabel("x")
ylabel("y")
#}

disp("\n*********************************************************************");
#Ex 3.18 c)
disp("***Ex 3.18 c)\n");

[x, y] = meshgrid([-1:.1:1], [-1:.1:1])
f = x .** 2 .+ (e .** (-(5 .* (x .+ y)) .** 2)) + (e .** (-(5 * (x .- y)) .** 2))
plot3(x, y, f)
hold on
contour(x, y, f);

grid on
xlabel("x")
ylabel("y")
