# Guía de lectura y exposición de la presentación del autor

La presentación se conserva intacta: 29 páginas principales y cuatro de respaldo.
Plan propuesto: **28:45 de contenido + 1:15 de transiciones = 30 minutos**;
quedan unos 15 minutos del bloque de 45 para discusión. Es un presupuesto
de guion, no un ensayo oral observado. Las páginas 30–33 se usan a petición.
La guía anterior en slides/ pertenece a otra versión y se conserva como historia.

| Página | Tema | Segundos |
|---:|---|---:|
| 1 | Portada | 20 |
| 2 | Problema del supervisor | 55 |
| 3 | Pregunta de investigación | 40 |
| 4 | Resultado condicionado | 40 |
| 5 | Precio relativo | 70 |
| 6 | Tres mecanismos | 50 |
| 7 | Cronología | 55 |
| 8 | Solicitantes y evaluación | 90 |
| 9 | Pago y decisión | 85 |
| 10 | Tres proposiciones | 25 |
| 11 | P1 | 85 |
| 12 | P2 | 85 |
| 13 | P3 | 90 |
| 14 | Prueba P1: óptimo | 90 |
| 15 | Prueba P1: riesgo y pendientes | 80 |
| 16 | Pruebas P2 y P3 | 90 |
| 17 | Estado de las pruebas | 35 |
| 18 | Qué comprueban las simulaciones | 55 |
| 19 | Cruce | 65 |
| 20 | Esquinas | 55 |
| 21 | Composición | 65 |
| 22 | Sensibilidad | 60 |
| 23 | Lean | 90 |
| 24 | Crítica de IA | 55 |
| 25 | Derivación 1 | 35 |
| 26 | Derivación 2 | 35 |
| 27 | Derivación 3 | 45 |
| 28 | Lectura para supervisión | 45 |
| 29 | Preguntas | 35 |

## Hilo que simplifica el modelo

1. **Precio dado, una decisión.** El banco decide cuánto evaluar; no decide el precio dentro de este modelo. Solicitantes y pares se resumen en parámetros.
2. **Dos restricciones.** El esfuerzo no puede superar ni la capacidad ni el nivel que lleva el riesgo a cero. El mínimo elige la primera cota que se alcanza.
3. **Tres preguntas sucesivas.** P1 resuelve esfuerzo y riesgo. P2 compara opacidad al mismo precio. P3 agrega ese riesgo a una cartera antigua. No son tres juegos distintos.
4. **Unidades antes de resultados.** Un punto porcentual de tasa es 0.01 en D. Una pendiente de riesgo de 0.13 significa 0.13 puntos porcentuales de riesgo por un punto porcentual de precio.
5. **Reglas con condiciones.** La pendiente a−g²/c exige interioridad. El umbral exige S4. El vínculo con el saldo exige S5. Nombrar esas condiciones al interpretar cada gráfico.

## Cómo usar las partes densas

- Páginas 8–9: explicar primero solicitantes, después evaluación y al final el pago. No leer todas las letras antes de dar su significado.
- Página 11: comparar el candidato deseado con las dos cotas; después leer la tabla de regímenes.
- Páginas 14–16: el cuadrado completo convierte el problema en elegir el punto más cercano. En P2 separar existencia de unicidad. En P3 empezar por la suma de saldos en atraso.
- Páginas 19–22: explicar ejes, qué parámetro cambia y qué se mantiene fijo. La frontera 1.04/(1−w) es la misma P3, no una proposición adicional.
- Páginas 25–27: el álgebra ya se explicó antes. Usarlas para mostrar la comprobación de las afirmaciones de IA, sin repetir toda la demostración. Son transcripciones tipográficas; no acreditan un manuscrito auténtico.
- Página 23: el cierre de Lean se consulta en lean_progreso.md. El PDF conserva el estado de la presentación; no afirmar que un build aislado es aceptación integral.

## Preguntas difíciles

- **¿La tasa causa el riesgo?** No. Se deriva una respuesta condicionada; la causalidad y la predicción empírica son problemas distintos.
- **¿Por qué a es positivo?** Es el supuesto de selección reducida, inspirado en información asimétrica; no se estima ni se deduce de un juego de clientes.
- **¿Más opacidad mejora evaluar?** No necesariamente. S4 impone el descenso y cruce de la diferencia neta. La simulación alternativa muestra su fracaso.
- **¿Por qué baja el ratio si sube el riesgo nuevo?** Porque cae el peso de una cohorte más riesgosa que la antigua. Hay que medir calidad y composición.
- **¿Qué es epsilon?** La sensibilidad proporcional del saldo al precio: B'/B=−epsilon. En términos precisos es una semielasticidad; el deck usa también la palabra elasticidad.
- **¿Qué falta comprobar personalmente?** Ya se recibieron diez páginas manuscritas en hand/. Corregir sus erratas y completar los cálculos indicados en hand/revision_manuscrito.md; la conversión de fotos no acredita por sí sola comprensión ni ensayo.

Si el ensayo excede 30 minutos, usar las repeticiones algebraicas como consulta
y conservar siempre las condiciones e interpretaciones. No consta una duración real.
