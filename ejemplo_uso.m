% EJEMPLO_USO - Script de ejemplo para demostrar el uso de las funciones
%
% Este script crea imágenes sintéticas de ejemplo y demuestra cómo
% utilizar las funciones de cálculo de entropía.

%% Limpiar entorno
clear all;
close all;
clc;

% Cargar paquete de imagen para Octave (ignorar si MATLAB)
try
    pkg load image;
catch
    % MATLAB no necesita esto
end

fprintf('=== EJEMPLO DE USO - ANÁLISIS DE ENTROPÍA ===\n\n');

% Agregar el directorio de código al path
addpath('codigo');

%% Ejemplo 1: Crear imágenes sintéticas con diferentes niveles de complejidad

fprintf('Creando imágenes sintéticas de ejemplo...\n\n');

% Imagen 1: Muy ordenada (baja entropía) - simula régimen laminar
img_ordenada = uint8(repmat(linspace(0, 255, 256)', 1, 256));

% Imagen 2: Moderadamente compleja - simula régimen de transición
img_moderada = uint8(128 + 30 * randn(256, 256));
% Suavizar con un filtro gaussiano (compatible con Octave)
h = fspecial('gaussian', [5 5], 2);
img_moderada = uint8(imfilter(double(img_moderada), h));

% Imagen 3: Muy desordenada (alta entropía) - simula régimen turbulento
img_desordenada = uint8(randi([0, 255], 256, 256));

%% Ejemplo 2: Calcular entropía de Shannon

fprintf('=== ENTROPÍA DE SHANNON ===\n');

H1_shannon = calcular_entropia_shannon(img_ordenada);
H2_shannon = calcular_entropia_shannon(img_moderada);
H3_shannon = calcular_entropia_shannon(img_desordenada);

fprintf('Imagen ordenada (simula laminar):     %.4f bits\n', H1_shannon);
fprintf('Imagen moderada (simula transición):  %.4f bits\n', H2_shannon);
fprintf('Imagen desordenada (simula turbulento): %.4f bits\n', H3_shannon);

%% Ejemplo 3: Calcular entropía de Rényi con diferentes alphas

fprintf('\n=== ENTROPÍA DE RÉNYI ===\n');

alphas = [0.5, 2, 3, 5];

fprintf('\nImagen ordenada (simula régimen laminar):\n');
for alpha = alphas
    H = calcular_entropia_renyi(img_ordenada, alpha);
    fprintf('  α = %.1f: %.4f bits\n', alpha, H);
end

fprintf('\nImagen moderada (simula régimen de transición):\n');
for alpha = alphas
    H = calcular_entropia_renyi(img_moderada, alpha);
    fprintf('  α = %.1f: %.4f bits\n', alpha, H);
end

fprintf('\nImagen desordenada (simula régimen turbulento):\n');
for alpha = alphas
    H = calcular_entropia_renyi(img_desordenada, alpha);
    fprintf('  α = %.1f: %.4f bits\n', alpha, H);
end

%% Ejemplo 4: Visualizar las imágenes sintéticas

fprintf('\n=== VISUALIZACIÓN ===\n');
fprintf('Generando visualización de las imágenes sintéticas...\n');

figure('Position', [100, 100, 1200, 400]);

% Imagen ordenada
subplot(1, 3, 1);
imshow(img_ordenada);
title(sprintf('Ordenada (Laminar)\nH_{Shannon} = %.2f bits', H1_shannon));

% Imagen moderada
subplot(1, 3, 2);
imshow(img_moderada);
title(sprintf('Moderada (Transición)\nH_{Shannon} = %.2f bits', H2_shannon));

% Imagen desordenada
subplot(1, 3, 3);
imshow(img_desordenada);
title(sprintf('Desordenada (Turbulento)\nH_{Shannon} = %.2f bits', H3_shannon));

% Título general (usar sgtitle si está disponible, sino crear como título)
try
    sgtitle('Comparación de Imágenes Sintéticas y sus Entropías');
catch
    % Octave anterior no tiene sgtitle
    annotation('textbox', [0 0.9 1 0.1], 'String', ...
               'Comparación de Imágenes Sintéticas y sus Entropías', ...
               'EdgeColor', 'none', 'HorizontalAlignment', 'center', ...
               'FontSize', 14, 'FontWeight', 'bold');
end

% Guardar figura
saveas(gcf, 'ejemplo_imagenes_sinteticas.png');
fprintf('Visualización guardada en: ejemplo_imagenes_sinteticas.png\n');

%% Ejemplo 5: Gráfico comparativo de entropías

figure('Position', [150, 150, 900, 600]);

% Preparar datos
categorias = {'Ordenada\n(Laminar)', 'Moderada\n(Transición)', 'Desordenada\n(Turbulento)'};
shannon_vals = [H1_shannon, H2_shannon, H3_shannon];

% Calcular Rényi con α = 2 para cada imagen
renyi_vals = [
    calcular_entropia_renyi(img_ordenada, 2), ...
    calcular_entropia_renyi(img_moderada, 2), ...
    calcular_entropia_renyi(img_desordenada, 2)
];

% Graficar
subplot(1, 2, 1);
bar(shannon_vals);
set(gca, 'XTickLabel', categorias);
ylabel('Entropía (bits)');
title('Entropía de Shannon');
grid on;
ylim([0, max(shannon_vals) * 1.2]);

subplot(1, 2, 2);
bar(renyi_vals);
set(gca, 'XTickLabel', categorias);
ylabel('Entropía (bits)');
title('Entropía de Rényi (α = 2)');
grid on;
ylim([0, max(renyi_vals) * 1.2]);

% Título general
try
    sgtitle('Comparación de Entropías entre Tipos de Imágenes');
catch
    % Octave anterior no tiene sgtitle
end

% Guardar figura
saveas(gcf, 'ejemplo_comparacion_entropias.png');
fprintf('Gráfico comparativo guardado en: ejemplo_comparacion_entropias.png\n');

%% Ejemplo 6: Análisis de sensibilidad del parámetro alpha

fprintf('\n=== ANÁLISIS DE SENSIBILIDAD DE ALPHA ===\n');
fprintf('Analizando cómo varía la entropía de Rényi con diferentes valores de α...\n');

alpha_range = [0.1, 0.5, 1.5, 2, 3, 5, 10];
H_ordenada = zeros(size(alpha_range));
H_moderada = zeros(size(alpha_range));
H_desordenada = zeros(size(alpha_range));

for i = 1:length(alpha_range)
    H_ordenada(i) = calcular_entropia_renyi(img_ordenada, alpha_range(i));
    H_moderada(i) = calcular_entropia_renyi(img_moderada, alpha_range(i));
    H_desordenada(i) = calcular_entropia_renyi(img_desordenada, alpha_range(i));
end

figure('Position', [200, 200, 800, 600]);
plot(alpha_range, H_ordenada, 'b-o', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
plot(alpha_range, H_moderada, 'g-s', 'LineWidth', 2, 'MarkerSize', 8);
plot(alpha_range, H_desordenada, 'r-^', 'LineWidth', 2, 'MarkerSize', 8);
hold off;

xlabel('Parámetro α');
ylabel('Entropía de Rényi (bits)');
title('Sensibilidad de la Entropía de Rényi al Parámetro α');
legend('Ordenada (Laminar)', 'Moderada (Transición)', 'Desordenada (Turbulento)', ...
       'Location', 'best');
grid on;

% Guardar figura
saveas(gcf, 'ejemplo_sensibilidad_alpha.png');
fprintf('Gráfico de sensibilidad guardado en: ejemplo_sensibilidad_alpha.png\n');

%% Resumen

fprintf('\n=== RESUMEN ===\n');
fprintf('Este ejemplo demuestra:\n');
fprintf('1. Cómo crear imágenes sintéticas con diferentes niveles de complejidad\n');
fprintf('2. Cómo calcular la entropía de Shannon\n');
fprintf('3. Cómo calcular la entropía de Rényi con diferentes valores de α\n');
fprintf('4. Cómo visualizar y comparar los resultados\n');
fprintf('5. Cómo analizar la sensibilidad del parámetro α\n\n');

fprintf('Para analizar imágenes reales de llamas, coloque las imágenes en:\n');
fprintf('  - imagenes/laminar/\n');
fprintf('  - imagenes/transicion/\n');
fprintf('  - imagenes/turbulento/\n');
fprintf('Y ejecute el script principal: analizar_llamas\n');

fprintf('\n=== EJEMPLO COMPLETADO ===\n');

close all;
