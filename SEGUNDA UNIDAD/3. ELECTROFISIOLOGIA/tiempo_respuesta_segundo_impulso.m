clc, clear, close all;

% Objetivo: Determinar el tiempo de respuesta para el segundo impulso
j = 1;
t_accion = [];
potencial = [];
% Para un tiempo de simulacion de 30ms se podran contar con 15 espacios de
% 2ms
for i = 1 : 15 
    % Determinar la cantidad de pulsos espacios 2ms
    tiempo_inicial = 0 + i*4e-3;
    tiempo_final = tiempo_inicial + 2e-3;
    [t, X, Y] = sim("MEMBRANA_CALAMAR_GIGANTE_2B");
    if ( max(Y(:, 1)) > 0)
        t_accion(j) = t(tiempo_inicial*1000);
        potencial(j) = max( Y(:, 1) );
        j = j + 1;
    end
end

plot(t_accion*1000, potencial*1000);
title("Tiempo de respuesta a un impulso en la membrana del calamar");
xlabel("Tiempo [ms]");
ylabel("Potencial [mV]");

