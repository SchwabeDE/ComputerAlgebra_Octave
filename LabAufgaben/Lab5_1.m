source("../opt.m");
graphics_toolkit gnuplot;
pkg load symbolic;
disp("\n*********************************************************************");
#Lab 5.1 a)
disp("***Lab 5.1 a)\n");

f_1 = @(x) (e.**(-x.**2)) / 2;
f_2 = @(x) x;

syms x

#fs_1 = diff(f_1)
#fs_2 = diff(f_2)

#{
fs_1 = @(x) -x .* e.**(-x.**2)
fs_2 = @(x) 1;
#}


#{
stepsize = [-10:1:10];
f_1(stepsize)
close all;
plot(stepsize,f_1(stepsize))
hold on;
plot(stepsize,f_2(stepsize));
hold off;
#}

#Lab 5.1 e)
disp("***Lab 5.1 e)\n");

function [result] = fixedPointIteration(f, startValue, steps)
  result = startValue;
  for i = 1 : steps
    result = f(result);
  end;
end;

function [m] = intervalBisectionMethod(f, a, b, theshold)
  steps = 0;
  while(theshold > steps)
    m = (1/2) * (a + b);
    if(f(m) < 0)
      a = m;
    elseif(f(m) > 0)
      b = m;
    else
      break;
    end;
    steps += 1;
  end;
  if(theshold == steps)
    disp("CANNOT FIND ROOT IN INTERVAL!");
    m = 0;
  end;
end;
      

fpiResult = fixedPointIteration(f_1,5,10)

ibmResult = intervalBisectionMethod(f_2, -5, 5, 50)

