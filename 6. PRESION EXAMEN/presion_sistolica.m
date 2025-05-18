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

% 1. Importación de datos
datos_presion = importdata('datos_presion.txt');

figure;
subplot(2, 2, 1);
plot(datos_presion);
title('Señal de presión Inicial');

% 2. Filtro pasa bajas
fc = 0.8;
fs = 100;
wn = fc/(fs/2)
[b, a] = butter(4, wn, 'low');
datos_filtrados = filtfilt(b, a, datos_presion);

% 3. Porción/descenso de la señal de filtrado
% Selección del rango umbral (Determinación del máximo)
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
subplot(2, 2, 2);
plot(datos_filtrados); % Datos originales
hold on;
subplot(2, 2, 2);
plot(posiciones, max_locales, 'r^', 'MarkerFaceColor', 'r'); % Máximos locales en rojo
title('Señal de Presión - Paso Bajo');
xlabel('Índice');
ylabel('Valor');
legend('Datos', 'Máximos Locales');
hold off;

% 5. Filtro Pasa Alto
fs = 100;
fc = 1;
wn = fc/(fs/2)
[b, a] = butter(4, wn, 'high');

datos_fil_alto = filtfilt(b, a, datos_presion);
subplot(2, 2, 3);
plot(datos_fil_alto);
title('Señal de Presión - Paso Alto');

% 6. Transformada discreta de fourier
% da = datos_presion(1:763);
% de = datos_presion(764:3963);
% 
% DA = fft(da);
% DE = fft(de);
% 
% figure;
% plot(abs(DA/numel(da)));
% figure;
% plot(abs(DE/numel(de)));

% 7. Componente Oscilatoria de la señal
comp_oscilatoria = datos_presion(5196:8016);

fc_osc = 1;
fs = 100;
wn = fc_osc/(fs/2);
[b, a] = butter(4, wn, 'high');

datos_fil_oscilatoria = filtfilt(b, a, comp_oscilatoria);
subplot(2, 2, 4);
plot(datos_fil_oscilatoria);
title('Señal de Presión - Componente Oscilatoria');

% 8. Envolvente de la señal generada

envolvente(1) = 0;
envolvente_n(1) = 0;

for i = 2 : length (datos_fil_oscilatoria) 
	if (envolvente(i-1) < datos_fil_oscilatoria(i - 1))
		envolvente(i) = datos_fil_oscilatoria(i);
	else
		envolvente(i) = envolvente(i - 1)*0.994;
	end
	if (envolvente_n(i-1) > datos_fil_oscilatoria(i - 1))
		envolvente_n(i) = datos_fil_oscilatoria(i);
	else
		envolvente_n(i) = envolvente(i - 1)*0.994;
	end
end

figure;
subplot(2, 2, 1);
plot(envolvente);
title('Envolvente de la señal');

subplot(2, 2, 2);
fc2 = 0.3;
wn2 = fc2/(fs/2);
[Bl2, Al2] = butter(4, wn2);
env_filt2 = filter(Bl2, Al2, envolvente);
plot(env_filt2);
title('Envolvente filtrada - Paso Bajo');




% Recuperación de la envolvente
% senal_analitica = hilbert(datos_fil_alto);  % Genera la señal analítica
% envolvente = abs(senal_analitica);          % Calcula la envolvente
% subplot(2, 2, 4);
% plot(envolvente);
% title('Envolvente de la señal');
