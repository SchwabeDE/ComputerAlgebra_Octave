source("../opt.m");
graphics_toolkit gnuplot;
disp("\n*********************************************************************");
#Ex 6.12
disp("***Ex 6.12\n");

#{
x = [7.38, 5.86, 2.46, 6.66, 0.83, 6.26, 6.61, 7.29, 8.91, 9.82];
y = [11.89, 2.01, 4.54, 7.26, 1.61, 3.99, 7.16, 11.17, 10.44, 1.97];
z=x.^2/3; w=x.*sin(x);  % define transformed variables in x
A=[x.' z.' w.'];        % build system matrix
b=A\y.'                 % solve the system

plot(x,y,'*')
xh=[1:0.1:10]  ;      % define the desired output points
zh=[xh; xh.^2/3; xh.*sin(xh)];  % and the transformed variable array from them
yh=b.'*zh         % evaluate the fit at those points

hold on
plot(xh,yh,'b-')
hold off
#}

#Ansatz #1 aus oberem Beispiel
x = [1 2 7 8]
y = [6 1 2 4]

c = 1 ./ (x.**2)
d = 1 ./ ((x.-9).**2)
A = [c' d']
b = A\y'


#plot(x,y,'*')

xh = [0 : 1 : 9]
zh = [1 ./ (xh.**2); 1 ./ ((xh.-9).**2) ]
yh = b' * zh
#{
hold on
plot(xh,yh,'b-')
hold off
#}

#Ansatz #2 aus Skript S.135
e = 1 ./ (x.**2)  #Basefunction 1
f = 1 ./ ((x.-9).**2) #Basefunction 2

A = [sum(e .* e) sum(e .* f); sum(e .* f) sum(f .* f)]
b = [sum(y .* e); sum(y .* f)]
a = A\b

f_a = @(a1, a2, x) (a1./x.**2) .+ (a2./(x.-9).**2)

xf = [0 : 1 : 9]
yf = f_a(a(1),a(2), xf)

plot(x,y,'k*')
hold on
plot(xf,yf,'b-')
plot(xh,yh,'c--')
hold off
