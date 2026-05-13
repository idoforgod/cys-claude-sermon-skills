#!/usr/bin/env bash
# install.sh — Claude Code CLI 환경에 sermon-* 스킬 일괄 자동 설치
#               (skills/ 폴더의 모든 sermon-*/ 폴더를 동적으로 인식)
#
# 사용법:
#   bash scripts/install.sh                  # 기본: ~/.claude/skills/ 에 심볼릭 링크
#   bash scripts/install.sh --copy           # 심볼릭 링크 대신 복사
#   bash scripts/install.sh --target ./.claude/skills  # 프로젝트 로컬 설치
#   bash scripts/install.sh --force          # 기존 동일명 스킬 덮어쓰기

set -euo pipefail

# ─── 색상 ──────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
RESET='\033[0m'

info()  { echo -e "${BLUE}ℹ${RESET}  $1"; }
ok()    { echo -e "${GREEN}✓${RESET}  $1"; }
warn()  { echo -e "${YELLOW}⚠${RESET}  $1"; }
err()   { echo -e "${RED}✗${RESET}  $1" >&2; }

# ─── 기본 설정 ─────────────────────────────────────────────────
TARGET="${HOME}/.claude/skills"
MODE="symlink"   # symlink | copy
FORCE=0

# ─── 인자 파싱 ─────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    --copy)    MODE="copy";   shift ;;
    --target)  TARGET="$2";   shift 2 ;;
    --force)   FORCE=1;       shift ;;
    -h|--help)
      cat <<EOF
${BOLD}cys-claude-sermon-skills installer${RESET}

Usage:
  bash scripts/install.sh [options]

Options:
  --copy              심볼릭 링크 대신 파일을 복사 (기본: 심볼릭 링크)
  --target <path>     설치 대상 디렉토리 (기본: ~/.claude/skills)
  --force             기존 동일명 스킬을 덮어쓰기
  -h, --help          이 도움말 표시

Examples:
  bash scripts/install.sh
  bash scripts/install.sh --copy
  bash scripts/install.sh --target ./.claude/skills
EOF
      exit 0
      ;;
    *) err "알 수 없는 옵션: $1"; exit 1 ;;
  esac
done

# ─── 저장소 루트 찾기 ─────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SOURCE_DIR="$REPO_ROOT/skills"

if [[ ! -d "$SOURCE_DIR" ]]; then
  err "skills/ 디렉토리를 찾을 수 없습니다: $SOURCE_DIR"
  exit 1
fi

# ─── 시작 ──────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}📖 Claude Sermon Skills — Installer${RESET}"
echo ""
info "Source:  $SOURCE_DIR"
info "Target:  $TARGET"
info "Mode:    $MODE"
echo ""

# 대상 디렉토리 생성
mkdir -p "$TARGET"

# ─── 설치 루프 ─────────────────────────────────────────────────
INSTALLED=0
SKIPPED=0
FAILED=0
SKILL_COUNT=0

for skill_path in "$SOURCE_DIR"/sermon-*/; do
  [[ -d "$skill_path" ]] || continue
  SKILL_COUNT=$((SKILL_COUNT + 1))
  skill_name="$(basename "$skill_path")"
  dest="$TARGET/$skill_name"

  # 기존 설치 처리
  if [[ -e "$dest" || -L "$dest" ]]; then
    if [[ $FORCE -eq 1 ]]; then
      rm -rf "$dest"
    else
      warn "이미 존재함, 건너뜀: $skill_name (--force 사용 시 덮어쓰기)"
      SKIPPED=$((SKIPPED + 1))
      continue
    fi
  fi

  # SKILL.md 존재 확인
  if [[ ! -f "$skill_path/SKILL.md" ]]; then
    err "$skill_name: SKILL.md가 없습니다"
    FAILED=$((FAILED + 1))
    continue
  fi

  # 설치 수행
  if [[ "$MODE" == "symlink" ]]; then
    if ln -s "$skill_path" "$dest" 2>/dev/null; then
      ok "Linked:  $skill_name"
      INSTALLED=$((INSTALLED + 1))
    else
      err "Link 실패: $skill_name"
      FAILED=$((FAILED + 1))
    fi
  else
    if cp -r "$skill_path" "$dest" 2>/dev/null; then
      ok "Copied:  $skill_name"
      INSTALLED=$((INSTALLED + 1))
    else
      err "Copy 실패: $skill_name"
      FAILED=$((FAILED + 1))
    fi
  fi
done

# ─── 결과 요약 ─────────────────────────────────────────────────
echo ""
echo -e "${BOLD}────────────────────────────────────────${RESET}"
echo -e "총 ${SKILL_COUNT}개 스킬 발견"
echo -e "${GREEN}✓ 설치:${RESET}  $INSTALLED"
[[ $SKIPPED -gt 0 ]] && echo -e "${YELLOW}⚠ 건너뜀:${RESET} $SKIPPED"
[[ $FAILED  -gt 0 ]] && echo -e "${RED}✗ 실패:${RESET}   $FAILED"
echo -e "${BOLD}────────────────────────────────────────${RESET}"
echo ""

if [[ $INSTALLED -gt 0 ]]; then
  ok "설치 완료. Claude Code를 재시작하면 활성화됩니다."
  echo ""
  info "검증을 원하시면: ${BOLD}bash scripts/verify.sh${RESET}"
fi

[[ $FAILED -eq 0 ]] || exit 1
