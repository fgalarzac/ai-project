"""Probe the unmodified AppliedModelingLib entrypoint on POSIX.

This reports environment readiness; it never reports a paper as formalized.
Usage: python code/lean_environment_probe.py /path/to/AppliedModelingLib /output
"""
from pathlib import Path
import hashlib
import json
import os
import platform
import subprocess
import sys
import tempfile

aml=Path(sys.argv[1]).resolve()
out=Path(sys.argv[2]).resolve()
out.mkdir(parents=True,exist_ok=True)
result={'platform':platform.platform(),'python':sys.version,
        'purpose':'environment readiness only, not formalization',
        'aml_commit':subprocess.check_output(['git','rev-parse','HEAD'],cwd=aml,text=True).strip(),
        'paper_formalized':False}

import fcntl  # A genuine POSIX implementation is required. No shim is used.

with tempfile.TemporaryDirectory(prefix='lean-posix-') as temp:
    lock=Path(temp)/'probe.lock'
    with lock.open('w') as handle:
        fcntl.flock(handle.fileno(),fcntl.LOCK_EX|fcntl.LOCK_NB)
        child='''import fcntl,sys
with open(sys.argv[1],'r+') as f:
    try:
        fcntl.flock(f.fileno(),fcntl.LOCK_EX|fcntl.LOCK_NB)
    except BlockingIOError:
        print('LOCK_CONFLICT_CONFIRMED')
        sys.exit(0)
    sys.exit(2)
'''
        check=subprocess.run([sys.executable,'-c',child,str(lock)],capture_output=True,text=True)
        if check.returncode or 'LOCK_CONFLICT_CONFIRMED' not in check.stdout:
            raise RuntimeError('Cross-process POSIX locking did not work')
        fcntl.flock(handle.fileno(),fcntl.LOCK_UN)
result['real_cross_process_flock']='passed'
env=dict(os.environ,PYTHONPATH=str(aml))
help_cmd=[sys.executable,'scripts/paper_contribution.py','--help']
help_run=subprocess.run(help_cmd,cwd=aml,env=env,capture_output=True,text=True)
(out/'official_help.txt').write_text(help_run.stdout+help_run.stderr,encoding='utf-8')
result['official_help_exit']=help_run.returncode
if help_run.returncode:
    (out/'environment.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8')
    raise SystemExit(help_run.returncode)

cmd=[sys.executable,'scripts/paper_contribution.py','check','Galarza26RelativeCredit','--fast']
check=subprocess.run(cmd,cwd=aml,env=env,capture_output=True,text=True)
(out/'official_check_without_scaffold.txt').write_text(check.stdout+check.stderr+f'\nEXIT_CODE={check.returncode}\n',encoding='utf-8')
result['official_check_exit']=check.returncode
result['official_check_passed']=check.returncode==0
result['generated_paper_folder_exists']=(aml/'papers/Galarza26RelativeCredit').is_dir()
result['fcntl_error_present']='No module named \'fcntl\'' in check.stderr
if result['fcntl_error_present']:
    raise RuntimeError('POSIX environment failed to resolve the original fcntl error')
result['next_gate']='Official source intake and generated paper folder; paper merge prerequisite remains external'
(out/'environment.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8')
print(json.dumps(result,indent=2))
print('ENVIRONMENT PROBE ONLY. A nonzero paper check remains a failed paper check.')
