clc, clear, close all;

% 1. En función al archivo de excel, se debe calcular el coeficiente de
% extinción y gráficar este mismo para compararlo con las gráficas del
% archivo de texto para determinar a que tipo de sustancia pertenece la
% absorbancia del .xlxs.

% 2. Considerar un c = 2.27m/M
% 3. Distancia l = 1cm

datos = readtable('medidas_hbo2_hb.csv');

head(datos);
disp(head(datos));

lambda = datos.lambda;
hbo2 = datos.Hb02;
hb = datos.Hb;

inicio = 1;
fin = 375;

% Concentracion(cm^-1M ^-1)
c = 27.7e-3;

plot(lambda, hbo2);
hold on
plot(lambda, hb);
title("Oxihemoglobina, Hemoglobina vs lambda");
xlabel("Lambda [nm]");
ylabel("Epsilon [cm^-1/M]");
hold off