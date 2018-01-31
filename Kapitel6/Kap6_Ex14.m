source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Ex 6.14
disp("***Ex 6.14\n");


#{ 
ETC..
#plot(x,y, "r*")

A = [1 1 1
1 1 0
1 0 1
0 1 1]

b = [1
2/3
2/3
2/3]

x = A\b

A * x

rref([A b])
#}

x = [0 1 2]
y = [2 3 6]

A = [1 3; 3 5]
b = [11; 15]

a = A\b

c = e**a(1)
d = a(2)

f = @(x) c .* e.**(d.*x);

fy = f(x)

plot(x,y,"k*")
hold on;
plot(x,fy,"r-")
hold off;