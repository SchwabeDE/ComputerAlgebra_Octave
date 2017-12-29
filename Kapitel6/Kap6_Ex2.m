source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Ex 6.2 a)
disp("***Ex 6.2 a)\n");

function [a] = calcCoeffTable(f, degree, valueTable)
  vanderA = fliplr(vander(valueTable));
  y = f(valueTable);
  #a is the coefficient table
  a = vanderA \ y';
  
  n = degree + 1;
  a = a(1:n);
end;

disp("\n*********************************************************************");
#Ex 6.2 a)
disp("***Ex 6.2 a)\n");

function [valueTable] = generateValueTable(type, a, b, degree)
  switch type
    case {"E" "e" "equidistant"}
      n = degree;
      stepSize = abs(a-b) / n;
      valueTable = [a:stepSize:b];
    case {"C" "c" "chebyshev"}
      n = degree + 1;
      chebyshev = @(k, n) -cos( ((2*k-1)/n) * (pi/2));
      valueTable = chebyshev([1:n],n);
    otherwise
      error("INVALID VALUETABLE TYPE!");
  end;
end;

#Extra - Calc y from coefficientTable
function [y] = calcYfromCoefficientTable(coefficientTable, x)
  m = rows(coefficientTable);
  y = coefficientTable(1);
  for i = 1 : m - 1
    y += coefficientTable(i.+1) .* (x .** i);
  end;
end;


f = @(x) 1 ./ (1 .+ 25 .* (x .** 2));
degree = 10
valueTable = generateValueTable("equidistant", -1, 1, degree)
coefficientTable = calcCoeffTable(f, degree, valueTable)

x = [-1:0.1:1]
yEqui = calcYfromCoefficientTable(coefficientTable, x)

valueTable = generateValueTable("chebyshev", -1, 1, degree)
coefficientTable = calcCoeffTable(f, degree, valueTable)
yCheb = calcYfromCoefficientTable(coefficientTable, x)

#{
close all;
plot(x,yEqui)
hold on;
plot(x,yCheb)
hold off;
#}

disp("\n*********************************************************************");
#Ex 6.3
disp("***Ex 6.3\n");

#f = @(x) x.**2;
f = @(x) e .**(-x.**2);
degree = 10

#valueTable = [-5:1:5];
valueTable = generateValueTable("equidistant", -2, 10, degree)

coefficientTable = calcCoeffTable(f, degree, valueTable)

disp("\n*********************************************************************");
#Ex 6.4 a)
disp("***Ex 6.4 a)\n");

#f = @(x) x.**2;

degree = 100

#valueTable = [-5:1:5];
valueTable = generateValueTable("equidistant", -2, 10, degree);

coefficientTable = calcCoeffTable(f, degree, valueTable);

y_p = calcYfromCoefficientTable(coefficientTable, valueTable);
y_f = f(valueTable);

devidation_p_f = abs(y_p) .- abs(y_f);
equi_maxNorm_devidation_p_f = norm(devidation_p_f, inf)


disp("\n*********************************************************************");
#Ex 6.4 b)
disp("***Ex 6.4 b)\n");

#f = @(x) x.**2;


valueTable = generateValueTable("chebyshev", -2, 10, degree);

coefficientTable = calcCoeffTable(f, degree, valueTable);

y_p = calcYfromCoefficientTable(coefficientTable, valueTable);
y_f = f(valueTable);

devidation_p_f = abs(y_p) .- abs(y_f);
cheb_maxNorm_devidation_p_f = norm(devidation_p_f, inf)

pkg load symbolic;
syms x
f = e **(-x**2);
t = taylor(f,'expansionPoint', 0, 'order', 10)

t_f = @(x) ((x.**8)./24) - ((x.**6)./6) + ((x.**4)./2) - (x.**2) + 1;
y_t_f = t_f(valueTable);

devidation_t_f = abs(y_t_f) .- abs(y_f);
taylor_maxNorm_devidation_p_f = norm(devidation_t_f, inf)
