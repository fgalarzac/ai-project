# Documentación del proyecto

Este índice organiza la lectura de la entrega y sus comprobaciones. El
[README principal](../README.md) resume la pregunta, el modelo y los tres
resultados. Los documentos de octubre y los diagnósticos iniciales conservan
el desarrollo histórico del proyecto.

## Leer la entrega

| Documento | Qué contiene |
|---|---|
| [Artículo en español](../paper/paper.pdf) · [English](../paper/paper_en.pdf) | Modelo, supuestos, resultados, demostraciones, simulaciones y apéndices. |
| [Guía de lectura](guia_lectura_paper.md) | Explicación de los símbolos y de cada etapa del argumento, con referencias a las páginas del artículo. |
| [Ediciones del artículo](paper_ediciones.md) | Fuentes, bibliografías, extensión y correspondencia entre idiomas. |
| [Informe de entrega](informe_final.md) | Síntesis de la contribución, la organización y las verificaciones. |
| [Matriz de entrega](cumplimiento.md) | Relación entre los requisitos de la consigna y los archivos del repositorio. |
| [Decisiones del modelo](decisiones.md) | Justificación de la medición, las restricciones y el alcance de los resultados. |
| [Fuentes](fuentes.md) | Procedencia de la evidencia, fechas de consulta y límites de su uso. |
| [Guía de presentación](guia_presentacion_actual.md) | Recorrido por las diapositivas del autor y distribución propuesta del tiempo. |
| [Apéndice manuscrito](../hand/Hand.pdf) | PDF suministrado por el autor. |
| [Registro de IA](../prompts.md) | Solicitudes, respuestas conservadas y registro de las comprobaciones. |

## Reproducir y verificar

| Recurso | Función |
|---|---|
| [Código y dependencias](../code/README.md) | Instrucciones para ejecutar `code/verify.py` y localizar las figuras y los resultados. |
| [Datos de contexto](../code/data/README.md) | Definición, unidades y fuente de la tabla histórica del BCRP. |
| [Estado de Lean](lean_progreso.md) | Fuente formalizada, proposiciones demostradas y evidencia del cierre aceptado. |
| [Reproducción de Lean](reproducir_lean.md) | Preparación del entorno Linux y comandos oficiales. |
| [Evidencia de Lean](lean_evidence/validation_summary.json) | Metadatos del grafo aceptado y de las comprobaciones de la fuente. |
| [Calidad de las ediciones](paper_ediciones_qa.json) | Extensión, preservación del modelo y revisión visual de ambos artículos. |
| [Registro general de calidad](qa_report.json) | Conteos, huellas de archivos y comprobaciones de los entregables. |

La carpeta `lean/` conserva los archivos generados por el protocolo oficial.
Sus instrucciones de reproducción y sus registros técnicos se consultan
desde los enlaces anteriores.

## Consultar el historial

- [Propuesta inicial](../proposal/proposal.pdf) y [presentación del tema](../slides/topic.pdf): avance de octubre de 2026.
- [Diagnóstico inicial](diagnostico_inicial.md): situación del repositorio el 10 de noviembre, anterior a las revisiones posteriores.
- [Alternativas de Lean](lean_alternativas.md): exploración del entorno y de las rutas de ejecución durante la etapa inicial.
- [Informe previo al cierre de Lean](archive/informe_antes_cierre_lean.md): registro de una versión anterior.
- [Resultados iniciales de integración](ci_results.json): comprobaciones vinculadas al commit indicado dentro del archivo.

Los registros históricos describen su fecha y versión. Para conocer la
entrega actual, se utilizan el artículo final, la matriz y el estado de Lean.
