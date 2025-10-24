# Fundamentos Teóricos del Análisis de Entropía

## Introducción

Este documento proporciona los fundamentos teóricos detrás del análisis de entropía aplicado a imágenes de llamas en diferentes regímenes de flujo.

## 1. Teoría de la Información

La teoría de la información, desarrollada por Claude Shannon en 1948, proporciona herramientas matemáticas para cuantificar la información contenida en un mensaje o señal. En el contexto de procesamiento de imágenes, estas herramientas permiten caracterizar la complejidad y el desorden visual.

## 2. Entropía de Shannon

### Definición

La entropía de Shannon mide la cantidad promedio de información (o incertidumbre) en una variable aleatoria. Para una imagen digital, se calcula a partir del histograma de intensidades:

```
H = -Σ p(i) · log₂(p(i))
```

donde:
- `H` es la entropía en bits
- `p(i)` es la probabilidad del nivel de intensidad `i`
- La suma es sobre todos los niveles de intensidad posibles (0-255 para imágenes de 8 bits)

### Propiedades

1. **No negatividad**: H ≥ 0
2. **Máximo**: Para imágenes de 8 bits, H_max = 8 bits (distribución uniforme)
3. **Mínimo**: H_min = 0 (imagen con un solo nivel de intensidad)

### Interpretación

- **Alta entropía**: La imagen contiene muchos niveles de intensidad diferentes distribuidos uniformemente, indicando alta complejidad visual y desorden.
- **Baja entropía**: La imagen tiene pocos niveles de intensidad o una distribución muy concentrada, indicando simplicidad y orden.

## 3. Entropía de Rényi

### Definición

La entropía de Rényi es una generalización paramétrica de la entropía de Shannon:

```
H_α = 1/(1-α) · log₂(Σ p(i)^α)
```

donde:
- `α` es el parámetro de orden (α ≥ 0, α ≠ 1)
- `p(i)` es la probabilidad del nivel de intensidad `i`

### Casos Especiales

1. **α = 0**: Entropía de Hartley (Max-entropy)
   ```
   H₀ = log₂(N)
   ```
   donde N es el número de estados con probabilidad no cero

2. **α → 1**: Converge a la entropía de Shannon
   ```
   lim(α→1) H_α = H_Shannon
   ```

3. **α = 2**: Entropía de colisión
   ```
   H₂ = -log₂(Σ p(i)²)
   ```
   Mide la probabilidad de que dos muestras aleatorias tengan el mismo valor

4. **α → ∞**: Entropía mínima
   ```
   H_∞ = -log₂(max p(i))
   ```
   Depende solo del evento más probable

### Interpretación del Parámetro α

- **α < 1**: Mayor sensibilidad a eventos raros (colas de la distribución)
- **α = 1**: Equilibrio (entropía de Shannon)
- **α > 1**: Mayor sensibilidad a eventos probables (centro de la distribución)
- **α → ∞**: Solo considera el evento más probable

## 4. Aplicación a Imágenes de Llamas

### Regímenes de Flujo

#### 4.1 Régimen Laminar
- **Características**: Flujo ordenado, líneas de corriente paralelas
- **Número de Reynolds**: Re < 2300
- **Expectativa de entropía**: Baja (estructura ordenada)
- **Apariencia visual**: Llama suave y estable

#### 4.2 Régimen de Transición
- **Características**: Flujo intermitente con vórtices ocasionales
- **Número de Reynolds**: 2300 < Re < 4000
- **Expectativa de entropía**: Media (estructura semi-ordenada)
- **Apariencia visual**: Llama con fluctuaciones moderadas

#### 4.3 Régimen Turbulento
- **Características**: Flujo caótico con remolinos y estructuras complejas
- **Número de Reynolds**: Re > 4000
- **Expectativa de entropía**: Alta (estructura desordenada)
- **Apariencia visual**: Llama altamente variable e inestable

### Relación entre Entropía y Régimen de Flujo

La entropía de la imagen está relacionada con:

1. **Variabilidad espacial**: Mayor turbulencia → Mayor variación de intensidad → Mayor entropía
2. **Complejidad estructural**: Estructuras caóticas → Más niveles de intensidad → Mayor entropía
3. **Predictibilidad**: Flujo laminar más predecible → Menor entropía

