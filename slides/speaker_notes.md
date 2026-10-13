# Guion detallado para el Topic Presentation

**Duración objetivo:** 24:00 de exposición + 1:00 de margen = 25 minutos.

Las diapositivas están en inglés; este guion está en español para que la lógica
económica sea más fácil de ensayar. No memorices cada frase. Memoriza la idea
central, la transición y la interpretación de cada ecuación.

## Slide 1 · Title — 0:30 (acumulado 0:30)

> Buenos días. Mi proyecto pregunta cuándo el precio relativo de un crédito
> puede servir como señal adelantada de la calidad futura de la cartera. Es una
> adaptación Track B de mi tesis: tomo un mecanismo que antes estaba en forma
> reducida y lo cierro con una decisión explícita de screening por parte del
> banco.

Señala brevemente el enlace del repositorio. No expliques todavía la base de
datos ni las ecuaciones.

**Transición:** “Primero voy a explicar por qué esta señal sería útil.”

## Slide 2 · Why should we care? — 1:15 (acumulado 1:45)

> El problema es de timing de información. La tasa del crédito se observa al
> originarlo, pero la calidad de la cartera solo se revela después. Para un
> supervisor, una variable observada hoy puede ser útil si anticipa un deterioro
> de cartera.

Define el resultado sin suponer que el público lo conoce:

> El NPL ratio es el saldo de créditos no productivos dividido entre el saldo
> total de créditos. En la aplicación usaré exactamente la clasificación del
> proveedor de datos, sin inventar aquí un umbral de días de atraso.

Luego plantea el dilema:

> Una tasa alta puede significar que llegaron prestatarios más riesgosos, pero
> también que el banco tiene más incentivo para evaluar bien a quienes presta.

**Transición:** “La pregunta es cuál de esas dos lecturas domina.”

## Slide 3 · Research question and contribution — 1:15 (acumulado 3:00)

Lee la pregunta casi literalmente, enfatizando “relative to peer banks” y
“predict”.

> No pregunto si una tasa alta es buena o mala en general. Pregunto si la
> desviación frente a bancos comparables contiene información sobre el NPL ratio
> futuro, y si el signo cambia según la opacidad del segmento.

Explica Track B:

> La tesis ya decía “selección menos screening”, pero la parte de screening no
> salía de una optimización. Mi contribución para el curso es derivarla desde el
> problema del banco y hacer visibles las condiciones necesarias para el cambio
> de signo.

Termina con el límite:

> Es una predicción condicional. No estoy afirmando que obligar a un banco a
> subir la tasa vaya a mejorar su cartera.

## Slide 4 · Constructing the price signal — 1:25 (acumulado 4:25)

Explica cada índice antes de la fórmula: `j` es banco, `s` es segmento de
crédito y `t` es mes. Después lee las dos etapas:

> Primero resto la tasa de política a la tasa que cobra el banco y obtengo el
> spread sobre política. Segundo, comparo ese spread con la mediana de los demás
> bancos en el mismo segmento y mes. Esa segunda diferencia es D.

Aclara que `k` dentro de la mediana identifica a otro banco; no es la opacidad
`kappa`.

Usa el ejemplo:

> Si el banco cobra 18%, la tasa de política es 5% y la mediana de spreads es
> 11%, el spread del banco es 13% y D es 2 puntos porcentuales. Positivo significa
> “más caro que sus pares”.

> La comparación será dentro de producto, madurez, moneda y mes para no mezclar
> créditos que no son comparables.

## Slide 5 · Why the sign is ambiguous — 1:15 (acumulado 5:40)

Explica primero sin ecuaciones:

> Canal de selección: al subir el precio relativo, los clientes que pueden
> comparar ofertas se van, y el banco puede quedarse con un pool peor. Canal de
> screening: si un crédito paga más cuando funciona, evitar el default se vuelve
> más valioso y el banco invierte más en evaluación.

Luego conecta con símbolos:

> `q0` es riesgo antes de evaluar y aumenta con D. `e*` es el esfuerzo óptimo y
> también aumenta con D. Como afectan la calidad en sentidos opuestos, el signo
> total no se puede asumir.

## Slide 6 · Timing — 1:20 (acumulado 7:00)

Recorre los seis pasos pausadamente. Enfatiza dos decisiones:

> Primero el banco publica D. Después de observar el pool que atrajo ese precio,
> elige e. Por eso, cuando resuelvo el subproblema de screening, D ya está dado.

Explica por qué hay una observación futura distinta:

> El riesgo teórico pertenece al crédito nuevo; el NPL ratio se observa más
> tarde y resume una cartera. Los voy a conectar con una ecuación de medición,
> no tratarlos como si fueran la misma variable.

## Slide 7 · Notation I — 1:05 (acumulado 8:05)

