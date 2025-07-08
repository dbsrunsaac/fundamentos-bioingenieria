clc, clear, close all;

%% Obtención de los datos
ppg_data = load("ppg_one_hour_sample.mat");


%% Procesamiento de la información
% 1. Para la experiencia se toma un valor de SpO2 para obtener el valor de R.
% 1.1 Su suma un valor DC para definir un nuevo valor de 0
% 2. Luego se trata de obtener este factor R mediante el conjunto de datos del dataset 
% 3. Luego de toma el valor pico a pico (max y min) del conjunto de datos y
% se divide entre 2raiz(2)
% 4. Luego se obtiene el valor de R con los datos obtenidos
% 5. Se verifica que este valor coincida con el teórico definido en 1