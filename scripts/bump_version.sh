#!/bin/bash
set -e

MOD_FILE="descriptor.mod"

if [ ! -f "$MOD_FILE" ]; then
  echo "❌ $MOD_FILE 파일을 찾을 수 없습니다."
  exit 1
fi

python3 - << 'PYEOF'
import re
import sys

mod_path = "descriptor.mod"
with open(mod_path, "r", encoding="utf-8") as f:
    content = f.read()

m = re.search(r'^version="([^"]+)"', content, re.MULTILINE)
if not m:
    print("❌ version 속성을 찾을 수 없습니다.")
    sys.exit(1)

old_ver = m.group(1)
parts = old_ver.split(".")

if len(parts) == 1:
    new_ver = f"{parts[0]}.0.1"
elif len(parts) == 2:
    new_ver = f"{parts[0]}.{parts[1]}.1"
else:
    # 마지막 자리 1 증가
    try:
        last_num = int(parts[-1])
        parts[-1] = str(last_num + 1)
        new_ver = ".".join(parts)
    except ValueError:
        new_ver = f"{old_ver}.1"

new_content = re.sub(r'^version="[^"]+"', f'version="{new_ver}"', content, count=1, flags=re.MULTILINE)
with open(mod_path, "w", encoding="utf-8") as f:
    f.write(new_content)

print(f"🚀 모드 버전 증가: v{old_ver} -> v{new_ver}")
PYEOF
