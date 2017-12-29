format short; more off; clc; clear;
graphics_toolkit gnuplot;

dH_funk = @(h, b, dT) h .* b .* dT;

#Länge des Schutzrohres konstant bei 1m
h = 1;
#Ausdehnungskoeffizent beta
b = 0.88 * 10 ** -4
#Delta Temperaturänderung in Grad Kelvin
dT = [0: 0.5 : 30];
#Delta Höhenänderung des Wasserpegels im Schutzrohres in mm
dH = dH_funk(h, b, dT)

#plot(dT, dH)

dH_1 = mean(dH_funk(h, 0.88 * 10 ** -4, dT))
dH_2 = mean(dH_funk(h, 3.85 * 10 ** -4, dT))
delta = dH_2 - dH_1

mittel = mean([dH_1 dH_2])

abweichung = delta - mittel

prozAbweichung = abweichung / mittel
