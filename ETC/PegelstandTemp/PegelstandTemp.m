format short; more off; clc; clear;
graphics_toolkit gnuplot;

dH_funk = @(h, dT) 0.21 .* h .* dT;

#L�nge des Schutzrohres konstant bei 1m
h = 1;
#Delta Temperatur�nderung in Grad Kelvin
dT = [0: 0.5 : 30];
#Delta H�hen�nderung des Wasserpegels im Schutzrohres in mm
dH = dH_funk(h, dT)

#plot(dT, dH)