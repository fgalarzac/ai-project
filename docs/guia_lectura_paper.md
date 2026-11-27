# Cómo leer el modelo, paso a paso

Esta guía acompaña al paper final de 16 páginas de cuerpo. Explica su misma
decisión y sus tres proposiciones. Las páginas indicadas son las numeradas en
el artículo, incluida su primera página.

## 1. Qué pregunta se responde — páginas 1–3

La pregunta es cuándo una tasa mayor que la de bancos comparables puede
informar sobre riesgo futuro. El indicador **D** resta a la tasa del banco
el promedio simple de las tasas de otros bancos comparables. Las tasas se
expresan en decimales anuales: D=0.02 significa dos puntos porcentuales por
encima de ese promedio. El propio banco queda fuera del grupo de referencia.

El precio tiene dos fuerzas. Puede atraer solicitantes más riesgosos, pero
también aumenta el premio de evitar un crédito malo y, con ello, el incentivo
a evaluar. El modelo compara ambas fuerzas. El banco elige cuánto evaluar
después de fijado el precio; la teoría no determina el precio de equilibrio.

La resta elimina una base aditiva común. No elimina diferencias de exposición
a un shock. En la descomposición de la página 3, **z** es el shock agregado,
**λ_j** la exposición del banco j a ese shock y **v_j** el componente propio
de ese banco; una barra sobre los términos de pares indica su promedio.
Esta notación local es distinta de la abreviatura z usada en la prueba de P1.

## 2. Qué se mantiene fijo y qué se elige — páginas 4–6

Se fija el segmento, su tecnología y el precio. Luego el banco observa la
calidad media de sus solicitantes y elige **e**, un índice de esfuerzo de
evaluación. El desempeño se observa más tarde, al mismo horizonte **h** al
que se refieren las probabilidades del modelo.

| Símbolo | Significado y unidades |
|---|---|
| κ | Opacidad exógena del segmento, entre cero y uno; no es un índice estimado. |
| q̄ | Probabilidad de referencia de los solicitantes cuando D=0. |
| a | Aumento de la probabilidad previa por una unidad de D; es positivo por S1. |
| q⁰=q̄+aD | Probabilidad del evento crediticio antes de evaluar. |
| g | Reducción de la probabilidad por una unidad de esfuerzo; productividad de evaluar. |
| c | Escala positiva del costo cuadrático de evaluación, c e²/2. El costo marginal es c e. |
| ē | Capacidad máxima de evaluación; es no negativa. |
| R̄ | Premio por desempeño en D=0, normalizado por unidad de crédito. |
| R=R̄+D | Premio por evitar el evento adverso; es positivo en el dominio comparado. |
| F | Costo por unidad de crédito que no cambia con el esfuerzo. |
| q=q⁰−g e | Probabilidad posterior a evaluar, para el mismo evento y horizonte. |
| e\*, q\* | Esfuerzo óptimo y probabilidad resultante. El asterisco señala optimización. |

Al variar esfuerzo, D y κ permanecen fijos. Al derivar respecto de D, se
comparan precios cercanos con la misma tecnología y se permite reoptimizar
el esfuerzo. Solo en P2 se comparan segmentos con distinta κ, al mismo
precio D₀. Esta distinción evita mezclar tres ejercicios diferentes.

## 3. Por qué hay dos cotas de esfuerzo — páginas 5–6

La evaluación reduce riesgo según q=q⁰−g e. Como una probabilidad no puede ser
negativa y g es positivo, debe cumplirse e≤q⁰/g. Además, el banco no puede
superar su capacidad: e≤ē. El conjunto factible es por ello
**0≤e≤u**, donde **u=min(ē,q⁰/g)**. S1 restringe los precios para que q⁰ esté
entre cero y uno; S3 exige también un premio positivo.

El objetivo es la probabilidad de evitar el evento, multiplicada por el
premio, menos los costos. F no cambia la elección entre esfuerzos porque
se resta por igual en todos ellos. La decisión de prestar o no prestar
queda fuera del problema resuelto.

## 4. Cómo se obtiene la solución — P1, páginas 6–8

1. **Existe una elección óptima.** El intervalo factible es no vacío y
   compacto y el objetivo es continuo. Si solo contiene cero, esa es la
   única elección. Con más de un punto, el costo cuadrático hace al objetivo
   estrictamente cóncavo, por lo que no hay dos máximos distintos.
2. **Se calcula el esfuerzo deseado.** Una unidad de esfuerzo aporta gR
   de beneficio marginal y cuesta c e. Igualarlos da **z=gR/c**. Aquí z
   abrevia el candidato sin restricciones; todavía se debe verificar si cabe.
