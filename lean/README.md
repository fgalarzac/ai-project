# Lean: verificación auxiliar y flujo oficial pendiente

## Lo efectivamente comprobado

`supplement/Counterexample.lean` es código original de esta sesión, separado
de una formalización de AppliedModelingLib. Lean **v4.30.0-rc2**, commit
`3dc1a088b6d2d8eafe25a7cd7ec7b58d731bd7cc`, Windows x86_64, comprueba:

| Declaración | Qué comprueba | Qué no comprueba |
|---|---|---|
| `opposite_signs` | 13/100 > 0 y expresión de composición < 0 | Derivada de funciones reales, solución óptima ni causalidad |
| `composition_value` | La expresión es exactamente −17/500 | Proposición 3 general |
| `probability_bounds` | Las constantes q, m0 y w están en sus dominios | Dominio completo de parámetros del modelo |

Constantes: q=9/40, m0=1/10, beta=13/100, w=1/5, epsilon=3.
Se usa `decide +kernel`, sin `sorry`, `admit`, `native_decide` ni hipótesis que
introduzcan el signo. `#print axioms` reporta `propext`, `Classical.choice` y
`Quot.sound`; salida real en `supplement/check_output.txt`.

Reproducir con el ejecutable de Lean indicado instalado:
```bash
lean lean/supplement/Counterexample.lean
```
No necesita Mathlib ni dependencias externas a Lean/Std. Esta comprobación
parcial no reemplaza el procedimiento del curso. **P1, P2 y P3: abiertas en
la formalización general oficial.** Las pruebas analíticas sí están completas.

## Procedimiento oficial y obstáculos observados

Se clonó AppliedModelingLib desde https://github.com/nikhgarg/AppliedModelingLib,
se ejecutó `git pull --ff-only` y se inspeccionaron su habilidad formalizadora,
el protocolo y la guía de intake. Commit:
`194edcc95df74806a39b961d10dedddc6e730cce`.

Comando intentado desde esa raíz:
```bash
python scripts/paper_contribution.py check Galarza26RelativeCredit --fast
```
Falló con código 1 antes de validar un paper por `ModuleNotFoundError:
No module named 'fcntl'`. Salida íntegra en `check_fast_windows.txt`.
El módulo es POSIX y no está disponible en el Python Windows utilizado.
No se alteraron scripts de AppliedModelingLib para aparentar un chequeo.

**Actualización de la exploración:** el catálogo del CLI sí incluye
`gpt-5.6-sol` y `xhigh`, y una petición real terminó correctamente. El
diagnóstico anterior confundía los agentes expuestos en este chat con la
disponibilidad mediante CLI. No se necesita sustituir el modelo.

También se probó Linux en GitHub Actions: bloqueo POSIX real, entrada oficial
sin parches y Lean auxiliar. El chequeo oficial ahora llega a un error distinto,
salida2: falta la carpeta generada y su `status.json`. Es evidencia de entorno
resuelto, **no** de paper verificado. Véanse [alternativas](../docs/lean_alternativas.md)
y [corrida](https://github.com/fgalarzac/ai-project/actions/runs/42813631433).

El paso inicial todavía exige un paper ya fusionado en main: esta entrega
permanece en apoyo para revisión mediante PR.
**No hay commit formalizado, scaffold oficial generado ni copia de
`papers/Galarza26RelativeCredit/` que se pueda certificar.** No se copió una
corrida ajena ni se presenta esta carpeta auxiliar como directorio generado.

## Continuación exacta

1. Revisar el paper y fusionarlo mediante PR. Copiar el hash de ese commit.
2. En entorno POSIX con Lean y dependencias de AppliedModelingLib, hacer
   `git pull` y usar `gpt-5.6-sol`, razonamiento `xhigh`, si está disponible.
3. Dar el prompt literal de abajo con hash real y ejecutar la habilidad del
   repositorio, no solo este archivo auxiliar.
4. Ejecutar el chequeo por paper y conservar su salida real.
5. Copiar la carpeta completa generada a `lean/`, respetando `.gitignore` y
   sin `git add -f`. Preservar estos registros auxiliares en docs si procede.
6. Actualizar tabla del paper, slide y README con cada declaración, archivo,
   hipótesis añadida y cobertura real. Si cambian resultados, repetir.

```text
Please formalize my own paper, an unpublished manuscript with no arXiv
record: https://github.com/fgalarzac/ai-project/blob/<commit>/paper/paper.pdf
(pinned at commit <commit>), using the paper-formalization skill and
workflow in this repository.
Use Galarza26RelativeCredit as the paper folder.
```

`<commit>` es un campo que debe completarse después del merge requerido,
no un commit ficticio ni un estado de formalización conseguido.
