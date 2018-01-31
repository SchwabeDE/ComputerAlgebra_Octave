source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#SVD
disp("***SVD\n");


M = [3 2 2; 2 3 -2]

MM_T = M*M'

[U, E] = eig(MM_T)
E = sqrt([E zeros(2,1)])

[V, lambda] = eig(M_TM = M'*M)

E_plus = (1./E)';
E_plus(~isfinite(E_plus))=0
Mpseudo = V*E_plus*U'

U
E
V
U*E*V'

disp("\n*********************************************************************");
clear;
M = [3 2 2; 2 3 -2]
[v,lambda] = eig(M*M')

[u,s,v] = svd(M)

u*s*v'

s_plus = (1./s)'
s_plus(~isfinite(s_plus))=0

v*s_plus*u'

[v, lambda] = eig(M'*M)

rref(M'*M-25*eye(3))
