clc, clear;
abs = load('absorvancia_solucion.txt');
trans = load('transmitancia_solucion.txt');
espectro = dlmread('espectro_absorp_hemoglobina.txt');

plot(abs);
hold on
plot(trans);
hold off;

figure;
lambda = espectro(1);
hb02 = espectro(2);
hb = espectro(3);


plot(lambda, hb02);
hold on
plot(lambda, hb);
hold off