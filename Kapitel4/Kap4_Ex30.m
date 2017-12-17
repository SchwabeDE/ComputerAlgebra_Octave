source("../opt.m");
graphics_toolkit gnuplot;
format short;


function [lexmedData] = getLexmedData(filename)
  file = fopen (filename, "r");
  lexmedData = dlmread(file, ' ', 5, 0);
  fclose(file);
end;

function [eigenValues, eigenVectors] = getEigen(dataMatrix)
  S = cov(dataMatrix);
  [v, lambda] = eig(S);
  eigenValues = fliplr(lambda);
  eigenVectors = fliplr(v);
end;

function [normalizedMatrix] = normalizeData(matrix)
  for n = 1 : columns(matrix)
    data_min = min(matrix(:,n));
    data_max = max(matrix(:,n));
    for m = 1 : rows(matrix)
      normalizedMatrix(m,n) = (matrix(m,n) - data_min) / (data_max - data_min);
    end;
  end;
end;


disp("\n*********************************************************************");
#Ex 4.30 a)
disp("***Ex 4.30 a)\n");
lexmedData = getLexmedData("lexmed.data");
[eigenValues, eigenVectors] = getEigen(lexmedData);


#Ex 4.30 b)
disp("***Ex 4.30 b)\n");
clear;

lexmedData = getLexmedData("lexmed.data");
normalizedData = normalizeData(lexmedData);
[eigenValues, eigenVectors] = getEigen(normalizedData)

M = 2
Vred = eigenVectors(:,1:M)


