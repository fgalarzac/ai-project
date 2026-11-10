# Precio relativo del crédito y morosidad futura

**Fabián Matías Galarza Chumbe · Track B · 10 de noviembre de 2026**

¿Cuándo informa el precio de créditos nuevos sobre la morosidad posterior de
un banco peruano? El indicador principal es la tasa anual del banco menos el
**promedio simple de otros bancos** en la misma celda y fecha. La mediana es
sensibilidad. La resta cancela una base aditiva común, pero conserva fondeo,
composición y exposición al ciclo heterogéneos.

El banco elige evaluación `e` condicionado en precio `D`. El riesgo previo es
`q0=qbar+aD`, el posterior `q=q0-ge` y el costo `ce²/2`. Con `a,g,c>0`,
`q0∈[0,1]`, `R=Rbar+D>0` y capacidad no negativa, el máximo único es
`e*=min(gR/c, capacidad, q0/g)`. La pendiente de riesgo es `a−g²/c` en el
interior, `a` con capacidad agotada y cero en el piso de riesgo. Un umbral de
opacidad requiere continuidad, cruce, monotonía estricta de `a−g²/c` e
interioridad al precio comparado.

La contribución adicional conecta cohortes con el saldo:
`M=(1−w)m0+wq*`, luego `M'=wq*'+w'(q*−m0)`. Bajo saldos deterministas,
evento y maduración compatibles, cartera antigua fija y sin castigos, el
segundo término puede invertir el signo de la cohorte nueva. No se resuelve
equilibrio de precios ni se demuestra mejora predictiva peruana.

| Componente | Estado y evidencia |
|---|---|
| [Artículo](paper/paper.pdf) y bibliografía | Tres proposiciones, pruebas completas, cinco figuras. Formato 11pt, márgenes de una pulgada. Conteo en [QA](docs/qa_report.json). |
| [Presentación final](slides/final.pdf) | 27 diapositivas en español: variables definidas, construcción gradual, pruebas e interpretación; [guía](slides/final_speaker_guide.md) de 29:40 min estimados, sin ensayo observado. |
| [Simulaciones](code/verify.py) | P1–P3, optimizador independiente, esquinas, sensibilidad y contraejemplos. Parámetros ilustrativos. |
| [Lean](docs/lean_progreso.md) | P1–P3 generales compilan y la revisión preliminar independiente no encontró discrepancias. Cierre oficial y copia final: en curso. |
| [Manuscritos](hand/README.md) | Pendientes de escritura y digitalización personales. Guía tipográfica completa disponible. |
| Tema de octubre | Propuesta y slides conservadas y recompiladas como versión histórica. Usan mediana y la calibración anterior. |
| Evidencia y colaboración IA | [Fuentes](docs/fuentes.md), [matriz](docs/cumplimiento.md), [prompts](prompts.md). Las cifras 2026 del plan no se reproducen sin su base. |

Desde la raíz:
```bash
python -m pip install -r code/requirements.txt
python code/verify.py
cd paper && latexmk -pdf paper.tex
cd ../slides && latexmk -pdf final.tex
```
Los cuatro PDF oficiales están junto a sus fuentes. `build.yml` se conserva
intacto. El flujo de entrega es **apoyo → PR → main**: lo evaluado es `main`.
Slides: hoy 10-nov a las 22:00 Lima. Paper completo: 26-nov a las 22:00 Lima.
