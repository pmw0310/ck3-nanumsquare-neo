#!/bin/bash
TARGET="/Users/pmw0310/Documents/Paradox Interactive/Crusader Kings III/mod/ck3-nanumsquare-neo"
SRC="/Users/pmw0310/Documents/workspace/ck3-nanumsquare-neo"
mkdir -p "$TARGET"
rsync -av --delete --exclude=".git" --exclude="scripts" "$SRC/" "$TARGET/"
echo "✅ CK3 로컬 모드 폴더 동기화 완료!"
