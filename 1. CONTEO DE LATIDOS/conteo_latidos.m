clc, clear, close all;
% 1. Lectura de datos y separación
data = readmatrix('espino-fotopletismografia.csv');

% 2. Separación de valores
datos_espino = data(1:12001, 3);

% Variables para la lectura 
% Frecuencia de muestreo
fs = 100;
t = 0 : 1/fs : length(datos_espino)/fs - 1/fs;

disp(length(t));
disp(length(datos_espino));

disp( length(datos_espino)/fs);
% a. Gráfica general
figure;
plot(t, datos_espino);
title("Muestra completa");
xlabel("Tiempo [s]");
ylabel("Unidades [Arb]");

% 3. Gráfica de los primeros 30 segundos
figure;
data_30_seg = datos_espino(1:3000);
t = 0 : 1/fs : length(data_30_seg)/fs - 1/fs;
plot(t(), datos_espino(1:3000));
title("Señal - Muestra de 30seg");

% 4. Filtro pasa altos butterworth
t = 0 : 1/fs : length(datos_espino)/fs - 1/fs;
fc = 0.05;
wn = fc/(fs/2);
[b, a] = butter(4, wn, 'high');
datos_high = filtfilt(b, a, datos_espino);

% 4.1 Gráficando la salida despues del filtro
figure;
plot(t, datos_high);
title("Señal - filtro pasa alto");

% 5. Valor medio de la señal
valor_medio = mean(datos_espino);
disp(["El valor medio es:", valor_medio]);

% 6. Señal sin el valor medio
datos_ac = datos_espino - valor_medio;

figure;
t = 0 : 1/fs : length(datos_ac)/fs - 1/fs;
plot(t, datos_ac);
title("Señal sin componente DC");

% 7. Filtro pasa alto - Señal sin componente DC
% 8. Variación en la frecuencia de corte para el filtro pasa alto
fc = 0.3;
wn = fc/(fs/2);
[b, a] = butter(4, wn, 'high');
datos_ac_high = filtfilt(b, a, datos_ac);

% 7.1 Gráfica de la señal resultante
figure;
plot(t, datos_ac_high);
title("Señal NO DC - Filtro pasa altos");

% 9. Filtro pasa bajo para retener hasta la 7ma armonica de la frecuencia
% del pulso estimada para la señal












