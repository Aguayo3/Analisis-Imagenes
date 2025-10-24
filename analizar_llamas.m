% ANALIZAR_LLAMAS - Script principal para análisis de entropía de imágenes de llamas
%
% Este script analiza imágenes de llamas en diferentes regímenes de flujo
% (laminar, transición y turbulento) calculando la entropía de Shannon y
% Rényi para caracterizar la complejidad y el desorden en cada régimen.
%
% Estructura de directorios esperada:
%   imagenes/laminar/     - Imágenes de régimen laminar
%   imagenes/transicion/  - Imágenes de régimen de transición
%   imagenes/turbulento/  - Imágenes de régimen turbulento
%
% Salidas:
%   - Tabla comparativa de entropías por régimen
%   - Gráficos de comparación
%   - Archivo CSV con resultados

%% Limpiar entorno
clear all;
close all;
clc;

%% Configuración
% Agregar el directorio de código al path
addpath('codigo');

% Definir directorios de imágenes
dir_laminar = 'imagenes/laminar/';
dir_transicion = 'imagenes/transicion/';
dir_turbulento = 'imagenes/turbulento/';

% Parámetros de entropía de Rényi
alphas = [0.5, 2, 3, 5]; % Diferentes valores de alpha para análisis

%% Cargar imágenes
fprintf('=== ANÁLISIS DE ENTROPÍA DE IMÁGENES DE LLAMAS ===\n\n');

% Obtener lista de archivos de imagen
formatos = {'*.jpg', '*.jpeg', '*.png', '*.tif', '*.tiff', '*.bmp'};
imagenes_laminar = obtener_imagenes(dir_laminar, formatos);
imagenes_transicion = obtener_imagenes(dir_transicion, formatos);
imagenes_turbulento = obtener_imagenes(dir_turbulento, formatos);

% Verificar que hay imágenes
if isempty(imagenes_laminar) && isempty(imagenes_transicion) && isempty(imagenes_turbulento)
    fprintf('ERROR: No se encontraron imágenes en los directorios especificados.\n');
    fprintf('Por favor, coloque imágenes de llamas en:\n');
    fprintf('  - %s\n', dir_laminar);
    fprintf('  - %s\n', dir_transicion);
    fprintf('  - %s\n', dir_turbulento);
    return;
end

fprintf('Imágenes encontradas:\n');
fprintf('  Régimen laminar: %d imágenes\n', length(imagenes_laminar));
fprintf('  Régimen transición: %d imágenes\n', length(imagenes_transicion));
fprintf('  Régimen turbulento: %d imágenes\n\n', length(imagenes_turbulento));

%% Analizar imágenes
resultados = [];

% Analizar régimen laminar
fprintf('Analizando régimen laminar...\n');
resultados_laminar = analizar_regimen(imagenes_laminar, 'Laminar', alphas);
resultados = [resultados; resultados_laminar];

% Analizar régimen de transición
fprintf('Analizando régimen de transición...\n');
resultados_transicion = analizar_regimen(imagenes_transicion, 'Transición', alphas);
resultados = [resultados; resultados_transicion];

% Analizar régimen turbulento
fprintf('Analizando régimen turbulento...\n');
resultados_turbulento = analizar_regimen(imagenes_turbulento, 'Turbulento', alphas);
resultados = [resultados; resultados_turbulento];

%% Crear tabla de resultados
if ~isempty(resultados)
    T = struct2table(resultados);
    fprintf('\n=== RESULTADOS DEL ANÁLISIS ===\n');
    disp(T);
    
    % Guardar resultados en CSV
    writetable(T, 'resultados_entropia.csv');
    fprintf('\nResultados guardados en: resultados_entropia.csv\n');
    
    %% Generar gráficos comparativos
    generar_graficos(resultados, alphas);
    fprintf('\nGráficos guardados en el directorio actual.\n');
else
    fprintf('\nNo se pudieron analizar imágenes.\n');
end

fprintf('\n=== ANÁLISIS COMPLETADO ===\n');
