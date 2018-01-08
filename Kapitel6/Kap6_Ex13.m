source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Ex 6.13 c)
disp("***Ex 6.13 c)\n");

data = [8 -16186.1
9 -2810.82
10 773.875
11 7352.34
12 11454.5
13 15143.3
14 13976.
15 15137.1
16 10383.4
17 14471.9
18 8016.53
19 7922.01
20 4638.39
21 3029.29
22 2500.28
23 6543.8
24 3866.37
25 2726.68
26 6916.44
27 8166.62
28 10104.
29 15141.8
30 15940.5
31 19609.5
32 22738.
33 25090.1
34 29882.6
35 31719.7
36 38915.6
37 37402.3
38 41046.6
39 37451.1
40 37332.2
41 29999.8
42 24818.1
43 10571.6
44 1589.82
45 -17641.9
46 -37150.2];


function [coeffList] = detCoeffFuncLSQ(tableDP, baseFunctions)
  x = tableDP(:,1);
  y = tableDP(:,2);
  
  for n = 1 : length(baseFunctions)
    for m = 1 : length(baseFunctions)
      A(n,m) = sum(baseFunctions{n}(x) .* baseFunctions{m}(x));
    end;
    b(n) = sum(y .* baseFunctions{n}(x));
  end;
  coeffList = A\b';

  #{
  f_a = @(a1, a2, x) (a1./x.**2) .+ (a2./(x.-9).**2)

  xf = [0 : 1 : 9]
  yf = f_a(a(1),a(2), xf)
  #}
end;


baseFunctions = {@(x)x.**4, @(x)x.**3, @(x)x.**2, @(x)x.**1, @(x)x.**0};

a = detCoeffFuncLSQ(data, baseFunctions)

x = data(:,1);
y = data(:,2);

function [y] = yf(baseFunctions, a, xf)
  y = 0;
  for i = 1 : length(baseFunctions)
    y += baseFunctions{i}(xf) * a(i);
  end;
end;
    
   
xf = x;    
yf = yf(baseFunctions, a, xf)

plot(x, y, "k*");
hold on;
plot(xf, yf, "r-");
hold off;

