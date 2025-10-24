function imagenes = obtener_imagenes(directorio, formatos)
% OBTENER_IMAGENES Obtener lista de archivos de imagen en un directorio
%
% Sintaxis:
%   imagenes = obtener_imagenes(directorio, formatos)
%
% Entradas:
%   directorio - Ruta del directorio a buscar
%   formatos   - Cell array con patrones de archivos (ej: {'*.jpg', '*.png'})
%
% Salida:
%   imagenes   - Cell array con rutas completas de los archivos encontrados

imagenes = {};
if exist(directorio, 'dir')
    for i = 1:length(formatos)
        archivos = dir(fullfile(directorio, formatos{i}));
        for j = 1:length(archivos)
            if ~archivos(j).isdir
                imagenes{end+1} = fullfile(directorio, archivos(j).name);
            end
        end
    end
end

end
