# Precio relativo del crédito y morosidad futura

**Fabián Matías Galarza Chumbe · Línea B · Entrega final**

¿Cuándo una tasa de interés superior a la de bancos comparables informa sobre
el riesgo crediticio futuro en Perú? El precio relativo **D** es la tasa del
banco menos el promedio simple de otros bancos comparables. La resta elimina
una base aditiva común; la mediana se utiliza como comparación de sensibilidad.

El banco elige el esfuerzo de evaluación **e**, dados el precio y la opacidad
del segmento **κ**, entre cero y uno. **q⁰** es el riesgo previo; **a**, su
sensibilidad al precio; **g**, la productividad de evaluar; **c**, la escala
del costo cuadrático; **R**, el premio por evitar el evento adverso; y **ē**,
la capacidad máxima de evaluación.

1. **Óptimo y restricciones (P1, S1–S3).** Con riesgo previo entre cero y uno,
   productividad, costo y premio positivos, y capacidad no negativa, el esfuerzo
   óptimo es único: `e*=min(gR/c, ē, q⁰/g)`. La pendiente del riesgo respecto
   del precio es `a−g²/c` en el interior, `a` si limita la capacidad y cero
   si se alcanza el piso de riesgo.
2. **Umbral por opacidad (P2, S4).** Hay un único cambio de signo si la
   pendiente interior es continua, estrictamente decreciente, positiva en
   κ=0 y negativa en κ=1, con interioridad para toda κ al mismo precio.
3. **Composición de cartera (P3, S5).** Para cohortes con el mismo evento y
   horizonte, saldos positivos y diferenciables y cohorte antigua fija, la
   variación del ratio combina calidad y composición. En un punto
   diferenciable, la composición puede invertir el signo del riesgo nuevo.

| Componente | Documento y contenido |
|---|---|
| Artículo final | [Español](paper/paper.pdf) · [English](paper/paper_en.pdf). 16 y 15 páginas de cuerpo, respectivamente; fuentes LaTeX y bibliografías en `paper/`. |
| Modelo paso a paso | [Guía de lectura](docs/guia_lectura_paper.md): símbolos, decisión del banco y demostraciones de P1–P3. |
| Presentaciones | [Tema](slides/topic.pdf) · [Final](slides/final.pdf). Se conservan sus fuentes y el contenido de la presentación del autor. |
| Propuesta | [Documento inicial](proposal/proposal.pdf), de cuatro páginas; antecedente del proyecto. |
| Código | [Instalación y reproducción](code/README.md). 4018 controles base y 73 adicionales; seis figuras del artículo. |
| Lean | [Tres proposiciones demostradas](docs/lean_progreso.md) sobre la edición española; [reproducción oficial](docs/reproducir_lean.md). |
| Apéndice manuscrito | [PDF del autor](hand/Hand.pdf), de diez páginas, e [índice](hand/README.md). |
| Documentación | [Índice](docs/README.md), [matriz de entrega](docs/cumplimiento.md), [fuentes](docs/fuentes.md) y [registro de IA](prompts.md). |

Desde la raíz del repositorio:

```bash
python -m pip install -r code/requirements.txt
python code/verify.py
```

La [comprobación automática](https://github.com/fgalarzac/ai-project/actions/workflows/build.yml)
verifica el código y compila los cuatro PDF oficiales. Las versiones se
integran en `main` mediante pull requests. El modelo establece resultados
condicionados por sus supuestos; su aplicación predictiva o causal requiere
validación empírica.
