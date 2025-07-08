% Paso 1: Generar una señal de ejemplo
Fs = 1000;                    % Frecuencia de muestreo (Hz)
T = 1/Fs;                     % Intervalo de muestreo (s)
L = 1500;                     % Longitud de la señal
t = (0:L-1)*T;                % Vector de tiempo

% Crear una señal compuesta por dos frecuencias
f1 = 50;                      % Frecuencia 1 (Hz)
f2 = 100;                     % Frecuencia 2 (Hz)
x = 0.7*sin(2*pi*f1*t) + sin(2*pi*f2*t);

% Paso 2: Aplicar la DFT
X = fft(x);

% Paso 3: Calcular la magnitud del espectro de frecuencia
P2 = abs(X/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

% Paso 4: Crear el vector de frecuencias
f = Fs*(0:(L/2))/L;

% Paso 5: Visualizar el espectro de frecuencia
figure;
plot(f,P1);
title('Espectro de frecuencia de la señal');
xlabel('Frecuencia (Hz)');
ylabel('|X(f)|');
