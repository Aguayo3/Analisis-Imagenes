function resultados = analizar_regimen(imagenes, nombre_regimen, alphas)
% ANALIZAR_REGIMEN Analizar todas las imágenes de un régimen
%
% Sintaxis:
%   resultados = analizar_regimen(imagenes, nombre_regimen, alphas)
%
% Entradas:
%   imagenes       - Cell array con rutas de imágenes
%   nombre_regimen - Nombre del régimen (ej: 'Laminar')
%   alphas         - Vector con valores de alpha para entropía de Rényi
%
% Salida:
%   resultados     - Array de estructuras con los resultados

resultados = [];

for i = 1:length(imagenes)
    try
        % Leer imagen
        img = imread(imagenes{i});
        [~, nombre_archivo, ~] = fileparts(imagenes{i});
        
        % Calcular entropía de Shannon
        H_shannon = calcular_entropia_shannon(img);
        
        % Calcular entropías de Rényi para diferentes alphas
        H_renyi = zeros(1, length(alphas));
        for j = 1:length(alphas)
            H_renyi(j) = calcular_entropia_renyi(img, alphas(j));
        end
        
        % Almacenar resultados
        resultado.Regimen = nombre_regimen;
        resultado.Archivo = nombre_archivo;
        resultado.Shannon = H_shannon;
        for j = 1:length(alphas)
            campo = sprintf('Renyi_alpha_%g', alphas(j));
            resultado.(campo) = H_renyi(j);
        end
        
        resultados = [resultados; resultado];
        
        fprintf('  %s: Shannon=%.4f bits\n', nombre_archivo, H_shannon);
        
    catch ME
        fprintf('  ERROR al procesar %s: %s\n', imagenes{i}, ME.message);
    end
end

end
