# Temas de Estadística Multidimensional - Clases

## Resumen de Temáticas Cubiertas en las Clases

Este documento consolida todos los temas tratados en las clases de Estadística Multidimensional, que servirán como base teórica para el primer trabajo del Proyecto Final.

---

## 1. Introducción a Datos Multivariantes

### Conceptos Fundamentales
- **Definición**: En análisis multivariante, cada observación no se describe con un solo valor, sino con **varias variables simultáneamente**.
- **Observación como vector**: Cada registro se representa como un vector de múltiples mediciones: $\mathbf{x}_i = (x_{i1}, x_{i2}, \ldots, x_{ip})$
- **Nube de puntos**: El conjunto de observaciones forma una nube de puntos en un espacio de $p$ dimensiones.

### Niveles de Análisis
- **Univariado**: Estudia una sola variable de forma aislada.
- **Bivariado**: Estudia dos variables y la relación entre ellas.
- **Multivariado**: Estudia varias variables simultáneamente considerando su estructura conjunta.

### Importancia del Análisis Multivariante
- Permite identificar patrones, estructura y dependencias entre múltiples variables.
- Esencial para comprender sistemas complejos donde las variables no actúan de manera aislada.
- Aplicable en reducción de dimensionalidad, clasificación, detección de atípicos e inferencia estadística.

---

## 2. Visualización en el Espacio Multidimensional

### Visualización 2D (Dos Dimensiones)
- **Representación**: Cada observación es un punto en un plano.
- **Información observable**:
  - Mezcla o separación entre grupos
  - Observaciones extremas o atípicas
  - Dispersión general de la nube
  - Forma y estructura del conjunto de datos
  - Relación visual entre dos variables

### Visualización 3D (Tres Dimensiones)
- **Representación**: Cada observación es un punto en el espacio tridimensional.
- **Ventajas sobre 2D**:
  - Estructura espacial más completa
  - Mejor separación entre categorías
  - Identificación de agrupamientos naturales
  - Mayor claridad en patrones multidimensionales

### Visualización de Dimensiones Mayores a 3
Para espacios de 4 o más dimensiones se utilizan técnicas como:
- **Proyecciones parciales**: Visualización de pares o ternas de variables
- **Coordenadas paralelas**: Permite visualizar perfiles completos de observaciones
- **Gráficos de matriz**: Matriz de dispersogramas para todas las combinaciones de variables

---

## 3. Estadística Descriptiva Multivariada

### Medidas de Localización Multivariada
- **Vector de medias**: $\boldsymbol{\mu} = (\mu_1, \mu_2, \ldots, \mu_p)$
- Representa el centro o centroide de la nube de puntos.
- Se calcula como la media de cada variable.

### Medidas de Dispersión Multivariada

#### Matriz de Varianza-Covarianza
$$\mathbf{\Sigma} = \begin{pmatrix}
\sigma_1^2 & \sigma_{12} & \cdots & \sigma_{1p} \\
\sigma_{21} & \sigma_2^2 & \cdots & \sigma_{2p} \\
\vdots & \vdots & \ddots & \vdots \\
\sigma_{p1} & \sigma_{p2} & \cdots & \sigma_p^2
\end{pmatrix}$$

- Diagonal: Varianzas de cada variable
- Fuera de diagonal: Covarianzas entre variables

#### Matriz de Correlación
- Estandariza las covarianzas a valores entre -1 y 1.
- Facilita la interpretación de relaciones entre variables.
- Valores cercanos a 1 o -1 indican fuerte relación lineal.
- Valores cercanos a 0 indican relación lineal débil o nula.

### Lectura de Matrices de Correlación
- Herramienta para resumir la estructura de dependencia en el sistema.
- Permite identificar variables relacionadas y patrones de asociación.
- Base fundamental para técnicas posteriores como PCA (Análisis de Componentes Principales).

---

## 4. Relaciones entre Variables

### Concepto de Dependencia
- **Variables relacionadas**: Dos o más variables cambian juntas de manera sistemática.
- **Independencia**: Las variables no muestran patrones de cambio conjunto.
- **En análisis multivariado**: Estudiamos sistemas de variables, no variables sueltas.

### Dependencia vs. Independencia
- Presencia o ausencia de patrones de movimiento conjunto.
- Evaluación visual mediante gráficos y cuantitativa mediante correlación.
- Implicaciones para interpretación y modelado.

### Medidas de Asociación Lineal
- **Correlación de Pearson**: Mide la fuerza y dirección de la relación lineal entre dos variables.
- Interpretación: 
  - $r \approx 1$: relación positiva fuerte
  - $r \approx -1$: relación negativa fuerte
  - $r \approx 0$: relación débil o nula

---

## 5. Estructura Multivariante y Patrones

### Detección de Patrones
- **Agrupamientos naturales**: Identificación de clusters o grupos en los datos.
- **Separación entre categorías**: Análisis de cohesión o dispersión de grupos categóricos.
- **Observaciones extremas**: Detección de puntos atípicos o outliers multidimensionales.
- **Direcciones dominantes**: Direcciones de mayor variabilidad en los datos.

