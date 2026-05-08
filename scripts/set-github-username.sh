#!/usr/bin/env bash
#
# set-github-username.sh
# 저장소 곳곳의 <YOUR_GITHUB> 플레이스홀더를 본인 GitHub 사용자명으로 일괄 치환
#
# 사용법:
#   bash scripts/set-github-username.sh <your-github-username>
#
# 예시:
#   bash scripts/set-github-username.sh choi-yoonsik
#

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "사용법: bash scripts/set-github-username.sh <your-github-username>"
  echo "예시:   bash scripts/set-github-username.sh choi-yoonsik"
  exit 1
fi

USERNAME="$1"

# 사용자명 형식 검증 (영문·숫자·하이픈만, 39자 이하)
if ! [[ "$USERNAME" =~ ^[A-Za-z0-9-]{1,39}$ ]]; then
  echo "❌ 잘못된 GitHub 사용자명 형식: $USERNAME"
  echo "   영문·숫자·하이픈만 사용 가능, 1~39자"
  exit 1
fi

# 저장소 루트 찾기
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_ROOT"

echo "🔧 <YOUR_GITHUB> → $USERNAME 치환 시작"
echo

# 대상 파일들
FILES=(
  "README.md"
  "CHANGELOG.md"
  "CODE_OF_CONDUCT.md"
  "CONTRIBUTING.md"
  "docs/INSTALLATION.md"
  "docs/TROUBLESHOOTING.md"
  "docs/FAQ.md"
  ".github/ISSUE_TEMPLATE/config.yml"
)

CHANGED=0
for f in "${FILES[@]}"; do
  if [ -f "$f" ] && grep -q "<YOUR_GITHUB>" "$f"; then
    # 크로스 플랫폼 sed (macOS/Linux)
    if [[ "$OSTYPE" == "darwin"* ]]; then
      sed -i '' "s|<YOUR_GITHUB>|$USERNAME|g" "$f"
    else
      sed -i "s|<YOUR_GITHUB>|$USERNAME|g" "$f"
    fi
    echo "  ✓ $f"
    CHANGED=$((CHANGED + 1))
  fi
done

echo
echo "────────────────────────────────────────"
echo "✓ ${CHANGED}개 파일 업데이트 완료"
echo "────────────────────────────────────────"
echo
echo "다음 단계:"
echo "  1. git add -A"
echo "  2. git commit -m 'chore: set GitHub username'"
echo "  3. git push origin main"
