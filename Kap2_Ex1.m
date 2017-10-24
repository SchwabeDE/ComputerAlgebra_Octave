clc;

#Ex 2.1 a)
printf ("***Ex 2.1 a)\n")
function [ret] = factorial (x)
    ret = 1;
    for i = 1 : x,
      ret *= i;
    end;
endfunction;
factorial(6)

#Ex 2.1 b)
printf ("***Ex 2.1 b)\n")
function [ret] = facrec(n)
    if n > 1,
        ret = n * facrec(n - 1);
    elseif n == 1,
        ret = 1;
    end;
endfunction;
facrec(6)

#Ex 2.1 c)
printf ("***Ex 2.1 c)\n")
function [ret] = fibonacci(n)
    if n > 1,
      ret = fibonacci(n - 1) + fibonacci(n - 2);
    elseif n == 1 || n == 0,
       ret = 1;
    end;
endfunction;
for i = 1 : 20,
    printf("%d. Fib = %d\n" ,i ,fibonacci(i));
end;

#Ex 2.1 d)
printf ("***Ex 2.1 d)\n")
tic();
t = [];
for i = 1 : 20,
    fibonacci(i);
    t = [t toc()];
end;

plot(t, "r");
title("Fibonacci Execution Speed");
xlabel("n");
ylabel("t in s");