#!/usr/bin/env bash
# install.sh — Claude Code CLI 환경에 sermon-* 스킬 일괄 자동 설치
#               (skills/ 폴더의 모든 sermon-*/ 폴더를 동적으로 인식)
#
# 사용법:
#   bash scripts/install.sh                  # 기본: ~/.claude/skills/ 에 링크
#                                            #   (Linux/macOS: 심볼릭 링크 / Windows: 정션)
#   bash scripts/install.sh --copy           # 링크 대신 복사
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
  --copy              링크 대신 파일을 복사 (기본: 링크)
  --target <path>     설치 대상 디렉토리 (기본: ~/.claude/skills)
  --force             기존 동일명 스킬을 덮어쓰기
  -h, --help          이 도움말 표시

Note:
  기본 모드는 링크다. Linux/macOS 는 심볼릭 링크,
  Windows(Git Bash)는 정션(junction)을 만든다 — 관리자 권한이 필요 없다.
  링크로 설치하면 저장소에서 git pull 한 내용이 스킬에 즉시 반영된다.
  --copy 로 설치하면 반영되지 않으므로 갱신 때마다 재설치해야 한다.

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

# ─── 플랫폼 감지 ───────────────────────────────────────────────
# Git Bash/MSYS 의 `ln -s` 는 심볼릭 링크 권한이 없으면 조용히 '복사'로
# 대체하면서 성공(0)을 반환한다. 그 결과 "Linked" 로 보고되지만 실제로는
# 복사본이 만들어져 이후 git pull 이 스킬에 반영되지 않는다.
# Windows 에서는 관리자 권한 없이 만들 수 있는 정션(junction)을 사용한다.
IS_WINDOWS=0
case "$(uname -s)" in
  MINGW*|MSYS*|CYGWIN*) IS_WINDOWS=1 ;;
esac

LINK_KIND="symlink"
[[ "$MODE" == "symlink" && $IS_WINDOWS -eq 1 ]] && LINK_KIND="junction"

MODE_LABEL="$MODE"
[[ "$MODE" == "symlink" ]] && MODE_LABEL="$LINK_KIND"

# ─── 시작 ──────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}📖 Claude Sermon Skills — Installer${RESET}"
echo ""
info "Source:  $SOURCE_DIR"
info "Target:  $TARGET"
info "Mode:    $MODE_LABEL"
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
    src="${skill_path%/}"   # glob 이 붙인 끝 슬래시 제거 (mklink 가 거부함)
    if [[ $IS_WINDOWS -eq 1 ]]; then
      # Windows: 정션 생성. 관리자 권한 불필요.
      # MSYS_NO_PATHCONV=1 로 /J 같은 인자가 경로로 변환되는 것을 막는다.
      src_win="$(cygpath -w "$src")"
      dest_win="$(cygpath -w "$dest")"
      if MSYS_NO_PATHCONV=1 cmd /c mklink /J "$dest_win" "$src_win" >/dev/null 2>&1; then
        ok "Junction: $skill_name"
        INSTALLED=$((INSTALLED + 1))
      else
        err "Junction 실패: $skill_name"
        FAILED=$((FAILED + 1))
      fi
    else
      # Linux/macOS: 심볼릭 링크. 생성 후 실제 링크인지 반드시 검증한다.
      # (검증 없이 성공으로 보고하면 복사본을 링크로 착각하게 된다)
      if ln -s "$src" "$dest" 2>/dev/null && [[ -L "$dest" ]]; then
        ok "Linked:  $skill_name"
        INSTALLED=$((INSTALLED + 1))
      else
        err "Link 실패: $skill_name"
        rm -rf "$dest" 2>/dev/null || true
        FAILED=$((FAILED + 1))
      fi
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
