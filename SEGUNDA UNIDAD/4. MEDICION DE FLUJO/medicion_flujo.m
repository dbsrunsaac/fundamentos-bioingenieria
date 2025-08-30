clc, clear, close all;

% Importar los datos
data = load("flujo.txt");

Ts = 0.02;
Fs = 1/Ts;

t = 0 : Ts : length(data)/Fs - Ts;

% Relación entre voltaje y flujo (mediante la hoja de datos del ventilador)
% Para este proceso el ventilador cuenta con una curva lineal (recta) para
% encontrar las equivalencias
disp(length(t));
disp(length(data));


flujo(1) = 0;
for i = 1 : length(data)
    flujo(i) = 5*(data(i) - 1)*1000/60;
end

% Obtención del volumen
volumen = trapz(t(1:62), flujo(1:62));
disp(volumen);

figure;
subplot(1, 2, 1);
plot(t, data);
title("Flujo expresado en Voltaje");
xlabel("Tiempo [s]");
ylabel("Voltaje [V]");

subplot(1, 2, 2);
plot(t, flujo);
title("Flujo");
xlabel("Tiempo [s]"),
ylabel("Flujo [mL/s]");


figure
plot(flujo, data);
title("Voltaje - Flujo de aire");
xlabel("Flujo [mL/s]");
ylabel("Voltaje [V]");
