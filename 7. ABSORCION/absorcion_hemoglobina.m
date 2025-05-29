clc, clear, close all;
datos = readtable('medidas_hbo2_hb.csv');

head(datos);
disp(head(datos));

lambda = datos.lambda;
hbo2 = datos.Hb02;
hb = datos.Hb;

plot(lambda, hbo2);
hold on
plot(lambda, hb);
title("Oxihemoglobina, Hemoglobina vs lambda");
xlabel("Lambda [nm]");
ylabel("Epsilon [cm^-1/M]");
hold off