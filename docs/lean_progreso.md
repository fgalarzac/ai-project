# Lean: estado y evidencia vigente

Actualizado el 22 de noviembre de 2026. **P1–P3 compilan; el cierre oficial
está en curso.** Una compilación no se presenta como aceptación del protocolo.

La fuente final ya está fusionada en el commit
`25f0b0c7df040e2b04d78064b30949492cd4472f`, por PR7, con CI aprobado.
Su PDF tiene SHA256
`d7e8130cf88602523ff6eec460a27f798314c2596a4f241190d1da5c88fc2953`.
Una lectura independiente del PDF completo y un control preliminar de 21
filas no detectaron diferencias de significado. El motor oficial está
renovando las revisiones ligadas a esta fuente. Una fila requiere adjuntar
el párrafo que define el saldo antiguo positivo y su proporción de atraso
entre cero y uno; esos límites ya están escritos en el artículo. Se corrige
el enlace de contexto y se repite la revisión afectada, sin agregar supuestos.

Los ocho dictámenes de la primera cola quedaron guardados antes de que el
CLI alcanzara su límite temporal: siete coincidencias y una incertidumbre
por ese contexto. El proceso terminó con salida 1 y no se presenta como
una corrida aprobada. La incertidumbre permanece abierta hasta su nueva
revisión independiente y el cierre estricto.

La revisión final independiente iniciada el 10 de noviembre terminó con salida
1 al alcanzar el límite de uso del CLI. No produjo un dictamen PASS ni un
grafo aceptado. El 22 de noviembre se comprobó de nuevo el repositorio del
motor: su rama principal conserva el mismo commit de base indicado abajo.
El paper se ha explicado con mayor detalle, conservando literalmente los
cinco supuestos y los tres enunciados. Su nuevo PDF debe fijarse en un commit
fusionado antes de renovar el cierre oficial. La presentación del usuario
se conserva sin modificaciones.

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

La fuente final indicada arriba conserva los enunciados matemáticos. La evidencia
posterior se registrará aquí, fuera del PDF, para evitar una referencia circular.

La revisión preliminar usa el bundle SHA256
`df4f92538b1b4a4054d4fe7f0734434c322975d6ebe58af387483f593a7108da`.
No es una credencial de aceptación. El fragmento de Optimization.lean proyectado
en la diapositiva 23 pertenece a esas pruebas generales, no al suplemento
racional inicial. No se atribuye revisión humana al estudiante.

Se conservan las [alternativas e intentos anteriores](lean_alternativas.md)
como historia. El fallo Windows por fcntl y los límites temporales del CLI
no se borran ni se convierten en verificaciones aprobadas.
