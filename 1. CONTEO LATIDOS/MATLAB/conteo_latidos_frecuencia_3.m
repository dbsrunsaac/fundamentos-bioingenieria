clc, clear all, close all;
datos_ppg = load('latidos.txt'); 

% Eliminar el componente DC
datos_ppg_ac = datos_ppg - mean(datos_ppg);

% Transformada discreta de Fourier
datos_frecuencia = fft(datos_ppg_ac);
mag_datos = abs(datos_frecuencia);
figure;
plot(mag_datos);
title('Señal completa');
xlabel('Muestras');
ylabel('Amplitud');
grid on;

figure;
N = length(datos_ppg_ac);
tramo = 1;
conteo = 1;
while tramo < N
    plot(mag_datos(tramo:tramo + 500));
    title('Segmento de la señal', conteo);
    xlabel('Muestras');
    ylabel('Amplitud');
    grid on;
    conteo = conteo + 1;
    pause();
    tramo = tramo + 500;
    
end