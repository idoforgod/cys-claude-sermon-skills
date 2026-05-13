#!/usr/bin/env bash
# package.sh — claude.ai 웹/앱 업로드용 ZIP 생성
#
# 산출물:
#   dist/sermon-<name>.zip                     (각 sermon-* 스킬 1개씩 — 개수는 동적)
#   dist/cys-claude-sermon-skills-all.zip      (전체 묶음 1개)
#   dist/MANIFEST.txt                          (포함된 스킬 목록)
#
# 사용법:
#   bash scripts/package.sh                # 전체 빌드
#   bash scripts/package.sh --only sermon-augustine-coaching  # 단일 스킬만

set -euo pipefail

GREEN='\033[0;32m'; RED='\033[0;31m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; BOLD='\033[1m'; RESET='\033[0m'
ok()   { echo -e "${GREEN}✓${RESET} $1"; }
info() { echo -e "${BLUE}ℹ${RESET} $1"; }
warn() { echo -e "${YELLOW}⚠${RESET} $1"; }
err()  { echo -e "${RED}✗${RESET} $1" >&2; }

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILLS_DIR="$REPO_ROOT/skills"
DIST_DIR="$REPO_ROOT/dist"

ONLY=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --only) ONLY="$2"; shift 2 ;;
    -h|--help)
      echo "Usage: bash scripts/package.sh [--only sermon-<name>]"; exit 0 ;;
    *) err "알 수 없는 옵션: $1"; exit 1 ;;
  esac
done

# zip 명령어 확인
if ! command -v zip >/dev/null 2>&1; then
  err "'zip' 명령어가 필요합니다. (apt install zip / brew install zip)"
  exit 1
fi

mkdir -p "$DIST_DIR"

echo ""
echo -e "${BOLD}📦 Packaging sermon skills${RESET}"
info "Source: $SKILLS_DIR"
info "Output: $DIST_DIR"
echo ""

# ─── 개별 스킬 ZIP ─────────────────────────────────────────────
COUNT=0
MANIFEST="$DIST_DIR/MANIFEST.txt"
{
  echo "cys-claude-sermon-skills — Distribution Manifest"
  echo "Generated: $(date '+%Y-%m-%d %H:%M:%S %Z')"
  echo ""
  echo "── Individual ZIPs ──"
} > "$MANIFEST"

for skill_path in "$SKILLS_DIR"/sermon-*/; do
  [[ -d "$skill_path" ]] || continue
  skill_name="$(basename "$skill_path")"

  # --only 필터
  if [[ -n "$ONLY" && "$ONLY" != "$skill_name" ]]; then
    continue
  fi

  zip_file="$DIST_DIR/$skill_name.zip"
  rm -f "$zip_file"

  # skills/ 디렉토리에서 실행하여 zip 내부 경로를 sermon-<name>/... 로 유지
  (cd "$SKILLS_DIR" && zip -qr "$zip_file" "$skill_name" -x "*.DS_Store" -x "__MACOSX/*")

  size=$(du -h "$zip_file" | cut -f1)
  ok "$skill_name.zip ($size)"
  echo "  - $skill_name.zip ($size)" >> "$MANIFEST"
  COUNT=$((COUNT + 1))
done

# ─── 전체 묶음 ZIP ─────────────────────────────────────────────
if [[ -z "$ONLY" ]]; then
  echo ""
  info "전체 묶음 생성 중..."
  ALL_ZIP="$DIST_DIR/cys-claude-sermon-skills-all.zip"
  rm -f "$ALL_ZIP"

  # 임시 빌드 디렉토리
  BUILD_DIR="$DIST_DIR/.build/cys-claude-sermon-skills"
  rm -rf "$DIST_DIR/.build"
  mkdir -p "$BUILD_DIR"

  cp -r "$SKILLS_DIR"/sermon-* "$BUILD_DIR/"
  cp "$REPO_ROOT/README.md" "$BUILD_DIR/" 2>/dev/null || true
  cp "$REPO_ROOT/LICENSE"   "$BUILD_DIR/" 2>/dev/null || true

  (cd "$DIST_DIR/.build" && zip -qr "$ALL_ZIP" "cys-claude-sermon-skills" -x "*.DS_Store" -x "__MACOSX/*")
  rm -rf "$DIST_DIR/.build"

  size=$(du -h "$ALL_ZIP" | cut -f1)
  ok "cys-claude-sermon-skills-all.zip ($size)"

  {
    echo ""
    echo "── Bundle ──"
    echo "  - cys-claude-sermon-skills-all.zip ($size)"
  } >> "$MANIFEST"
fi

echo ""
echo -e "${BOLD}────────────────────────────────────────${RESET}"
ok "총 $COUNT개 개별 스킬 패키징"
[[ -z "$ONLY" ]] && ok "전체 묶음 1개 생성"
ok "Manifest: $MANIFEST"
echo -e "${BOLD}────────────────────────────────────────${RESET}"
echo ""

info "claude.ai 웹/앱에서 사용하시려면:"
echo "    1. dist/sermon-<name>.zip 또는 cys-claude-sermon-skills-all.zip 다운로드"
echo "    2. claude.ai > Projects > Files 에 업로드"
echo "    3. 또는 Skills 메뉴에서 직접 업로드"
echo ""
