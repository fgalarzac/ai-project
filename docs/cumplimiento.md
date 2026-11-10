# Matriz de cumplimiento de la consigna vigente

Estado auditado el10 de noviembre de 2026. Autoridad: issue7, no inferencias de la nota de
otro proyecto. `Cumplido` describe la evidencia disponible, no una nota.
Las pruebas analíticas, la comprobación numérica y Lean son capas distintas.

| Requisito | Diagnóstico inicial | Estado actual | Evidencia y verificación | Acción restante |
|---|---|---|---|---|
| Tema TrackB y pregunta concreta | Propio en propuesta | Cumplido | paper§1–4; precio relativo y morosidad peruana | Defensa personal |
| Repositorio público y enlace en issue | Presente | Cumplido | Comentario6157914408 y API pública | Ninguna nueva publicación de enlace |
| Rama→PR→merge | apoyo existente divergente | Cumplido para base | PR4 fusionado; actualización desde apoyo en PR5 | Conservar flujo por PR en integración Lean |
| README de una página | Muy extenso | Cumplido | README compacto con condiciones y estados | Revisar comprensión |
| Propuesta2–4pp y fuente | Avance propio | Cumplido | proposal/proposal.tex/pdf recompilados; conteo en qa_report.json | Versión histórica de octubre |
| Slides del tema y fuente conservadas | Avance propio | Cumplido | slides/topic.tex/pdf recompilados | Sin reescribir historia |
| Paper8–20pp desde título a conclusión,11pt,1in,1col | Plantilla | Cumplido | paper.tex y pdf; body:end en aux y revisión del PDF | Véase conteo final QA |
| Introducción, literatura, modelo, discusión, conclusión | Plantilla | Cumplido | paper§1–8 | Revisar personalmente |
| Primitivas, unidades, dominios y cronología | Parcial | Cumplido | paper§4, S1–S3 | Ninguna simulación empírica atribuida |
| Supuestos numerados | Incompletos | Cumplido | S1–S5, referencias en P1–P3 | Mantener al cambiar modelo |
| Proposición propia con prueba completa | Solo candidata | Cumplido | P1global, P2umbral, P3composición y pruebas | Lean general separado |
| Existencia, unicidad y esquinas | Solo FOC interior | Cumplido | Cuadrado completo, compactitud, singleton, capacidad y piso | No se resuelve equilibrio de precios |
| Signo, opacidad y robustez | Cruce impuesto | Cumplido | Condiciones S4, tecnología que empeora, capacidad y sensibilidad | Validar opacidad con datos en trabajo futuro |
| Conexión flujo-stock | Mapa positivo postulado | Cumplido | S5 y P3, condición cuantitativa y contraejemplo | Examinar castigos/curaciones al llevar a datos |
| Promedio versus mediana | Inconsistencia | Cumplido | Promedio principal, mediana sensibilidad, ejemplo verificado | Celdas y pesos empíricos pendientes |
| Hechos, fuentes y editorial de preprints | Cifras del plan sin base | Parcial | docs/fuentes.md; tabla BCRP reproducible; WP identificado | Base del plan necesaria para verificar sus cifras2026 |
| Verificación de cada resultado | Solo interior | Cumplido | code/verify.py, checks.py; SymPy, optimización independiente, esquinas y diferencias finitas | No se prueba teorema por simulación |
| Dependencias y semilla | Parcial | Cumplido | requirements.txt; semilla 20261110; fallas explícitas | Instalar versiones compatibles |
| Figuras legibles con unidades y fuente | Solo figura tema | Cumplido | Cinco figuras finales, captions y fuentes, revisión visual | Véase QA |
| Presentación final español,30min y discusión | Plantilla | Cumplido | 27slides, timing.json:1780seg, guía y preguntas | Ensayo real pendiente |
| Lean: enunciado, fragmento real y límites en slide | Ejemplo de plantilla | Cumplido | Slide22 compara identidad de P3 con enunciado y prueba generales reales | Cierre oficial separado y explícito |
| Lean oficial con agente y paper fijado | Placeholder | Parcial | Fuente fusionada, agente exigido, P1–P3 compiladas, revisión preliminar independiente | Cierre, fuente actualizada y copia íntegra pendientes |
| Tabla Lean por resultado, hipótesis y chequeo | Ejemplo | Cumplido como reporte de estado | ApéndiceB: declaraciones, archivos, hipótesis, compilación y fuente fijada | Estado vigente fuera del PDF en lean_progreso.md |
| Manuscrito auténtico de todas las derivaciones | Placeholder | Pendiente | Guía tipográfica de 12 apartados en hand/, no suplantada como manuscrito | Escribir, revisar, escanear y proyectar hoja real |
| IA: afirmación revisada, veredicto y registro | Parcial | Cumplido como registro disponible | prompts.md y apéndiceC; no revisión humana fabricada | Ratificación personal y manuscrito de crítica |
| CuatroPDF junto a fuentes | Dos finales de plantilla | Cumplido | Compilación de propuesta, tema, final y paper | CI remota superada; enlace en informe final |
| build.yml conservado | Original | Cumplido | SHA256e67f4c1c24b115ecbf3e8feca11e0d2e4541cec368411d4a1fe508cf3ebf8d0f | Ningún cambio permitido |
| Entrega en main a tiempo | No hay merge final | Pendiente | PR revisable desde apoyo | Slides10nov22:00; paper26nov22:00, Lima |

La presentación es trabajo en progreso para recibir crítica. El material académico y su reproducción están preparados. El manuscrito
personal y el cierre oficial de Lean siguen pendientes.
Un resultado nulo de predicción no permite atribuir todo a ausencia de señal.
La entrega puede aspirar a alta calidad sin garantizar una calificación.
