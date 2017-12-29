format short; more off; clc; clear;
graphics_toolkit gnuplot;

#Wärmeausdehnungskoeffiziententabelle von: 
#https://www.engineeringtoolbox.com/water-density-specific-weight-d_595.html

#Grad in Celsius
x = [4 10 15 20]'
#Wärmeausdehnungskoeffizent
y = [0.003 0.88 1.51 2.07]' .* (10**-4)

% Create a function to plot the data
function plotData(x,y)
plot(x,y,'rx','MarkerSize',8); % Plot the data
end
% Plot the data
plotData(x,y);
xlabel('Grad in Celsius'); % Set the x-axis label
ylabel('Wärmeausdehnungskoeffizent beta'); % Set the y-axis label
#fprintf('Program paused. Press enter to continue.\n');
#pause;

m = length(x);
X = [ones(m, 1) x]

theta = (pinv(X'*X))*X'*y
#ERGEBNIS: y =  1.3139e-005 * x -5.7351e-005

% Plot the fitted equation we got from the regression
hold on; % this keeps our previous plot of the training data visible
plot(X(:,2), X*theta, '-')
legend('Gegebene Werte', 'Lineare Regression')
title ("Funktion von beta")
hold off % Don't put any more plots on this figure