# Backlog de Issues Específicas - Proyecto Final (Cancer_Data)

## Objetivo del backlog
Definir issues accionables y medibles para GitHub Projects, alineadas con los temas de [Temas_Clases_EM.md](Temas_Clases_EM.md) y aplicadas al dataset [Cancer_Data.csv](Cancer_Data.csv).

## Equipo
- Jaider
- Julian
- Mauricio
- Andres
- Nelson

## Convenciones para GitHub Projects
- Estados sugeridos: `Backlog`, `Ready`, `In Progress`, `Review`, `Done`
- Prioridad: `P0` (crítico), `P1` (alto), `P2` (medio)
- Estimación: horas efectivas
- Etiquetas sugeridas: `data-cleaning`, `eda`, `multivariate`, `pca`, `report`, `qa`, `team-sync`

---

## Epic 1. Preparación y calidad de datos

### ISSUE 1 - Auditoría técnica inicial del dataset
- Responsable: Nelson
- Prioridad: P0
- Estimación: 3 h
- Etiquetas: `eda`, `team-sync`
- Dependencias: ninguna
- Título GitHub: `AUD-01 | Auditoría inicial de Cancer_Data.csv`
- Descripción específica:
  - Verificar ruta, encoding y separador del archivo.
  - Confirmar dimensiones reales del dataset (filas y columnas).
  - Detectar columnas no informativas (IDs puros, columnas vacías o constantes).
  - Identificar posibles inconsistencias de nombres (espacios, mayúsculas/minúsculas, símbolos).
- Subtareas:
  - Cargar dataset con `readr::read_csv` y guardar snapshot de `str()`.
  - Generar tabla de tipos de datos por columna.
  - Generar tabla de nulos por columna (`n` y `%`).
  - Generar tabla de cardinalidad para variables categóricas.
- Entregables:
  - `results/01_auditoria_dataset.md`
  - `results/tables/tabla_nulos.csv`
- Criterios de aceptación:
  - Se reportan dimensiones y tipos de todas las variables.
  - Se listan columnas problemáticas candidatas a limpieza.
  - El documento permite a otro integrante reproducir la carga sin errores.
- Definition of Done (DoD) de la issue:
  - Script ejecuta de inicio a fin sin intervención manual.
  - Tablas exportadas y vinculadas en el resumen.

### ISSUE 2 - Limpieza, tipado y diccionario de variables
- Responsable: Jaider
- Prioridad: P0
- Estimación: 5 h
- Etiquetas: `data-cleaning`
- Dependencias: ISSUE 1
- Título GitHub: `CLEAN-01 | Limpieza y tipado estandarizado de variables`
- Descripción específica:
  - Normalizar nombres de columnas a `snake_case`.
  - Convertir variable de diagnóstico a factor con niveles ordenados (`B`, `M` o equivalente real).
  - Resolver valores faltantes según regla consensuada (imputación o exclusión documentada).
  - Validar rangos plausibles en variables clínicas (sin valores negativos imposibles).
- Subtareas:
  - Crear función de limpieza reutilizable.
  - Documentar cada transformación en una tabla de trazabilidad.
  - Guardar dataset limpio versionado.
- Entregables:
  - `data/processed/cancer_data_clean.csv`
  - `results/02_log_limpieza.md`
- Criterios de aceptación:
  - 0 columnas con tipo incorrecto respecto al diccionario.
  - Diagnóstico queda tipado y validado.
  - Todas las reglas de limpieza quedan justificadas.
- DoD:
  - Archivo limpio se genera automáticamente con script.
  - Log de decisiones revisado por Nelson.

---

## Epic 2. EDA univariado y bivariado

### ISSUE 3 - Perfil univariado por variable y por clase diagnóstica
- Responsable: Julian
- Prioridad: P1
- Estimación: 6 h
- Etiquetas: `eda`
- Dependencias: ISSUE 2
- Título GitHub: `EDA-UNI-01 | Perfil univariado general y estratificado por diagnóstico`
- Descripción específica:
  - Reportar balance de clases (`B` vs `M`) con conteos y porcentajes.
  - Para cada variable numérica: media, mediana, sd, IQR, min, max, asimetría.
  - Repetir resumen por grupo de diagnóstico.
  - Detectar variables con diferencias descriptivas visibles entre clases.
- Subtareas:
  - Construir tabla resumen global.
  - Construir tabla resumen estratificada.
  - Crear histogramas/densidades para top 10 variables más informativas.
- Entregables:
  - `results/03_perfil_univariado.md`
  - `results/tables/tabla_resumen_global.csv`
  - `results/tables/tabla_resumen_por_clase.csv`
- Criterios de aceptación:
  - Balance de clases reportado explícitamente.
  - Tablas completas para todas las variables numéricas.
  - Al menos 10 visualizaciones con interpretación breve.
- DoD:
  - El documento identifica variables con mayor separación descriptiva inicial.

