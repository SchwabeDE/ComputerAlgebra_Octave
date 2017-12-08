source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Ex 5.12
disp("***Ex 5.12\n");


function [m] = intervalBisection(f, aInit, bInit, threshold)
  a = aInit;
  b = bInit;
  
  rounds = 0;
 
  do
    rounds += 1;
  
    m = (1/2) * (a + b);
    currPoint = f(m)
    
    if(currPoint < 0)
      a = m;
    elseif(currPoint > 0)
      b = m;
    else
      printf("Root found after %d Iterations!\n", rounds);
    end
  until(currPoint == 0 || threshold <= rounds )
endfunction

#{
function [ret] = f(x)
  if(x == 1 || x == -1)
    x = 1;
  end
  ret = (x*(1-x)) / (1- x**2);
endfunction
#}

function [ret] = f(x)
  ret = x - 2;
endfunction

  
a = -4;
b = 4;
result = intervalBisection(@f, a, b, 150)

xPlot = [];
yPlot = [];
for x = - 10 : 1 : 10
  xPlot = [xPlot x];
  yPlot = [yPlot f(x)];
end

xPlot
yPlot

plot(xPlot, yPlot);
grid on;
grid minor on;

refresh;
refreshdata;