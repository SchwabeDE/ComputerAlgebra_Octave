function [coeffList] = detCoeffFuncLSQ(tableDP, baseFunctions)
  x = tableDP(:,1);
  y = tableDP(:,2);
  
  for n = 1 : length(baseFunctions)
    for m = 1 : length(baseFunctions)
      A(n,m) = sum(baseFunctions{n}(x) .* baseFunctions{m}(x));
    end;
    b(n) = sum(y .* baseFunctions{n}(x));
  end;
  coeffList = A\b';
end;