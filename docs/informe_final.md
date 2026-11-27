# Informe de entrega

El proyecto estudia cuándo el precio relativo del crédito informa sobre el
riesgo futuro. El banco elige cuánto evaluar a los solicitantes después de
observar ese precio. El artículo distingue la selección de solicitantes, el
incentivo a evaluar y la composición del saldo de cartera.

La [edición española](../paper/paper.pdf) tiene 16 páginas de cuerpo y 19 en
total; la [edición inglesa](../paper/paper_en.pdf), 15 y 18, respectivamente.
Ambas utilizan 11 puntos, una columna y márgenes de una pulgada. La
[guía de lectura](guia_lectura_paper.md) sigue las páginas del artículo y
explica los símbolos antes de utilizar sus resultados.

## Contribución y estructura

El artículo presenta la pregunta y la literatura, define el indicador de
precio relativo y desarrolla las primitivas y la decisión del banco. A
continuación demuestra tres proposiciones y las contrasta mediante
simulaciones. La discusión delimita la interpretación económica y las
condiciones de una aplicación empírica.

| Resultado | Qué demuestra | Condiciones decisivas |
|---|---|---|
| P1: esfuerzo y riesgo óptimos | La solución única compara el esfuerzo deseado con la capacidad y la cota de probabilidad. La pendiente del riesgo depende del régimen vigente. | Supuestos S1–S3; las pendientes se calculan en intervalos con restricciones estrictas. |
| P2: umbral por opacidad | Existe un único punto donde cambia el signo de la pendiente interior del riesgo respecto del precio. | Continuidad, descenso estricto, cruce de signos e interioridad uniforme al precio comparado, según S4. |
| P3: composición de cartera | La respuesta del ratio combina calidad y cambios en el peso de la cohorte nueva; la composición puede invertir el signo. | Contabilidad y comparabilidad de cohortes de S5, con las condiciones de diferenciabilidad de la proposición. |

El modelo original se conserva: los cinco supuestos y los tres enunciados
españoles mantienen su texto. El [registro de preservación](modelo_preservado.json)
y las [comprobaciones entre idiomas](paper_ediciones_qa.json) documentan esa
correspondencia. Las decisiones económicas se explican en
[decisiones.md](decisiones.md).

## Reproducción y evidencia

[code/verify.py](../code/verify.py) ejecuta 4018 controles base y 73 adicionales.
La [documentación del código](../code/README.md) describe las dependencias y
las salidas. Las comprobaciones incluyen un optimizador acotado independiente,
los regímenes de la solución, la validez de probabilidades y saldos, las
pendientes y las conversiones de unidades. Las seis figuras del artículo se
generan a partir de esos ejercicios.

El ejemplo de composición utiliza una cohorte nueva cuyo riesgo aumenta con
el precio, mientras su peso en la cartera disminuye. La pendiente del riesgo
nuevo es 0.13 y la del ratio total es −0.034, por unidad de tasa decimal.
Una subida de un punto porcentual del precio corresponde a 0.01 unidades:
las respuestas locales son, respectivamente, 0.13 y −0.034 puntos
porcentuales. La frontera del ejemplo se alcanza cuando la semielasticidad
del saldo, es decir, su respuesta proporcional al precio, vale 1.3.

Las cifras simuladas son ilustrativas. La [tabla histórica del BCRP](../code/data/README.md)
se presenta con su definición y universo originales. El [registro de fuentes](fuentes.md)
identifica qué se consultó y cómo se utiliza. El alcance del artículo es
teórico: las estimaciones para el Perú requieren datos y validación adicionales.

## Formalización y archivos de la entrega

Las tres proposiciones están demostradas en Lean y el cierre estricto está
aceptado sobre la edición española final del 24 de noviembre de 2026. El
[registro vigente](lean_progreso.md) enlaza la fuente fijada, el grafo aceptado,
la revisión independiente y los resultados de los controles oficiales. La
[guía de reproducción](reproducir_lean.md) permite reconstruir los módulos
y revalidar el recibo con los insumos presentes.

La [propuesta](../proposal/proposal.pdf) y las dos presentaciones se conservan
en sus rutas originales. El [PDF manuscrito](../hand/Hand.pdf) es el archivo
suministrado por el autor, de diez páginas. El [registro de IA](../prompts.md)
reúne las interacciones conservadas y las comprobaciones realizadas.

El [índice documental](README.md) permite localizar cada componente; la
[matriz](cumplimiento.md) lo relaciona con la consigna. Los conteos y huellas
se registran en [qa_report.json](qa_report.json). El workflow oficial
compila los cuatro PDF y ejecuta las verificaciones numéricas. Su contenido
se conserva intacto y las actualizaciones se integran mediante pull requests.
