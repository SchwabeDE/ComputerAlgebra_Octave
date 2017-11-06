source("../opt.m");
#Ex 3.5
disp("***Ex 3.5\n");

sum = 0;
for n = 0 : 100
   sum += 1 / (2 ** n)
end;
