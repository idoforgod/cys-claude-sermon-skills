# 트러블슈팅 (Troubleshooting)

가장 자주 보고되는 문제와 해결책 정리.

---

## 🔧 설치 관련

### Q1. `bash: scripts/install.sh: Permission denied`
```bash
chmod +x scripts/*.sh
```
또는 항상 `bash scripts/install.sh` 형태로 실행하시면 됩니다.

### Q2. `~/.claude/skills` 디렉토리가 없음
처음 설치하시는 경우 정상입니다. `install.sh`가 자동으로 생성합니다. Claude Code를 한 번이라도 실행한 적이 있다면 이미 존재할 것입니다.

### Q3. 'zip' 명령이 없음 (`package.sh` 실행 시)
```bash
# Ubuntu/Debian
sudo apt install zip

# macOS (Homebrew)
brew install zip

# Windows
# WSL 사용 권장. 또는 PowerShell의 Compress-Archive 사용
```

### Q4. Windows에서 심볼릭 링크 실패
Windows의 일반 PowerShell에서는 심볼릭 링크 권한 문제가 발생할 수 있습니다. 다음 중 하나를 선택하세요:
1. **WSL 사용** (가장 권장)
2. `--copy` 모드 사용: `bash scripts/install.sh --copy`
3. 관리자 권한으로 PowerShell 실행 후 시도

### Q5. `verify.sh`에서 일부 스킬이 "폴더 없음"으로 나옴
- `install.sh`를 다시 실행했는지 확인
- `--target` 옵션을 install과 verify에서 동일하게 사용했는지 확인
- 심볼릭 링크가 깨지지 않았는지 확인:
  ```bash
  ls -la ~/.claude/skills/sermon-augustine-coaching
  # 깨진 링크면 → 삭제 후 재설치
  ```

---

## 🤖 Claude가 sermon skill을 호출하지 않을 때

### Q6. 자연어로 요청해도 적절한 skill이 호출되지 않음

다음을 차례로 시도해 보세요:

1. **Claude Code 재시작** — 설치 후 재시작이 필요합니다
2. **명시적으로 호출**:
   ```
   sermon-augustine-coaching skill을 사용해서 마태복음 5장 산상수훈 설교 주제 제안해줘
   ```
3. **검증 스크립트 재실행**: `bash scripts/verify.sh`
4. **frontmatter 확인** — SKILL.md 첫 줄이 `---` 인지 확인

### Q7. 잘못된 스킬이 호출됨 (트리거 충돌)

예: "본문 분석"이라고 했는데 `bible-dictionary`가 호출됨.

해결책:
- **더 구체적인 키워드 사용**: "본문 다각도 분석", "7가지 분석법" 등
- [docs/ARCHITECTURE.md](./ARCHITECTURE.md)의 트리거 우선순위 표 참고

### Q8. claude.ai 웹에서 스킬이 인식 안 됨

claude.ai는 Claude Code와 동작 방식이 다릅니다:
- claude.ai는 **Skills 메뉴**를 통한 정식 등록 또는 **Project Knowledge 첨부**가 필요합니다
- [INSTALLATION.md 방법 2](./INSTALLATION.md#2-claudeai-웹--프로젝트projects-사용)를 따라 Project로 첨부하세요
- 단순 첨부의 경우 **Custom Instructions에 호출 지시문**을 넣어주는 것이 좋습니다

---

## 📂 파일 / 권한 문제

### Q9. SKILL.md 파일이 깨져 보임 (한글 글자 깨짐)
```bash
# 인코딩 확인
file skills/sermon-*/SKILL.md
# 모두 "UTF-8 Unicode text" 여야 함

# 다시 클론
cd ..
rm -rf claude-sermon-skills
git clone https://github.com/idoforgod/claude-sermon-skills.git
```

### Q10. `cp -r` 시 권한 오류
일부 시스템에서 발생할 수 있습니다:
```bash
# 일반적 해결
bash scripts/install.sh --copy

# 그래도 안 되면 sudo 없이 사용자 홈에 강제
mkdir -p ~/.claude/skills
cp -r skills/sermon-* ~/.claude/skills/
```

---

## 🌍 언어 / 출력 문제

### Q11. Claude가 한국어로 답변하지 않음
- 사용자 환경 설정에서 한국어 우선 확인
- 명시적으로 *"한국어로 답변해줘"* 추가
- 일부 신학 용어가 영어로 출력될 수 있는데, 이는 1차 자료(라틴어, 영어, 헬라어) 인용 시 정상입니다

### Q12. 헬라어/히브리어 글자가 □□□로 표시됨
폰트 문제입니다. 시스템에 다음 폰트를 설치하세요:
- **macOS**: 기본 시스템 폰트로 충분
- **Windows**: SBL Hebrew, SBL Greek (무료, sbl-site.org)
- **Linux**: `sudo apt install fonts-sil-ezra fonts-sil-galatia`

---

## 🔄 업데이트 관련

### Q13. `git pull` 후 일부 스킬이 작동 안 함
캐시된 심볼릭 링크가 원인일 수 있습니다:
```bash
bash scripts/uninstall.sh -y
bash scripts/install.sh
bash scripts/verify.sh
```

### Q14. 새 버전과 내가 수정한 SKILL.md가 충돌
```bash
# 커스터마이즈한 부분을 별도 브랜치에 보관
git stash
git pull origin main
git stash pop
# → 충돌 발생 시 수동 머지
```

장기적으로 커스터마이즈하시려면 fork 후 본인 저장소에서 작업하시는 것을 권장합니다.

---

## 🆘 그래도 해결되지 않는 경우

[GitHub Issues](https://github.com/idoforgod/claude-sermon-skills/issues)에 다음 정보를 포함하여 등록해 주세요:

```
- 환경: macOS 14 / Ubuntu 22.04 / Windows 11 + WSL
- Claude 모델: Claude Opus 4.7
- 사용 환경: Claude Code CLI / Claude.ai 웹 / Claude Desktop
- 실행한 명령:
  bash scripts/install.sh --copy
- 오류 메시지 / 예상 동작 / 실제 동작:
  ...
```

---

## 📚 추가 자료

- [Claude Skills 공식 문서](https://docs.claude.com)
- [Claude Code 공식 문서](https://docs.claude.com/claude-code)
- [본 저장소 README](../README.md)
- [아키텍처 문서](./ARCHITECTURE.md)
