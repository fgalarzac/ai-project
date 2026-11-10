# Lean: estado y evidencia vigente

Actualizado el 10 de noviembre de 2026. **P1–P3 compilan; el cierre oficial
está en curso.** Una compilación no se presenta como aceptación del protocolo.

| Componente | Resultado real |
|---|---|
| Motor | AppliedModelingLib `194edcc95df74806a39b961d10dedddc6e730cce`, sin parches |
| Agente | Sesiones reales del CLI con `gpt-5.6-sol`, esfuerzo `xhigh` |
| Entorno | Linux real en GitHub Actions; Lean 4.30.0-rc2 |
| Fuente inicial | PDF fusionado por PR4, commit `dc52cd19c3a53b4350c1cba1cf8b4a11037b95ad` |
| PDF inicial SHA256 | `a618a5d9dc04dfb16e3b982fd1864968b90f1d115d0ed00a60fc8fe2e49dbe43` |
| Pruebas | `Galarza26RelativeCredit.proposition1`, `proposition2`, `proposition3`; todas compilan |
| Axiomas | Solo `propext`, `Classical.choice`, `Quot.sound`; inspección real de los tres endpoints |
| Revisión preliminar independiente | 21 coincidencias, 0 discrepancias, 0 incertidumbres; salida 0 |
| Aceptación integral | Pendiente: grafo, revisiones vinculadas, informes y chequeos finales |
| Copia íntegra a lean/ | Se realizará después del cierre; el contenido actual es auxiliar histórico |

La fuente final se volverá a fijar después de fusionar la actualización de
paper y presentación. Los enunciados matemáticos no han cambiado. La evidencia
posterior se registrará aquí, fuera del PDF, para evitar una referencia circular.

La revisión preliminar usa el bundle SHA256
`df4f92538b1b4a4054d4fe7f0734434c322975d6ebe58af387483f593a7108da`.
No es una credencial de aceptación. El fragmento de Stock.lean proyectado
en la diapositiva 22 pertenece a esas pruebas generales, no al suplemento
racional inicial. No se atribuye revisión humana al estudiante.

Se conservan las [alternativas e intentos anteriores](lean_alternativas.md)
como historia. El fallo Windows por fcntl y los límites temporales del CLI
no se borran ni se convierten en verificaciones aprobadas.
