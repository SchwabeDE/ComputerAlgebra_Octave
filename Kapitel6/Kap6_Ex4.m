source("../opt.m");
graphics_toolkit gnuplot;

#Extra: norm examples
disp("***Calc 2 Norm example\n");
A = [1 2; 3 4]

norm(A, 2)
eigA = A' * A
[v, lambda] = eig(eigA)
sqrt(diag(lambda))

disp("\n*********************************************************************");
#Ex 6.4 a)
disp("***Ex 6.4 a)\n");

#see file Kap6_Ex2.m