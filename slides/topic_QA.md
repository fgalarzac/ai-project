# Preguntas probables y respuestas defendibles

Las respuestas cortas son para exposición oral. Los detalles sirven si el
profesor repregunta.

## Preguntas de comprensión básica

### “¿Qué es exactamente el NPL ratio?”

Es el saldo de créditos clasificados como no productivos dividido entre el
saldo total de créditos de la cartera. Es una proporción observada a nivel de
banco, segmento y fecha futura. La clasificación exacta de “non-performing” se
tomará del diccionario de la fuente de datos.

### “¿Cuál es la diferencia entre `q*` y el NPL ratio?”

`q*` es la probabilidad teórica de default de la nueva originación después del
screening óptimo. El NPL ratio es una razón de stocks observada después para una
cartera que contiene préstamos de distintas cohortes. El modelo los conecta
mediante una relación de forecasting con `rho_h > 0`; no los trata como iguales.

### “¿Qué significa que un segmento sea opaco?”

Significa que la calidad de los solicitantes es difícil de inferir con
información fácilmente observable o comparable. `kappa` es una característica
ordinal del segmento: un valor mayor representa más opacidad. No afirmo que una
sola proxy empírica sea una medición estructural perfecta de `kappa`.

### “¿Por qué usar un spread relativo y no la tasa bruta?”

La tasa bruta mezcla el precio propio del banco con cambios de política monetaria
y condiciones comunes de mercado. Primero resto la tasa de política y luego la
mediana de bancos comparables. Así, `D` mide cuánto se aparta el banco de sus
pares dentro del mismo producto, madurez, moneda y mes.

### “¿Por qué puede un precio alto anticipar menor riesgo?”

No ocurre mecánicamente. Un precio alto aumenta el payoff de un préstamo que
funciona, lo que eleva el beneficio marginal de evaluar y, en el modelo, el
esfuerzo óptimo. El riesgo solo cae si ese canal supera el deterioro del pool
por selección adversa.

## Preguntas sobre el modelo

### “¿Quién elige `D` y quién elige `e`?”

El mismo banco elige ambos de manera secuencial. Primero publica `D` y forma un
pool de solicitantes. Después observa ese pool y elige `e`. Esta secuencia hace
que `D` esté dado cuando se resuelve el subproblema de screening.

### “¿Qué representa `a(kappa)`?”

Es la pendiente de riesgo pre-screening con respecto al spread relativo:
`dq0/dD = a(kappa)`. Cuanto mayor es `a`, más se deteriora la composición de
solicitantes cuando el banco se vuelve relativamente caro.

### “¿Qué representa `g(kappa)`?”

Es la productividad marginal del esfuerzo: una unidad de `e` reduce la
probabilidad de default en `g` unidades. No es una probabilidad ni un costo.

### “¿Por qué `h = g^2/c` y no simplemente `g/c`?”

El esfuerzo responde al precio en `g/c`. Pero cada unidad adicional de esfuerzo
mejora la calidad en `g`. Multiplicando la respuesta de esfuerzo por la
productividad de esfuerzo aparece `g(g/c)=g^2/c`. Por eso `h` es la respuesta
de calidad, no la respuesta de esfuerzo.

### “¿La segunda derivada basta para un máximo?”

Sí dentro del intervalo cuando la solución es interior, porque
`d²pi/de² = -c(kappa) < 0`: el objetivo es estrictamente cóncavo en `e`. Además,
el proyecto verifica que la solución ilustrativa quede dentro de `(0,e_bar)`.
Si llega a una esquina, se usa la regla truncada y cambia la derivada local.

### “¿Qué pasa si el banco no puede elegir screening después del precio?”

El orden es una hipótesis institucional. Si precio y screening se eligen
simultáneamente, las condiciones de primer orden se resuelven en conjunto y el
objeto `h` puede cambiar. La versión secuencial es una adaptación mínima y
transparente; la simultánea es una robustez posterior.

### “¿Por qué `a'(kappa) < 0`?”

La interpretación propuesta es que prestatarios de segmentos opacos comparan
menos eficazmente las ofertas, por lo que la composición del pool reacciona
menos al precio relativo. Es un supuesto mantenido, no una verdad automática.
La simulación y la futura aplicación deben mostrar sensibilidad a esta forma.

### “¿Por qué debería subir el screening leverage con opacidad si evaluar es caro?”

No tiene por qué subir. Como `h=g²/c`, se requiere
`2g'/g > c'/c`: la ganancia marginal de información debe crecer suficientemente
rápido para dominar el mayor costo. Si esa desigualdad falla, el modelo no
predice el cambio de signo. Exponer esta condición corrige la intuición reducida
de que el costo por sí mismo generaría el resultado.

### “¿Estás definiendo opacidad para que el resultado funcione?”

No. Opacidad ordena segmentos por dificultad informativa. La teoría separa esa
definición de las restricciones sobre `a`, `g` y `c`. `h' > 0` y el cruce en los
extremos son hipótesis que pueden fallar; no forman parte de la definición de
`kappa`.

