clc;
format long;
#Ex 2.6
printf ("***Ex 2.6\n");

function [x] = squareroot(number, xPrev, limit)
    if limit == 0,
        break;
    end;
    x = (1 / 2) * (xPrev + (number / xPrev))
    squareroot(number, x, limit - 1);
endfunction;

squareroot(5, 2, 40);