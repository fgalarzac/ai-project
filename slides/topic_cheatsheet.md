# Topic Presentation — ficha de repaso rápido

## Mensaje en una oración

El modelo deriva cuándo un spread relativo cambia de ser señal de selección
adversa a ser señal de screening, y muestra que el cambio requiere que el valor
marginal de información aumente lo suficiente con la opacidad.

## Objetos empíricos

```text
s_jst = i_jst - r_t
D_jst = s_jst - median_{k != j}{s_kst}
NPL_{js,t+h} = non-performing balance / total outstanding balance
```

`j`: banco · `s`: segmento · `t`: mes de precio · `h`: horizonte · `k`: banco
par · `D > 0`: banco más caro que la mediana de pares.

## Secuencia

```text
opacity kappa → bank posts D → applicant pool q0 → bank chooses e
→ optimized origination risk q* → future NPL ratio
```

## Cinco ecuaciones que debes poder explicar

1. Pool antes de screening:

   ```text
   q0(D,kappa) = q_bar + a(kappa)D
   ```

2. Tecnología de calidad:

   ```text
   q(D,e,kappa) = q0(D,kappa) - g(kappa)e
   ```

3. FOC y solución:

   ```text
   g(kappa)[R_bar+D] - c(kappa)e = 0
   e* = [g(kappa)/c(kappa)][R_bar+D]
   ```

4. Riesgo optimizado:

   ```text
   q* = q_bar + a(kappa)D - h(kappa)[R_bar+D]
   h(kappa) = g(kappa)^2/c(kappa)
   ```

5. Resultado central:

   ```text
   beta(kappa) = dq*/dD = a(kappa) - h(kappa)
   ```

## Intuición de los símbolos clave

- `a`: cuánto empeora el pool cuando `D` aumenta.
- `g`: cuánto mejora la calidad una unidad de esfuerzo.
- `c`: qué tan caro es aumentar esfuerzo.
- `e*`: esfuerzo óptimo; sube con `D`.
- `h=g²/c`: efecto de la respuesta de esfuerzo sobre calidad; no es esfuerzo.
- `beta`: signo predictivo del precio sobre riesgo de originación.
- `kappa*`: opacidad en la que `a=h` y `beta=0`.

## Proposición

Con solución interior, probabilidades válidas, continuidad,
`a' < 0`, `h' > 0`, `a(0)>h(0)` y `a(1)<h(1)`, existe un único `kappa*`:

```text
kappa < kappa*  → beta > 0 → precio alto predice más riesgo
kappa = kappa*  → beta = 0
kappa > kappa*  → beta < 0 → precio alto predice menos riesgo
```

Prueba: valor intermedio para existencia + monotonía estricta para unicidad.

## Condición que no debes olvidar

```text
h'/h = 2g'/g - c'/c
```

`h' > 0` requiere `2g'/g > c'/c`. Un mayor costo por sí solo reduce `h`; la
ganancia marginal de información debe crecer más rápido.

## Puente empírico

```text
NPL_{js,t+h} = alpha_h + rho_h q*_{jst} + u_{js,t+h},  rho_h > 0
```

`q*` es riesgo de originación; el NPL ratio es un stock futuro. La relación es
de forecasting y conserva el signo si `rho_h > 0`; no es una identidad ni una
afirmación causal.

## Respuestas de emergencia

- **“D es endógeno.”** Sí; el resultado es condicional y predictivo, no causal.
- **“No resolviste D*.”** El precio existe por compactitud y continuidad; el
  aporte es el mapa de calidad condicional. El oligopolio cerrado es extensión.
- **“¿Y si h no sube?”** No hay umbral forzado; reporto las regiones `a>h`,
  `a=h` y `a<h`.
- **“¿La calibración es evidencia?”** No; solo verifica factibilidad y límites.
- **“¿Qué es nuevo?”** La combinación precio relativo + screening endógeno +
  condición para el signo a través de opacidad.

## Frase final

> No concluyo que una tasa alta sea segura; identifico la desigualdad económica
> que determina cuándo su contenido informativo cambia de selección a screening.
