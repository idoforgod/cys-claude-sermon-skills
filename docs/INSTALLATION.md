# 환경별 설치 가이드 (Installation)

`claude-sermon-skills`는 **Claude Code CLI**, **Claude.ai 웹**, **Claude.ai 모바일 앱**, **Claude Desktop** 모든 환경에서 사용 가능합니다. 환경에 따라 설치 절차가 다르므로 해당 섹션을 참고하세요.

---

## 📑 목차

1. [Claude Code CLI 환경](#1-claude-code-cli-환경-권장)
2. [Claude.ai 웹 — 프로젝트(Projects) 사용](#2-claudeai-웹--프로젝트projects-사용)
3. [Claude.ai 웹 — 개별 Skill 업로드](#3-claudeai-웹--개별-skill-업로드)
4. [Claude.ai 모바일 앱 (iOS/Android)](#4-claudeai-모바일-앱-iosandroid)
5. [Claude Desktop 앱](#5-claude-desktop-앱)
6. [팀 공유 / 다중 사용자 환경](#6-팀-공유--다중-사용자-환경)
7. [업데이트 & 제거](#7-업데이트--제거)

---

## 1. Claude Code CLI 환경 (권장)

가장 강력하고 빠른 사용 방법입니다. Claude가 자동으로 sermon skill을 감지하여 호출합니다.

### 사전 요구사항
- [Claude Code](https://docs.claude.com/claude-code) 설치 (`claude` 커맨드 사용 가능)
- macOS, Linux, 또는 Windows + WSL
- Git, Bash

### 설치 단계

```bash
# 1. 저장소 클론
git clone https://github.com/idoforgod/claude-sermon-skills.git
cd claude-sermon-skills

# 2. 자동 설치 (~/.claude/skills 에 심볼릭 링크 생성)
bash scripts/install.sh

# 3. 검증
bash scripts/verify.sh

# 4. Claude Code 재시작
#    (이미 실행 중이라면 종료 후 다시 실행)
```

### 설치 옵션

```bash
# 심볼릭 링크 대신 복사 (저장소 폴더 삭제해도 작동)
bash scripts/install.sh --copy

# 프로젝트 로컬 설치 (해당 프로젝트에서만 사용)
bash scripts/install.sh --target ./.claude/skills

# 기존 동일명 스킬 덮어쓰기
bash scripts/install.sh --force
```

### 사용 방법

설치 후 Claude Code 세션에서 자연어로 요청하면 됩니다.

```
> 빌립보서 4:4-7로 큐티 만들어줘
> 어거스틴 신학으로 마태복음 5장 산상수훈 설교 주제 잡아줘
> 마태복음 18:20을 사해사본·시내사본·바티칸사본으로 비교해줘
```

Claude가 적절한 sermon skill을 자동으로 호출합니다.

---

## 2. Claude.ai 웹 — 프로젝트(Projects) 사용

여러 스킬을 한 번에 사용하고 싶을 때 가장 편리한 방법입니다.

### 단계

#### 1) ZIP 패키지 생성
```bash
git clone https://github.com/idoforgod/claude-sermon-skills.git
cd claude-sermon-skills
bash scripts/package.sh
```

`dist/` 폴더에 다음 파일들이 생성됩니다:
- `claude-sermon-skills-all.zip` — 전체 묶음 (권장)
- `sermon-<name>.zip` × 20 — 개별 스킬

#### 2) 압축 해제 후 업로드 준비
```bash
cd dist
unzip claude-sermon-skills-all.zip
# → claude-sermon-skills/ 폴더 생성됨
```

#### 3) Claude.ai에서 프로젝트 생성
1. [claude.ai](https://claude.ai) 로그인
2. 좌측 **Projects** → **New project**
3. 프로젝트 이름: `설교 준비 (Sermon Prep)` 등
4. **Project Knowledge** → **Add files** 클릭
5. `claude-sermon-skills/` 폴더 안의 모든 `SKILL.md` 파일들을 업로드

> **Tip**: 모든 SKILL.md를 한 번에 업로드하려면 폴더 구조를 평탄화하면 됩니다:
> ```bash
> mkdir flat
> for d in claude-sermon-skills/sermon-*; do
>   name=$(basename "$d")
>   cp "$d/SKILL.md" "flat/${name}.md"
> done
> ```
> 그 후 `flat/` 안의 파일들을 일괄 업로드하세요.

#### 4) Custom Instructions 설정 (권장)
프로젝트 설정에서 다음을 추가하면 적절한 skill이 자동 호출됩니다:

```
당신은 설교 준비를 돕는 어시스턴트입니다.
업로드된 sermon-*.md 스킬 정의들을 참조하여,
사용자 요청에 가장 적합한 스킬의 절차를 따라 응답하세요.
```

---

## 3. Claude.ai 웹 — 개별 Skill 업로드

특정 스킬 1–2개만 일회성으로 사용하려는 경우.

```bash
bash scripts/package.sh --only sermon-augustine-coaching
```

생성된 `dist/sermon-augustine-coaching.zip`을 다운받아:
1. claude.ai 새 채팅 시작
2. 첨부 클립(📎) → `SKILL.md` 파일 첨부
3. 프롬프트: *"이 SKILL.md의 절차에 따라 마가복음 10:17-22로 어거스틴식 설교 주제를 잡아주세요."*

---

## 4. Claude.ai 모바일 앱 (iOS/Android)

모바일에서는 **Projects 동기화**를 통해 사용합니다.

1. PC/Mac에서 **방법 2 (Projects)** 로 설치 완료
2. 모바일 앱에서 같은 계정으로 로그인
3. Projects 목록에서 동일 프로젝트 선택
4. 모바일에서도 sermon skill이 그대로 작동

> 모바일에서는 새로운 SKILL.md를 직접 업로드하기 어려우므로, **데스크톱에서 한 번 설정 → 모바일에서 사용** 패턴을 권장합니다.

---

## 5. Claude Desktop 앱

Claude Desktop은 Claude Code와 연동되므로 [방법 1](#1-claude-code-cli-환경-권장)을 그대로 따르시면 됩니다. 별도 설치 절차가 필요 없습니다.

---

## 6. 팀 공유 / 다중 사용자 환경

여러 명이 같은 sermon skill을 공유해 사용하려면:

### 옵션 A. 팀 GitHub 저장소 Fork
```bash
# 1. 본 저장소를 팀 GitHub Organization에 Fork
# 2. 팀원이 각자 클론
git clone https://github.com/<TEAM_ORG>/claude-sermon-skills.git
cd claude-sermon-skills
bash scripts/install.sh
```

### 옵션 B. 공유 폴더 + 심볼릭 링크 (Mac/Linux)
```bash
# 공유 폴더(예: Dropbox, Google Drive)에 한 번 클론
git clone <repo> /path/to/shared/claude-sermon-skills

# 각 팀원 머신에서 심볼릭 링크
bash /path/to/shared/claude-sermon-skills/scripts/install.sh
```

### 옵션 C. Claude.ai 팀 플랜의 Projects 공유
- Claude Pro/Team 플랜에서 Projects를 팀 단위로 공유
- 한 사람이 [방법 2](#2-claudeai-웹--프로젝트projects-사용) 로 설정 후 팀에 공유

---

## 7. 업데이트 & 제거

### 업데이트
```bash
cd claude-sermon-skills
git pull origin main
bash scripts/install.sh --force   # 기존 링크/복사본 갱신
bash scripts/verify.sh
```

### 일부만 사용 (선택 설치)
저장소를 클론한 뒤 `skills/` 디렉토리에서 사용하지 않을 폴더를 임시 다른 곳으로 옮긴 후 `install.sh`를 실행하시면 됩니다.

### 완전 제거
```bash
# 인터랙티브 (확인 후 제거)
bash scripts/uninstall.sh

# 자동 (확인 없이)
bash scripts/uninstall.sh -y

# 프로젝트 로컬 설치본 제거
bash scripts/uninstall.sh --target ./.claude/skills -y
```

---

## 🔧 문제가 발생했을 때

[TROUBLESHOOTING.md](./TROUBLESHOOTING.md)를 먼저 확인해 주세요. 거기에도 답이 없다면 [GitHub Issues](https://github.com/idoforgod/claude-sermon-skills/issues)에 등록해 주세요.

---

## ✅ 설치 검증 체크리스트

- [ ] `~/.claude/skills/` 또는 `./.claude/skills/`에 `sermon-*` 20개 폴더 존재
- [ ] 각 폴더에 `SKILL.md` 파일 존재
- [ ] `bash scripts/verify.sh` 모든 항목 통과
- [ ] Claude Code에서 *"sermon skill 목록 알려줘"* 라고 했을 때 인식됨
- [ ] 테스트 프롬프트(*"창세기 1:1 본문 다각도 분석해줘"*)에 적절한 skill이 호출됨