### “¿Por qué existe un único umbral?”

La continuidad y el cambio de orden en los extremos garantizan al menos un
cruce por el teorema del valor intermedio. Como `a' < 0` y `h' > 0`, la
diferencia `a-h` cae estrictamente y no puede cruzar cero más de una vez.

### “¿Qué ocurre si no se cruzan `a` y `h`?”

Entonces no hay umbral. El resultado correcto es uno de tres casos: selección
domina en todo el dominio, hay igualdad en algún punto sin el patrón propuesto,
o screening domina en todo el dominio. La contribución sigue siendo la
caracterización de las condiciones, no un signo impuesto.

## Preguntas de identificación y alcance

### “¿No es `D` endógeno?”

Sí. El banco lo elige en la primera etapa. La proposición es un mapa de calidad
condicional al precio observado, no una intervención causal. Empíricamente se
pregunta si `D` mejora pronósticos con controles de banco y segmento por mes.
Un efecto causal exigiría instrumentos o un equilibrio oligopólico estructural
completo.

### “¿Por qué no resolver `D*` explícitamente?”

El objetivo inmediato es determinar qué información contiene un precio
relativo observado sobre la calidad futura. Compactitud y continuidad cierran
la existencia de la primera etapa; el subproblema entrega el mapa testeable. Un
`D*` cerrado requeriría escoger una demanda y una estructura competitiva
específicas que no son necesarias para el mecanismo central.

### “¿Eso significa que el modelo está incompleto?”

No para la pregunta condicional propuesta, pero sí deja una extensión abierta.
El agente, el orden de decisiones, la función objetivo, la solución de screening
y el resultado de calidad están cerrados. Lo que no se reclama es una solución
cerrada de equilibrio industrial para el nivel exacto del precio.

### “¿Por qué asumir payoff cero en default?”

Es una normalización. Con recuperación `X`, el beneficio marginal de evitar un
default depende de `R(D)-X`. Mientras esa brecha aumente con `D`, el canal sigue
existiendo; cambiaría la fórmula del leverage. Es una robustez natural.

### “¿Qué pasa si screening también reduce el volumen aprobado?”

La versión actual interpreta `e` como intensidad de underwriting por crédito
potencial y resume su efecto en la calidad condicional. Una versión con tasa de
aceptación endógena agrega un margen de volumen y modifica la FOC. El umbral
puede sobrevivir si sigue existiendo una mejora de calidad inducida por precio,
pero el `h` exacto cambia.

### “¿Cómo vas a medir opacidad?”

La teoría requiere un orden preespecificado. Las proxies candidatas deben
reflejar disponibilidad de información y comparabilidad del prestatario. La
aplicación reportará cada proxy por separado y no presentará ninguna como una
estimación directa de `kappa`.

### “¿Cómo evaluarás si la señal aporta?”

Con pronósticos rolling fuera de muestra del NPL ratio a varios horizontes.
Compararé un benchmark sin `D` contra modelos que incluyen `D` e interacciones
con grupos de opacidad. Reportaré desempeño predictivo y estabilidad del signo,
no solo significancia dentro de muestra.

## Preguntas sobre novedad y ejecución

### “¿Qué es nuevo respecto de Ruckes?”

Ruckes endogeniza screening y pricing mixto cuando cambia la calidad previa de
los prestatarios en el ciclo. Este proyecto estudia otra derivada: el signo de
la calidad con respecto al precio relativo y cómo ese signo cambia entre
segmentos de opacidad. Además incorpora explícitamente el margen de comparación
de precios.

### “¿Qué es nuevo respecto de Broecker?”

Broecker muestra cómo la competencia en tasas interactúa con tests imperfectos.
Aquí el banco elige esfuerzo continuo de screening, y el resultado es una
comparación explícita entre la pendiente de selección y la respuesta endógena
de screening.

### “¿La calibración prueba la proposición?”

No. La proposición se prueba analíticamente. La calibración solo demuestra que
el conjunto de supuestos no está vacío y comprueba esfuerzo interior,
probabilidades válidas, monotonía y cruce único para un ejemplo reproducible.

### “¿Qué agrega Lean a una prueba corta?”

La prueba es simple pero sensible a supuestos. Lean obliga a declarar
continuidad, cruce en extremos y monotonía estricta, y evita concluir unicidad
si falta alguna condición. Se formalizará después de congelar la proposición,
para no codificar una versión todavía móvil.

### “¿Cuál es el mayor riesgo del proyecto?”

Que `h'(kappa)>0` no sea defendible empírica o tecnológicamente. El fallback no
es cambiar la definición: es caracterizar las regiones `a>h`, `a=h` y `a<h`, y
tratar la existencia del umbral como una restricción estimable.

### “Dime la contribución en una oración.”

El modelo deriva cuándo un spread relativo cambia de ser una señal de selección
adversa a ser una señal de screening, y hace explícita la condición informativa
necesaria para ese cambio.
