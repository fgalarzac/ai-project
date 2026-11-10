"""Persistent Linux execution transport for an unmodified AppliedModelingLib.

Only an explicitly dispatched workflow runs this helper. Requests and results
live on a dedicated transport branch; this does not manufacture audit evidence.
The authenticated language-model session stays on the operator's computer.
"""
from __future__ import annotations

import hashlib
import json
import os
from pathlib import Path
import subprocess
import tarfile
import time


def command(argv, cwd, **kwargs):
    return subprocess.run(argv, cwd=cwd, check=True, **kwargs)


def safe_extract(archive: Path, root: Path):
    root = root.resolve()
    with tarfile.open(archive, "r:gz") as bundle:
        for item in bundle.getmembers():
            target = (root / item.name).resolve()
            if not target.is_relative_to(root) or item.issym() or item.islnk():
                raise ValueError(f"Unsafe upload member: {item.name}")
        bundle.extractall(root, filter="data")


def main():
    control = Path(os.environ["LEAN_CONTROL_DIR"])
    aml = Path(os.environ["LEAN_AML_DIR"])
    branch = os.environ["LEAN_CONTROL_BRANCH"]
    command(["git", "config", "user.name", "Lean execution transport"], control)
    command(["git", "config", "user.email", "lean-transport@users.noreply.github.com"], control)
    deadline = time.monotonic() + 5.6 * 3600
    print("Persistent Linux worker ready", flush=True)
    while time.monotonic() < deadline:
        command(["git", "fetch", "-q", "origin", branch], control)
        command(["git", "reset", "--hard", f"origin/{branch}"], control, stdout=subprocess.DEVNULL)
        pending = [p for p in sorted((control / "requests").glob("*/request.json"))
                   if not (control / "responses" / p.parent.name / "result.json").exists()]
        if not pending:
            time.sleep(4)
            continue
        for request_path in pending:
            request = json.loads(request_path.read_text())
            response = control / "responses" / request_path.parent.name
            response.mkdir(parents=True, exist_ok=True)
            result = {"request_id": request_path.parent.name, "argv": request.get("argv"),
                      "started_utc": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())}
            print("Executing", request_path.parent.name, request.get("argv"), flush=True)
            try:
                upload = request_path.parent / "upload.tar.gz"
                if upload.exists():
                    digest = hashlib.sha256(upload.read_bytes()).hexdigest()
                    if digest != request["upload_sha256"]:
                        raise ValueError("Upload digest mismatch")
                    safe_extract(upload, aml)
                env = dict(os.environ, LEAN_NUM_THREADS="1", PYTHONUNBUFFERED="1")
                env.update(request.get("env", {}))
                cwd = (aml / request.get("cwd", ".")).resolve()
                if not cwd.is_relative_to(aml.resolve()):
                    raise ValueError("Working directory outside AppliedModelingLib")
                started = time.monotonic()
                with (response / "stdout.txt").open("w") as out, (response / "stderr.txt").open("w") as err:
                    process = subprocess.run(request["argv"], cwd=cwd, env=env, stdout=out,
                                             stderr=err, timeout=min(request.get("timeout", 1800), 3600))
                result.update(exit_code=process.returncode, elapsed_seconds=round(time.monotonic()-started, 3))
                with tarfile.open(response / "download.tar.gz", "w:gz") as bundle:
                    roots = request.get("download", ["papers/Galarza26RelativeCredit", "lakefile.toml"])
                    for relative in roots:
                        path = (aml / relative).resolve()
                        if not path.is_relative_to(aml.resolve()):
                            raise ValueError("Download outside AppliedModelingLib")
                        if path.exists():
                            bundle.add(path, arcname=relative, filter=lambda i: None if
                                       "/__pycache__/" in i.name or i.name.endswith(".pyc") else i)
                result["download_sha256"] = hashlib.sha256((response / "download.tar.gz").read_bytes()).hexdigest()
            except Exception as exc:
                result.update(exit_code=-1, transport_error=f"{type(exc).__name__}: {exc}")
            result["finished_utc"] = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
            (response / "result.json").write_text(json.dumps(result, indent=2)+"\n")
            command(["git", "add", "responses/"+request_path.parent.name], control)
            command(["git", "commit", "-q", "-m", "Record Linux execution "+request_path.parent.name], control)
            command(["git", "push", "-q", "origin", "HEAD:"+branch], control)
            print("Completed", result, flush=True)
            if request.get("shutdown"):
                return
    print("Worker reached its bounded session deadline", flush=True)


if __name__ == "__main__":
    main()
