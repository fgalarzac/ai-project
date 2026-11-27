# Revisión del manuscrito recibido

Revisión del 26 de noviembre de 2026 de las diez fotografías incorporadas en
[el apéndice manuscrito](derivaciones_manuscritas.pdf), contrastadas con el
paper español final. La numeración siguiente corresponde a ese PDF de diez
páginas, no a la guía tipográfica. Se inspeccionaron también las diez páginas
renderizadas; los JPEG incrustados coinciden byte por byte con los recibidos.

## Alcance y estado

Las hojas contienen las demostraciones principales de P1, P2 y P3: no hace
falta volver a escribirlas desde cero. Sin embargo, algunas igualdades
intermedias tienen signos incorrectos aunque el resultado final sea correcto.
Además, faltan comprobaciones y aplicaciones algebraicas del paper. Por ello
el estado es **manuscrito recibido, pendiente de correcciones y complemento**.
Esta revisión del asistente no es una ratificación humana del panel de Lean.

## Correcciones en las hojas existentes

| Página | Dónde | Corrección |
|---|---|---|
| 2 | Expansión de la utilidad después de «Luego» | Escribir `(1-q⁰)R + gRe - F - ce²/2`; aparece `1+q⁰`. La primera fórmula y el cuadrado completo posterior sí usan el signo correcto. |
| 2 | Cálculo de derivadas | Anotar «regla de la potencia» y «derivada de una constante»; se mantienen fijos D, κ, q⁰, R, g, c y F al variar e. |
| 5 | Parámetros del ejemplo de empate | Añadir `a=0.04`, además de `g=0.4`. Así quedan justificadas las pendientes `-0.12` y `0.04`. |
| 6 | Referencia a «primera rama de P2» | La rama de la solución interior es la de **P1**; P2 usa esa rama para identificar la derivada con beta. |
| 8 | Primera línea al derivar el ratio | Usar `(1-w)'m₀+(1-w)m₀'+w'q*+w(q*)'`. Aparece `1+w`, incompatible con la línea siguiente. Indicar «regla del producto» y `m₀'=0`. |
| 9 | Derivada del peso | La simplificación final es correcta. Explicitar «regla del cociente» y `B₀'=0`, pues el saldo antiguo se mantiene fijo respecto de D. |
| 10 | Definición inicial del saldo | El exponente es **negativo**: `B(D)=B₁ exp(-εD)`. La derivada siguiente `B'=-εB` requiere ese signo. |
| 10 | Factorización de M' y primera equivalencia | Usar siempre `M'=w[β_D-ε(1-w)(q*-m₀)]`. Aparece `1+w` en esos pasos, aunque el despeje posterior sí usa `1-w`. |

Se pueden corregir los signos sobre las hojas y fotografiarlas nuevamente,
o añadir una fe de erratas escrita a mano que identifique página y fórmula.
El PDF recibido se conserva fielmente; no se modifican digitalmente los
trazos para simular una corrección del autor. La foto 8 recorta parte del
margen izquierdo: al repetirla conviene incluir toda la hoja.

## Complemento que todavía no aparece en las fotos

No se exige un número fijo de páginas manuscritas. Se pueden agrupar estos
desarrollos y reutilizar las definiciones ya escritas. Al lado de cada paso
hay que indicar la operación y las condiciones que la justifican. La guía
adicional de 19 páginas enviada al autor desarrolla el núcleo de lo pendiente
en su página 11 y en las páginas 16-18. Las identidades breves del precio que
siguen completan también el alcance del paper.

### 1. Comprobaciones breves del precio relativo

Para el ejemplo de comparadores: la media de 8, 9, 10 y 25 por ciento es
`(8+9+10+25)/4=13%`; la mediana es `(9+10)/2=9.5%`. Con tasa propia de
12%, las brechas son `12-13=-1` y `12-9.5=2.5` puntos porcentuales.

Para exposiciones distintas al mismo shock, usar la notación local del paper:
`i_j=b+λ_j z+v_j`, donde z es el shock agregado, λ_j es su exposición y v_j
el componente propio. El promedio de pares es
`media(i_k)=b+media(λ_k)z+media(v_k)`, por linealidad de la media. Al restar:

```text
D = [b+λ_j z+v_j] - [b+media(λ_k)z+media(v_k)]
  = [λ_j-media(λ_k)]z + [v_j-media(v_k)].
```

Esto cancela b, pero no la exposición desigual al shock. Finalmente, si
`s_j=i_j-b` y `s_p=media(i_k-b)`, entonces `D=s_j-s_p`, de donde
`D-s_j+s_p=0`: los tres regresores son exactamente colineales. Son las
identidades de las secciones 3 y 8 del paper, no supuestos nuevos.

### 2. Dominio, interioridad y alternativa sin cruce

Con los parámetros de la página 7, añadir `q̄=0.28`, `R̄=1.10`, `ē=0.50`,
`D∈[-0.10,0.10]` y `κ∈[0,1]`. Las exponenciales son positivas. Como
`0<a≤0.18`, se tiene `|aD|≤0.018` y por ello
`0.262≤q⁰≤0.298`; también `1≤R≤1.2`. Ambos son admisibles.

Las dos cotas siguientes comprueban interioridad para todo ese dominio:

```text
gR/c = sqrt(0.05) exp(0.4κ) R
     ≤ 1.2 sqrt(0.05) exp(0.4) ≈ 0.400299 < 0.50 = ē.

