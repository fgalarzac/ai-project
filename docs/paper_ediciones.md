# Artículo final en español e inglés

| Edición | Artículo | Fuente LaTeX | Bibliografía | Páginas de cuerpo / total |
|---|---|---|---|---|
| Español | [PDF](../paper/paper.pdf) | [paper.tex](../paper/paper.tex) | [references.bib](../paper/references.bib) | 16 / 19 |
| Inglés | [PDF](../paper/paper_en.pdf) | [paper_en.tex](../paper/paper_en.tex) | [references_en.bib](../paper/references_en.bib) | 15 / 18 |

Ambas ediciones usan 11 puntos, márgenes de una pulgada y una columna.
Incluyen el modelo completo, cinco supuestos, tres proposiciones, sus pruebas,
seis figuras, referencias y apéndices. La versión inglesa traduce también
las etiquetas y leyendas de las figuras. No es un resumen del artículo español.

La revisión editorial presenta la contribución, la medición, el mecanismo y
las condiciones en una secuencia académica. Las limitaciones describen el
alcance de los resultados; las notas operativas se concentran en la
documentación de reproducción. La figura 1 se rediseñó con márgenes
equilibrados, una leyenda exterior y un pie alineado al ancho del gráfico.

## Comprobaciones

Se conservaron literalmente los cinco supuestos y los tres enunciados en
español. Las siete ecuaciones numeradas y las expresiones y condiciones de
los ocho bloques del modelo coinciden entre idiomas. Los dos archivos de
resultados numéricos siguen iguales. Pasaron 4018 controles base y 73
adicionales. Se revisaron visualmente todas las páginas y la figura 1 a
tamaño completo: cero desbordamientos, caracteres faltantes o texto fuera
de página. [Registro de calidad](paper_ediciones_qa.json).

La presentación del autor y el workflow original se conservan sin cambios.
El artículo español se compila mediante el workflow original; un workflow
adicional compila y publica la edición inglesa.

## Compilación local

Con una distribución LaTeX que incluya `latexmk`, desde la raíz del repositorio:

```bash
cd paper
latexmk -pdf paper.tex
latexmk -pdf paper_en.tex
```

Los PDF se generan junto a sus fuentes. Las figuras y cifras se reproducen
previamente mediante [code/verify.py](../code/verify.py), ejecutado desde la
raíz del proyecto.

## Fuente de la formalización

La edición española final del 24-nov tiene un cierre Lean aceptado y propio,
registrado en [lean_progreso.md](lean_progreso.md). La fuente anterior del
22-nov se conserva como archivo histórico con sus bytes exactos. La traducción
inglesa representa la misma matemática; el registro identifica por separado
la fuente sometida al protocolo oficial. El [índice documental](README.md)
reúne las instrucciones de lectura y reproducción de la entrega.
