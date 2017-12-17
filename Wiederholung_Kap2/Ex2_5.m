clc;
format short;

x = [4 1 6 10 -4 12 0.1]
y = [-1 4 3 10 -9 15 -2.1]

#a)
function [a] = calcA(x,y)
  for i = 1 : length(x)
    for j = 1 : length(y)
      a(i,j) = x(i) * y(j);
    end;
  end;
end;

A = calcA(x,y)

#b)

function [b] = calcB(x,y)
  for i = 1 : length(x)
    for j = 1 : length(y)
      b(i,j) = x(i) / y(j);
    end;
  end;
end;

B = calcB(x,y)

#c

function [c] = calcC(x,y)
  c = 0;
  for i = 1 : length(x)
    for j = 1 : length(y)
      c += x(i) * y(j);
    end;
  end;
end;

C1 = calcC(x,y)
C2 = sum(sum(calcA(x,y)))

#d

function [d] = calcD(x,y)
  for i = 1 : length(x)
    for j = 1 : length(y)
      d(i,j) = x(i) / (2+x(i)+y(j));
    end;
  end;
end;

D = calcD(x,y)

#e

function [e] = calcE(x,y)
  sortedX = sort(x, "ascend");
  sortedY = sort(y, "ascend");
  
  for i = 1 : length(x)
    for j = 1 : length(y)
      e(i,j) = sortedX(i) * sortedY(j);
    end;
  end;
end;

E = calcE(x,y)

#f
fliplr(x)
fliplr(y)
