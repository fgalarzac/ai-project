# Reproducción de las verificaciones

El punto de entrada es [verify.py](verify.py). Ejecuta las comprobaciones del
modelo y las comprobaciones adicionales de lectura y unidades. Las
dependencias están fijadas en [requirements.txt](requirements.txt).

## Instalación y ejecución

Desde la raíz del repositorio, con Python 3.11 o 3.12:

```bash
python -m venv .venv
```

Activar el entorno según el sistema:

```bash
# Linux o macOS
source .venv/bin/activate
```

```powershell
# Windows, PowerShell
.venv\Scripts\Activate.ps1
```

Después, en el entorno activado:

```bash
python -m pip install -r code/requirements.txt
python code/verify.py
```

La integración continua utiliza Python 3.12 en Ubuntu 24.04. Una ejecución
correcta termina con código de salida cero. Una comprobación que no se
satisface produce una excepción y una salida distinta de cero.

## Organización

| Archivo o carpeta | Función |
|---|---|
| [model.py](model.py) | Primitivas, esfuerzo factible, solución óptima y riesgo resultante. |
| [checks.py](checks.py) | 4018 comprobaciones base: álgebra, optimización, regímenes y simulaciones. |
| [reader_checks.py](reader_checks.py) | 73 comprobaciones adicionales, incluidas la frontera de composición y las conversiones de unidades. |
| [figure_output.py](figure_output.py) | Rutinas de salida utilizadas por las figuras. |
| [figures/](figures/) | Figuras en PDF y PNG, incluidas las versiones inglesas. |
| [output/](output/) | Resultados numéricos, parámetros de figuras y cifras utilizadas en LaTeX. |
| [data/](data/README.md) | Tabla histórica de contexto y documentación de su fuente. |
| [restore_lean_run.py](restore_lean_run.py) | Restauración de los insumos para reproducir la formalización oficial. |

## Interpretación de los resultados

Las comprobaciones contrastan la solución analítica con un optimizador
acotado, verifican probabilidades y saldos, y comparan pendientes dentro de
un mismo régimen. También incluyen esquinas, empates, un escenario sin cruce
por opacidad y un contraejemplo de composición de cartera.

Los parámetros de las simulaciones son ilustrativos. La tabla histórica del
BCRP aporta contexto y conserva su propia definición de riesgo. El código
no estima un efecto causal ni evalúa un pronóstico con datos bancarios peruanos.

La compilación de los artículos y la reproducción de Lean tienen instrucciones
separadas: [ediciones del artículo](../docs/paper_ediciones.md) y
[reproducción de Lean](../docs/reproducir_lean.md).
