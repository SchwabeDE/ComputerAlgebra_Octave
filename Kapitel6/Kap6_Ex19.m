source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Ex 6.19
disp("***Ex 6.19\n");

#Test

#A = [1 5 9; 3 1 7; 5 11 1]
A = [1 5 9; 2 10 18; 5 11 1]
b = [3; 5; 8]

x_t1 = A\b

x_t2 = rref([A b])(:,4)

x_t3 = inv(A)*b

x_t4 = rref([A'*A A'*b])(:,4)