### Estructura General del Sistema
- Cómo se distribuyen las variables conjuntamente.
- Qué tan compacta o dispersa es la nube de puntos.
- Si existen subestructuras internas o caóticos.
- Comportamiento simultáneo de múltiples variables.

---

## 6. Distribución Normal Multivariante

### Definición Formal
La distribución normal multivariante generaliza la distribución normal univariada clásica (campana de Gauss) a espacios de múltiples dimensiones.

### Parámetros
- **Vector de medias** ($\boldsymbol{\mu}$): Centro de la distribución multidimensional.
- **Matriz de covarianza** ($\boldsymbol{\Sigma}$): Describe la dispersión, orientación, forma y dependencia en el espacio multidimensional.

### Propiedades Importantes
- Modela simultáneamente un vector de variables.
- Permite representar: centro, dispersión, orientación, dependencia y forma geométrica.
- Es la distribución fundamental para:
  - Inferencia multivariante
  - Análisis de Componentes Principales (PCA)
  - Análisis Factorial
  - Técnicas de clasificación
  - Modelos gaussianos
  - Detección de atípicos

### Distribuciones Asociadas
- **Distribución conjunta**: Comportamiento simultáneo de todas las variables.
- **Distribuciones marginales**: Comportamiento individual de cada variable (normal univariada).
- **Distribuciones condicionales**: Comportamiento de un subconjunto de variables dado otro subconjunto.

### Conceptos Probabilísticos Fundamentales
- **Independencia**: Cuando la covarianza es cero.
- **Esperanza vectorial**: Vector de valores esperados de cada variable.
- **Ley de la varianza total**: Descomposición de la varianza en componentes.

### Intuición Geométrica
- En 2D: Elipses concéntricas alrededor del vector de medias.
- En 3D: Elipsoides en el espacio tridimensional.
- La orientación y forma de estas figuras están determinadas por la matriz de covarianza.

---

## 7. Técnicas de Análisis Multivariante (Introducción)

### Análisis de Componentes Principales (PCA)
- Técnica de reducción de dimensionalidad.
- Transforma variables originales en nuevas variables (componentes principales) no correlacionadas.
- Ordena componentes por cantidad de varianza explicada.
- Utiliza la matriz de covarianza o correlación.

### Clustering o Análisis de Conglomerados
- Agrupa observaciones similares en clusters.
- Las medidas descriptivas multivariadas proporcionan la base para definir similaridad.
- Permite identificar estructura natural en los datos.

### Fundamentos Teóricos
- Las medidas de localización y dispersión multivariadas son la base de estas técnicas.
- La matriz de correlación ayuda a entender qué tan interconectadas están las variables.
- La visualización multidimensional orienta la interpretación de resultados.

---

## 8. Casos de Aplicación Práctica

### Dataset Iris
- **Características**: 150 observaciones de flores, 4 variables numéricas (sépalos y pétalos), 1 variable categórica (especie).
- **Usos**:
  - Visualización 2D y 3D
  - Cálculo de matrices de covarianza y correlación
  - Detección de separación entre especies
  - Base para PCA y clustering

### Dataset USArrests
- **Características**: 50 estados de EE.UU., 4 variables de crimen y urbanización.
- **Análisis**:
  - Relaciones entre tipos de criminalidad
  - Estructura de dependencia entre variables
  - Interpretación de matrices de correlación
  - Uso de coordenadas paralelas

### Cancer Data (Proyecto Final)
- **Características**: 354 pacientes, 34 variables de características tumorales, diagnóstico (benigno/maligno).
- **Análisis**:
  - Identificación de patrones multivariados
  - Separación entre diagnósticos
  - Análisis exploratorio en múltiples dimensiones
  - Base para clasificación y predicción

---

## 9. Herramientas de Visualización y Análisis

### Gráficos Bivariados
- Dispersogramas (scatter plots)
- Visualización de relaciones entre pares de variables

### Gráficos Multivariados Tradicionales
- Gráficos 3D
- Coordenadas paralelas
- Matriz de dispersogramas (pair plots)

### Herramientas Estadísticas
- Resúmenes numéricos (media, desv. est., min, max, cuartiles)
- Matrices de correlación y covarianza
- Visualización mediante corrplots

### Paquetes R Utilizados
- `ggplot2`: Visualización avanzada
- `plotly`: Gráficos interactivos
- `GGally`: Matrices de gráficos
- `corrplot`: Visualización de matrices de correlación
- `MASS`: Funciones estadísticas avanzadas
- `tidyr` y `dplyr`: Manipulación de datos

---

## 10. Conclusión y Perspectiva del Proyecto Final

Todos estos temas forman la base teórica necesaria para:

1. **Entender la estructura** de datasets multidimensionales.
2. **Explorar datos** usando visualización y medidas descriptivas.
3. **Identificar patrones** y relaciones entre variables.
4. **Preparar datos** para técnicas de modelado más avanzadas.
5. **Comunicar hallazgos** de manera clara y fundamentada.

El **Proyecto Final** aplicará estos conceptos al análisis exploratorio y descriptivo de datos reales, con énfasis en la identificación de patrones, separación entre clases y comportamiento conjunto de múltiples variables.
