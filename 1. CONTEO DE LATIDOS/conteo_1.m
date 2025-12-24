clc, clear, close all;
% 1. Lectura de datos 
data = readmatrix('espino-fotopletismografia.csv');

% 2. Separación de valores
datos_espino = data(1:12001, 3);

% 3. Graficar los 30 primeros segundos
% 3.a Escala de tiempo

fs = 100;
t = 0 : 1/fs : ( length(datos_espino) - 1 )/fs;

plot(t, datos_espino);
title("Muestra total");
xlabel("Tiempo [s]");
ylabel("Wave [Arb]");

% 3.b 30 seg
datos_30seg = datos_espino(1:3000);


