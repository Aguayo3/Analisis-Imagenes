# Estructura del Repositorio

Este documento describe la estructura completa del repositorio de Análisis de Imágenes de Llamas.

## Árbol de Directorios

```
Analisis-Imagenes/
│
├── README.md                           # Documentación principal del proyecto
├── GUIA_RAPIDA.md                      # Guía de inicio rápido
├── TEORIA.md                           # Fundamentos teóricos
├── ESTRUCTURA.md                       # Este archivo (estructura del proyecto)
├── .gitignore                          # Archivos a ignorar en Git
│
├── analizar_llamas.m                   # Script principal de análisis
├── ejemplo_uso.m                       # Script de ejemplo con imágenes sintéticas
│
├── codigo/                             # Directorio de funciones MATLAB
│   ├── calcular_entropia_shannon.m     # Función: Entropía de Shannon
│   ├── calcular_entropia_renyi.m       # Función: Entropía de Rényi
│   ├── obtener_imagenes.m              # Función: Buscar imágenes en directorio
│   ├── analizar_regimen.m              # Función: Analizar régimen de flujo
│   └── generar_graficos.m              # Función: Generar gráficos comparativos
│
└── imagenes/                           # Directorio de imágenes
    ├── laminar/                        # Imágenes de régimen laminar
    │   └── README.md                   # Descripción del régimen laminar
    ├── transicion/                     # Imágenes de régimen de transición
    │   └── README.md                   # Descripción del régimen de transición
    └── turbulento/                     # Imágenes de régimen turbulento
        └── README.md                   # Descripción del régimen turbulento
```

## Archivos de Documentación

### README.md
Documentación principal del proyecto que incluye:
- Descripción general del proyecto
- Explicación de los regímenes de flujo
- Instrucciones de instalación y uso
- Ejemplos de código
- Referencias bibliográficas

### GUIA_RAPIDA.md
Guía de inicio rápido para usuarios que incluye:
- Pasos básicos para comenzar
- Uso de las funciones principales
- Interpretación de resultados
- Solución de problemas comunes

### TEORIA.md
Fundamentos teóricos del análisis de entropía que incluye:
- Teoría de la información
- Definición matemática de entropía de Shannon
- Definición matemática de entropía de Rényi
- Aplicación a imágenes de llamas
- Referencias académicas

### ESTRUCTURA.md
Este archivo que documenta la estructura del repositorio.

## Scripts Principales

### analizar_llamas.m
Script principal que:
- Carga imágenes de los tres regímenes
- Calcula entropía de Shannon para cada imagen
- Calcula entropía de Rényi con múltiples valores de α
- Genera tabla comparativa de resultados
- Crea gráficos de comparación
- Guarda resultados en archivo CSV

**Uso**: `analizar_llamas` en MATLAB

### ejemplo_uso.m
Script de demostración que:
- Crea imágenes sintéticas simulando los tres regímenes
- Demuestra el uso de las funciones de entropía
- Genera visualizaciones de ejemplo
- Analiza sensibilidad del parámetro α

**Uso**: `ejemplo_uso` en MATLAB

## Funciones en el Directorio 'codigo/'

### calcular_entropia_shannon.m
**Propósito**: Calcula la entropía de Shannon de una imagen

**Entrada**: 
- `imagen` - Imagen en escala de grises o RGB

**Salida**:
- `entropia` - Valor de entropía en bits

**Fórmula**: H = -Σ p(i) · log₂(p(i))

### calcular_entropia_renyi.m
**Propósito**: Calcula la entropía de Rényi de una imagen

**Entradas**:
- `imagen` - Imagen en escala de grises o RGB
- `alpha` - Parámetro de orden (α ≥ 0, α ≠ 1)

**Salida**:
- `entropia` - Valor de entropía en bits

**Fórmula**: H_α = 1/(1-α) · log₂(Σ p(i)^α)

### obtener_imagenes.m
**Propósito**: Obtiene lista de archivos de imagen en un directorio

**Entradas**:
- `directorio` - Ruta del directorio
- `formatos` - Cell array con patrones de archivo

