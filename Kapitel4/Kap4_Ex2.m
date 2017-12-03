source("../opt.m");
disp("\n*********************************************************************");
#Ex 4.2 e)
disp("***Ex 4.2 e)\n");

function [x] = pLotto(k)
  x = (nchoosek(6, k) * nchoosek(43, 6 - k)) / nchoosek(49, 6);
endfunction

function [x] = pLottoZusatz(k)
  x =( pLotto(k) * (6-k) /43 );
  #x = (nchoosek(7, k) * nchoosek(42, 7 - k)) / nchoosek(49, 7);
endfunction

function [x] = mittlererGewinn(quote)
  pSuper = 1 / 10;
  
  x = pLotto(6) .* pSuper .* quote(:, 1) .+ \
      pLotto(6) .* (1 - pSuper) .* quote(:, 2) .+ \
      pLottoZusatz(5) .* quote(:, 3) .+ \
      pLotto(5) .* quote(:, 4) .+ \
      pLotto(4) .* quote(:, 5) .+ \
      pLottoZusatz(3) .* quote(:, 6) .+ \
      pLotto(3) .* quote(:, 7);
      
  x = sum(x) / rows(quote);
endfunction
  

Quoten =[4334833.80, 1444944.60, 135463.50, 10478.20, 178.20, 108.70, 11.00;
12085335.80, 1382226.80, 172778.30, 12905.90, 192.30, 82.30, 12.10;
7938655.30, 3291767.70, 141075.70, 11018.40, 157.50, 79.20, 10.10;
3988534.00, 2215852.20, 117309.80, 9537.30, 130.70, 60.80, 8.70;
16141472.80, 7288193.60, 242939.70, 14798.30, 190.10, 87.70, 10.90]


mittlererGewinn(Quoten)