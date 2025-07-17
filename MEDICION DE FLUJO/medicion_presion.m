clc, clear, close all;
% Obtención de los datos
data = load("presion.txt");

Ts = 0.02;
Fs = 1/Ts;

t = 0 : Ts : length(data)/Fs - Ts;

presion(1) = 0;

for i = 1 : length(data)
    presion(i) = 167*data(i) - 101.85;
end

subplot(1, 2, 1);
plot(t, data);
title("Presión en forma de voltaje");
xlabel("Tiempo [s]");
ylabel("Voltaje [V]");

subplot(1, 2, 2);
plot(t, presion);
title("Presion");
xlabel("Tiempo [s]");
ylabel("Presión [cmH20]");