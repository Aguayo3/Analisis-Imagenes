function entropia = calcular_entropia_shannon(imagen)
% CALCULAR_ENTROPIA_SHANNON Calcula la entropía de Shannon de una imagen
%
% Sintaxis:
%   entropia = calcular_entropia_shannon(imagen)
%
% Entrada:
%   imagen - Imagen en escala de grises o RGB (será convertida a escala de grises)
%
% Salida:
%   entropia - Valor de entropía de Shannon en bits
%
% Descripción:
%   La entropía de Shannon mide la cantidad de información promedio contenida
%   en la imagen. Se calcula como: H = -sum(p(i) * log2(p(i)))
%   donde p(i) es la probabilidad del nivel de intensidad i.
%
% Ejemplo:
%   img = imread('llama.jpg');
%   H = calcular_entropia_shannon(img);
%   fprintf('Entropía de Shannon: %.4f bits\n', H);

% Verificar que la imagen existe
if isempty(imagen)
    error('La imagen está vacía');
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

% Eliminar probabilidades cero para evitar log(0)
probabilidades = probabilidades(probabilidades > 0);

% Calcular entropía de Shannon: H = -sum(p * log2(p))
entropia = -sum(probabilidades .* log2(probabilidades));

end
