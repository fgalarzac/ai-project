# Reproducir la formalización

El entorno es **Linux**, Python 3.12, Git, Poppler y Lean 4.30.0-rc2.
Windows nativo no ejecuta el protocolo completo porque utiliza `fcntl`.
La [acción de GitHub](../.github/workflows/lean-paper.yml) repite estos pasos
desde una instalación limpia, sin ejecutar otra revisión con IA.

## 1. Obtener el proyecto y la biblioteca

Desde una carpeta vacía:

```bash
git clone https://github.com/fgalarzac/ai-project.git
git clone --no-tags https://github.com/nikhgarg/AppliedModelingLib.git
git -C AppliedModelingLib fetch ../ai-project/docs/lean_evidence/engine_registration.bundle HEAD
git -C AppliedModelingLib checkout --detach 4d30604f45ddd6848fd87691c8e3ca63881b073b
sudo apt-get update
sudo apt-get install -y poppler-utils
```

El bundle añade únicamente cuatro líneas de registro del paper en Lake.
Su padre es el motor público `194edcc95df74806a39b961d10dedddc6e730cce`.
No contiene un motor modificado ni credenciales.

## 2. Instalar Lean y restaurar los insumos exactos

```bash
curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -o elan-init.sh
sh elan-init.sh -y --default-toolchain none
export PATH="$HOME/.elan/bin:$PATH"
cd AppliedModelingLib
elan toolchain install "$(cat lean-toolchain)"
elan default "$(cat lean-toolchain)"
lake exe cache get
cd ..
python3 ai-project/code/restore_lean_run.py --aml AppliedModelingLib
```

El restaurador verifica los SHA256 del PDF, del TeX y de los artefactos
públicos. Copia la carpeta generada y restaura los insumos que su `.gitignore`
excluye: el PDF fuente, su extracción con `pdftotext` y el paquete de revisión
humana. Exige el commit correcto y rechaza sobrescribir un paper existente.
No emite dictámenes ni aceptación.

## 3. Ejecutar los controles oficiales

```bash
cd AppliedModelingLib
export PYTHONPATH=.
export LEAN_NUM_THREADS=1
git diff --exit-code 194edcc95df74806a39b961d10dedddc6e730cce -- scripts config skills AppliedModelingLib
python3 scripts/paper_contribution.py check Galarza26RelativeCredit --fast
python3 scripts/private_paper_checkpoint.py Galarza26RelativeCredit
python3 scripts/final_closure_receipt.py --paper Galarza26RelativeCredit --check
```

El primer control compila la interfaz y revisa el aislamiento semántico.
El segundo reconstruye todos los módulos con `lake --rehash`.
El tercero revalida el grafo aceptado contra los insumos actuales, con las
fuentes presentes. No se usan `--allow-missing-source-bytes`, `--no-build`
ni un motor parcheado. Si un insumo cambia, su aceptación debe revalidarse.

## Alcance y fallo conocido de la biblioteca

El cierre estricto original terminó con salida 0, diez etapas completas y
cero errores. El recibo vigente identifica el grafo `1e2850e8…`.
La evidencia está en [lean_progreso.md](lean_progreso.md).

En esta versión, `paper_contribution.py check` sin `--fast` devuelve salida
2 después de la aceptación: la fachada espera una acción terminal antigua,
mientras el planificador actual devuelve `closeout_complete=true` y
`next_action=null`. Se conservan también los diagnósticos directos sin recibo
operativo, con salida 1; no se presentan como aprobados. Por ello se usan
los tres controles oficiales anteriores para reconstruir el paper y
revalidar la aceptación ya emitida. La CI no afirma éxito de esa fachada.

## Carpeta y archivos excluidos

`lean/` es una copia íntegra y sin edición del directorio generado. Se respeta
su `.gitignore` y no se usa `git add -f`. El PDF fuente está en `paper/paper.pdf`;
el paquete de revisión tiene una copia idéntica de 37 páginas en
[HUMAN_REVIEW_PACKET.pdf](lean_evidence/HUMAN_REVIEW_PACKET.pdf).
El restaurador recompone los archivos excluidos para ejecutar los controles.
Los finales de línea del directorio generado se preservan byte por byte.
El ZIP completo de Lean incluye también los insumos locales excluidos.

El paquete permite revisar las tres proposiciones; no registra revisión
humana que el estudiante no haya realizado. Esa revisión y las derivaciones
manuscritas auténticas continúan siendo trabajo personal.
