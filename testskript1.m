X = linspace(-100,100,10);
Y = linspace(-100,100,10);
[ XX, YY ] = meshgrid(X,Y);

ZZ1 = XX + 2 * YY - 6;
#ZZ2 = 4/3 - 2/3 * XX + 1/3 *YY;

figure;
hold on;
mesh(XX,YY,ZZ1);
#mesh(XX,YY,ZZ2);