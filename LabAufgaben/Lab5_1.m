source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Lab 5.1 a)
disp("***Lab 5.1 a)\n");

f_1 = @(x) (e.**(-x.**2)) / 2;
f_2 = @(x) x;

fs_1 = @(x) -x .* e.**(-x.**2)
fs_2 = @(x) 1;

#{
stepsize = [-10:1:10];
f_1(stepsize)
close all;
plot(stepsize,f_1(stepsize))
hold on;
plot(stepsize,f_2(stepsize));
hold off;
#}

#Lab 5.1 e)
disp("***Lab 5.1 e)\n");
f_array = [0];
for i = 1 : 100
  f_array = [f_array f_1(f_array(end))];
end
f_array