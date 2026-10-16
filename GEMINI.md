# 프로젝트 전용 규칙 (Project Rules)

## 1. 버전 관리 규칙 (Version Management)
- **모드 버전 자동 갱신**: 모드 파일(`gui/`, `localization/`, `fonts/` 등 모드 콘텐츠)에 기능 추가나 버그 수정 등 실제 변경이 발생할 때에만 `descriptor.mod`의 `version`을 1단계 올립니다. 문서, CI 워크플로우, 스크립트 등 개발 환경 파일만 변경된 경우에는 모드 버전을 올리지 않습니다.
- **버전 범프 스크립트**: 버전을 올릴 때에는 `bash scripts/bump_version.sh`를 실행하거나 직접 `descriptor.mod`의 버전을 올리고 스테이징(`git add descriptor.mod`)하여 커밋에 포함하세요.
- **Git Hook 연동**: 로컬 Git pre-commit 훅(`.githooks/pre-commit`)은 스테이징된 파일 중 모드 콘텐츠 파일이 포함되어 있을 때에만 자동으로 버전을 올리도록 설정되어 있습니다.

## 2. 모드 파일 동기화 규칙 (Mod Sync)
- 모드 파일(`gui/`, `localization/`, `fonts/`, `descriptor.mod` 등)에 변경이 발생한 후에는 반드시 `bash scripts/sync.sh`를 실행하여 CK3 로컬 모드 폴더(`~/Documents/Paradox Interactive/Crusader Kings III/mod/ck3-nanumsquare-neo`)에 최신 상태를 반영하세요.

## 3. 언어 및 인코딩 규칙 (Language & Encoding)
- 모든 로컬라이제이션 YAML 파일(`localization/**/*.yml`)은 반드시 **UTF-8 with BOM** 인코딩을 유지해야 합니다.
- 모든 커밋 메시지, 설명, 문서는 자연스러운 **한국어**로 작성하세요.

