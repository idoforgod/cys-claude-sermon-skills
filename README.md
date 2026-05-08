<div align="center">

# 📖 Claude Sermon Skills

**한국 목회자·신학생·진지한 평신도를 위한 Claude 설교 준비 스킬 모음**

20개의 통합 설교 준비 스킬 · Claude.ai 웹/앱 + Claude Code CLI 동시 지원

[![Skills](https://img.shields.io/badge/skills-20-blue)](./skills)
[![License](https://img.shields.io/badge/license-MIT-green)](./LICENSE)
[![Claude](https://img.shields.io/badge/Claude-Skills-orange)](https://docs.claude.com)
[![Korean](https://img.shields.io/badge/lang-한국어-red)](./README.md)

[설치하기](#-빠른-설치) · [스킬 목록](#-스킬-목록-20) · [사용 예시](./examples/USAGE_EXAMPLES.md) · [기여하기](./CONTRIBUTING.md)

</div>

---

## 📌 한 줄 요약

> **본문 분석부터 설교문 작성, 회중 반응 시뮬레이션까지** — 설교 준비 전 과정을 Claude와 함께 수행하는 통합 스킬 패키지.

---

## 🎯 누구를 위한 것인가

- **목회자** — 매주 설교 준비 시간을 단축하고 신학적 깊이를 더하고 싶은 분
- **부교역자·전도사** — 강해 설교, 큐티, 교리 설교 등 다양한 장르를 익히고 싶은 분
- **신학생·박사 과정** — 본문비평, 헬라어 문법, 조직신학 학습이 필요한 분
- **소그룹 리더·평신도 성경교사** — 본문 해석을 학술적 깊이로 검증하고 싶은 분

---

## ⚡ 빠른 설치

### 사전 요건

- **Git** — 터미널에서 `git --version`으로 확인
- **Bash** — macOS·Linux 기본 탑재
- **Claude Code CLI** (방법 1·2 선택 시) — [공식 문서](https://docs.claude.com/claude-code) 참고

---

### 방법 1. 터미널 한 줄 설치 (가장 빠름) ⭐

macOS·Linux 터미널을 열고 아래 한 줄을 붙여넣어 실행하세요. 클론 → 설치 → 검증이 한 번에 끝납니다.

```bash
git clone https://github.com/idoforgod/claude-sermon-skills.git ~/claude-sermon-skills \
  && cd ~/claude-sermon-skills \
  && bash scripts/install.sh \
  && bash scripts/verify.sh
```

설치 완료 후 **Claude Code를 재시작**하면 20개 sermon skill이 활성화됩니다. 기본 설치 위치는 `~/.claude/skills/`이며, 본 저장소의 각 스킬 폴더로 심볼릭 링크가 만들어집니다.

> 💡 **이미 클론한 저장소가 있다면** — 해당 폴더로 이동한 뒤 `bash scripts/install.sh && bash scripts/verify.sh`만 실행하시면 됩니다.

---

### 방법 2. 단계별 설치 (CLI)

원하는 위치에서 직접 한 단계씩 실행하실 수도 있습니다.

```bash
# 1. 저장소 클론
git clone https://github.com/idoforgod/claude-sermon-skills.git
cd claude-sermon-skills

# 2. ~/.claude/skills/ 에 심볼릭 링크
bash scripts/install.sh

# 3. 설치 확인 (20개 스킬 frontmatter·구조 점검)
bash scripts/verify.sh
```

설치 옵션:

| 명령어 | 설명 |
|---|---|
| `bash scripts/install.sh` | 기본 — `~/.claude/skills/`에 심볼릭 링크 |
| `bash scripts/install.sh --copy` | 심볼릭 링크 대신 파일 복사 |
| `bash scripts/install.sh --target ./.claude/skills` | 프로젝트 로컬에 설치 |
| `bash scripts/install.sh --force` | 동일명 스킬 덮어쓰기 |
| `bash scripts/uninstall.sh` | 설치된 sermon 스킬 제거 |

---

### 방법 3. Claude.ai 웹/앱 사용자

Claude.ai 인터페이스에서는 스킬을 **개별 업로드** 또는 **프로젝트(Projects) 첨부**로 사용합니다.

```bash
# 개별 스킬을 ZIP으로 패키징
bash scripts/package.sh

# → dist/ 폴더에 sermon-*.zip 20개와 claude-sermon-skills-all.zip 1개 생성
```

생성된 ZIP 파일을 Claude.ai의 [프로젝트(Projects)](https://claude.ai/projects)에 업로드하거나, 대화창에 직접 첨부하시면 됩니다. 자세한 단계는 [`docs/INSTALLATION.md`](./docs/INSTALLATION.md)를 참고하세요.

---

### 방법 4. 수동 설치

스크립트 없이 직접 복사하셔도 됩니다. 각 `skills/sermon-*` 폴더를 다음 위치 중 하나로 복사하시면 됩니다.

- 사용자 전역: `~/.claude/skills/`
- 프로젝트 로컬: `<프로젝트 루트>/.claude/skills/`

---

> 💡 **이 저장소를 fork해서 본인 GitHub 계정으로 publish하실 경우** — 모든 문서의 `idoforgod`를 본인 사용자명으로 일괄 치환하세요:
> ```bash
> # macOS
> find . -type f \( -name "*.md" -o -name "*.yml" \) ! -path "./.git/*" \
>   -exec sed -i '' "s|idoforgod|<your-username>|g" {} +
> # Linux
> find . -type f \( -name "*.md" -o -name "*.yml" \) ! -path "./.git/*" \
>   -exec sed -i "s|idoforgod|<your-username>|g" {} +
> ```

---

## 📚 스킬 목록 (20개)

스킬은 **5개 카테고리**로 분류됩니다.

### 🔍 1. 본문 분석 & 원어 (5개)

| 스킬명 | 한 줄 설명 |
|---|---|
| [`sermon-text-analysis-multimethod`](./skills/sermon-text-analysis-multimethod) | 7+10가지 방법론으로 본문을 다각도 분석, 가짜 해석 자동 검증 |
| [`sermon-bible-dictionary`](./skills/sermon-bible-dictionary) | 성경 인물·지명·단어·개념 사전 (원어·어원·용례·신학 통합) |
| [`sermon-textual-criticism`](./skills/sermon-textual-criticism) | 사해사본·시내사본·바티칸사본 등 고대 사본 비교 본문비평 |
| [`sermon-multi-bible-version-compare`](./skills/sermon-multi-bible-version-compare) | 9개 번역본·종교 문헌 다층 비교 (개역개정·NIV·헬라어·Vulgata·코란·탈무드) |
| [`sermon-greek-grammar-machen`](./skills/sermon-greek-grammar-machen) | 메이첸 신약 헬라어 33강 단계별 문법 학습 |

### 🏛 2. 신학 코칭 (5개)

| 스킬명 | 한 줄 설명 |
|---|---|
| [`sermon-augustine-coaching`](./skills/sermon-augustine-coaching) | 어거스틴 신학·설교론 기반 메시지 형성 (고백록·하나님의 도성) |
| [`sermon-luther-coaching`](./skills/sermon-luther-coaching) | 루터의 이신칭의·십자가 신학·법과 복음 코칭 |
| [`sermon-calvin-institutes`](./skills/sermon-calvin-institutes) | 칼빈 『기독교 강요』 4권 80장 조직신학 학습 |
| [`sermon-bavinck-coaching`](./skills/sermon-bavinck-coaching) | 바빙크 『개혁교의학』 신칼빈주의·은혜와 자연 코칭 |
| [`sermon-lloyd-jones-coaching`](./skills/sermon-lloyd-jones-coaching) | 마틴 로이드 존스 『설교와 설교자』 Logic on Fire |

### 🌍 3. 배경 & 컨텍스트 (3개)

| 스킬명 | 한 줄 설명 |
|---|---|
| [`sermon-history-culture-geo-context`](./skills/sermon-history-culture-geo-context) | 성경 본문의 역사·문화·지리·사회 배경 재구성 |
| [`sermon-christian-history-interpreter`](./skills/sermon-christian-history-interpreter) | 성경 시대 이후 모든 역사를 기독교적 시각으로 해석 |
| [`sermon-topic-research-multidisciplinary`](./skills/sermon-topic-research-multidisciplinary) | 11개 학문 분야 학제간 설교 주제 자료 조사 |

### ✍️ 4. 설교문 작성 & 기획 (5개)

| 스킬명 | 한 줄 설명 |
|---|---|
| [`sermon-topic-message-coach`](./skills/sermon-topic-message-coach) | 6단계 대화로 주제·메시지 정립 (설교 준비 입구) |
| [`sermon-emotive-writing-coach`](./skills/sermon-emotive-writing-coach) | 설득력 있는 설교문 작성 인터랙티브 글쓰기 코칭 |
| [`sermon-doctrinal-planner`](./skills/sermon-doctrinal-planner) | 4단계 교리설교 기획안 자동 생성 |
| [`sermon-calvin-style-insight`](./skills/sermon-calvin-style-insight) | 칼빈식 lectio continua 강해 설교문 작성 |
| [`sermon-planner-52week`](./skills/sermon-planner-52week) | 키워드 1개 → 52주 연간 설교 계획 자동 생성 |

### 🙏 5. 큐티 & 검증 (2개)

| 스킬명 | 한 줄 설명 |
|---|---|
| [`sermon-qt-original-text-based`](./skills/sermon-qt-original-text-based) | 원어 분석 기반 '생명의 삶'·'매일성경' 스타일 큐티 자동 생성 |
| [`sermon-audience-feedback-persona`](./skills/sermon-audience-feedback-persona) | 8명의 회중 페르소나가 강단 아래에서 솔직한 반응 시뮬레이션 |

---

## 🗺 추천 워크플로우

설교 준비를 처음부터 끝까지 진행할 때 권장 순서:

```
[입구]      sermon-topic-message-coach            (주제·메시지 정립)
   ↓
[본문 분석] sermon-text-analysis-multimethod       (7가지 분석법 자동)
            sermon-bible-dictionary                (단어·인물·지명)
            sermon-multi-bible-version-compare    (번역본 비교)
            sermon-textual-criticism              (사본 비교, 필요 시)
   ↓
[배경]      sermon-history-culture-geo-context     (시대 배경 재구성)
            sermon-topic-research-multidisciplinary (현대 학제간 자료)
   ↓
[신학]      sermon-augustine/luther/calvin/bavinck/lloyd-jones-coaching
            (택일 또는 복수)
   ↓
[작성]      sermon-emotive-writing-coach           (글쓰기 코칭)
            sermon-doctrinal-planner              (교리설교 시)
            sermon-calvin-style-insight           (강해 설교 시)
   ↓
[검증]      sermon-audience-feedback-persona       (회중 8명 반응)
   ↓
[QT/연간]  sermon-qt-original-text-based          (큐티 변환)
            sermon-planner-52week                 (연간 계획)
```

전체 사용 예시는 [`examples/USAGE_EXAMPLES.md`](./examples/USAGE_EXAMPLES.md)에 7가지 시나리오로 정리해 두었습니다.

---

## 🛠 동작 환경

| 환경 | 지원 | 비고 |
|---|---|---|
| **Claude Code CLI** | ✅ | `~/.claude/skills/` 자동 인식 |
| **Claude.ai 웹** | ✅ | Projects 첨부 또는 개별 업로드 |
| **Claude.ai 모바일 (iOS/Android)** | ✅ | Projects 동기화로 사용 |
| **Claude Desktop** | ✅ | Claude Code 연동 사용 |
| **API (직접 호출)** | ⚠️ | 시스템 프롬프트로 변환 필요 |

---

## 📁 저장소 구조

```
claude-sermon-skills/
├── README.md                       ← 이 문서
├── LICENSE                         (MIT)
├── CHANGELOG.md
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
│
├── skills/                         ← 20개 스킬 (개별 폴더 유지)
│   ├── sermon-text-analysis-multimethod/
│   │   └── SKILL.md
│   ├── sermon-audience-feedback-persona/
│   │   ├── SKILL.md
│   │   └── personas/               (8명 페르소나)
│   ├── sermon-emotive-writing-coach/
│   │   ├── SKILL.md
│   │   └── references/
│   └── ... (나머지 17개)
│
├── docs/
│   ├── INSTALLATION.md             ← 환경별 상세 설치
│   ├── ARCHITECTURE.md             ← 스킬 간 관계도
│   ├── TROUBLESHOOTING.md
│   └── FAQ.md
│
├── examples/
│   ├── USAGE_EXAMPLES.md           ← 7가지 실제 시나리오
│   ├── 01-weekly-sermon-prep.md
│   ├── 02-doctrinal-series.md
│   └── ... (시나리오별 상세)
│
├── scripts/
│   ├── install.sh                  ← 자동 설치
│   ├── uninstall.sh
│   ├── verify.sh                   ← 설치 검증
│   └── package.sh                  ← claude.ai 업로드용 ZIP 생성
│
└── .github/
    ├── workflows/
    │   ├── validate-skills.yml     (frontmatter·구조 자동 검증)
    │   └── release.yml             (태그 push 시 ZIP 자동 빌드)
    └── ISSUE_TEMPLATE/
```

---

## 🌐 라이선스 & 신학적 입장

- 코드/스킬 정의: **MIT License**
- 본 스킬들은 **교파 중립적**이지만 **정통 기독교 신앙**(니케아·사도신경·종교개혁 5 sola) 위에 서 있습니다.
- 인용된 신학자들의 입장은 그들의 1차 자료에 근거하여 정확히 전달하되, 해석의 다양성을 존중합니다.

---

## 🙏 만든 사람

**최윤식 박사 (Dr. Choi Yoon-sik)** · 미래학자, 목회자, 아시아미래인재연구소 소장

---

## 🤝 기여하기

스킬 개선 제안, 버그 리포트, 새로운 사용 시나리오 공유는 언제나 환영합니다. [`CONTRIBUTING.md`](./CONTRIBUTING.md)를 참고하세요.

---

<div align="center">

**"오직 말씀 위에서 — Sola Scriptura"**

⭐ 도움이 되셨다면 Star를 눌러주세요.

</div>
