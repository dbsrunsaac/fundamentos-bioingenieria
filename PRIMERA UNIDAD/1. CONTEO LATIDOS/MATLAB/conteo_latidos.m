clc, clear, close all;
datos_ppg = load('latidos.txt'); 

% Eliminar el componente DC
datos_ppg_ac = datos_ppg - mean(datos_ppg);

% Figura 1: Señal completa
figure;
plot(datos_ppg_ac);
title('Señal completa');
xlabel('Muestras');
ylabel('Amplitud'); 
grid on;

% Figura 2: Segmentos con salto
figure;
N = length(datos_ppg_ac);
tramo = 1;
conteo = 1;
while tramo < N
    plot(datos_ppg_ac(tramo:tramo + 500));
    title('Segmento de la señal', conteo);
    xlabel('Muestras');
    ylabel('Amplitud');
    grid on;
    conteo = conteo + 1;
    pause();
    tramo = tramo + 500;
    
end