3. **Se imponen las restricciones.** Completar el cuadrado convierte la
   maximización en elegir el punto factible más cercano a z. Así,
   `e*=min(gR/c,ē,q⁰/g)`.
4. **Se calcula el riesgo.** Sustituir e\* en q⁰−g e da la fórmula de P1 y
   permite comprobar que q\* sigue entre cero y uno.
5. **Se deriva dentro de cada régimen.** Si ninguna cota limita el esfuerzo,
   la pendiente es **a−g²/c**. Si limita la capacidad, el esfuerzo no responde
   y la pendiente es **a**. Si opera el piso de probabilidad, la pendiente
   es **cero**. Las desigualdades estrictas identifican cada régimen.
6. **Se tratan los empates.** La solución es continua; las pendientes de
   ambos lados pueden diferir. En tal caso se usan derivadas laterales.

La expresión g²/c tiene dos partes: el esfuerzo aumenta g/c por unidad de
precio y cada unidad de esfuerzo reduce el riesgo en g. Esa explicación
solo corresponde al régimen interior.

Con los parámetros ilustrativos del paper, en D=0 el candidato es
aproximadamente 0.246, menor que la capacidad 0.50 y la cota de probabilidad
1.252. El riesgo pasa de 0.28 a 0.225. La pendiente interior es 0.13: un
punto porcentual adicional de precio produce localmente 0.13 puntos
porcentuales adicionales de riesgo. Son unidades del ejemplo, no estimaciones.

## 5. Cuándo cambia el signo con la opacidad — P2, páginas 8–9

Se llama **H=g²/c** a la fuerza de evaluación y **β=a−H** a la pendiente
neta interior. Para obtener un umbral único, S4 exige continuidad, descenso
estricto de β, signo positivo en κ=0, signo negativo en κ=1 e interioridad
al precio comparado para todo el intervalo.

La prueba tiene cuatro pasos: β es continua; cruza cero por el teorema del
valor intermedio; el descenso estricto hace único el cero y ordena los signos;
la interioridad permite identificar β con la derivada de q\*. La opacidad
por sí sola no demuestra esas condiciones. El escenario alternativo del
paper explica por qué el cruce puede fallar.

## 6. Por qué el ratio de cartera puede moverse al revés — P3, páginas 9–14

**B₀** es el saldo antiguo y **m₀** su fracción en atraso. **B(D)** es el
saldo de los créditos nuevos que permanece al horizonte elegido.
**w=B/(B₀+B)** es su peso, entre cero y uno. **M** es el ratio esperado de
cartera. S5 hace compatibles el evento, el horizonte y los saldos de las
dos cohortes y mantiene fijos el saldo y el riesgo antiguos al variar D.

Primero se suman saldos en atraso y se divide por el total positivo:
`M=(1−w)m₀+w q*`. Después se deriva. Una prima indica derivada respecto
de D; **β_D** es la derivada del riesgo nuevo. El resultado es
`M'=w β_D+w'(q*−m₀)`. El primer término es calidad; el segundo, composición.

Si el saldo nuevo no cambia, w'=0 y se conserva el signo. Si cambia, una
cohorte nueva más riesgosa puede perder suficiente peso como para reducir
el ratio total, aunque aumente su riesgo individual.

El caso **B(D)=B₁ exp(−εD)** usa B₁ como saldo nuevo en D=0 y ε como
semielasticidad: B'/B=−ε. No es la elasticidad respecto del nivel de D.
Con los valores del contraejemplo, la inversión exige **ε>1.04/(1−w)**.
Para w=0.20 el corte es 1.3; ε=3 lo supera. La pendiente de cartera es
−0.034 mientras la del riesgo nuevo es 0.13. Una subida de un punto
porcentual de D implica una variación local del ratio de −0.034 puntos
porcentuales. La igualdad en el corte da pendiente cero, sin inversión estricta.

## 7. Cómo evaluar el alcance — páginas 13–19

Una derivada condicional, una mejora de pronóstico fuera de muestra y un
efecto causal requieren argumentos diferentes. Este artículo demuestra las
proposiciones bajo sus condiciones. Las simulaciones contrastan la
implementación; Lean comprueba los enunciados formalizados. Ninguna de esas
capas demuestra que los bancos peruanos satisfagan los supuestos ni sustituye
la validación empírica.

Para preparar la defensa, conviene poder explicar primero la decisión y las
dos cotas, después los tres regímenes, luego el umbral condicional y, por
último, calidad frente a composición. El [apéndice manuscrito](../hand/Hand.pdf)
contiene las derivaciones suministradas por el autor. El estado vigente de Lean
se consulta en [lean_progreso.md](lean_progreso.md).
