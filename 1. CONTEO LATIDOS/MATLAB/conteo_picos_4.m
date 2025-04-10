% Datos de ejemplo
x = load('latidos.txt');

% Encontrar máximos locales
[picos, posiciones] = findpeaks(x);

% Mostrar resultados
disp('Máximos locales:');
disp(length(picos));
disp('Posiciones de los máximos locales:');
% disp(posiciones);

% Gráfica
figure;
plot(x, '-o');
hold on;
plot(posiciones, picos, 'r^', 'MarkerFaceColor', 'r'); % Máximos locales en rojo
title('Máximos locales en los datos');
xlabel('Índice');
ylabel('Valor');
legend('Datos', 'Máximos locales');
