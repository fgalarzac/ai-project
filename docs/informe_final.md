# Informe final de auditoría y mejora del proyecto

Fabián Matías Galarza Chumbe. 10 de noviembre de 2026, hora de Lima.

> **Actualización Lean:** una exploración posterior verificó mediante petición
> real `gpt-5.6-sol/xhigh` en el CLI y resolvió `fcntl` usando Linux sin parches.
> La entrada oficial funciona; el chequeo del paper se detiene por ausencia
> de la carpeta generada y `status.json` (salida2). Las proposiciones generales
> siguen abiertas. Véase [la comparación y evidencias](lean_alternativas.md).

## 1. Cambios y contribución central

El trabajo está en [apoyo](https://github.com/fgalarzac/ai-project/tree/apoyo).
Se abrió el [PR #4 hacia main](https://github.com/fgalarzac/ai-project/pull/4)
como borrador y **no se fusionó**. La copia antigua de octubre con archivos
no seguidos se conservó intacta. Se partió de un clon limpio de apoyo en
6462a960d2687a84c4369c2d23b4c8e25385ea5a y se integró main mediante merge.
El único conflicto modify/delete se resolvió conservando las notas anteriores
en docs/archive y respetando su eliminación de la ruta original en main.

El paper y la presentación final eran ejemplos de un trabajador asistido por
IA. Se reemplazaron por un modelo bancario coherente con la pregunta del plan:
el precio relativo del crédito como posible señal adelantada de morosidad en
la banca múltiple peruana. La propuesta y la presentación del tema se mantienen
identificadas como versiones históricas, con pequeños arreglos tipográficos.

La contribución puede explicarse en términos sencillos: un precio alto puede
atraer solicitantes más riesgosos y también incentivar que el banco evalúe
mejor. Esa segunda respuesta deja de operar si se agota la capacidad. Incluso
si la calidad de los créditos nuevos empeora, la morosidad de toda la cartera
puede bajar si esos créditos pierden peso frente a una cartera antigua más
segura. El signo de una señal de saldo necesita esa contabilidad.

Se prueban tres resultados: solución global de evaluación con capacidad y
probabilidades válidas; umbral por opacidad bajo cruce, monotonía e interioridad;
y transmisión del riesgo al saldo con término de composición. Hay pruebas
completas en el cuerpo, contraejemplos y comprobaciones independientes.
El precio se mantiene dado: no se declara resuelta una etapa estratégica de
precios. No se confunde esta estática comparativa con un coeficiente predictivo
ni con un efecto causal.

Se eligió promedio simple de pares como indicador principal para respetar el
estimando del plan. La mediana queda como sensibilidad y se muestra un ejemplo
donde cambia el signo de la brecha. Restar pares cancela una base aditiva común,
no todas las diferencias entre bancos. Las decisiones se justifican en
docs/decisiones.md y el diagnóstico previo en docs/diagnostico_inicial.md.

El PDF de investigación se leyó completo (24 páginas). La base y los scripts
separados que menciona no se recibieron. Sus cifras descriptivas para 2026 no
se presentaron como evidencia confirmada. Se usó una transcripción oficial
acotada del BCRP con universo, unidades y definición explícitos. El repositorio
de referencia informa criterios de claridad y trazabilidad; no se copiaron
su modelo, código, resultados ni pruebas, y no se infirió por qué obtuvo la
nota mencionada por el usuario.

## 2. Matriz de cumplimiento con evidencia

| Requisito | Diagnóstico inicial | Estado actual | Evidencia y verificación | Acción restante |
|---|---|---|---|---|
| Tema TrackB y pregunta concreta | Propio en propuesta | Cumplido | paper§1–4; precio relativo y morosidad peruana | Defensa personal |
| Repositorio público y enlace en issue | Presente | Cumplido | Comentario6157914408 y API pública | Ninguna nueva publicación de enlace |
| Rama→PR→merge | apoyo existente divergente | Parcial | Trabajo en apoyo, main integrado preservando notas en docs/archive | Revisar y fusionar PR para entrega oficial |
| README de una página | Muy extenso | Cumplido | README compacto con condiciones y estados | Revisar comprensión |
| Propuesta2–4pp y fuente | Avance propio | Cumplido | proposal/proposal.tex/pdf recompilados; conteo en qa_report.json | Versión histórica de octubre |
| Slides del tema y fuente conservadas | Avance propio | Cumplido | slides/topic.tex/pdf recompilados | Sin reescribir historia |
| Paper8–20pp desde título a conclusión,11pt,1in,1col | Plantilla | Cumplido | paper.tex y pdf; body:end en aux y revisión del PDF | Véase conteo final QA |
| Introducción, literatura, modelo, discusión, conclusión | Plantilla | Cumplido | paper§1–8 | Revisar personalmente |
| Primitivas, unidades, dominios y cronología | Parcial | Cumplido | paper§4, S1–S3 | Ninguna simulación empírica atribuida |
| Supuestos numerados | Incompletos | Cumplido | S1–S5, referencias en P1–P3 | Mantener al cambiar modelo |
| Proposición propia con prueba completa | Solo candidata | Cumplido | P1global, P2umbral, P3composición y pruebas | Lean general separado |
| Existencia, unicidad y esquinas | Solo FOC interior | Cumplido | Cuadrado completo, compactitud, singleton, capacidad y piso | No se resuelve equilibrio de precios |
| Signo, opacidad y robustez | Cruce impuesto | Cumplido | Condiciones S4, tecnología que empeora, capacidad y sensibilidad | Validar opacidad con datos en trabajo futuro |
| Conexión flujo-stock | Mapa positivo postulado | Cumplido | S5 y P3, condición cuantitativa y contraejemplo | Examinar castigos/curaciones al llevar a datos |
| Promedio versus mediana | Inconsistencia | Cumplido | Promedio principal, mediana sensibilidad, ejemplo verificado | Celdas y pesos empíricos pendientes |
| Hechos, fuentes y editorial de preprints | Cifras del plan sin base | Parcial | docs/fuentes.md; tabla BCRP reproducible; WP identificado | Base del plan necesaria para verificar sus cifras2026 |
| Verificación de cada resultado | Solo interior | Cumplido | code/verify.py, checks.py; SymPy, optimización independiente, esquinas y diferencias finitas | No se prueba teorema por simulación |
| Dependencias y semilla | Parcial | Cumplido | requirements.txt; semilla 20261110; fallas explícitas | Instalar versiones compatibles |
| Figuras legibles con unidades y fuente | Solo figura tema | Cumplido | Cinco figuras finales, captions y fuentes, revisión visual | Véase QA |
| Presentación final español,30min y discusión | Plantilla | Cumplido | 27slides, timing.json:1780seg, guía y preguntas | Ensayo real pendiente |
| Lean: enunciado, fragmento real y límites en slide | Ejemplo de plantilla | Parcial | Slide22, código auxiliar comprobado; indica especialización y límites | No hay P1–P3 generales formalizadas |
| Lean oficial con agente y paper fijado | Placeholder | Pendiente | CLI exigido y Linux verificados; faltan carpeta generada y paper fusionado | Seguir flujo exacto desde paper fusionado |
| Tabla Lean por resultado, hipótesis y chequeo | Ejemplo | Cumplido como reporte de estado | ApéndiceB: tres resultados abiertos; sin hash formalizado inventado | Actualizar después del flujo oficial |
| Manuscrito auténtico de todas las derivaciones | Placeholder | Pendiente | Guía tipográfica de 12 apartados en hand/, no suplantada como manuscrito | Escribir, revisar, escanear y proyectar hoja real |
| IA: afirmación revisada, veredicto y registro | Parcial | Cumplido como registro disponible | prompts.md y apéndiceC; no revisión humana fabricada | Ratificación personal y manuscrito de crítica |
| CuatroPDF junto a fuentes | Dos finales de plantilla | Cumplido | Compilación de propuesta, tema, final y paper | Resultado CI remoto en informe final |
| build.yml conservado | Original | Cumplido | SHA256e67f4c1c24b115ecbf3e8feca11e0d2e4541cec368411d4a1fe508cf3ebf8d0f | Ningún cambio permitido |
| Entrega en main a tiempo | No hay merge final | Pendiente | PR revisable desde apoyo | Slides10nov22:00; paper26nov22:00, Lima |

La presentación es trabajo en progreso para recibir crítica. El proyecto no
se declara completo respecto de manuscrito personal y formalización oficial.
Un resultado nulo de predicción no permite atribuir todo a ausencia de señal.
La entrega puede aspirar a alta calidad sin garantizar una calificación.


## 3. Páginas y duración

- **Artículo: 11 páginas de cuerpo**, desde título hasta conclusión. PDF total:
  **14 páginas**, incluyendo una de referencias y dos de apéndices.
- Se verificó la etiqueta `body:end` del `.aux` compilado y se contrastó la
  transición conclusión/referencias en el PDF. No se cambió formato para ajustar
  extensión: artículo de 11 pt, una columna, margen de una pulgada.
- Propuesta: **4 páginas**. Presentación histórica del tema: **19 diapositivas**.
- Presentación final: **27 diapositivas**, completamente en español salvo
  identificadores del código y nombre oficial del curso. Su guía asigna
  **1780 segundos = 29 minutos 40 segundos** de explicación. Se prevén cerca de 15 minutos de
  discusión en el bloque de 45 minutos. **No se observó un ensayo oral real**: el tiempo
  es una estimación sumada por diapositiva, no una inferencia de su número.
- La guía tipográfica de derivaciones tiene **6 páginas y 12 apartados**.

## 4. Verificaciones ejecutadas

| Verificación | Resultado real | Evidencia |
|---|---|---|
| `python code/verify.py` | **4018 comprobaciones superadas** | code/output/verification.json, docs/verification_log.txt |
| P1: solución versus optimizador independiente | Error máximo de esfuerzo 3.7841e-8, menor que tolerancia 2e-6 | SciPy minimiza objetivo y contrasta extremos |
| P1: pendientes y dominios | Error de diferencias finitas 1.0509e-10; interior: 765, capacidad: 293, piso: 437 en 1495 sorteos válidos | Semilla20261110; dominios inválidos rechazados |
| P2: cruce y robustez | Raíz 0.640466922731; contraste independiente y escenarios sin reversión | SymPy, Brent, malla 1001 × 121 |
| P3: composición | q'=0.13 y M'=-0.034; error máximo de derivada 2.5851e-11 | Producto/cociente simbólico, diferencias finitas y contraejemplo |
| Cuatro PDF oficiales | Todos compilan localmente con Tectonic 0.17.0 | docs/build_results.json |
| Guía adicional | Compila a 6 páginas | hand/guia_derivaciones.tex/pdf |
| Revisión visual y estructural | Sin texto fuera de página, marcadores de plantilla, desbordes ni caracteres faltantes en los cinco PDF | docs/qa_report.json; páginas renderizadas con PyMuPDF |
| Enlaces en PDF | Artículo 17, final 5, tema 1, propuesta 4 | Conteo estructural y revisión |
| Lean auxiliar | Tres declaraciones comprobadas, código de salida0 | lean/supplement/check_output.txt |
| Axiomas Lean auxiliar | Solo propext, Classical.choice y Quot.sound | `#print axioms`; `decide +kernel`, sin admisiones |
| Chequeo oficial AppliedModelingLib | **Falló, salida 1** | lean/check_fast_windows.txt: falta fcntl en Windows |
| Workflow original | Idéntico SHA256e67f4c1c…3ebf8d0f | No se modificó .github/workflows/build.yml |
| Git | Rama apoyo, sin sobreescribir la copia antigua; PR revisable | Historial y PR #4 |

La formalización oficial completa **no se ejecutó con éxito**. La exploración posterior comprobó el agente por CLI y resolvió el entorno
POSIX en Linux. Falta el directorio generado, las pruebas generales y el
paper fusionado requerido por el procedimiento. No existe un hash formalizado
por ese flujo. Se registra un candidato público fijado a commit, identificado
expresamente como **no formalizado**, en docs/source_candidate.json. No se
copió un directorio generado inexistente ni el de otro estudiante.

El suplemento Lean solo comprueba la aritmética exacta y los dominios de
constantes del contraejemplo. **No prueba P1–P3 generales**, ni sus derivadas,
ni las simulaciones, ni una aplicación empírica. Las tres filas del apéndice
Lean permanecen abiertas. El README de lean detalla cómo continuar literalmente
con AppliedModelingLib en el entorno y configuración requeridos.

Las figuras son ilustrativas salvo el contexto oficial debidamente rotulado.
No hay panel peruano estimado, RMSE, valores p ni aumento predictivo inventado.
Tampoco se simula que la guía tipográfica sea una derivación manuscrita.

**GitHub Actions:** el job de Python del PR ya terminó correctamente.
La corrida que corresponde al commit de las fuentes es [esta](https://github.com/fgalarzac/ai-project/actions/runs/42773045432).
**Resultado observado: success.** Los dos jobs, Python y compilación de los cuatro PDF, terminaron correctamente en Ubuntu. También pasó la corrida de push 42773006748. Este estado corresponde exactamente al commit de fuentes 92fb042. Se descargaron los cuatro PDF de la corrida: paper de 14 páginas, conclusión en la 11, referencias desde la 12; propuesta de 4 páginas y presentaciones de 19 y 27 diapositivas. Evidencia: docs/ci_artifacts_qa.json.

## 5. Archivos modificados y entrega revisable

Fuente principal fijada en commit `92fb04298eb57c9dc8790d4a4704fbda11453bbb`. El candidato público es
[paper/paper.pdf](https://github.com/fgalarzac/ai-project/blob/92fb04298eb57c9dc8790d4a4704fbda11453bbb/paper/paper.pdf).
Este enlace no afirma que esté fusionado ni formalizado.

Las rutas siguientes son relativas al repositorio. `A`=nuevo, `M`=modificado,
`D`=eliminado, `R`=renombrado según detección de Git. La detección de renombre
entre figuras de PDF no implica reutilización de contenido: se retiró el ejemplo
de esfuerzo de plantilla y se generó el gráfico público desde la transcripción.

```text
M	README.md
A	code/checks.py
A	code/data/README.md
A	code/data/bcrp_2024_table_2_2.csv
A	code/figures/corners.pdf
A	code/figures/corners.png
D	code/figures/effort_check.pdf
A	code/figures/mechanisms.pdf
A	code/figures/mechanisms.png
A	code/figures/public_context.pdf
A	code/figures/public_context.png
A	code/figures/sensitivity.pdf
A	code/figures/sensitivity.png
A	code/figures/stock_composition.pdf
A	code/figures/stock_composition.png
A	code/model.py
D	code/output/effort_check.csv
A	code/output/numbers.tex
A	code/output/verification.json
M	code/requirements.txt
M	code/verify.py
A	code/verify_lean.py
A	docs/archive/topic_speaker_notes_2026-10-13.md
A	docs/build_results.json
A	docs/ci_artifacts_qa.json
A	docs/ci_results.json
A	docs/cumplimiento.md
A	docs/decisiones.md
A	docs/diagnostico_inicial.md
A	docs/environment.json
A	docs/fuentes.md
A	docs/informe_final.md
A	docs/qa_report.json
A	docs/source_candidate.json
A	docs/verification_log.txt
M	hand/README.md
A	hand/guia_derivaciones.pdf
A	hand/guia_derivaciones.tex
M	lean/README.md
A	lean/check_fast_windows.txt
A	lean/supplement/Counterexample.lean
A	lean/supplement/check_output.txt
M	paper/paper.pdf
M	paper/paper.tex
M	paper/references.bib
M	prompts.md
M	proposal/model_notes.md
M	proposal/proposal.pdf
M	slides/final.pdf
M	slides/final.tex
A	slides/final_speaker_guide.md
A	slides/timing.json
M	slides/topic.pdf
M	slides/topic.tex
M	slides/topic_QA.md
M	slides/topic_cheatsheet.md
```

La lista anterior incluye este informe y los registros de QA y CI. La lista definitiva
del PR es la autoridad sobre el diff. Los archivos intermedios de compilación,
runtime, herramientas descargadas, copia de referencia y QA gráfico se mantienen
fuera del paquete final. Los PDF oficiales quedan junto a sus fuentes.

## 6. Participación personal y entrega oficial

1. **Antes de exponer:** leer el modelo y explicar cada condición sin mirar el
   texto. Usar las preguntas difíciles y respuestas de slides/final_speaker_guide.md.
2. **Escritura auténtica:** escribir y revisar todas las derivaciones guiadas
   de hand/guia_derivaciones.pdf. Digitalizarlas legiblemente en hand/. Sustituir
   el estado pendiente y proyectar una hoja real de la afirmación de IA revisada.
3. **Ensayo con cronómetro:** contrastar29:40 con el ritmo personal. Reducir
   sensibilidad si hace falta, conservando condiciones y puente flujo-stock.
4. **Revisar el PR y fusionar mediante el flujo del curso.** Se dejaron los
   cambios en apoyo, como se solicitó. El borrador no equivale a entrega en main.
5. **Formalización:** después del paper fusionado, fijar el hash, ejecutar el
   flujo con el agente indicado cuando esté disponible, conservar chequeo y
   copiar el directorio completo. Actualizar tabla, diapositiva y estados.

Según la [consigna vigente](https://github.com/alexanderquispe/AI-Econ-Modeling/issues/7)
y el [cronograma](https://github.com/alexanderquispe/AI-Econ-Modeling/blob/main/PRESENTATIONS.md),
la exposición es el **11 de noviembre de 2026, 08:20–09:05**. Las diapositivas deben
estar fusionadas en main el **10 de noviembre a las 22:00**, hora de Lima.
El repositorio completo vence el **26 de noviembre de 2026 a las 22:00**. La revisión
y el merge de slides no deben esperar a completar una futura formalización
del paper si eso compromete el plazo de la presentación.

## 7. Debilidades restantes por prioridad

1. **Formalización oficial pendiente.** La aritmética auxiliar no cubre la
   exigencia de todas las proposiciones. Es una brecha real de evaluación.
2. **Manuscrito auténtico pendiente y comprensión no comprobada.** La guía
   facilita el trabajo, pero no reemplaza escritura, revisión ni defensa.
3. **Ritmo oral no ensayado.** Un guion de 30 minutos puede necesitar ajustes al
   explicarlo personalmente, especialmente P1 y la identidad de cartera.
4. **Sin validación predictiva peruana.** La teoría organiza hipótesis. El
   panel y sus fechas de publicación deben reconstruirse y auditarse antes
   de afirmar utilidad del indicador. No es una exigencia empírica inventada
   para TrackB, pero limita la respuesta a la pregunta de tesis.
5. **Primitivas reducidas y tecnología sencilla.** Selección, esfuerzo sin
   efecto en volumen, normalización de pagos, opacidad sin medición y ausencia
   de juego de precios delimitan la interpretación.
6. **Puente contable exigente.** Castigos, curaciones, amortización selectiva,
   garantías y denominador aleatorio pueden alterar el resultado de saldo.
7. **Novedad acotada al aporte del curso.** Se combinan ingredientes conocidos
   con restricciones y contabilidad explícitas. No se afirma prioridad universal.

La entrega mejora sustancialmente el trabajo y hace revisables sus límites.
No garantiza una calificación ni oculta requisitos pendientes.
