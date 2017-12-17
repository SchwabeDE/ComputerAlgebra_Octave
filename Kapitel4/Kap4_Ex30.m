source("../opt.m");
graphics_toolkit gnuplot;
format short;
disp("\n*********************************************************************");
#Ex 4.30 a)
disp("***Ex 4.30 a)\n");

file = fopen ("lexmed.data", "r");
lexmedData = dlmread(file, ' ', 5, 0);
#data = dlmread(file);
fclose(file);

S_1 = cov(lexmedData);
[m_1,n_1] = size(S_1)
[eigenvalues_1, ~] = eig(S_1);

sortedEigenvalues_1 = sort(eigenvalues_1, "descend")
x = Vred_1 = S_1 - sortedEigenvalues_1 * eye(rank(S_1))


#Ex 4.30 b)
disp("***Ex 4.30 b)\n");

normalizedLexmedData = lexmedData ./ max(max(lexmedData));
S_2 = cov(normalizedLexmedData);
[m_2,n_2] = size(S_2)
[eigenvalues_2, eigenvectors_2] = eig(S_2);

sortedEigenvalues_2 = sort(eigenvalues_2, "descend")