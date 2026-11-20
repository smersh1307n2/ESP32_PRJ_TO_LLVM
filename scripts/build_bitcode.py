#!/usr/bin/env python3
"""Build selected ESP-IDF C examples as LLVM bitcode using the IDF Clang toolchain."""
from __future__ import annotations

import argparse
import json
import os
import shlex
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MAIN = ROOT / "main"
TEMP = MAIN / "ir_gen_temp"
OUTPUT = ROOT / "llvm_output"


def run(args: list[str], *, cwd: Path = ROOT) -> None:
    print("+", shlex.join([str(x) for x in args]), flush=True)
    subprocess.run(args, cwd=cwd, check=True)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("example", help="Example directory, e.g. examples/01_integer")
    args = parser.parse_args()

    example = (ROOT / args.example).resolve()
    if not example.is_dir() or ROOT not in example.parents:
        raise SystemExit(f"Invalid example directory: {example}")
    sources = sorted(example.glob("*.c"))
    if not sources:
        raise SystemExit(f"No C sources in {example}")

    clang = os.environ.get("ESPB_CLANG") or shutil.which("clang")
    if not clang:
        raise SystemExit("clang must be available (install esp-clang and add its bin directory to PATH)")

    OUTPUT.mkdir(exist_ok=True)
    TEMP.mkdir(parents=True, exist_ok=True)
    original = MAIN / "CMakeLists.txt"
    saved = original.read_bytes() if original.exists() else None
    try:
        for item in TEMP.iterdir():
            if item.is_file():
                item.unlink()
        copied = []
        for source in sources:
            target = TEMP / source.name
            shutil.copy2(source, target)
            copied.append(target)
        cmake_sources = " ".join(f'"ir_gen_temp/{p.name}"' for p in copied)
        original.write_text(f"idf_component_register(SRCS {cmake_sources} INCLUDE_DIRS .)\n", encoding="utf-8")
        run([sys.executable, str(Path(os.environ["IDF_PATH"]) / "tools" / "idf.py"), "reconfigure"])
        commands = json.loads((ROOT / "build" / "compile_commands.json").read_text(encoding="utf-8"))
        for source in copied:
            match = next((entry for entry in commands if Path(entry["file"]).name == source.name), None)
            if match is None:
                raise RuntimeError(f"No compile command found for {source.name}")
            argv = match.get("arguments") or shlex.split(match["command"])
            argv = list(argv)
            argv[0] = clang
            filtered = []
            skip = False
            for token in argv[1:]:
                if skip:
                    skip = False
                    continue
                if token == "-o":
                    skip = True
                    continue
                if token == "-c":
                    continue
                filtered.append(token)
            output = OUTPUT / f"{example.name}_{source.stem}.bc"
            run([clang, *filtered, "-emit-llvm", "-c", "-o", str(output)], cwd=Path(match["directory"]))
            print(f"BITCODE_OUTPUT={output}")
    finally:
        if saved is not None:
            original.write_bytes(saved)
        elif original.exists():
            original.unlink()
        shutil.rmtree(TEMP, ignore_errors=True)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except subprocess.CalledProcessError as exc:
        raise SystemExit(exc.returncode)