g²R/c = 0.05 exp(1.2κ) R
      ≤ 0.06 exp(1.2) ≈ 0.199207 < 0.262 ≤ q⁰.

Como g>0, la segunda desigualdad equivale a gR/c < q⁰/g.
```

Para la alternativa del paper, sustituir únicamente
`g=sqrt(0.05) exp(-0.4κ)` y mantener a y c:

```text
H = [sqrt(0.05) exp(-0.4κ)]² / exp(0.4κ)
  = 0.05 exp(-1.2κ).
a/H = [0.18 exp(-0.8κ)]/[0.05 exp(-1.2κ)]
    = 3.6 exp(0.4κ) ≥ 3.6 > 1.
Como H>0, a>H y β=a-H>0: no existe cruce por cero.
```

En el escenario de capacidad `ē=0.08`, `gR/c≥sqrt(0.05)>0.08` y
`g ē≤0.08 sqrt(0.05) exp(0.8)≈0.039812<0.262≤q⁰`.
Por tanto limita la capacidad y la pendiente es a, positiva.

El segundo ejemplo de esquinas del paper también puede comprobarse en D=0:
con `q̄=0.04`, `a=0.04`, `g=0.5`, `c=1`, `R̄=1.10` y `ē=1`,
`z=gR/c=0.55`, mientras `q⁰/g=0.08<0.55<1`.
Así `e*=0.08`, `q*=0.04-0.5(0.08)=0`. Usar z sin la restricción daría
`0.04-0.5(0.55)=-0.235`, una probabilidad inválida. La pendiente efectiva
es cero en el entorno donde persisten esas desigualdades estrictas.

### 3. Recorrido numérico y contraejemplo de composición

En D=κ=0, usar los parámetros del paper:
`q̄=0.28`, `a=0.18`, `g=sqrt(0.05)`, `c=1`, `R̄=1.10` y `ē=0.50`.

```text
q⁰ = 0.28+0.18(0) = 0.28; R=1.10+0=1.10.
z = gR/c = sqrt(0.05)(1.10) ≈ 0.245967.
q⁰/g = 0.28/sqrt(0.05) ≈ 1.252198.
0 < z < 0.50 < 1.252198: la solución es interior y e*=z.
ge* = g²R/c = 0.05(1.10) = 0.055.
q* = 0.28-0.055 = 0.225.
β_D = a-g²/c = 0.18-0.05 = 0.13.
```

Con `B₀=4`, `B₁=1`, `m₀=0.10` y `ε=3`, todos los saldos son positivos,
las probabilidades pertenecen a [0,1] y:

```text
B(0)=1 exp(0)=1; w=1/(4+1)=0.20; 1-w=0.80.
q*-m₀=0.225-0.10=0.125>0.
M'=0.20[0.13-3(0.80)(0.125)]
  =0.20(0.13-0.30)=0.20(-0.17)=-0.034<0.
ε_crítica=0.13/[0.80(0.125)]=0.13/0.10=1.3.
3>1.3: hay inversión estricta, aunque β_D=0.13>0.
```

Si se varía w manteniendo el riesgo y su pendiente en ese punto:
`ε_crítica=0.13/[(1-w)0.125]=1.04/(1-w)`, con `0<w<1`.
Para w=0.20 se obtiene `M'=0.026-0.020ε`: los valores ε=0, 1.3 y 3 dan
respectivamente 0.026, 0 y -0.034. La igualdad no es inversión estricta.

### 4. Unidades

Una subida de un punto porcentual del precio es `ΔD=0.01`. Multiplicar la
pendiente por ese cambio da unidades de probabilidad; multiplicar después
por 100 da puntos porcentuales:

```text
Δq* ≈ 0.13(0.01)=0.0013 de probabilidad = 0.13 pp.
ΔM  ≈ -0.034(0.01)=-0.00034 de fracción = -0.034 pp.
```

Son respuestas locales; el ratio M no es lineal en D. El nivel `q*=0.225`
equivale a 22.5%, y no es su pendiente. La semielasticidad y la elasticidad
ya están distinguidas en la página 10.

## Qué cierra este pendiente

Incorporar las correcciones y el complemento manuscritos, comprobar su
legibilidad y actualizar el índice y el estado de cumplimiento. No hace
falta copiar instrucciones al estudiante ni repetir todas las definiciones,
las pruebas ya escritas o los miles de cálculos de una malla de simulación.
La exigencia es cubrir las derivaciones y sus condiciones, no reproducir una
cantidad fija de páginas de la guía. El contenido que se entrega debe estar
fusionado en main, según la consigna oficial.
