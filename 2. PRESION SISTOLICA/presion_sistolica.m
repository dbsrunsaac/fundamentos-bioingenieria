clc, clear, close all;

% Consideraciones para el análisis de datos
%En la señal de baja frecuencia sirve para saber:

%85% -> presión sistolica
%el punto centra es la presión media
%55% -> presión diastolica
%(Se realiza mediante un enfoque en la gráfica de la señal)

% TRABAJO ENCARGADO
% 1. Pre procesamiento
% 2. 2 intentos (mediciones) para aplicar el método oscilometrico
% 3. Separar las partes del desenso de presión (herramientas como Python, excel)
% 4. Análisis en el dominio del tiempo, frecuencia y filtrado de las señales.
% 5. Algoritmo para la medición de presión arterial, se aplica (filtrado, detección de envolvente y calculo de puntos de la curva de presión que corresponde a ciertas características de la envolvente).
% 6. Criterios mediante software que permitan evaluar la confiabilidad de las mediciones realizadas.


datos_presion = importdata('datos_presion.txt');

fc = 0.8;
fs = 100;
wn = fc/(fs/2)
[b, a] = butter(4, wn, 'low');

datos_filtrados = filtfilt(b, a, datos_presion);

% Determinación del máximo
umbral_minimo = 150;

% Inicializar variables
max_locales = []; % Almacenar valores de los máximos locales
posiciones = []; % Almacenar posiciones de los máximos locales

% Algoritmo para encontrar máximos locales
for i = 2:length(datos_filtrados)-1
    % Comprobar si el elemento actual es mayor que sus vecinos y supera el umbral
    if datos_filtrados(i) >= datos_filtrados(i-1) && datos_filtrados(i) >= datos_filtrados(i+1) && datos_filtrados(i) >= umbral_minimo
        max_locales = [max_locales, datos_filtrados(i)]; % Guardar el valor del máximo
        posiciones = [posiciones, i]; % Guardar la posición del máximo
    end
end

% Mostrar resultados
disp(['Máximos locales encontrados (con umbral mínimo de ', num2str(umbral_minimo), '):']);
disp(length(max_locales));
disp('Posiciones de los máximos locales:');

% Gráfica
figure;
plot(datos_filtrados); % Datos originales
hold on;
plot(posiciones, max_locales, 'r^', 'MarkerFaceColor', 'r'); % Máximos locales en rojo
title('Señal Filtrada');
xlabel('Índice');
ylabel('Valor');
legend('Datos', 'Máximos Locales');
hold off;

figure;
plot(datos_presion);
title('Datos presion');


% Filtro pasa alto
fc = 1;
fs = 100;
wn = fc/(fs/2)
[b, a] = butter(4, wn, 'high');

datos_fil_alto = filtfilt(b, a, datos_presion);
figure;
plot(datos_fil_alto);
title('Datos pasa altos');

2
% Recuperación de la envolvente
senal_analitica = hilbert(datos_fil_alto);  % Genera la señal analítica
envolvente = abs(senal_analitica);          % Calcula la envolvente
figure;
plot(envolvente)
plot(envolvente)
