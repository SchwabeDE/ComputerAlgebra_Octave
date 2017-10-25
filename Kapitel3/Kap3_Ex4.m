source("../opt.m");
#Ex 3.4
disp("***Ex 3.4\n");
tic();
sum = 0;
for n = 1 : (5000000 * 60)  #aprox. 6 min -> 20.0965086991896
  sum += 1 / n;
  #printf("n = %d -> %f\n", n, sum);
end;
sum
toc();