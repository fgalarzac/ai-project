# Informe de entrega y estado del proyecto

10 de noviembre de 2026. Trabajo en apoyo, con publicación mediante pull request.

## Cambios y contribución

El trabajo explica cuándo el precio relativo del crédito informa sobre riesgo.
Un precio alto puede empeorar la selección e incentivar evaluación. La capacidad
limitada altera ese equilibrio. Al agregar créditos antiguos y nuevos, cambiar
los pesos puede invertir el signo del riesgo. El modelo condiciona en precio;
no afirma resolver equilibrio ni mejorar un pronóstico peruano ya estimado.

El paper tiene tres proposiciones con pruebas completas: óptimo global y
esquinas; umbral único bajo cruce e interioridad; y transmisión al saldo con
composición. Se define el promedio de pares como referencia y la mediana como
sensibilidad. Las cifras no reproducibles del plan no se presentan como hechos.

## Artículo y presentación

Se conserva 11pt, una columna y márgenes de una pulgada. El cuerpo debe tener
8–20 páginas; el conteo definitivo figura en [qa_report.json](qa_report.json),
usando la etiqueta body:end y la transición conclusión/referencias del PDF.
La versión publicada tiene 11 páginas de cuerpo y 14 en total; se recompiló
y revisó visualmente antes de publicar, sin recortes ni advertencias.

La presentación tiene 27 diapositivas en español. Sigue problema, evidencia,
pregunta, precio relativo, mecanismos, cronología, primitivas, optimización,
P1–P3 y pruebas, simulaciones, Lean, límites y discusión. Los símbolos nuevos
se explican en su diapositiva. Se distinguen derivadas respecto de opacidad
y precio; se explican el saldo base y su sensibilidad antes de utilizarlos.
El guion suma 1780 segundos (29:40), con unos 15 minutos para discusión.
Es una estimación, no un ensayo oral observado.

## Verificaciones y límites

- `python code/verify.py`: 4018 comprobaciones aprobadas, con optimizador
  independiente, diferencias finitas, SymPy, dominios y contraejemplos.
- Cuatro PDF obligatorios junto a sus fuentes: propuesta, tema, presentación
  final y paper. La guía de derivaciones es un quinto PDF tipográfico.
- Conteo, hashes, advertencias, enlaces y recortes: [QA](qa_report.json).
- `.github/workflows/build.yml` permanece intacto; SHA256
  `e67f4c1c24b115ecbf3e8feca11e0d2e4541cec368411d4a1fe508cf3ebf8d0f`.
- P1–P3 generales compilan en Lean; solo axiomas estándar. La revisión
  preliminar independiente no encontró discrepancias en 21 elementos.
  El cierre oficial está en curso: [evidencia vigente](lean_progreso.md).

## Publicación y archivos

[PR4](https://github.com/fgalarzac/ai-project/pull/4) fusionó la versión base.
[PR5](https://github.com/fgalarzac/ai-project/pull/5) concentra la actualización
académica y la infraestructura Linux para Lean. El estado remoto real debe
consultarse en esos enlaces. Los cambios académicos abarcan paper/paper.tex/pdf,
slides/final.tex/pdf, guía y timing, README, prompts y documentación. Las
fuentes históricas de propuesta y tema se conservan. La carpeta Lean final
se integrará después de la aceptación oficial, mediante el mismo flujo por PR.

La [matriz de cumplimiento](cumplimiento.md) relaciona requisitos con evidencia.
El [informe anterior](archive/informe_antes_cierre_lean.md) conserva la historia
y el diagnóstico; sus estados antiguos de GitHub y Lean no son el estado actual.

## Participación personal y debilidades

El estudiante aún debe escribir, revisar y digitalizar las derivaciones reales
de hand/, contrastarlas con la guía, comprender las hipótesis y ensayar la
defensa. La guía tipográfica no se presenta como manuscrito auténtico.

Prioridades restantes: cierre oficial de Lean; manuscrito y defensa personales;
en investigación posterior, panel reproducible, prueba fuera de muestra y
contraste del supuesto contable frente a castigos, amortización y recuperaciones.
La revisión independiente realizada es de IA; no se ha fabricado aprobación
humana. El material apunta a alta calidad académica sin garantizar una nota.
