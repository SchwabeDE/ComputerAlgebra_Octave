format short; more off; clc; clear;
graphics_toolkit gnuplot;

#Ermittlung einer Funktion für den Wärmeausdehnungskoeffizienten 

x = [0.1
1
4
10
15
20
25
30
35
40]

y = [-0.68
-0.50
0.003
0.88
1.51
2.07
2.57
3.03
3.45
3.84].*10**-4

bf_1 = x.**2;
bf_2 = x.**1;
bf_3 = x.**0;

A = [sum(bf_1 .* bf_1) sum(bf_1 .* bf_2) sum(bf_1 .* bf_3);
     sum(bf_2 .* bf_1) sum(bf_2 .* bf_2) sum(bf_2 .* bf_3);
     sum(bf_3 .* bf_1) sum(bf_3 .* bf_2) sum(bf_3 .* bf_3)]
b = [sum(y .* bf_1); sum(y .* bf_2); sum(y .* bf_3)]

#Berechnung von a mithilfe der Pseudoinversen 
#(benötigt für überdeterminiertes System)
a = inv(A'*A)*A'*b

f_a = @(x) a(1).*x.**2 + a(2).*x.**1 + a(3).*x.**0

xf = [min(x): 0.1 : max(x)];
yf = f_a(xf);

f_a(20)

#Plot
plot(x,y,"k*", 'MarkerSize',6);
xlabel('Grad in Celsius'); 
ylabel('Wärmeausdehnungskoeffizent ß'); 

hold on;
plot(xf,yf,"r-");
legend('Tabellenwerte', 'Regressionsfunktion', 4)
title ("Regressionsfunktion: ß in Abhängigkeit der Temp in °C")

grid on;
grid minor on;
axis("normal")

#xL = get(gca,'XLim');
#line (xL,[0 0], "linestyle", ":", "color", "k");
hold off;