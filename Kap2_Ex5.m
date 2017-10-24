clc;
format short;

x = [4,1,6,10,-4,12,0.1]
y = [-1,4,3,10,-9,15,-2.1]

i = 1;
j = 1;

#Ex 2.5 a)
printf ("***Ex 2.5 a)\n");
a = x(i) * y(j)

#Ex 2.5 b)
printf ("***Ex 2.5 b)\n");
b = x(i) / y(j)

#Ex 2.5 c)
printf ("***Ex 2.5 c)\n");
disp("Variant 1");
c1 = x .* y
disp("Variant 2");
c2 = [];
for i = 1 : columns(x),
  c2 = [c2 (x(i) * y(i))];
end;
c2

#Ex 2.5 d)
printf ("***Ex 2.5 d)\n");
d = x(i) / (2 + x(i) + y(j))

#Ex 2.5 e)
printf ("***Ex 2.5 e)\n");
sort(x, "ascend")
sort(y, "ascend")
e = sort(x, "ascend") .* sort(y, "ascend")

#Ex 2.5 f)
printf ("***Ex 2.5 f)\n");
fliplr(x)
fliplr(y)