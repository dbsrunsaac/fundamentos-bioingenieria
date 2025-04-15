clc, clear, close all;
delt = 0.001;

% VITACORA DE AVANCE
% 1.1 Se determino la resistencia sistemica y se determino la ecuación para
% determinar la variación del volumen ventricular en función a la
% resistencia sistemica

% 1.2 Se considero un modelo rectificador con 2 fuentes de presión para el
% modelado de la ventricula y el flujo sistemico, definiendo la presión
% sistemica como la presión diastolica y la cual se definio de forma
% condicional

% 1.3 Se definio el modelo circuito, siendo necesario agregar su equivalente
% en la simulación mediante el empleo del filtro RC para hacer uso de su
% ecuación de diferencias.

% 2. Para repetir los latidos por segundo es necesario agregar un bucle
% for adicional al código de manera que dentro de este también se pueda
% modificar el volumen inicial para obtener diferentes salidas o
% resultados.


% 4. Para definir un 
a = 7e-4;
b = 20;
c = 2.5;
d = 80;
tc = 0.264;
tp = 0.371;
tr = 0.299;
tb = 0.258;
alpha = 2.88;
Vv0 = 145; % Volumen Inicial (por defecto de 150)

denom = ((1.-exp(-(tp/tc)^alpha))*exp(-((tp-tb)/tr)^alpha));
t(1) = 0;
Vv(1) = Vv0; % Vv Volumen ventricular
edp = a*((Vv0 -b))^2;
pdp = c*Vv0 -d ;
pp = pdp/denom;
t1 = 0;
t2 = 0;
e1 = exp(-(t1/tc)^alpha);
e2 = exp(-(t2/tr)^alpha);
pv0 = edp + pp*((1.-e1)*e2);

% Calculo del flujo
pd = 84; % presion diastolica
flujo(1) = 0;
part(1) = 0;
for j = 2: 1500
    pv(j) = edp + pp*((1. - e1)*e2); % Presión actual
    t(j) = t(j - 1) + delt;
    % Se modifica el volumen ventricular (Vv) en función al flujo de salida
    % el cual se define como Flujo = Presion/Rsistemica;
    Vv(j) = Vv(j - 1) - pv(j)/1*delt; 
    edp = a*((Vv(j) - b))^2;
    pdp = c*Vv(j) - d;
    pp = pdp/denom;
    t1 = t(j);
    
    % Calculo del flujo
    if (pv(j) > pd)
        flujo(j) = (pv(j)-pd)/1;
        % Actualizando el volumen en función del flujo
        Vv(j) = Vv(j-1) - flujo(j)*delt;
        part(j) = pd + flujo(j)*1*delt;
    else
        flujo(j) = 0;
        part(j) = 0;
    end
    
    % Agregando la presión arterial se tiene

    t2 = t(j) - tb;
    if(t2 < 0)
        t2 = 0;
    end
    
    e1 = exp(-(t1/tc)^alpha);
    e2 = exp(-(t2/tr)^alpha);
    
end
figure('Position', [250, 125, 800, 600]);
hold on
plot(t, pv, 'DisplayName', 'Presion Ventricular');
plot(t, Vv, 'DisplayName', 'Volumen Ventricular');
plot(t, flujo, 'DisplayName', 'Flujo');
plot(t, part, 'DisplayName', 'Presión Arterial');
grid on
hold off

legend('show');
legend('Location', 'best');
title("Presión Isovolumica Ventricular");
xlabel("Time (s)");
ylabel("Presion Ventricular Pv [mmHg]");