No leas la tabla mecánicamente. Agrupa:

> Kappa describe el segmento. D y e son las decisiones secuenciales. L es el
> volumen potencial. q-bar es riesgo base; q0 es el riesgo antes del screening y
> q es el riesgo después. e-bar es la restricción tecnológica máxima.

Aclara:

> Cuando elimino los subíndices j, s y t no cambio el objeto; solo simplifico el
> álgebra.

## Slide 8 · Notation II — 1:05 (acumulado 9:10)

Agrupa otra vez:

> `a` mide cuánto empeora el pool por una unidad adicional de D. `g` mide cuánto
> reduce el riesgo una unidad de esfuerzo. `c` desplaza el costo del esfuerzo.
> R-bar más D es lo que recibe el banco si el préstamo funciona y F recoge otros
> costos.

Reserva `h` para el final:

> h igual a g al cuadrado sobre c será el apalancamiento del screening. No es el
> esfuerzo; es la fuerza con la que el ajuste óptimo de esfuerzo transmite un
> cambio de precio hacia la calidad.

## Slide 9 · Step 1: price sorting — 1:15 (acumulado 10:25)

> Antes de evaluar, q0 es q-bar más a por D. Si D es cero, el banco está en la
> mediana de sus pares y q0 es q-bar. Como a es positivo, un banco más caro atrae
> un pool con mayor probabilidad de default.

Explica `a' < 0` como supuesto y no como verdad universal:

> Asumo que la selección por precio es más débil cuando el segmento es opaco,
> porque esos prestatarios comparan ofertas con menor facilidad. Es una
> restricción que debe defenderse o someterse a robustez; no es una identidad.

## Slide 10 · Step 2: screening technology — 1:15 (acumulado 11:40)

> El banco puede reducir q0 mediante esfuerzo e. Cada unidad reduce el riesgo en
> g. El costo es cuadrático: las primeras verificaciones son relativamente
> baratas, pero profundizar la evaluación cuesta cada vez más.

Explica la interioridad:

> Para usar una FOC interior necesito que el esfuerzo resultante sea positivo y
> menor que e-bar, y que q permanezca entre cero y uno. No lo escondo: el código
> verifica esos límites para la calibración ilustrativa. Si se alcanza una
> esquina, la derivada cambia y eso va a la sección de robustez.

## Slide 11 · Complete bank problem — 1:35 (acumulado 13:15)

Lee el objetivo por bloques, no de izquierda a derecha:

> Afuera, el banco elige D y eso determina el volumen L. Adentro, dado el pool,
> elige e. El primer bloque es probabilidad de performance por payoff de
> performance; luego resto otros costos F y el costo convexo de screening.

Explica el cierre del primer paso:

> D pertenece a un intervalo compacto y las funciones son continuas, así que el
> problema de precio tiene solución. No afirmo tener una fórmula cerrada de D
> estrella porque eso exigiría imponer una estructura particular de competencia
> y demanda.

Defiende el alcance:

> Para mi pregunta de forecasting necesito el mapa de calidad condicional a un D
> observado. Esa es la parte que resuelvo exactamente.

## Slide 12 · Solving the screening decision — 1:40 (acumulado 14:55)

Esta es una de las diapositivas principales. Di:

> El beneficio marginal de una unidad adicional de esfuerzo es g por R-bar más
> D. g es cuánto riesgo evito y R-bar más D es el valor que preservo al evitar un
> default. El costo marginal es c por e. Igualándolos obtengo e estrella.

Señala la segunda derivada:

> Como la segunda derivada es menos c y c es positivo, el objetivo es estrictamente
> cóncavo en e: el punto satisface suficiencia y es único dentro del intervalo.

Luego interpreta:

> La derivada de e estrella con respecto a D es g sobre c, que es positiva. Este
> es el canal de screening que antes estaba supuesto y ahora sale del problema
> del banco.

## Slide 13 · Substitution reveals the two forces — 1:35 (acumulado 16:30)

> Sustituyo el esfuerzo óptimo en la ecuación de riesgo. La primera parte,
> q-bar más a por D, viene de selección. La segunda resta h por R-bar más D y
> viene del screening óptimo.

Define de nuevo `h` y deriva:

> h es g al cuadrado sobre c. Al derivar q estrella con respecto a D queda la
> ecuación central: beta de kappa es a menos h.

Interpreta los dos signos:

> Si a es mayor que h, la selección domina y un precio alto anticipa mayor
> riesgo. Si h es mayor que a, el ajuste de screening domina y el precio alto
> anticipa menor riesgo. No estoy suponiendo el signo; estoy caracterizando la
> desigualdad que lo determina.

## Slide 14 · Candidate Proposition 1 — 1:40 (acumulado 18:10)

