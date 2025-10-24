DEPENDENCIAS
-MATLAB (versión R2016b o posterior, para la sintaxis de sgtitle y fullfile con strings).

-Image Processing Toolbox™: Esta es esencial. Se utiliza para las funciones:
	-rgb2gray()
	-imhist() (usada dentro de renyi_entropy)
	-entropy()

EJECUCIÓN
1.Clona o descarga este TAREASISCOM_1_1.m y las carpetas (laminar,transicion y turbulenta)
2.Asegurarse que TAREASISCOM_1_1.m y carpetas esten en la misma carpeta.
3.Ajusta los parámetros:(Opcional) Puedes cambiar los siguientes parámetros clave en la sección 
--- CONFIGURACIÓN ---:

    	-alpha (línea 42): El parámetro de orden para la entropía de Rényi. (Ej. 0.5, 2, 30).
	-img_por_segundo (línea 39): Define cuántas imágenes se agrupan para promediar. El código 	está configurado en 5. Basado en el cálculo del eje de tiempo (tsec), esto asume que 10 	imágenes = 1 segundo (es decir, cada grupo de 5 es 0.5s).

    	-max_imag (línea 50): Límite de imágenes a procesar por carpeta (configurado en 50).

    	-patron_archivo (línea 48): Cambia *.tiff si tus imágenes están en otro formato (ej. *.png).

4.Ejecuta el script en MATLAB. Las dos figuras con los gráficos aparecerán automáticamente.

FUNCIONES LOCALES
El script incluye una función local renyi_entropy(I, alpha) que calcula la entropía de Rényi para una imagen de entrada I (en escala de grises) y un orden alpha.

function H = renyi_entropy(I, alpha)
    % Normalizar a distribución de probabilidad
    counts = imhist(I);        % histograma de niveles 0-255
    p = counts / sum(counts);  % probabilidad
    p = p(p>0);                % quitar ceros para evitar log(0)
    
    % Entropía de Rényi
    H = 1/(1-alpha) * log2(sum(p.^alpha));
end