source("../opt.m");
graphics_toolkit gnuplot;
pkg load symbolic;
disp("\n*********************************************************************");
#Lab 5.1 a)
disp("***Lab 5.1 a)\n");

f_1 = @(x) (e.**(-x.**2)) / 2;
f_2 = @(x) x;

#syms x

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

function [mk] = intervalBisectionMethod(f, a, b, theshold)
  if(f(a) * f(b) < 0)
    for i = 1 : theshold
      mk = (1/2) * (a + b)
      if(f(mk) == 0)
        break;
      elseif(f(mk) > 0)
        a = mk;
      elseif(f(mk) < 0)
        b = mk;
      end;
    end;
  else
    disp("CANNOT USE INTERVAL BISECTION METHOD");
  end;
end;

function [xNew] = newtonsMethod(f, fs, x, maxK)
  for k = 1 : maxK
    xNew = x - (f(x) / fs(x));
    x = xNew;
  end;
end;
      

fpiResult = fixedPointIteration(f_1,5,10)

f_adjust = @(x) ((e.**(-x.**2)) / 2) - x;
fs_adjust = @(x) -x * (e**(-x**2)) - 1;

ibmResult = intervalBisectionMethod(f_adjust, 0, 2, 50)

syms x
f_symbolic = ((e.**(-x.**2)) / 2) - x;
fs_symbolic = diff(f_symbolic)
dfh = function_handle (fs_symbolic)
dfh(5)


nmResult = newtonsMethod(function_handle(f_symbolic), function_handle(fs_symbolic), 5, 10)