### ISSUE 4 - Matriz de relación bivariada enfocada en diagnóstico
- Responsable: Andres
- Prioridad: P1
- Estimación: 6 h
- Etiquetas: `eda`, `multivariate`
- Dependencias: ISSUE 2
- Título GitHub: `EDA-BI-01 | Relaciones bivariadas y separación B vs M`
- Descripción específica:
  - Seleccionar 8-12 pares de variables con mayor potencial de separación.
  - Crear scatter plots coloreados por diagnóstico y boxplots comparativos.
  - Incluir tendencia lineal o suavizada cuando aplique.
- Subtareas:
  - Definir criterio de selección de pares (correlación + diferencia de medias).
  - Estandarizar estilo gráfico y nomenclatura.
  - Escribir interpretación por bloque de gráficos.
- Entregables:
  - `results/04_analisis_bivariado.md`
  - `results/figs/bivariado_*.png`
- Criterios de aceptación:
  - Mínimo 12 gráficos útiles, no redundantes.
  - Cada gráfico tiene lectura concreta sobre separabilidad.
  - Se reportan pares más prometedores para modelado.
- DoD:
  - Evidencia visual suficiente para justificar variables candidatas.

---

## Epic 3. Estadística multivariada y estructura del sistema

### ISSUE 5 - Matriz de covarianza y correlación interpretada
- Responsable: Mauricio
- Prioridad: P1
- Estimación: 4 h
- Etiquetas: `multivariate`
- Dependencias: ISSUE 2
- Título GitHub: `MULTI-01 | Estructura de covarianza y correlación`
- Descripción específica:
  - Calcular matrices de covarianza y correlación para variables numéricas limpias.
  - Visualizar mapa de calor y detectar bloques de alta relación.
  - Identificar multicolinealidad potencial.
- Subtareas:
  - Exportar matrices en CSV.
  - Generar `corrplot` con umbral alto (|r| >= 0.7).
  - Redactar hallazgos principales por grupos de variables.
- Entregables:
  - `results/05_correlacion_covarianza.md`
  - `results/tables/matriz_correlacion.csv`
  - `results/tables/matriz_covarianza.csv`
- Criterios de aceptación:
  - Se listan pares con mayor correlación positiva/negativa.
  - Se identifican variables redundantes candidatas a reducción.
- DoD:
  - Conclusiones claras para informar PCA.

### ISSUE 6 - Visualización multivariada avanzada (3D + coordenadas paralelas)
- Responsable: Nelson
- Prioridad: P2
- Estimación: 5 h
- Etiquetas: `multivariate`, `eda`
- Dependencias: ISSUE 3, ISSUE 5
- Título GitHub: `MULTI-VIZ-01 | Patrones multivariados en 3D y coordenadas paralelas`
- Descripción específica:
  - Construir al menos 2 gráficos 3D con variables seleccionadas.
  - Construir 1 gráfico de coordenadas paralelas con normalización previa.
  - Analizar compactación, dispersión y traslape entre diagnósticos.
- Subtareas:
  - Seleccionar combinaciones con soporte estadístico (correlación y diferencias de clase).
  - Validar legibilidad de colores por clase.
  - Redactar lectura geométrica de la nube de puntos.
- Entregables:
  - `results/06_visualizacion_multivariada.md`
  - `results/figs/plot3d_*.html`
  - `results/figs/coordenadas_paralelas.png`
- Criterios de aceptación:
  - Se reportan patrones concretos (agrupación, solapamiento, extremos).
  - Se justifica por qué esas variables se visualizaron juntas.
- DoD:
  - Hallazgos conectados con decisiones de PCA o selección de variables.

---

## Epic 4. Reducción de dimensionalidad y supuestos

### ISSUE 7 - PCA completo con interpretación por diagnóstico
- Responsable: Mauricio
- Prioridad: P0
- Estimación: 7 h
- Etiquetas: `pca`, `multivariate`
- Dependencias: ISSUE 5
- Título GitHub: `PCA-01 | Análisis de Componentes Principales e interpretación`
- Descripción específica:
  - Estandarizar variables numéricas.
  - Ejecutar PCA y reportar varianza explicada acumulada.
  - Analizar cargas de PC1 y PC2.
  - Visualizar individuos y variables, coloreando por diagnóstico.
- Subtareas:
  - Scree plot + tabla de varianza explicada.
  - Biplot con etiquetas interpretables.
  - Tabla de top variables por magnitud de carga en PC1/PC2.
- Entregables:
  - `results/07_pca.md`
  - `results/tables/pca_varianza.csv`
  - `results/tables/pca_cargas_pc1_pc2.csv`
- Criterios de aceptación:
  - Se justifica número de componentes retenidas.
  - Se interpreta contribución de variables clave.
  - Se discute separación B vs M en espacio PCA.
- DoD:
  - Resultado reproducible y argumentado con tablas y gráficos.

