# Lean: cierre y evidencia vigente

**P1–P3 están demostradas y el cierre estricto está aceptado.** La ejecución
real terminó el 22 de noviembre de 2026 a las 23:36 de Lima: diez etapas,
cero errores y seis advertencias. La revisión humana independiente figura
pendiente, 0/3; no se inventa ni se confunde con la aceptación automática.

## Fuente y preservación

La fuente es el PDF fusionado por PR7, commit
`25f0b0c7df040e2b04d78064b30949492cd4472f`, SHA256
`d7e8130cf88602523ff6eec460a27f798314c2596a4f241190d1da5c88fc2953`.
Tiene 15 páginas de cuerpo y 18 en total. Los cinco supuestos y los tres
enunciados originales permanecen idénticos. Los ocho archivos de slides/
se conservan sin cambios. El estado se actualiza fuera del PDF para mantener
fija la fuente que Lean auditó.

## Evidencia verificable

| Elemento | Resultado real y acceso |
|---|---|
| Motor | AppliedModelingLib `194edcc95df74806a39b961d10dedddc6e730cce`, sin parches; registro aditivo en `4d30604…` |
| Entorno y agente | Linux real; Lean 4.30.0-rc2; sesiones reales del CLI `gpt-5.6-sol`, esfuerzo `xhigh` |
| Pruebas | `Galarza26RelativeCredit.proposition1`, `proposition2`, `proposition3`; solo axiomas estándar `propext`, `Classical.choice`, `Quot.sound` |
| Correspondencia con el texto | 18 elementos del modelo y tres resultados vigentes, sin discrepancias ni incertidumbres abiertas |
| Revisión adversarial final | Contexto independiente, PDF completo; dictamen PASS del agente, no del estudiante |
| Cierre estricto | [Log real](lean_evidence/strict_worker.txt): salida 0, cero errores |
| Grafo aceptado | [Puntero](../lean/audit/obligation_evidence/current_accepted_graph.json), SHA256 `1e2850e85cf4eb3994a9bc350e5ccc823bf7ab537a9b263575be98761c73b61c` |
| Planificador actual | [Salida oficial](lean_evidence/accepted_planner.json): cierre completo, recibo actual y ninguna acción pendiente |
| Comando exigido `--fast` | [Salida 0](lean_evidence/fast_check_stdout.txt) |
| Todos los módulos | [Checkpoint oficial, salida 0](lean_evidence/full_module_checkpoint_stdout.txt), con `lake --rehash` |
| Revalidación de la aceptación | [Recibo actual, salida 0](lean_evidence/receipt_final_stdout.txt), fuentes presentes |
| Lectura humana | [Paquete de 37 páginas](lean_evidence/HUMAN_REVIEW_PACKET.pdf), [DAG](../lean/docs/DependencyDAG.pdf), [reporte](../lean/FINAL_VALIDATION_REPORT.md) |
| Reproducción limpia | [Instrucciones](reproducir_lean.md) y [workflow](../.github/workflows/lean-paper.yml) |

La credencial es el grafo aceptado validado por el motor oficial. Los logs,
esta tabla y [validation_summary.json](lean_evidence/validation_summary.json)
son evidencia descriptiva; no sustituyen esa validación.

## Incidencias y límites conservados

La primera cola guardó siete coincidencias y una incertidumbre por faltar
el enlace al párrafo que define el saldo antiguo positivo y su morosidad
entre cero y uno; el CLI terminó por límite de uso, salida 1. Se adjuntó ese
párrafo ya existente y una revisión independiente resolvió las dos filas
afectadas. No se añadió un supuesto ni se cambió la matemática.

El intento del 10 de noviembre interrumpido por cuota no fue una aceptación.
La revisión final nueva del 22 de noviembre sí terminó con salida 0 y PASS.
La cronología está en el registro generado.

La fachada general sin `--fast` conserva un fallo del motor (salida 2:
`closeout planner exposed no executable next action`). No reconoce la
respuesta terminal del planificador actual. Los diagnósticos directos sin
recibo operativo tampoco publican aceptación, salida 1. Se conservan sus
salidas y se distinguen del cierre estricto aprobado. La reproducción usa
el `--fast` exigido, la reconstrucción completa y la revalidación del grafo,
sin debilitar controles ni modificar el motor.

La copia de `lean/` respeta el directorio generado y su ignore. El suplemento
racional inicial está separado en `code/lean_supplement/`; el snippet de la
diapositiva 23 pertenece a las pruebas generales. Las
[alternativas e intentos anteriores](lean_alternativas.md) se conservan como
historia. Los requisitos personales están en la [matriz](cumplimiento.md).

