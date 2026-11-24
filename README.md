# Precio relativo del crédito y morosidad futura

**Fabián Matías Galarza Chumbe · Línea B · ediciones del 24 de noviembre de 2026**

¿Cuándo una tasa mayor que la de bancos pares informa sobre morosidad futura
en Perú? El indicador resta a la tasa propia el **promedio simple de otros
bancos** comparables; la mediana es sensibilidad. La resta cancela una base
aditiva común, sin eliminar diferencias de fondeo o clientela.

El banco elige evaluación, dado el precio. El esfuerzo óptimo es
`min(gR/c, capacidad, q0/g)`: demanda de evaluación, capacidad y probabilidad
válida. Bajo S1–S3, el máximo es único. El riesgo tiene pendiente `a−g²/c`
solo en el interior; con capacidad agotada es `a` y en el piso es cero.
S4 da un umbral único por opacidad si hay continuidad, descenso estricto,
cruce e interioridad. S5 conecta cohortes con cartera:
`M'=wq*'+w'(q*−m0)`. La composición puede invertir el signo.

Aquí g es productividad de evaluar, c escala de su costo, R premio por
desempeño, q0 riesgo previo y a sensibilidad al precio; w es el peso nuevo y
m0 el riesgo antiguo. La [guía de lectura](docs/guia_lectura_paper.md) explica
los símbolos y cada paso siguiendo las páginas del paper.

| Componente | Estado y acceso |
|---|---|
| Paper final: [español](paper/paper.pdf) · [English](paper/paper_en.pdf) | Ediciones completas, figura 1 corregida y pruebas paso a paso. 16 y 15 páginas de cuerpo, respectivamente; 11pt y una pulgada. [Ediciones y controles](docs/paper_ediciones.md). |
| [Presentación del autor](slides/final.pdf) | Conservada sin cambios: 33 páginas, 29 principales y cuatro de respaldo. [Guía actual](docs/guia_presentacion_actual.md); duración propuesta de 30 min, sin ensayo observado. |
| [Verificación](code/verify.py) | 4018 controles originales + 73 adicionales; seis figuras, parámetros ilustrativos y dependencias fijadas. |
| [Lean](docs/lean_progreso.md) | P1–P3 demostradas; cierre aceptado sobre la fuente del 22-nov, preservada. La edición editorial del 24-nov está en revalidación. [Reproducción](docs/reproducir_lean.md) y paquete de revisión; fallo conocido de la fachada general documentado. |
| [Derivaciones](hand/README.md) | Guía tipográfica de 13 apartados; faltan las páginas manuscritas auténticas y la revisión personal. |
| Historia y evaluación | Propuesta y tema conservados. [Matriz](docs/cumplimiento.md), [informe](docs/informe_final.md), [fuentes](docs/fuentes.md) y [registro IA](prompts.md). |

```bash
python -m pip install -r code/requirements.txt
python code/verify.py
cd paper && latexmk -pdf paper.tex
```

Los cuatro PDF oficiales están junto a sus fuentes. `build.yml` permanece
intacto. Entrega por **apoyo → PR → main**; se evalúa lo fusionado en `main`
al **26 de noviembre, 22:00 Lima**. El trabajo es teórico: no prueba precios
de equilibrio, causalidad ni mejora predictiva peruana. La guía no sustituye
comprensión, manuscrito ni defensa personal.
