# Guía de Inicio Rápido

Esta guía le ayudará a comenzar rápidamente con el análisis de entropía de imágenes de llamas.

## Pasos Básicos

### 1. Preparar las Imágenes

Coloque sus imágenes de llamas en los directorios correspondientes según el régimen de flujo:

```
imagenes/
├── laminar/       ← Imágenes de régimen laminar
├── transicion/    ← Imágenes de régimen de transición
└── turbulento/    ← Imágenes de régimen turbulento
```

**Formatos soportados**: JPG, JPEG, PNG, TIF, TIFF, BMP

### 2. Ejecutar el Análisis

Abra MATLAB en el directorio del proyecto y ejecute:

```matlab
analizar_llamas
```

Este script automáticamente:
- Cargará todas las imágenes de los tres regímenes
- Calculará la entropía de Shannon para cada imagen
- Calculará la entropía de Rényi con α = 0.5, 2, 3, 5
- Generará gráficos comparativos
- Guardará los resultados en un archivo CSV

### 3. Ver los Resultados

Después de ejecutar el análisis, encontrará:

- **resultados_entropia.csv** - Tabla con todos los valores calculados
- **comparacion_shannon.png** - Comparación de entropía de Shannon entre regímenes
- **comparacion_renyi.png** - Comparación de entropía de Rényi para diferentes α
- **promedio_shannon.png** - Promedios de entropía por régimen

## Ejemplo Rápido con Imágenes Sintéticas

Si desea probar el código sin tener imágenes reales, ejecute:

```matlab
ejemplo_uso
```

Este script:
- Crea imágenes sintéticas simulando los tres regímenes
- Demuestra cómo usar las funciones de entropía
- Genera visualizaciones de ejemplo

## Uso Individual de Funciones

### Calcular Entropía de Shannon

```matlab
% Leer imagen
img = imread('imagenes/laminar/llama_001.jpg');

% Calcular entropía
H = calcular_entropia_shannon(img);
fprintf('Entropía de Shannon: %.4f bits\n', H);
```

### Calcular Entropía de Rényi

```matlab
% Leer imagen
img = imread('imagenes/turbulento/llama_001.jpg');

% Calcular con α = 2
H = calcular_entropia_renyi(img, 2);
fprintf('Entropía de Rényi (α=2): %.4f bits\n', H);
```

## Interpretación Básica

### Valores Esperados

| Régimen      | Entropía Esperada | Característica        |
|--------------|-------------------|-----------------------|
| Laminar      | **Baja**          | Flujo ordenado        |
| Transición   | **Media**         | Flujo intermitente    |
| Turbulento   | **Alta**          | Flujo caótico         |

### Qué Significa la Entropía

- **Entropía alta** → Mayor complejidad, más desorden, más información
- **Entropía baja** → Menor complejidad, más orden, menos información

## Parámetro α en Entropía de Rényi

El parámetro α controla qué aspectos de la distribución de probabilidad se enfatizan:

| α | Énfasis | Nombre Especial |
|---|---------|-----------------|
| **0** | Todos los eventos por igual | Entropía de Hartley |
| **< 1** | Eventos raros | - |
| **→ 1** | Balance | Entropía de Shannon |
| **> 1** | Eventos frecuentes | - |
| **2** | Probabilidad de colisión | Entropía de colisión |
| **→ ∞** | Solo el evento más probable | Entropía mínima |

## Solución de Problemas

### No se encuentran imágenes

**Problema**: El script muestra "No se encontraron imágenes"

**Solución**: 
- Verifique que las imágenes estén en los directorios correctos
- Asegúrese de que las imágenes tengan extensiones válidas (.jpg, .png, etc.)
- Use rutas completas si es necesario

### Error al leer imagen

**Problema**: Error al procesar una imagen específica

**Solución**:
- Verifique que la imagen no esté corrupta
- Intente abrirla en un visor de imágenes primero
- Convierta la imagen a un formato compatible (JPG o PNG)

### Gráficos no se muestran

**Problema**: Los gráficos se generan pero no se visualizan

**Solución**:
- Los gráficos se guardan automáticamente como archivos PNG
- Abra los archivos PNG directamente para visualizarlos
- En MATLAB, use `openfig` si necesita interactividad

## Requisitos del Sistema

- **MATLAB**: R2016b o superior
- **Toolbox necesario**: Image Processing Toolbox
- **Alternativa**: GNU Octave con paquete image (gratuito y de código abierto)

## Compatibilidad con Octave

El código también funciona con GNU Octave (alternativa gratuita a MATLAB):

```bash
# Instalar Octave y el paquete image
sudo apt-get install octave octave-image  # En Linux

# Ejecutar el script
octave --eval "ejemplo_uso"
```

## Próximos Pasos

1. **Lea la documentación completa**: Consulte [README.md](README.md) para más detalles
2. **Revise la teoría**: Vea [TEORIA.md](TEORIA.md) para fundamentos matemáticos
3. **Experimente con α**: Pruebe diferentes valores de α en Rényi para su aplicación
4. **Personalice el análisis**: Modifique los scripts según sus necesidades específicas

## Contacto y Ayuda

- Para reportar problemas: Abra un issue en GitHub
- Para contribuir: Envíe un pull request
- Para preguntas: Consulte la documentación o contacte al autor

## Referencias Rápidas

- **Funciones principales**:
  - `calcular_entropia_shannon(imagen)` - Calcula entropía de Shannon
  - `calcular_entropia_renyi(imagen, alpha)` - Calcula entropía de Rényi
  - `analizar_llamas` - Script principal de análisis

- **Archivos importantes**:
  - `README.md` - Documentación completa del proyecto
  - `TEORIA.md` - Fundamentos teóricos
  - `ejemplo_uso.m` - Ejemplo interactivo

¡Comience ahora ejecutando `ejemplo_uso` para ver el sistema en acción!