**Salida**:
- `imagenes` - Cell array con rutas de imágenes

### analizar_regimen.m
**Propósito**: Analiza todas las imágenes de un régimen de flujo

**Entradas**:
- `imagenes` - Cell array con rutas de imágenes
- `nombre_regimen` - Nombre del régimen
- `alphas` - Vector con valores de α

**Salida**:
- `resultados` - Array de estructuras con resultados

### generar_graficos.m
**Propósito**: Genera gráficos comparativos de entropías

**Entradas**:
- `resultados` - Array de estructuras con resultados
- `alphas` - Vector con valores de α usados

**Salidas**: 
- Archivos PNG con gráficos

## Directorio de Imágenes

### imagenes/laminar/
Contiene imágenes de llamas en **régimen laminar**:
- Flujo ordenado y suave
- Bajo número de Reynolds (Re < 2300)
- Baja entropía esperada

### imagenes/transicion/
Contiene imágenes de llamas en **régimen de transición**:
- Flujo intermitente
- Número de Reynolds medio (2300 < Re < 4000)
- Entropía media esperada

### imagenes/turbulento/
Contiene imágenes de llamas en **régimen turbulento**:
- Flujo caótico
- Alto número de Reynolds (Re > 4000)
- Alta entropía esperada

## Archivos de Salida

Cuando se ejecuta `analizar_llamas`, se generan los siguientes archivos:

### resultados_entropia.csv
Tabla CSV con columnas:
- Regimen
- Archivo
- Shannon
- Renyi_alpha_0.5
- Renyi_alpha_2
- Renyi_alpha_3
- Renyi_alpha_5

### comparacion_shannon.png
Gráfico de boxplot comparando entropía de Shannon entre los tres regímenes.

### comparacion_renyi.png
Conjunto de gráficos de boxplot para diferentes valores de α de Rényi.

### promedio_shannon.png
Gráfico de barras con el promedio de entropía de Shannon por régimen.

Cuando se ejecuta `ejemplo_uso`, se generan:
- `ejemplo_imagenes_sinteticas.png`
- `ejemplo_comparacion_entropias.png`
- `ejemplo_sensibilidad_alpha.png`

## Archivo .gitignore

Especifica archivos que no deben ser versionados en Git:
- Archivos temporales de MATLAB/Octave (*.asv, *.m~, *.mat)
- Resultados generados (CSV, PNG)
- Archivos de sistema (.DS_Store, Thumbs.db)
- Opcionalmente: imágenes de prueba

## Flujo de Trabajo Típico

1. **Preparación**:
   ```bash
   git clone https://github.com/Aguayo3/Analisis-Imagenes.git
   cd Analisis-Imagenes
   ```

2. **Agregar imágenes**:
   - Copiar imágenes de llamas a los directorios correspondientes

3. **Ejecutar análisis**:
   ```matlab
   analizar_llamas
   ```

4. **Revisar resultados**:
   - Ver `resultados_entropia.csv`
   - Abrir archivos PNG generados

5. **Experimentar** (opcional):
   ```matlab
   ejemplo_uso
   ```

## Extensibilidad

El código está diseñado para ser fácilmente extensible:

- **Agregar nuevas métricas**: Crear nuevas funciones en `codigo/`
- **Modificar análisis**: Editar `analizar_llamas.m`
- **Cambiar visualizaciones**: Modificar `generar_graficos.m`
- **Agregar regímenes**: Crear nuevos directorios en `imagenes/`

## Compatibilidad

- **MATLAB**: R2016b o superior
- **GNU Octave**: Versión 4.0 o superior con paquete image
- **Sistema operativo**: Multiplataforma (Windows, macOS, Linux)

## Mantenimiento

Para mantener el repositorio limpio:
- No versionar archivos generados (están en .gitignore)
- Documentar cambios importantes
- Actualizar README.md y TEORIA.md según sea necesario
- Mantener consistencia en el estilo de código

## Soporte

Para ayuda:
1. Consultar GUIA_RAPIDA.md
2. Revisar README.md
3. Leer TEORIA.md para fundamentos
4. Abrir un issue en GitHub si persiste el problema
