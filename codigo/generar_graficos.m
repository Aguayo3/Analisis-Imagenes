function generar_graficos(resultados, alphas)
% GENERAR_GRAFICOS Generar gráficos comparativos de entropías
%
% Sintaxis:
%   generar_graficos(resultados, alphas)
%
% Entradas:
%   resultados - Array de estructuras con resultados del análisis
%   alphas     - Vector con valores de alpha usados

% Extraer datos por régimen
regimenes = unique({resultados.Regimen});
n_regimenes = length(regimenes);

if n_regimenes == 0
    return;
end

% Gráfico 1: Entropía de Shannon por régimen
figure('Position', [100, 100, 800, 600]);

shannon_vals = [];
labels = {};
for i = 1:n_regimenes
    idx = strcmp({resultados.Regimen}, regimenes{i});
    vals = [resultados(idx).Shannon];
    shannon_vals = [shannon_vals; vals'];
    labels = [labels; repmat(regimenes(i), length(vals), 1)];
end

boxplot(shannon_vals, labels);
ylabel('Entropía de Shannon (bits)');
xlabel('Régimen de Flujo');
title('Comparación de Entropía de Shannon entre Regímenes');
grid on;
saveas(gcf, 'comparacion_shannon.png');

% Gráfico 2: Entropías de Rényi por régimen
figure('Position', [150, 150, 1000, 600]);

for k = 1:length(alphas)
    subplot(2, ceil(length(alphas)/2), k);
    
    campo = sprintf('Renyi_alpha_%g', alphas(k));
    renyi_vals = [];
    labels = {};
    
    for i = 1:n_regimenes
        idx = strcmp({resultados.Regimen}, regimenes{i});
        if isfield(resultados(1), campo)
            vals = [resultados(idx).(campo)];
            renyi_vals = [renyi_vals; vals'];
            labels = [labels; repmat(regimenes(i), length(vals), 1)];
        end
    end
    
    if ~isempty(renyi_vals)
        boxplot(renyi_vals, labels);
        ylabel('Entropía de Rényi (bits)');
        xlabel('Régimen de Flujo');
        title(sprintf('\\alpha = %.1f', alphas(k)));
        grid on;
    end
end

% Título general para el conjunto de gráficos
try
    sgtitle('Comparación de Entropía de Rényi entre Regímenes');
catch
    % Octave anterior no tiene sgtitle
end

saveas(gcf, 'comparacion_renyi.png');

% Gráfico 3: Promedio de entropías por régimen
figure('Position', [200, 200, 800, 600]);

promedios_shannon = zeros(n_regimenes, 1);
for i = 1:n_regimenes
    idx = strcmp({resultados.Regimen}, regimenes{i});
    promedios_shannon(i) = mean([resultados(idx).Shannon]);
end

bar(promedios_shannon);
set(gca, 'XTickLabel', regimenes);
ylabel('Entropía de Shannon Promedio (bits)');
xlabel('Régimen de Flujo');
title('Entropía de Shannon Promedio por Régimen');
grid on;
saveas(gcf, 'promedio_shannon.png');

close all;

end
