# Decisiones del modelo y de la entrega

Estas decisiones explican el alcance del [artículo final](../paper/paper.pdf).
La [guía de lectura](guia_lectura_paper.md) desarrolla su notación y sus pruebas.

1. **Resolver la evaluación a un precio dado.** El banco elige el esfuerzo
   después de observar el precio relativo y la composición de solicitantes.
   El análisis compara decisiones condicionadas por ese precio; resolver su
   equilibrio en un juego entre bancos requiere un modelo adicional.

2. **Usar el promedio simple de otros bancos como referencia principal.**
   El banco evaluado queda fuera de sus pares. La mediana se conserva como
   comparación de sensibilidad. Restar la misma base a todas las tasas
   cancela ese componente común, pero conserva las diferencias de exposición,
   fondeo y clientela entre bancos.

3. **Imponer conjuntamente capacidad y probabilidades válidas.** El esfuerzo
   no puede superar la capacidad ni reducir el riesgo por debajo de cero.
   La solución de P1 compara el candidato interior con ambas cotas. La
   existencia, la unicidad, los empates y el caso de capacidad cero forman
   parte de esa solución.

4. **Condicionar el umbral a propiedades verificables.** En P2, la diferencia
   entre selección y evaluación debe ser continua, estrictamente decreciente
   y cruzar cero, con interioridad al mismo precio para todas las opacidades.
   El escenario alternativo muestra por qué la opacidad, por sí sola, no
   garantiza un cambio de signo.

5. **Distinguir riesgo de cohorte y ratio de cartera.** P3 construye el ratio
   a partir de saldos antiguos y nuevos, para el mismo evento y horizonte.
   La derivada separa la calidad de la cohorte nueva de su peso en la cartera.
   El contraejemplo y la frontera aplican esa identidad a un saldo exponencial.

6. **Separar evidencia histórica y simulación.** La tabla del BCRP se usa con
   su universo, fechas y definición originales. Las demás cifras generadas
   ilustran el modelo y sus unidades. La aplicación predictiva al Perú se
   plantea como una etapa empírica posterior.

7. **Vincular Lean con una fuente exacta.** La formalización demuestra las
   tres proposiciones de la edición española fijada por commit y huellas de
   archivos. El [registro de Lean](lean_progreso.md) distingue pruebas,
   revisiones de correspondencia y cierre oficial. La traducción inglesa
   conserva la misma matemática y tiene su propia comprobación editorial.

8. **Conservar los antecedentes y los archivos del autor.** La propuesta y
   la presentación del tema documentan el avance de octubre. Las
   diapositivas finales y el PDF manuscrito se conservan como archivos
   suministrados por el autor. El [índice](README.md) identifica los documentos
   actuales y los registros históricos.
