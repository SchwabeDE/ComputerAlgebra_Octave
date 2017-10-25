clc;

#Ex 2.3 a)
printf ("***Ex 2.3 a)\n");

function [ret] = finiteGeometricSeries(q, n)
  if q == 1,
    disp("q cannot be 1 -> Div by zero!");
    break;
  end;
  ret = (1 - (q ** (n + 1))) / (1 - q);
endfunction
finiteGeometricSeries(2,2)

#Ex 2.3 b)
 
#An infinite geometric series converges if its common ratio q satisfies –1 < q < 1. 
#=> Otherwise it diverges.
printf ("***Ex 2.3 b)\n");

function [ret] = infiniteGeometricSeries(q)
  if -1 < q && q < 1,
    #disp("The infinite geometric series CONVERGES!\n");
    ret = 1 / (1 - q);
  else
    disp("The infinite geometric series DIVERGES!\nCannot apply formula..");
    ret = nan;
  end;
endfunction

for i = -1 : 0.1 : 1
  printf("q = %f => %f\n", i, infiniteGeometricSeries(i))
end;