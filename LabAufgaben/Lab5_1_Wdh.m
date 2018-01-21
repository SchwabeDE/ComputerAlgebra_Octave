source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Lab 5.1 a)
disp("***Lab 5.1 a)\n");

f_1 = @(x) x;
f_2 = @(x) (1/2).*e.**(-x.**2);

x = [0.418 : 0.001 : 0.42];

#{
plot(x, f_1(x), "k-")
hold on;
plot(x, f_2(x), "r-");
hold off;
#}

# Schnittpunkt: x = 0.419365; y = 0.419365

disp("\n*********************************************************************");
#Lab 5.1 b)
disp("***Lab 5.1 b)\n");

function [x_n] = fixPointIteration(f, a, n)
  x_n = a;
  for i = 1 : n
    x_n = f(x_n)
  end;
end;

fixPointIteration(f_2, 0, 82)

fs_2 = @(x) -x .* e.**(-x.**2);

x = [-5: 0.1 : 5];
ys = abs(fs_2(x));

[min, idxMin] = min(ys)
[max, idxMax] = max(ys)
#plot(x, fs_2(x), "r-")

conInt_a = x(idxMin)
conInt_b = x(idxMax)

disp("\n*********************************************************************");
#Lab 5.1 c)
disp("***Lab 5.1 c)\n");
# zweite Abteitung = 0 -> x = 0.707

disp("\n*********************************************************************");
#Lab 5.1 d)
disp("***Lab 5.1 d)\n");


epsilon = 10**-12
lipschitz = 0.707
x_0 = 0
x_1 = 0.5

k = log( (epsilon*(1-lipschitz)) / abs(x_1 - x_0) ) / log(lipschitz)

disp("\n*********************************************************************");
#Lab 5.1 e)
disp("***Lab 5.1 e)\n");

function [m_k] = intervalBisectionMethod(f, a, b, k)
  for i = 1 : k
    m_k = (1/2)*(a + b);
    
    if(f(m_k) > 0)
      a = m_k;
    elseif(f(m_k) < 0)
      b = m_k;
    else
      disp("ROOT FOUND!");
    end;
  end;
end;

f_adjusted = @(x) (1/2).*e.**(-x.**2) .- x
fs_adjusted = @(x) -x .* e.**(-x.**2) .- 1

iBM = intervalBisectionMethod(f_adjusted, 0, 1, 20)

function [x_k] = newtonsMethod(f, fs, x_init, k)
  x_k = x_init;
  for i = 1 : k
    x_k = x_k - (f(x_k) / fs(x_k));
  end;
end;

nM = newtonsMethod(f_adjusted, fs_adjusted, 0, 20)

