clc;
format long;
#Ex 3.2
disp("***Ex 3.2\n");

function ret = calcSqrtSequence(itLim)
  if itLim <= 0
    ret = 1;
    break;
  end;
  ret = sqrt(1 + calcSqrtSequence(itLim - 1));
endfunction

for i = 0 : 40
  calcSqrtSequence(i)
end;