Presenta los supuestos en lenguaje:

> Necesito una solución interior y probabilidades válidas; continuidad; que la
> selección a caiga con opacidad; que el apalancamiento h aumente; y que el
> orden de a y h sea distinto en los dos extremos.

Explica la prueba:

> En kappa cero, a menos h es positivo; en kappa uno, es negativo. Por continuidad,
> existe al menos un cruce. Como a menos h cae estrictamente, no puede haber dos.
> Así obtengo un único kappa estrella y el signo a cada lado.

> La derivada cruzada negativa resume que la señal precio-riesgo se vuelve menos
> positiva, o más negativa, al aumentar la opacidad.

## Slide 15 · Key restriction and correction — 1:25 (acumulado 19:35)

Esta es la corrección conceptual que conviene decir con claridad:

> Una versión intuitiva pero incorrecta diría que el signo cambia porque evaluar
> es costoso. Si el costo c sube y todo lo demás queda igual, h baja. Eso debilita,
> no fortalece, el canal de screening.

Lee la derivada logarítmica:

> Para que h aumente, dos veces el crecimiento proporcional de g debe superar
> el crecimiento proporcional de c. La historia defendible es que la opacidad
> crea heterogeneidad latente y vuelve más valiosa una unidad adicional de
> información; ese beneficio debe crecer suficientemente rápido.

> Es un supuesto falsable. Si no se cumple, no voy a forzar el resultado.

## Slide 16 · Illustrative calibration — 1:35 (acumulado 21:10)

Aclara antes de señalar el gráfico:

> Esto no es evidencia peruana ni una estimación. Es una calibración transparente
> para comprobar que los supuestos son conjuntamente factibles y que las
> probabilidades y el esfuerzo permanecen en sus dominios.

Recorre los paneles:

> A la izquierda, a cae y h sube; cruzan una vez alrededor de 0.64. A la derecha,
> beta igual a a menos h empieza positiva, cruza cero y termina negativa. El
> script reproduce el gráfico y falla si no hay cruce único o si se violan los
> límites.

## Slide 17 · Mapping to the NPL ratio — 1:10 (acumulado 22:20)

> q estrella no es el NPL ratio. q estrella es riesgo de originación; el NPL
> ratio es un stock futuro. Los conecto con una relación de forecasting: alpha
> captura la base del horizonte, rho positivo transmite riesgo de originación y
> u recoge otros shocks.

> Si rho es positivo, no cambia el signo de beta. Empíricamente compararé si D
> mejora pronósticos fuera de muestra por grupo de opacidad y horizonte, con
> controles de banco y de segmento por mes. No llamaré causal al coeficiente.

## Slide 18 · Literature — 0:40 (acumulado 23:00)

Primero resume la literatura en una sola frase por referencia:

> Varian aporta dispersión de precios; Broecker, competencia con tests; Ruckes,
> screening endógeno; Dell'Ariccia y Marquez, regímenes de información. Mi
> contribución estrecha es combinar precio relativo, screening continuo y una
> condición para el cambio de signo por opacidad.

No describas el proyecto como si toda la literatura previa estuviera equivocada;
la novedad es la combinación y la derivada específica.

## Slide 19 · Plan, risks, and takeaway — 1:00 (acumulado 24:00)

> Voy a cerrar la prueba y la robustez con R general, mapear el espacio de
> parámetros, evaluar forecasting fuera de muestra y formalizar en Lean cuando
> el teorema esté congelado. Si h no crece, el resultado correcto será reportar
> las tres regiones sin umbral. Si el precio está confundido, mantengo la lectura
> predictiva.

Cierra con una frase lenta:

> Mi conclusión no es que una tasa alta sea segura. Es que el modelo identifica
> exactamente cuándo un precio relativo deja de ser señal de selección adversa
> y pasa a ser señal de screening.

## Preguntas para abrir la discusión

Si debes llenar unos segundos o invitar preguntas, usa una sola:

> La condición más discutible es si la ganancia marginal de información aumenta
> con la opacidad. Esa es precisamente la condición que quiero someter a prueba.

## Checklist de entrega oral

- Di “relative spread” o “spread relativo”, no solo “interest rate”.
- Di “NPL ratio” o “ratio de créditos no productivos” para el outcome observado.
- Reserva “default probability” para `q0`, `q`, y `q*`.
- Distingue “screening effort” (`e*`) de “screening leverage” (`h`).
- Presenta `a' < 0`, `h' > 0`, y `rho_h > 0` como supuestos mantenidos.
- Presenta la calibración como una verificación ilustrativa, no como evidencia.
- Nunca describas el coeficiente predictivo como causal.
- Si estás corto de tiempo, recorta literatura y ejemplo; no recortes slides 11–15.