### ISSUE 8 - Normal multivariante, distancia de Mahalanobis y atípicos
- Responsable: Julian
- Prioridad: P1
- Estimación: 6 h
- Etiquetas: `multivariate`, `qa`
- Dependencias: ISSUE 5
- Título GitHub: `ASSUMP-01 | Supuesto gaussiano multivariante y detección de outliers`
- Descripción específica:
  - Evaluar aproximación a normalidad multivariante (QQ plot de Mahalanobis o prueba apropiada).
  - Calcular distancias de Mahalanobis e identificar outliers con umbral estadístico.
  - Comparar incidencia de atípicos por diagnóstico.
- Subtareas:
  - Definir umbral con cuantiles de chi-cuadrado.
  - Generar tabla de observaciones extremas.
  - Redactar impacto potencial en análisis descriptivo/PCA.
- Entregables:
  - `results/08_supuestos_y_outliers.md`
  - `results/tables/outliers_mahalanobis.csv`
- Criterios de aceptación:
  - Método y umbral están justificados.
  - Lista de atípicos con interpretación.
  - Recomendación explícita: mantener, winsorizar o excluir (con razón).
- DoD:
  - Decisión final sobre atípicos aprobada por el equipo.

---

## Epic 5. Integración, control de calidad y entrega

### ISSUE 9 - Selección final de variables discriminantes
- Responsable: Jaider
- Prioridad: P0
- Estimación: 5 h
- Etiquetas: `multivariate`, `qa`
- Dependencias: ISSUE 3, ISSUE 4, ISSUE 5, ISSUE 7
- Título GitHub: `FEAT-01 | Ranking final de variables discriminantes B vs M`
- Descripción específica:
  - Integrar evidencia univariada, bivariada, correlación y PCA.
  - Proponer ranking top 10 variables discriminantes.
  - Marcar variables redundantes y variables recomendadas para modelado futuro.
- Subtareas:
  - Construir matriz de decisión con criterios ponderados.
  - Validar coherencia con cargas de PCA y separación visual.
  - Redactar recomendación final.
- Entregables:
  - `results/09_variables_discriminantes.md`
  - `results/tables/ranking_variables_top10.csv`
- Criterios de aceptación:
  - Ranking trazable a evidencia previa.
  - Justificación estadística por variable.
  - Recomendación accionable para siguiente etapa del proyecto.
- DoD:
  - Documento apto para incluir directo en la entrega.

### ISSUE 10 - Integración del informe y checklist final de entrega
- Responsable: Andres
- Prioridad: P0
- Estimación: 7 h
- Etiquetas: `report`, `qa`, `team-sync`
- Dependencias: ISSUE 1 a ISSUE 9
- Título GitHub: `REPORT-01 | Integración narrativa y control final de calidad`
- Descripción específica:
  - Integrar todos los resultados en una narrativa única.
  - Verificar consistencia entre tablas, gráficos y conclusiones.
  - Preparar sección final: limitaciones, hallazgos clave y siguientes pasos.
- Subtareas:
  - Estructurar documento con introducción, método, resultados, conclusiones.
  - Aplicar checklist de reproducibilidad (scripts, rutas, outputs).
  - Corregir redacción y formato para entrega académica.
- Entregables:
  - `entrega-1/informe_final.Rmd` (o equivalente)
  - `entrega-1/informe_final.html`
  - `results/10_checklist_entrega.md`
- Criterios de aceptación:
  - El informe conecta teoría de clase con resultados en Cancer_Data.
  - Todas las figuras y tablas están citadas y explicadas.
  - Checklist final marcado al 100%.
- DoD:
  - Informe listo para envío sin tareas abiertas críticas.

---

## Matriz de carga por integrante (equilibrada)
- Nelson: ISSUE 1, ISSUE 6
- Jaider: ISSUE 2, ISSUE 9
- Julian: ISSUE 3, ISSUE 8
- Mauricio: ISSUE 5, ISSUE 7
- Andres: ISSUE 4, ISSUE 10

## Reglas de coordinación recomendadas
- Reunión breve de 15 minutos cada 2 días para desbloqueos.
- Toda issue debe tener evidencia (tabla/figura) antes de pasar a `Review`.
- Ninguna issue `P0` puede quedarse en `Backlog` después del primer tercio del sprint.
- Commits sugeridos: prefijo por issue, por ejemplo `PCA-01: agregar scree plot y tabla de varianza`.

## Definition of Ready (DoR) para este proyecto
Una issue entra en `Ready` si tiene:
- objetivo claro,
- datos de entrada definidos,
- dependencias cerradas,
- entregable esperado,
- criterio de aceptación verificable.

## Definition of Done (DoD) transversal
Una issue se considera `Done` solo si:
- existe evidencia reproducible (script + output),
- cumple todos los criterios de aceptación,
- fue revisada por al menos 1 compañero,
- y su resultado está integrado o enlazado en el informe principal.
