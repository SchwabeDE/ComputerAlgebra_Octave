source("../opt.m");
graphics_toolkit gnuplot
disp("\n*********************************************************************");
#Ex 3.24
disp("***Ex 3.24\n");

[x, y] = meshgrid([-1:.5:1], [-1:.5:1])

f = (x .** 2 .+ y .** 2) / (1 .+ x .** 4 .+ y .** 4)


hold on;
plot3(x, y, f)
contour(x, y, f);
hold off;

grid on
xlabel("x")
ylabel("y")