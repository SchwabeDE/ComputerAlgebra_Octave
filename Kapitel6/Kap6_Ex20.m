source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Ex 6.20
disp("***Ex 6.20\n");

M = [8 2 2; 2 4 1]



MM_T = M*M'

[v, lambda] = eigs(MM_T, size(MM_T,1))

A_1 = MM_T - eye(2,2)*lambda(1,1)
A_2 = MM_T - eye(2,2)*lambda(2,2)
#b = [0; 0]
#x = A\b
rref(A_1)
rref(A_2)

M_TM = M'*M

[v, lambda] = eigs(M_TM, size(M_TM,1))

B_1 = M_TM - eye(3,3)*lambda(1,1)
rref(B_1)

B_2 = M_TM - eye(3,3)*lambda(3,3)
rref(B_2)

[2.38 -0.42; 1 1] * [9.11 0 0; 0 3.29 0] * [3.65 1.52 1; -8.49 19.73 1; -3 -2 14]

[u,s,v] = svd(M)