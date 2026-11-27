# Evaluación y mejora del proyecto — 22 de noviembre de 2026

## Resultado y criterio académico

Se conserva el modelo de la presentación del autor. El profesor lo consideró
bien, con observación de complejidad, según el comentario comunicado por el
estudiante. La revisión mejora la explicación y las pruebas, sin sustituir
las primitivas ni agregar resultados teóricos.

El paper en español tiene 16 páginas de cuerpo; la edición inglesa, 15, ambas dentro de 8–20, en 11pt, una columna y
márgenes de una pulgada. Sus tres resultados muestran: el óptimo con dos
restricciones; un umbral único solo bajo cruce e interioridad; y una condición
exacta para que la composición invierta el signo del riesgo nuevo.

## Cambios realizados

- Guía de lectura, diccionario de símbolos y separación de elegir esfuerzo,
  variar precio y comparar opacidad.
- Pruebas de P1–P3 divididas en pasos, con reglas y condiciones explícitas.
- Ejemplo guiado de esfuerzo y riesgo; conversión precisa de unidades.
- Frontera de composición ya presente en la presentación, ahora reproducida
  por código y explicada en el paper como aplicación de P3.
- Validación de probabilidades de referencia, primitivas finitas y saldos,
  consistente entre el ratio y su derivada.
- Dependencias fijadas, documentación actualizada y guía de 13 apartados
  para el manuscrito personal.

Los cinco supuestos y los tres enunciados se mantuvieron literalmente iguales;
sus huellas están en modelo_preservado.json. El PDF adjunto coincide con el
de main y **no se modificó ningún archivo de slides/**.

## Evaluación de calidad

La pregunta, los mecanismos, las proposiciones y las simulaciones cuentan una
misma historia. La existencia y unicidad no descansan solo en primer orden;
se tratan esquinas y probabilidades válidas. P2 distingue opacidad de una
mejora tecnológica impuesta. P3 evita identificar automáticamente un flujo
de riesgo con un ratio de saldo. La contribución está acotada frente al
antecedente empírico de Morgan y Ashcraft; no se reclama novedad universal.

Las limitaciones sustantivas están visibles: selección reducida, tecnología
lineal, volumen independiente del esfuerzo, precio dado y contabilidad S5.
No se reportan causalidad, estimaciones peruanas ni mejora predictiva no ejecutada.

## Verificaciones

El punto único de reproducción es `python code/verify.py`: 4018 controles
originales y 73 adicionales, seis figuras y archivos de resultados separados.
El contraejemplo exacto es −17/500 y el corte de composición en w=1/5 es 13/10.
La semilla base sigue siendo 20261110. Las cifras del plan no reproducibles
no se presentan como hechos confirmados.

Los conteos, hashes, revisión visual y compilación figuran en qa_report.json.
El PR6 fue fusionado con las dos ejecuciones de CI aprobadas: los controles
numéricos y las cuatro compilaciones pasaron en Linux. La lectura algebraica
final corrigió dos signos de la explicación nueva: la condición estacionaria
es e=z y la cota por valor absoluto es débil antes de la desigualdad estricta.
Los enunciados originales permanecen idénticos.
El control de preservación compara el SHA256 de los archivos de slides con
el estado inicial del autor. `build.yml` mantiene el SHA256 original
e67f4c1c24b115ecbf3e8feca11e0d2e4541cec368411d4a1fe508cf3ebf8d0f.

## Estado restante y entrega

La [matriz](cumplimiento.md) distingue cumplimiento, límites y pendientes.
El cierre estricto de Lean sobre el PDF final está aceptado: diez etapas,
cero errores, tres proposiciones y solo axiomas estándar. La carpeta generada
se copia íntegra; el [registro vigente](lean_progreso.md) enlaza el grafo,
la revisión independiente y el paquete humano. La reproducción reconstruye
todos los módulos y revalida el recibo con fuentes presentes. El fallo de la
fachada general de esta versión queda documentado; no se afirma su éxito.

El 26 de noviembre el estudiante suministró diez fotografías de derivaciones
auténticas, incorporadas en hand/derivaciones_manuscritas.pdf. Su revisión
identificó erratas de signos y desarrollos aún ausentes; el detalle y el
complemento necesario están en hand/revision_manuscrito.md. El apéndice sigue
parcial hasta corregir y añadir esas hojas. Las láminas transcritas por Claude
son un material distinto de estos escaneos.
El presupuesto de 30 minutos para 29 páginas principales es una estimación;
cuatro páginas quedan como respaldo. No se inventa un ensayo ni aprobación humana.

Se trabaja en apoyo y se publica por pull request hacia main. La entrega
oficial requiere el repositorio completo fusionado al 26 de noviembre a las
22:00 de Lima. La evaluación anterior a esta revisión se conserva en Git.
La calidad técnica mejora la entrega; no garantiza una nota.


## Ediciones finales del 24 de noviembre de 2026

La revisión editorial convierte las notas de seguimiento en una exposición
académica final, desarrolla las transiciones y conserva literalmente los
cinco supuestos y los tres enunciados en español. La edición inglesa incluye
el texto completo, las demostraciones y las seis figuras traducidas.
La figura 1 tiene márgenes equilibrados, escala y etiquetas legibles y una
leyenda exterior. Las magnitudes no cambian. Ambas ediciones compilan sin
desbordamientos ni caracteres faltantes y cumplen el límite de cuerpo.
La edición española final del 24 de noviembre tiene su propio cierre Lean
aceptado. La fuente anterior se conserva con sus bytes exactos como archivo
histórico. La traducción inglesa mantiene los mismos enunciados y condiciones.