## 5. Ventajas del Análisis de Entropía

### 5.1 Objetividad
- Métrica cuantitativa que elimina la subjetividad del análisis visual
- Permite comparaciones reproducibles entre diferentes condiciones

### 5.2 Sensibilidad
- Detecta diferencias sutiles en la estructura de la llama
- Diferentes valores de α en Rényi permiten enfocarse en diferentes aspectos

### 5.3 Robustez
- Invariante a la escala de intensidad (normalización automática)
- Menos sensible a ruido que otros métodos basados en gradientes

## 6. Limitaciones y Consideraciones

### 6.1 Información Espacial
- La entropía basada en histogramas no considera la disposición espacial de los píxeles
- Dos imágenes con diferente estructura pueden tener la misma entropía

### 6.2 Resolución
- La resolución de la imagen afecta el cálculo de entropía
- Comparaciones deben hacerse con imágenes de resolución similar

### 6.3 Condiciones de Captura
- Iluminación, exposición y otros parámetros de la cámara afectan los resultados
- Es crucial mantener condiciones de captura consistentes

## 7. Metodología Recomendada

### 7.1 Captura de Imágenes
1. Usar misma cámara y configuración para todas las imágenes
2. Mantener distancia y ángulo consistentes
3. Controlar iluminación ambiental
4. Capturar múltiples muestras de cada régimen

### 7.2 Preprocesamiento
1. Convertir a escala de grises (elimina información de color redundante)
2. Considerar corrección de iluminación si es necesaria
3. Aplicar filtrado de ruido solo si es estrictamente necesario

### 7.3 Análisis
1. Calcular entropía de Shannon para caracterización general
2. Usar múltiples valores de α en Rényi para análisis detallado
3. Realizar análisis estadístico sobre múltiples muestras
4. Comparar distribuciones entre regímenes

## 8. Referencias Bibliográficas

1. **Shannon, C. E.** (1948). "A Mathematical Theory of Communication". *Bell System Technical Journal*, 27(3), 379-423.
   - Trabajo fundacional de la teoría de la información

2. **Rényi, A.** (1961). "On Measures of Entropy and Information". *Proceedings of the Fourth Berkeley Symposium on Mathematical Statistics and Probability*, Volume 1: Contributions to the Theory of Statistics, 547-561.
   - Introduce la generalización de la entropía de Shannon

3. **Gonzalez, R. C., & Woods, R. E.** (2018). *Digital Image Processing* (4th ed.). Pearson.
   - Referencia estándar de procesamiento de imágenes

4. **Turns, S. R.** (2011). *An Introduction to Combustion: Concepts and Applications* (3rd ed.). McGraw-Hill Education.
   - Fundamentos de combustión y regímenes de flujo

5. **Pope, S. B.** (2000). *Turbulent Flows*. Cambridge University Press.
   - Teoría de turbulencia y sus características

6. **Cover, T. M., & Thomas, J. A.** (2006). *Elements of Information Theory* (2nd ed.). Wiley-Interscience.
   - Tratado completo de teoría de la información

## 9. Extensiones Posibles

### 9.1 Entropía Espacial
- Considerar la distribución espacial de píxeles mediante entropía condicional
- Analizar entropía en subregiones de la imagen

### 9.2 Análisis Temporal
- Calcular entropía en secuencias de video
- Estudiar la evolución temporal de la entropía

### 9.3 Análisis Multiresolución
- Calcular entropía a diferentes escalas usando wavelets
- Identificar estructuras a diferentes niveles de detalle

### 9.4 Otras Medidas
- Información mutua entre canales de color
- Dimensión fractal como medida complementaria de complejidad
- Análisis espectral de frecuencias espaciales

## 10. Conclusión

El análisis de entropía proporciona herramientas cuantitativas poderosas para caracterizar la complejidad visual de imágenes de llamas. La combinación de entropía de Shannon (caracterización general) y entropía de Rényi (análisis paramétrico) permite una descripción completa y objetiva de las diferencias entre regímenes de flujo laminar, de transición y turbulento.
