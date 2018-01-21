source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Ex 7.1 a)
disp("***Ex 7.1 a)\n");

#f_unitCircle = @(x,y) x.**2 .+ y.**2

f_unitCircle = @(x) sqrt(1.-x.**2)

function [area] = naiveMonteCarloUnitCircle(f_unitCircle, randX, randY, B, H)
  f_values = f_unitCircle(randX);

  
  numberHitsUnderCurve = sum(f_values >= randY);
  numberHitsInsideRectangle = length(f_values);
  
  area = numberHitsUnderCurve / numberHitsInsideRectangle * B * H;
end;

randNumbers = 50000000;
#randNumbers = 10;
randX = rand(randNumbers,1);
randY = rand(randNumbers,1);

B = 2
H = 2

nMCUC = naiveMonteCarloUnitCircle(f_unitCircle, randX, randY, B, H)

function [area] = meanMonteCarloUnitCircle(f_unitCircle, randX, a, b)
  f_values = f_unitCircle(randX);
  
  area = ( (b - a) / length(f_values) ) * sum(f_values);
end;

a = -1
b = 1

grid = [-1 : 0.0001: 1];

mMCUC = meanMonteCarloUnitCircle(f_unitCircle, randX, a, b) * 2