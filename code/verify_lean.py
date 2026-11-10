"""Check the supplementary Lean file. This is not the official paper workflow."""
from pathlib import Path
import os
import shutil
import subprocess

root=Path(__file__).resolve().parents[1]
lean=os.environ.get('LEAN_BIN') or shutil.which('lean')
if not lean:
    raise SystemExit('Lean not found. Install v4.30.0-rc2 or set LEAN_BIN to its executable.')
version=subprocess.run([lean,'--version'],capture_output=True,text=True,check=True)
result=subprocess.run([lean,str(root/'lean'/'supplement'/'Counterexample.lean')],
                      capture_output=True,text=True,encoding='utf-8',errors='replace')
log=version.stdout+result.stdout+result.stderr+f'\nEXIT_CODE={result.returncode}\n'
print(log)
(root/'lean'/'supplement'/'check_output.txt').write_text(log,encoding='utf-8')
if result.returncode:
    raise SystemExit(result.returncode)
if 'sorryAx' in log or '_native' in log:
    raise SystemExit('Unexpected admission or native-decision axiom in supplementary proof')
