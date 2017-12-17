source("../opt.m");
disp("\n*********************************************************************");
#Von Neumann Filter and Symmetry Test
disp("***Von Neumann Filter and Symmetry Test\n");
BYTES = 800;


function [bitlist] = generateBitlist(len)
  A = round(rand(8 * len,1));
  bit = dec2bin(A);
  bitlist = [''];
  for i = 1 : rows(bit)
    bitlist = [bitlist bit(i,:)];
  end;
end;
bitlist = generateBitlist(BYTES)

function [ratio] = symmetryTest(bitlist)    
  zeroBits = 0;
  for i = 1 : length(bitlist)
    if(bitlist(i) == '0')
      zeroBits += 1;
    end;
  end;
  zeroBits;
  ratio = zeroBits / length(bitlist);
end;
symmetryRatio = symmetryTest(bitlist)

function [symmetricBitlist] = vonNeumannFilter(bitlist)
  symmetricBitlist = [''];
  discarded = 0;
  for i = 1 : 2 : length(bitlist)
    doubleBits = bitlist(i:i+1);
    if(doubleBits == '00' || doubleBits == '11');
      discarded += 1;
    elseif(doubleBits == '01')
      symmetricBitlist = [symmetricBitlist '0'];
    elseif(doubleBits == '10')
      symmetricBitlist = [symmetricBitlist '1'];
    else
      disp("Wrong input");
    end;
  end;
end;

symmetricBitlist = vonNeumannFilter(bitlist)
symmetryRatioAfterVonNeumann = symmetryTest(symmetricBitlist)

%!test 
assert (length(generateBitlist(2)), 16)