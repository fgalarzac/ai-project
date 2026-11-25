# Lean: validación de la edición final en español

**Las tres proposiciones están demostradas y el cierre estricto está aceptado.**
La renovación concluyó el 25 de noviembre de 2026. Los diez controles estrictos
terminaron con salida 0 y cero errores. El registro humano permanece en 0/3.

## Fuente exacta y ediciones

La fuente auditada es el [artículo español](../paper/paper.pdf) del commit
`1f26057150da8a1bffbf1fc357f15bd14466a090`, fusionado por PR10, SHA256
`381af6e7d069af85faca6774b3c07e0f927fced227c284c41cf9b203ac81f4a5`: 16 páginas de cuerpo y 19 totales.
La [edición inglesa](../paper/paper_en.pdf) es una traducción completa de
15 páginas de cuerpo y 18 totales. Se contrastaron sus ecuaciones y condiciones;
la credencial formal identifica expresamente la fuente española.

Los cinco supuestos y tres enunciados españoles conservan su texto original.
Los ocho archivos de la presentación permanecen idénticos. La renovación de
Lean actualiza su correspondencia con el PDF; no cambia la matemática de las pruebas.
La fuente anterior se conserva como archivo histórico en `lean_evidence/frozen_source/`.

## Resultados verificables

| Comprobación | Evidencia actual |
|---|---|
| Motor oficial sin modificaciones | AppliedModelingLib `194edcc…`; registro aditivo de Lake `4d30604…` |
| Revisión de la fuente | Lectura independiente del PDF completo y de sus pasajes exactos |
| Correspondencia matemática | Tres resultados y 18 componentes del modelo: sin discrepancias ni incertidumbres abiertas |
| Revisión adversarial final | [Informe independiente](../lean/docs/AGENT_SOURCE_AUDIT.md), PASS; [ejecución real](lean_evidence/actual_adversarial_run.json) |
| Cierre estricto | [Log completo](lean_evidence/strict_worker.txt), diez etapas y cero errores |
| Grafo aceptado | [Puntero](../lean/audit/obligation_evidence/current_accepted_graph.json), `73176b110cad1b3750b61da169704116cafbae83a77cc510c87c1fef04801977` |
| Planificador | [Cierre completo y ninguna acción pendiente](lean_evidence/accepted_planner.json) |
| Chequeo oficial `--fast` | [Salida 0](lean_evidence/fast_check_stdout.txt) |
| Todos los módulos | [Reconstrucción oficial, salida 0](lean_evidence/full_module_checkpoint_stdout.txt) |
| Grafo revalidado, fuentes presentes | [Salida 0](lean_evidence/receipt_final_stdout.txt) |
| Material de lectura | [Paquete de 40 páginas](lean_evidence/HUMAN_REVIEW_PACKET.pdf), [diagrama](../lean/docs/DependencyDAG.pdf) e [informe](../lean/FINAL_VALIDATION_REPORT.md) |

La reproducción limpia de esta actualización se comprueba en el PR; su resultado se registra después de la ejecución real.

Las siete advertencias del cierre están documentadas en el log: seis son
comprobaciones de encabezados o referencias de los registros y una corresponde
a la revisión humana pendiente (0/3).

Las sesiones independientes utilizaron el CLI real `gpt-5.6-sol`, esfuerzo
`xhigh`. Las pruebas solo dependen de los axiomas estándar `propext`,
`Classical.choice` y `Quot.sound`. La carpeta `lean/` copia íntegramente los
313 archivos generados, sin editar su contenido y respetando su ignore.
Los [metadatos](lean_evidence/validation_summary.json) describen los resultados;
la credencial es el grafo aceptado revalidado por el motor oficial.

## Límites y reproducción

El primer intento de revisión final de esta edición se interrumpió por límite
de uso del CLI, sin dictamen. Un nuevo revisor independiente completó la
revisión con salida 0 y PASS. Ambos intentos constan en el registro de migración;
no se atribuye aceptación al intento interrumpido.

La fachada general sin `--fast` conserva su fallo al interpretar el estado
terminal del planificador, salida 2. Su [salida real](lean_evidence/full_check_stderr.txt)
se distingue de los controles aprobados. La [reproducción](reproducir_lean.md)
utiliza el chequeo exigido, la reconstrucción completa y la revalidación del
grafo, con las fuentes presentes y el motor sin parches.

Lean comprueba las consecuencias de los supuestos; no acredita su validez en
bancos peruanos ni una mejora predictiva. La revisión humana y las derivaciones
manuscritas auténticas corresponden al estudiante, según `hand/README.md`.
