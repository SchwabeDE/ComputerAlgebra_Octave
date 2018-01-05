source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Ex 6.9
disp("***Ex 6.9\n");

#Tridiagonal algorithm (b -> maindiagonal)
function [x] = tridiagonalAlgorithm(b, c, d)

  n = length(b);
  
  #Elimination
  for k = 2 : n
    m = c(k-1) / b(k-1);
    b(k) = b(k) - m * c(k-1);
    d(k) = d(k) - m * d(k-1);
  end;

  x(n) = d(n) / b(n);  #Addition to the skript algorithm
  #Backward substitution
  for k = n - 1 : -1 : 1
    d(n) = d(n) / b(n);
    d(k) = (d(k) - c(k)*d(k+1)) / b(k);
    x(k) = d(k);
  end;
  x = x';
end;


function [a,b,c,d, yListInterpol] = naturalSplineInterpolation(valueTable_xy, xListForInterpol)
  
  i = rows(valueTable_xy)
  n = i - 1
  
  #extract x and y
  x = valueTable_xy(:,1)
  y = valueTable_xy(:,2)
  
  #calculate h
  for i = 1 : rows(valueTable_xy) - 1
    h(i) = x(i+1) - x(i);
  end;
  
  #calculate b and c (neccessary for the tridiagonalAlgorithm)
  for i = 1 : n - 1
    b_diag(i) = 2 * (h(i) + h(i+1));
  end;
  c_diag = h(2:end-1);
  
  #calculate r
  for i = 2 : n
    r(i) = (6/h(i)) * (y(i+1) - y(i)) - (6/h(i-1)) * (y(i) - y(i-1));
  end;
  r = r(2:end)
  
  y_2der = tridiagonalAlgorithm(b_diag, c_diag, r);
  #y_2der_0 and y_2der_n must be zero for the natural spline
  y_2der = [0; y_2der; 0]
  
  #calculate a, b, c and d
  a = [];
  b = [];
  c = [];
  d = [];
  for i = 1 : n
    a = [a 1/(6*h(i)) * (y_2der(i+1)-y_2der(i))];
    b = [b (1/2) * y_2der(i)];
    c = [c (1/h(i)) * (y(i+1)-y(i)) - (h(i)/6) * (y_2der(i+1) + 2*y_2der(i))];
    d = [d y(i)];
  end;
  
  #spline function
  s_f = @(x, x_i, a_i, b_i, c_i, d_i) a_i*(x-x_i)**3 + b_i*(x-x_i)**2 + c_i*(x-x_i) + d_i;
  
  #list of interpolated y values
  yListInterpol = [];
  for idx = 1 : length(xListForInterpol)
    
    #get x from x-interpolation list and lookup the matching intervall (represented by i)
    x_interpol = xListForInterpol(idx);
    i = lookup(x, x_interpol);
    
    if(i < length(x))
      yListInterpol = [yListInterpol s_f(x_interpol, x(i), a(i), b(i), c(i), d(i))];
    #return the last known y-point (prevents out of bounds)
    elseif(i == length(x))
      yListInterpol = [yListInterpol y(end)]
    end;
  end;
end;

valueTable_xy = [0 0; 1 1; 2 0; 3 1]
xListForInterpol = [0 : 0.05 : 3];
[a, b, c, d, yListInterpol] = naturalSplineInterpolation(valueTable_xy, xListForInterpol)

#{
plot(xListForInterpol, yListInterpol)
hold on;
plot(valueTable_xy(:,1), valueTable_xy(:,2))
hold off;
#}

disp("\n*********************************************************************");
#Ex 6.10
disp("***Ex 6.10\n");

f = @(x) e.**(-x.**2);

n = 11;
a = -2;
b = 10;
stepSize = abs(a-b) / (n-1);
x = [a:stepSize:b]
xListForInterpol = [a : 0.1 : b];
y = f(x)

valueTable_xy = [x' y']
[a, b, c, d, yListInterpol] = naturalSplineInterpolation(valueTable_xy, xListForInterpol)

plot(xListForInterpol, yListInterpol)
hold on;
plot(valueTable_xy(:,1), valueTable_xy(:,2))
hold off;