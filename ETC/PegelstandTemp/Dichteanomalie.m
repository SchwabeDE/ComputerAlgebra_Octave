format short; more off; clc; clear;
graphics_toolkit gnuplot;

#Virialgleichung für luftfreies Wasser
function [d_lf] = dichteLF(t)
  a_0 = 999.83952;
  a_1 = 16.952577;
  a_2 = -7.9905127*10**-3;
  a_3 = -4.6241757*10**5;
  a_4 = 1.0584601*10**-7;
  a_5 = -2.8103006*10**-10;
  b = 0.0168872;
  
  d_lf = (a_0 .+ a_1 .* t .+ a_2 .* t .**2 .+ a_3 .* t .**3 .+ a_4 .* t .**4 .+ a_5 .* t .**5) ./ (1 .+ b .* t);
  #Umrechnung von g/l nach kg/m³ 
  #d_lf = d_lf * 10**-6;
end;

gradC = [0 : 0.5 : 30];
d_LF = dichteLF(gradC)

#plot(gradC, d_LF)

gradC_10 = dichteLF(10)
gradC_20 = dichteLF(20)


#calcB = @(t) 1.6 * 10**-5 * 9.6 * 10**-6 * t;
calcB = @(t) 1.6 * 10**-5 + 9.6 * 10**-6 * t;

b = calcB(40)


#------------------
#Funkapprox. basierend auf Thermal expansion coefficient-Werten von: 
#https://www.engineeringtoolbox.com/water-density-specific-weight-d_595.html
#
clear;
gradC = [0 : 1 : 30];
#b_func = @(t) -0.39771 .+ 0.11568 .* t;
#b_func = @(t) -0.57351 .+ 0.13139 .* t;
#b_func = @(t) 1.3139e-005 * t -5.7351e-005

#Optimiert für 4 bis 20°C
b_func = @(t) 1.2924e-005 * t -4.6742e-005

b = b_func(gradC)

#plot(gradC,b)
b_func(20)
