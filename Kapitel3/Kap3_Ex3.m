clc;
format long;
#Ex 3.3
disp("***Ex 3.3\n");

function ret = calcLimitSequence(itLim)
  if itLim <= 0
    ret = 1;
    break;
  end;
  ret = 1 + (1 / calcLimitSequence(itLim - 1));
endfunction;
for i = 0 : 40
  calcLimitSequence(i)
end;