source("../opt.m");
disp("\n*********************************************************************");
#Lab Ex 4.1 a)
disp("***Lab Ex 4.1 a)\n");


function [ret] = getBitsFromLcg(x,a,b,m, numbers)
  lcg = @(x, a, b, m) mod(a * x + b, m);
  
  ret = [''];
  lastX = x;
  for i = 1 : numbers
    lastX = lcg(lastX,a,b,m);
    ret = [ret dec2bin(lastX)];
  end;
end;

function [testPassed, ratio] = symmetryTest(bitlist)
  zeros = 0;
  for i = 1 : length(bitlist)
    if(bitlist(i) == '0')
      zeros += 1;
    end;
  end;
  ratio = zeros / length(bitlist);
  stdDev = 1 / (2 * sqrt(length(bitlist)))
  expVal = 0.5;
  if(expVal - 2*stdDev <= ratio && ratio <= expVal + 2*stdDev)
    testPassed = true;
  else
    testPassed = false;
  end;  
end;

function [filteredBitlist] = vonNeumannFilter(bitlist)
  filteredBitlist = [''];
  if(mod(length(bitlist), 2) == 0)
    listEnd = length(bitlist);
  else
    listEnd = length(bitlist) - 1;
  end;
  
  for i = 1 : 2 : listEnd
    twoBit = bitlist(i:i+1);
    if(twoBit == '01')
      filteredBitlist = [filteredBitlist '0'];
    elseif(twoBit == '10')
      filteredBitlist = [filteredBitlist '1'];
    end;
  end;
end;


a = 7141;
b = 54773;
m = 259200;

SEED = 5;
NUMBERS = 10;

bitlist = getBitsFromLcg(SEED, a, b, m, NUMBERS)

#bitlist = '1111111101111111101111111111000001111111100000011111111110000000000000000000000011111111111111000'
#bitlist = '10001000001111101010100000000101010100000100001011010101010111101000000010000000011001'

[testResult, testRatio] = symmetryTest(vonNeumannFilter(bitlist))