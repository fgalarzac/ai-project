# Notas de la formalización

La fuente es el [PDF fusionado](https://github.com/fgalarzac/ai-project/blob/25f0b0c7df040e2b04d78064b30949492cd4472f/paper/paper.pdf), del 22 de noviembre de 2026. Su SHA256 es `d7e8130cf88602523ff6eec460a27f798314c2596a4f241190d1da5c88fc2953`. Los cinco supuestos y los tres enunciados conservan literalmente su texto original. Esta edición amplía la explicación y los pasos de las pruebas, sin añadir primitivas ni resultados teóricos.

En [PaperInterface.lean](../PaperInterface.lean) se leen los tres enunciados completos. [ProofInterface.lean](../ProofInterface.lean) contiene las demostraciones de tipo exacto. El [informe](../FINAL_VALIDATION_REPORT.md) explica qué se comprueba y qué depende de los supuestos del paper. El [diagrama](DependencyDAG.pdf) muestra las relaciones entre los resultados y sus condiciones.

La evaluación es una elección condicionada en el precio. El ratio de cartera se interpreta para el mismo evento y horizonte de ambas cohortes, bajo S5. La formalización no aporta una estimación con datos bancarios ni una demostración de precios de equilibrio. Las anotaciones humanas del paquete de revisión no se han completado.

Los registros de aceptación se emiten por el motor sobre los archivos exactos; estas notas son una guía de lectura.
