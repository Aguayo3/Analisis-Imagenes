function entropia = calcular_entropia_renyi(imagen, alpha)
% CALCULAR_ENTROPIA_RENYI Calcula la entropía de Rényi de una imagen
%
% Sintaxis:
%   entropia = calcular_entropia_renyi(imagen, alpha)
%
% Entrada:
%   imagen - Imagen en escala de grises o RGB (será convertida a escala de grises)
%   alpha  - Parámetro de orden (alpha >= 0, alpha ~= 1)
%            alpha = 0: entropía de Hartley (log del número de estados)
%            alpha -> 1: converge a entropía de Shannon
%            alpha = 2: entropía de colisión
%            alpha -> inf: entropía mínima
%
% Salida:
%   entropia - Valor de entropía de Rényi en bits
%
% Descripción:
%   La entropía de Rényi es una generalización de la entropía de Shannon.
%   Se calcula como: H_alpha = 1/(1-alpha) * log2(sum(p(i)^alpha))
%   donde p(i) es la probabilidad del nivel de intensidad i.
%
% Ejemplo:
%   img = imread('llama.jpg');
%   H2 = calcular_entropia_renyi(img, 2);
%   fprintf('Entropía de Rényi (alpha=2): %.4f bits\n', H2);

% Verificar que la imagen existe
if isempty(imagen)
    error('La imagen está vacía');
end

% Valor por defecto de alpha
if nargin < 2
    alpha = 2; % Entropía de colisión por defecto
end

% Verificar que alpha sea válido
if alpha < 0
    error('El parámetro alpha debe ser no negativo');
end

if alpha == 1
    warning('Para alpha=1, usar calcular_entropia_shannon en su lugar');
    % En el límite alpha->1, la entropía de Rényi converge a Shannon
    entropia = calcular_entropia_shannon(imagen);
    return;
end

% Convertir a escala de grises si es RGB
if size(imagen, 3) == 3
    imagen = rgb2gray(imagen);
end

% Convertir a double para cálculos
imagen = double(imagen);

% Calcular histograma normalizado (probabilidades)
[counts, ~] = imhist(uint8(imagen));
probabilidades = counts / sum(counts);

% Eliminar probabilidades cero
probabilidades = probabilidades(probabilidades > 0);

% Calcular entropía de Rényi
if alpha == 0
    % Entropía de Hartley: logaritmo del número de estados con probabilidad no cero
    entropia = log2(length(probabilidades));
elseif isinf(alpha)
    % Entropía mínima: -log2(max(p))
    entropia = -log2(max(probabilidades));
else
    % Caso general: H_alpha = 1/(1-alpha) * log2(sum(p^alpha))
    suma = sum(probabilidades .^ alpha);
    entropia = (1 / (1 - alpha)) * log2(suma);
end

end
