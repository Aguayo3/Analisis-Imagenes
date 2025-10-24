# Análisis de Imágenes de Llamas

Repositorio que incluye fotos capturadas de una llama en régimen laminar, transición y turbulento. Con el código en MATLAB de análisis de entropía de Shannon y Rényi.

## Descripción del Proyecto

Este proyecto proporciona herramientas para analizar imágenes de llamas en diferentes regímenes de flujo utilizando medidas de entropía. La entropía es una métrica que cuantifica el desorden o la complejidad de la información en una imagen, lo que permite caracterizar objetivamente las diferencias entre los regímenes de flujo.

### Regímenes de Flujo

1. **Régimen Laminar**: Flujo ordenado y suave, con capas paralelas de fluido. La llama es estable y bien definida.
2. **Régimen de Transición**: Flujo intermedio con fluctuaciones moderadas y vórtices intermitentes.
3. **Régimen Turbulento**: Flujo caótico con alta variabilidad, formación de remolinos y estructuras complejas.

### Medidas de Entropía

- **Entropía de Shannon**: Mide la cantidad promedio de información en una imagen. Valores más altos indican mayor desorden.
- **Entropía de Rényi**: Generalización de la entropía de Shannon que permite ajustar la sensibilidad a diferentes aspectos de la distribución mediante el parámetro α.

## Estructura del Repositorio

```
Analisis-Imagenes/
├── README.md                           # Este archivo
├── analizar_llamas.m                   # Script principal de análisis
├── codigo/                             # Funciones de MATLAB
│   ├── calcular_entropia_shannon.m     # Calcula entropía de Shannon
│   └── calcular_entropia_renyi.m       # Calcula entropía de Rényi
└── imagenes/                           # Directorio de imágenes
    ├── laminar/                        # Imágenes de régimen laminar
    │   └── README.md
    ├── transicion/                     # Imágenes de régimen de transición
    │   └── README.md
    └── turbulento/                     # Imágenes de régimen turbulento
        └── README.md
```

## Requisitos

- MATLAB R2016b o superior
- Image Processing Toolbox

## Instalación

1. Clone este repositorio:
   ```bash
   git clone https://github.com/Aguayo3/Analisis-Imagenes.git
   cd Analisis-Imagenes
   ```

2. Coloque sus imágenes de llamas en los directorios correspondientes:
   - `imagenes/laminar/` - Imágenes de régimen laminar
   - `imagenes/transicion/` - Imágenes de régimen de transición
   - `imagenes/turbulento/` - Imágenes de régimen turbulento

3. Formatos de imagen soportados: JPG, JPEG, PNG, TIF, TIFF, BMP

## Uso

### Análisis Completo

Para analizar todas las imágenes en los tres regímenes:

```matlab
% Ejecutar el script principal
analizar_llamas
```

Este script:
1. Carga todas las imágenes de los directorios especificados
2. Calcula la entropía de Shannon para cada imagen
3. Calcula la entropía de Rényi con diferentes valores de α (0.5, 2, 3, 5)
4. Genera una tabla comparativa de resultados
5. Crea gráficos de comparación entre regímenes
6. Guarda los resultados en un archivo CSV

### Uso Individual de Funciones

#### Entropía de Shannon

```matlab
% Leer imagen
img = imread('imagenes/laminar/llama_001.jpg');

% Calcular entropía de Shannon
H_shannon = calcular_entropia_shannon(img);
fprintf('Entropía de Shannon: %.4f bits\n', H_shannon);
```

#### Entropía de Rényi

```matlab
% Leer imagen
img = imread('imagenes/turbulento/llama_001.jpg');

% Calcular entropía de Rényi con α = 2 (entropía de colisión)
H_renyi = calcular_entropia_renyi(img, 2);
fprintf('Entropía de Rényi (α=2): %.4f bits\n', H_renyi);

% Calcular con diferentes valores de α
alpha_values = [0.5, 2, 3, 5, inf];
for alpha = alpha_values
    H = calcular_entropia_renyi(img, alpha);
    fprintf('Entropía de Rényi (α=%.1f): %.4f bits\n', alpha, H);
end
```

## Resultados

El análisis genera los siguientes archivos de salida:

- `resultados_entropia.csv` - Tabla con todos los valores de entropía calculados
- `comparacion_shannon.png` - Gráfico de boxplot comparando entropía de Shannon entre regímenes
- `comparacion_renyi.png` - Gráficos de boxplot para diferentes valores de α de Rényi
- `promedio_shannon.png` - Gráfico de barras con promedios por régimen

### Interpretación de Resultados

- **Mayor entropía** → Mayor desorden y complejidad en la imagen
- **Menor entropía** → Imagen más ordenada y predecible

Se espera que:
- El régimen **laminar** tenga menor entropía (más ordenado)
- El régimen **turbulento** tenga mayor entropía (más caótico)
- El régimen de **transición** tenga valores intermedios

## Fundamento Teórico

### Entropía de Shannon

La entropía de Shannon se define como:

```
H = -Σ p(i) · log₂(p(i))
```

donde `p(i)` es la probabilidad del nivel de intensidad `i` en la imagen.

### Entropía de Rényi

La entropía de Rényi es una generalización parametrizada por α:

```
H_α = 1/(1-α) · log₂(Σ p(i)^α)
```

Casos especiales:
- α = 0: Entropía de Hartley (logaritmo del número de estados)
- α → 1: Converge a la entropía de Shannon
- α = 2: Entropía de colisión
- α → ∞: Entropía mínima

## Referencias

1. Shannon, C. E. (1948). "A Mathematical Theory of Communication". *Bell System Technical Journal*, 27(3), 379-423.

2. Rényi, A. (1961). "On Measures of Entropy and Information". *Proceedings of the Fourth Berkeley Symposium on Mathematical Statistics and Probability*, Volume 1: Contributions to the Theory of Statistics, 547-561.

3. Turns, S. R. (2011). "An Introduction to Combustion: Concepts and Applications". McGraw-Hill Education.

## Contribuciones

Las contribuciones son bienvenidas. Por favor:

1. Fork el repositorio
2. Cree una rama para su función (`git checkout -b feature/nueva-funcion`)
3. Commit sus cambios (`git commit -am 'Agregar nueva función'`)
4. Push a la rama (`git push origin feature/nueva-funcion`)
5. Abra un Pull Request

## Licencia

Este proyecto está disponible bajo la licencia MIT.

## Autor

Aguayo3

## Contacto

Para preguntas o sugerencias, por favor abra un issue en el repositorio de GitHub.