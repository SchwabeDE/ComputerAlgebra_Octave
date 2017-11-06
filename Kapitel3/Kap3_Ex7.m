source("../opt.m");
#Ex 3.7
disp("***Ex 3.7\n");

#Ex 3.7 a)
disp("***Ex 3.7 a)\n");

sum = 0;
for n = 1 : 60
  partSum = (n + 1) * (2 ** -n);
  sum += partSum
end;

disp("\n*********************************************************************");
#Ex 3.7 b)
disp("***Ex 3.7 b)\n");

sum = 0;
for n = 0 : 100
  partSum = (4 ** n) * factorial(n + 1) * (n ** -n)
  sum += partSum
end;

disp("\n*********************************************************************");
#Ex 3.7 c)
disp("***Ex 3.7 c)\n");

sum = 0;
for n = 0 : 15
  partSum = (3 * n) * ((4 + (1 / n)) ** -n)
  sum += partSum
end;