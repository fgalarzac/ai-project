# Lean: alternativas probadas y ruta recomendada

Actualización del 10 de noviembre de 2026. Esta nota reemplaza el diagnóstico
anterior sobre la disponibilidad del agente. Las proposiciones generales
siguen abiertas: preparar el entorno no equivale a formalizarlas.

## Resultado de la exploración

**Hay una ruta viable sin sustituir el modelo exigido ni parchear los controles:**
usar `gpt-5.6-sol`, esfuerzo `xhigh`, mediante el CLI autenticado, y ejecutar
AppliedModelingLib en Linux real. La alternativa inmediata de Linux ya quedó
probada en GitHub Actions sobre Ubuntu 24.04. Para una sesión larga e interactiva,
WSL2/Ubuntu o un equipo Linux persistente simplificarían la misma ruta.

La afirmación anterior «el agente no está disponible» era demasiado amplia.
No figuraba entre los agentes seleccionables de este chat, pero sí figura en
el catálogo local del CLI. Se verificó con una petición real, sin cambiar
configuración global y sin usar una API key adicional.

## Pruebas ejecutadas

| Prueba | Resultado | Evidencia |
|---|---|---|
| Catálogo local del CLI | Incluye `gpt-5.6-sol` y `xhigh` | `lean_alternatives/catalog_probe.json` |
| Petición real del CLI | Salida 0 y respuesta `LEAN_MODEL_PROBE_OK` | Prompt de prueba sin herramientas ni cambios de archivos; log JSONL guardado |
| Autenticación | CLI ya autenticado con ChatGPT | `codex login status`; no se exportaron credenciales |
| Linux remoto | Ubuntu 24.04, Python 3.12 y Lean 4.30.0-rc2 | [Corrida de entorno](https://github.com/fgalarzac/ai-project/actions/runs/42814537900) |
| `fcntl.flock` | Exclusión entre dos procesos comprobada | `linux-evidence/environment.json` |
| Diagnóstico oficial `doctor` | **Salida 0**, Git, Lake y Lean requeridos disponibles | `linux-evidence/official_doctor.txt` |
| Entrada oficial sin parches | `paper_contribution.py --help`: salida 0 | `linux-evidence/official_help.txt` |
| Chequeo oficial del paper | Salida 2: falta el directorio generado y su `status.json` | `linux-evidence/official_check_without_scaffold.txt` |
| Suplemento Lean en Linux | Tres declaraciones comprobadas; solo axiomas estándar | `linux-evidence/lean_supplement.txt` |
| Biblioteca original | Commit `194edcc95df74806a39b961d10dedddc6e730cce`, árbol intacto | La acción exige que no haya modificaciones |

La acción se llama expresamente **environment preflight (not paper
formalization)**. Su éxito significa que la preparación del entorno pasó.
El chequeo del paper **no** pasó, y su código de salida y error se conservan.
No se cambia ese resultado por una marca verde de formalización.

La prueba inicial instaló el toolchain de Lean y comprobó la entrada oficial,
no las bibliotecas matemáticas compiladas ni las auditorías semánticas. El diagnóstico oficial `paper_contribution.py doctor` también terminó con
salida 0: Python, Git, Lake y el arranque de Lean están disponibles. Reportó
`pdftotext` y `latexmk` como herramientas opcionales ausentes, que habrá que
instalar para extracción y documentos de revisión. La
compilación de P1--P3 y la preparación de sus dependencias seguirán siendo
parte de la corrida completa, no de una prueba de disponibilidad.

## Comparación de alternativas

| Alternativa | Estado en este equipo | Ventaja | Límite y decisión |
|---|---|---|---|
| CLI Windows + comprobaciones Linux en Actions | **Probada** para selección de agente, entrada oficial y Lean auxiliar | No requiere instalar un sistema, reiniciar ni copiar credenciales a GitHub | Adecuada para preparar y comprobar lotes. Una sesión de prueba larga necesita conservar y transferir los archivos de trabajo; el runner es efímero. |
| WSL2 con Ubuntu | Funciones WSL y VirtualMachinePlatform deshabilitadas; no se instalaron | Agente, Python POSIX, Lake y archivos en un mismo entorno persistente | Requiere habilitación con administrador, instalación y posiblemente reinicio. Es la opción local más directa para el flujo completo. |
| Equipo Linux/macOS persistente o Codespace | No se encontró un entorno guardado accesible en Codex Cloud; no se crearon recursos | Permite ejecución interactiva del flujo sin adaptar scripts | Requiere un entorno disponible y autenticación allí. Codespaces/VM pueden tener costos; no se crearon ni contrataron. |
| Windows nativo con Lean/Mathlib | Lean auxiliar funciona; el flujo Python oficial no | Útil para construir y comprobar pruebas Lean localmente | La biblioteca usa `fcntl` en varios módulos, además de mecanismos POSIX y `/proc`. Resolver solo un import no demuestra portabilidad del flujo completo. |
| Sustituir `fcntl` por un módulo ficticio o eliminar controles | **Descartada** | Podría ocultar el primer error | Anularía garantías de exclusión y auditoría. No es una solución válida ni se implementó. |
| Usar otro modelo | Innecesaria | Puede servir para exploración no oficial | El modelo exigido ya responde por CLI. No hace falta asumir que el docente aceptaría una sustitución. |

Docker/Podman no están instalados ni disponibles en PATH. Su instalación
añadiría otro entorno y no mejora la salida inmediata ya comprobada en Linux.
MSYS2/Cygwin no se adoptaron: una capa parcial POSIX necesita una prueba de
compatibilidad de todo el flujo, no solo de `import fcntl`.

## Siguiente paso del procedimiento académico

1. Revisar y fusionar el paper mediante [PR #4](https://github.com/fgalarzac/ai-project/pull/4).
   El PR sigue abierto; no se ha escrito directamente en `main` ni se ha
   efectuado un merge como parte de esta exploración.
2. Copiar el hash del commit fusionado que contiene el PDF definitivo.
3. Desde la raíz de un clon actualizado de AppliedModelingLib en Linux,
   ejecutar `python3 scripts/paper_contribution.py doctor` y resolver sus
   prerrequisitos. Iniciar el CLI con el modelo y esfuerzo que ya se probaron:

   ```bash
   codex --model gpt-5.6-sol -c 'model_reasoning_effort="xhigh"'
   ```

4. Dar el prompt oficial con el hash real, solicitando la habilidad
   paper-formalization y la carpeta `Galarza26RelativeCredit`.
5. Generar el inventario y los enunciados fieles de P1–P3. Construir y comprobar
   las pruebas generales, sin `sorry` ni hipótesis que introduzcan la conclusión.
6. Ejecutar el chequeo por paper, conservar su salida y copiar el directorio
   generado completo a `lean/`, respetando `.gitignore` y sin `git add -f`.
7. Actualizar tabla, presentación y registro. Si cambia un resultado, repetir
   el flujo sobre la nueva fuente fijada.

No es necesario comprar acceso API, instalar un módulo `fcntl` de pip ni
cambiar el modelo. Para el arranque completo, lo que falta es la secuencia
de fuente fusionada y formalización, no la disponibilidad del agente.

## Archivos preparados

- `.github/workflows/lean-environment.yml`: prueba remota independiente.
- `code/lean_environment_probe.py`: comprueba bloqueos POSIX y llama la entrada
  oficial; nunca declara un paper formalizado.
- `docs/lean_alternatives/`: salidas reales del CLI y de Linux.
- `.github/workflows/build.yml`: **conservado intacto**.

## Fuentes primarias

- [OpenAI: modelo GPT-5.6 Sol](https://developers.openai.com/api/docs/models/gpt-5.6-sol)
  y [selección de modelos en CLI](https://learn.chatgpt.com/docs/models?surface=cli).
  La aceptación en esta cuenta se comprobó además con una petición real.
- [Python: `fcntl` es Unix](https://docs.python.org/3.12/library/fcntl.html).
- [Microsoft: instalación de WSL](https://learn.microsoft.com/en-us/windows/wsl/install).
- [GitHub: runners hospedados](https://docs.github.com/en/actions/reference/runners/github-hosted-runners).
- [Consigna del curso, sección 6](https://github.com/alexanderquispe/AI-Econ-Modeling/issues/7).

La nota anterior describía un bloqueo observado de Windows. Esta exploración
lo resuelve usando Linux real; no demuestra todavía el cumplimiento de la
formalización académica completa.
