clear, clc, close all;
t = 0: 0.01: 0.8;
%% Objetivos
% 1. Calcular en que tiempo inicia la sistole
% 2. Calcular Tmaxdpdt de la señal de presión (Punto máximo en la curva de la primera
% derivada)

%% Obtención y gráfica de la señal
% Recuperando el archivo como una matriz
datos_presion = dlmread('presion_periferica.txt');
% Ignorando o eliminando la primera columna
datos_presion(:, 1) = [];
% Eliminando el valor medioa
datos_presion = datos_presion - mean(datos_presion)
% Mostrando los datos de la presión periferica
plot(datos_presion);
hold on

%% Tiempo en el que inicia la sistole

%% Tmaxdpdt Punto máximo en la curva de la primera derivada

primera_derivada(1) = 0;
for i = 1:1: length(datos_presion) - 1
    primera_derivada(i) = datos_presion(i + 1) + datos_presion(i);
end
% Obtención de valor máximo

% Selección del rango umbral (Determinación del máximo)
umbral_minimo = 200;

% Inicializar variables
max_locales = []; % Almacenar valores de los máximos locales
posiciones = []; % Almacenar posiciones de los máximos locales

% Algoritmo para encontrar máximos locales
for i = 2:length(primera_derivada)-1
    % Comprobar si el elemento actual es mayor que sus vecinos y supera el umbral
    if primera_derivada(i) >= primera_derivada(i-1) && primera_derivada(i) >= primera_derivada(i+1) && primera_derivada(i) >= umbral_minimo
        max_locales = [max_locales, primera_derivada(i)]; % Guardar el valor del máximo
        posiciones = [posiciones, i]; % Guardar la posición del máximo
    end
end

% Mostrar resultados
disp(['Máximos locales encontrados (con umbral mínimo de ', num2str(umbral_minimo), '):']);
disp(length(max_locales));
disp('Máximo local y Posición de los máximos locales:');
disp([max_locales, posiciones]);

figure
plot(posiciones, max_locales, 'r^', 'MarkerFaceColor', 'r'); % Máximos locales en rojo
hold on
plot(primera_derivada);
hold off






