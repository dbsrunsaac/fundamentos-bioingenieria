% Datos de ejemplo
% x = [1, 3, 7, 1, 2, 6, 4, 1, 8, 2, 1];
% 
% % Encontrar máximos locales
% [picos, posiciones] = findpeaks(x);
% 
% % Mostrar resultados
% disp('Máximos locales:');
% disp(picos);
% disp('Posiciones de los máximos locales:');
% disp(posiciones);
% 
% % Gráfica
% figure;
% plot(x, '-o');
% hold on;
% plot(posiciones, picos, 'r^', 'MarkerFaceColor', 'r'); % Máximos locales en rojo
% title('Máximos locales en los datos');
% xlabel('Índice');
% ylabel('Valor');
% legend('Datos', 'Máximos locales');


% Supongamos que 'signal' es tu vector de datos de la señal
% signal = load('latidos.txt');
% 
% % Encontrar los picos en la señal
% [pks, locs] = findpeaks(signal);
% 
% % Mostrar los picos y sus ubicaciones
% disp('Picos encontrados:');
% disp(pks);
% disp('Ubicaciones de los picos:');
% disp(locs);
% 
% % Número de picos encontrados
% num_peaks = numel(pks);
% disp(['Número de picos: ', num2str(num_peaks)]);


% Datos de ejemplo
% x = load('latidos.txt');
% Datos de ejemplo
clc, clear, close all;
data = load('latidos.txt');
x = data - mean(data);

% Establecer un valor mínimo para los picos
umbral_minimo = 40;

% Inicializar variables
max_locales = []; % Almacenar valores de los máximos locales
posiciones = []; % Almacenar posiciones de los máximos locales

% Algoritmo para encontrar máximos locales
for i = 2:length(x)-1
    % Comprobar si el elemento actual es mayor que sus vecinos y supera el umbral
    if x(i) >= x(i-1) && x(i) >= x(i+1) && x(i) >= umbral_minimo
        max_locales = [max_locales, x(i)]; % Guardar el valor del máximo
        posiciones = [posiciones, i]; % Guardar la posición del máximo
    end
end

% Mostrar resultados
disp(['Máximos locales encontrados (con umbral mínimo de ', num2str(umbral_minimo), '):']);
disp(length(max_locales));
disp('Posiciones de los máximos locales:');
% disp(posiciones);

% Gráfica
figure;
plot(x); % Datos originales
hold on;
plot(posiciones, max_locales, 'r^', 'MarkerFaceColor', 'r'); % Máximos locales en rojo
title(['Máximos Locales (Umbral Mínimo = ', num2str(umbral_minimo), ')']);
xlabel('Índice');
ylabel('Valor');
legend('Datos', 'Máximos Locales');



