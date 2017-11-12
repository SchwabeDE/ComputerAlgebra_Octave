source("../opt.m");
graphics_toolkit gnuplot
disp("\n*********************************************************************");
#Ex 3.20
disp("***Ex 3.20\n");

[x, y] = meshgrid([-1:.1:1], [-1:.1:1])
#TODO
#f = (abs(y .- x) + abs(y .+ x)) + (4 .* e .** (-x .** 2 - (y .- 3) .** 2)) + (4 .* e .** -(x .- 3) .** 2 .- y .** 2) + (4 .* e .** -(x .+ 3) .** 2 .- y .** 2) + (4 .* e .** (-x .** 2 - (y .+ 3) .** 2))

plot3(x, y, f)
hold on
contour(x, y, f);

grid on
xlabel("x")
ylabel("y")