source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Ex Least Squares Example
disp("***Least Squares Example\n");

x = [0 2 3 4]
y = [-1 0 2 1]

c = x.**2
d = x
e = ones(1,length(x))

A = [c' d' e']
b = A\y'
plot(x,y,'*')

xh = [0 : 1 : 4]
zh = [xh.**2; xh; e = ones(1,length(xh))]
yh = b' * zh

grid on;
grid minor;
hold on
plot(xh,yh,'b-')
hold off
