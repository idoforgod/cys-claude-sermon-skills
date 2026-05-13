#!/usr/bin/env bash
# verify.sh — 설치된 sermon skill의 구조와 frontmatter를 검증
#
# 사용법:
#   bash scripts/verify.sh                             # 저장소 내 skills/ 검증
#   bash scripts/verify.sh --target ~/.claude/skills   # 설치된 위치 검증
#
# 동작:
#   - 저장소 skills/ 디렉토리를 sermon-*/ 와일드카드로 스캔하여 "기대 목록"을 동적으로 구성
#   - 대상 디렉토리에서 각 스킬의 폴더·SKILL.md·frontmatter(name, description) 검증
#   - 새 스킬을 추가해도 verify.sh 수정 없이 자동 검사

set -euo pipefail

GREEN='\033[0;32m'; RED='\033[0;31m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; BOLD='\033[1m'; RESET='\033[0m'
ok()   { echo -e "${GREEN}✓${RESET} $1"; }
fail() { echo -e "${RED}✗${RESET} $1"; }
warn() { echo -e "${YELLOW}⚠${RESET} $1"; }
info() { echo -e "${BLUE}ℹ${RESET} $1"; }

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SOURCE_DIR="$REPO_ROOT/skills"
TARGET="$SOURCE_DIR"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target) TARGET="$2"; shift 2 ;;
    -h|--help)
      echo "Usage: bash scripts/verify.sh [--target <dir>]"; exit 0 ;;
    *) fail "알 수 없는 옵션: $1"; exit 1 ;;
  esac
done

if [[ ! -d "$SOURCE_DIR" ]]; then
  fail "저장소 skills/ 디렉토리를 찾을 수 없습니다: $SOURCE_DIR"; exit 1
fi
if [[ ! -d "$TARGET" ]]; then
  fail "대상 디렉토리가 없습니다: $TARGET"; exit 1
fi

# ─── 기대 목록 동적 구성 ───────────────────────────────────────
# 저장소의 skills/sermon-*/ 폴더를 스캔하여 기대 목록을 생성
declare -a EXPECTED_SKILLS=()
for skill_path in "$SOURCE_DIR"/sermon-*/; do
  [[ -d "$skill_path" ]] || continue
  EXPECTED_SKILLS+=("$(basename "$skill_path")")
done

EXPECTED=${#EXPECTED_SKILLS[@]}

echo ""
echo -e "${BOLD}🔍 Verifying sermon skills in:${RESET} $TARGET"
info "기대 스킬 수 (저장소 기준): $EXPECTED"
echo ""

if [[ $EXPECTED -eq 0 ]]; then
  fail "저장소 skills/ 아래에 sermon-* 폴더가 없습니다."; exit 1
fi

COUNT=0
PASS=0
FAILED=0
WARNED=0

for skill_name in "${EXPECTED_SKILLS[@]}"; do
  COUNT=$((COUNT + 1))
  path="$TARGET/$skill_name"

  # 1. 폴더 존재 (심볼릭 링크 포함)
  if [[ ! -e "$path" ]]; then
    fail "$skill_name — 폴더 없음"
    FAILED=$((FAILED + 1))
    continue
  fi

  # 심볼릭 링크면 실제 경로 추적
  real_path="$path"
  [[ -L "$path" ]] && real_path="$(readlink -f "$path" 2>/dev/null || readlink "$path")"

  if [[ ! -d "$real_path" ]]; then
    fail "$skill_name — 디렉토리가 아님"
    FAILED=$((FAILED + 1))
    continue
  fi

  skill_md="$real_path/SKILL.md"

  # 2. SKILL.md 존재
  if [[ ! -f "$skill_md" ]]; then
    fail "$skill_name — SKILL.md 없음"
    FAILED=$((FAILED + 1))
    continue
  fi

  # 3. frontmatter 검증
  first_line="$(head -n 1 "$skill_md" | tr -d '\r')"
  if [[ "$first_line" != "---" ]]; then
    fail "$skill_name — frontmatter 시작(---) 없음"
    FAILED=$((FAILED + 1))
    continue
  fi

  # name과 description 추출
  has_name=$(awk '/^---$/{c++; next} c==1 && /^name:/{print "yes"; exit}' "$skill_md")
  has_desc=$(awk '/^---$/{c++; next} c==1 && /^description:/{print "yes"; exit}' "$skill_md")

  if [[ "$has_name" != "yes" ]]; then
    fail "$skill_name — frontmatter에 name 필드 없음"
    FAILED=$((FAILED + 1))
    continue
  fi

  if [[ "$has_desc" != "yes" ]]; then
    fail "$skill_name — frontmatter에 description 필드 없음"
    FAILED=$((FAILED + 1))
    continue
  fi

  # name 일치 확인
  declared_name=$(awk '/^---$/{c++; next} c==1 && /^name:/{sub(/^name:[[:space:]]*/,""); print; exit}' "$skill_md" | tr -d '\r' | xargs)
  if [[ "$declared_name" != "$skill_name" ]]; then
    warn "$skill_name — frontmatter name=\"$declared_name\" 폴더명과 불일치"
    WARNED=$((WARNED + 1))
  fi

  # description 길이 검사
  desc_len=$(awk '/^---$/{c++; next} c==1 && /^description:/{sub(/^description:[[:space:]]*/,""); print length; exit}' "$skill_md")
  if [[ -n "$desc_len" && "$desc_len" -lt 50 ]]; then
    warn "$skill_name — description이 너무 짧음 ($desc_len자)"
    WARNED=$((WARNED + 1))
  fi

  ok "$skill_name"
  PASS=$((PASS + 1))
done

# 대상 디렉토리에 기대 목록 외 추가 sermon-* 폴더가 있는지 보고 (참고용)
EXTRA=0
if [[ "$TARGET" != "$SOURCE_DIR" ]]; then
  for extra_path in "$TARGET"/sermon-*/; do
    [[ -e "$extra_path" ]] || continue
    extra_name="$(basename "$extra_path")"
    found=0
    for s in "${EXPECTED_SKILLS[@]}"; do
      [[ "$s" == "$extra_name" ]] && { found=1; break; }
    done
    if [[ $found -eq 0 ]]; then
      warn "대상에만 존재하는 스킬(저장소에 없음): $extra_name"
      EXTRA=$((EXTRA + 1))
    fi
  done
fi

echo ""
echo -e "${BOLD}────────────────────────────────────────${RESET}"
echo -e "검사한 스킬:    $COUNT / $EXPECTED"
echo -e "${GREEN}✓ 통과:${RESET}        $PASS"
[[ $WARNED -gt 0 ]] && echo -e "${YELLOW}⚠ 경고:${RESET}        $WARNED"
[[ $EXTRA  -gt 0 ]] && echo -e "${YELLOW}⚠ 추가 폴더:${RESET}   $EXTRA"
[[ $FAILED -gt 0 ]] && echo -e "${RED}✗ 실패:${RESET}        $FAILED"
echo -e "${BOLD}────────────────────────────────────────${RESET}"
echo ""

if [[ $FAILED -eq 0 && $COUNT -eq $EXPECTED ]]; then
  ok "모든 스킬이 정상 설치되어 있습니다."
  exit 0
elif [[ $FAILED -eq 0 ]]; then
  warn "구조는 통과했으나 일부 스킬이 누락되었을 수 있습니다."
  exit 0
else
  fail "검증 실패. 위 오류를 확인해 주세요."
  exit 1
fi
