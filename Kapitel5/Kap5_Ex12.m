source("../opt.m");
disp("\n*********************************************************************");
#Ex 5.12
disp("***Ex 5.12\n");

function [currPoint] = intervalBisection(f, aInit, bInit, threshold)
  a = aInit;
  b = bInit;
  
  rounds = 0;
 
  do
    rounds += 1;
  
    m = (1/2) * (a + b);
    currPoint = f(m)
    
    if(f(m) < 0)
      a = m;
    elseif(f(m) > 0)
      b = m;
    else
      disp("Root found!")
    end
  until(f(m) == 0 || threshold <= rounds )
endfunction

function [ret] = f(x)
  if(x == 1 || x == -1)
    x = 1;
  end
  ret = (x*(1-x)) / (1- x**2);
endfunction
  
  
result = intervalBisection(@f, -4, -1/2, 150)

xResults = [];
for x = -50 : 10
  xResults = [xResults f(x)];
end

#plot(xResults)