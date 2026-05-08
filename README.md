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

## 📖 스킬 상세 가이드 · Skill Reference Guide

각 스킬을 **무엇이냐(What) · 언제 쓰나(When) · 무엇을 주는가(Key features)** 세 항목으로 한국어와 영어 병기로 정리했습니다.
Each skill is documented in three sections — *What it is*, *When to use*, *Key features* — bilingually (Korean / English).

---

### 🔍 카테고리 1. 본문 분석 & 원어 · Text Analysis & Original Languages

#### 1. `sermon-text-analysis-multimethod`

**무엇이냐 / What it is**
- **KO** — 성경 본문 한 단위(절·단락·장)를 입력받아 **7가지 핵심 분석법**(원문 언어·구조·평행 본문·키아스무스·신학·문학·역사문화)을 자동 산출하고, **추가 10가지 분석법**(문맥·수사학·사회정치·심리·해석사·신비·묵상·페미니스트·윤리·포스트콜로니얼)을 메뉴로 제시하는 **메타 분석 스킬**.
- **EN** — A meta text-analysis skill that auto-runs **7 core methods** (original-language, structural, parallel passage, chiastic, theological, literary, historical-cultural) on any biblical unit and offers **10 additional methods** on demand (contextual, rhetorical, socio-political, psychological, history of interpretation, mystical, contemplative, feminist, ethical, postcolonial).

**언제 쓰나 / When to use**
- 본문은 정해졌는데 어디부터 풀어야 할지 막막할 때 / *When the passage is fixed but you don't know where to start.*
- 어떤 해석이 정통한지 검증받고 싶을 때 / *When you need to verify whether a reading is orthodox.*
- 가짜 어원, 풍유적 곡해, 아전인수식 적용 등 한국 강단의 흔한 오류를 거르고 싶을 때 / *To filter out pseudo-etymologies, allegorical distortions, and forced applications common in Korean pulpits.*

**핵심 기능 / Key features**
- 7가지 자동 분석 + 10가지 메뉴 분석 (총 17종) / *7 auto-runs + 10 menu-driven (17 total).*
- 가짜 해석·이단적 재해석 자동 식별·필터링 / *Automatic detection of heterodox interpretations.*
- 다른 sermon 스킬을 한 화면에 종합하는 메타 도구 / *Aggregates other sermon skills into one panel.*

---

#### 2. `sermon-bible-dictionary`

**무엇이냐 / What it is**
- **KO** — 성경 인물·지명·단어·신학적 개념을 **주석서·성경 지도·성경사전·개론서 수준의 깊이**로 풀어주는 통합 성경사전. 원어 분석 + 어원 추적 + 성경 전체 용례 점검 + 신학적 의미 해석을 한 응답에 모은다.
- **EN** — An integrated Bible dictionary that explains biblical persons, places, words, and theological concepts at the depth of a commentary + Bible atlas + Bible dictionary + introduction. Combines original-language analysis, etymology, full canonical usage, and theological meaning in one answer.

**언제 쓰나 / When to use**
- 특정 성경 인물·지명을 빠르게 정리할 때 (아브라함·바울·예루살렘·바벨론 등) / *To quickly profile a person or place (Abraham, Paul, Jerusalem, Babylon, etc.).*
- 핵심 단어·개념의 깊이를 더할 때 (아가페·헤세드·샬롬·언약·칭의 등) / *To deepen key words/concepts (agape, hesed, shalom, covenant, justification).*
- 설교 한 단락에 인용할 신뢰할 만한 사전 정보가 필요할 때 / *When you need a trustworthy dictionary blurb for a sermon paragraph.*

**핵심 기능 / Key features**
- 원어(히브리어·헬라어) 음역과 어원 정리 / *Hebrew/Greek transliteration and etymology.*
- 성경 전체에서의 용례 비교 / *Cross-canonical usage comparison.*
- 신학적 함의까지 한 응답에 통합 / *Theological significance integrated.*

---

#### 3. `sermon-textual-criticism`

**무엇이냐 / What it is**
- **KO** — 성경 한 구절을 **고대 사본**으로 비교하여 본문비평적 차이를 분석하는 학술 도구. 신약은 P46·P52·P66·P75·시내(ℵ)·바티칸(B)·알렉산드리아(A)·베자(D) 등 + Old Latin·Peshitta·Coptic, 구약은 사해사본(DSS)·마소라(BHS)·사마리아 오경·70인역(LXX)·타르굼.
- **EN** — A textual-criticism workbench that compares a verse across **ancient manuscripts**: NT papyri (P46/52/66/75), uncials (Sinaiticus, Vaticanus, Alexandrinus, Bezae), Byzantine majority, and early versions (Old Latin, Peshitta, Coptic); OT via Dead Sea Scrolls, Masoretic Text, Samaritan Pentateuch, LXX, Targum.

**언제 쓰나 / When to use**
- 막 16:9-20, 요 7:53-8:11, 요일 5:7-8 등 본문비평적으로 유명한 구절을 다룰 때 / *For famous textual cruxes (Mark 16:9-20, John 7:53-8:11, 1 John 5:7-8).*
- 일반 구절의 사본 전승을 학술적으로 살피고 싶을 때 / *For scholarly review of a normal verse's transmission.*
- "어느 사본이 원본에 가까운가"를 외부·내부 증거로 평가할 때 / *To weigh manuscripts by external/internal evidence.*

**핵심 기능 / Key features**
- 사본별 이독(variant readings) 정리 / *Variant readings tabulated by manuscript.*
- 본문비평 4원칙(어려운 독법·짧은 독법·외부증거·내부증거) 적용 / *Applies the four canons of textual criticism.*
- 번역본 비교(`sermon-multi-bible-version-compare`)보다 **한 단계 더 깊은** 사본 자체 분석 / *Goes one layer deeper than translation comparison.*

---

#### 4. `sermon-multi-bible-version-compare`

**무엇이냐 / What it is**
- **KO** — 성경 한 구절을 **9개 필수 번역본·종교 문헌**으로 다층 비교하는 도우미. 개역개정·NIV·헬라어 원문·히브리어 원문·라틴어 Vulgata·천주교 성경(공동번역/200주년) + 추가 한국어/영어 번역 + **코란·탈무드 대응 본문**까지 한 화면에.
- **EN** — A multi-version comparison tool stacking a verse across **9 canonical surfaces**: Korean Revised, NIV, Greek, Hebrew, Latin Vulgate, Catholic Korean (Common/Bicentennial), additional KO/EN versions, plus matched passages in the **Quran and Talmud**.

**언제 쓰나 / When to use**
- 한 구절의 번역 차이를 한눈에 비교할 때 / *To eyeball translation differences at a glance.*
- 천주교·개신교 성경, 원어, 라틴어 전통의 신학적 함의를 짚고 싶을 때 / *To trace theological nuance across Catholic/Protestant/original/Latin traditions.*
- 비교종교학적으로 코란·탈무드의 대응 본문을 같이 보고 싶을 때 / *To compare with Quranic / Talmudic parallels for comparative-religion work.*

**핵심 기능 / Key features**
- 9개 표면을 행 단위로 정렬한 비교 표 / *Row-aligned comparison table of 9 sources.*
- 번역 선택 차이의 신학적 함의 분석 / *Theological commentary on translator choices.*
- 5절 이하 단일 본문 단위에 최적화 / *Optimized for ≤5-verse units.*

---

#### 5. `sermon-greek-grammar-machen`

**무엇이냐 / What it is**
- **KO** — J. G. **메이첸의 표준 교과서 『New Testament Greek for Beginners』(33강)** 를 토대로 신약 헬라어 문법을 가르치는 학습 도우미. 알파벳·격·관사·명사 변화·동사 활용·분사·부정사·가정법·명령법까지 33강 순서 또는 주제별 자유 학습.
- **EN** — A teaching tutor based on **J. G. Machen's classic *New Testament Greek for Beginners* (33 lessons)**. Walks through alphabet, cases, articles, declensions, verb conjugations, participles, infinitives, subjunctives, imperatives — sequentially or by topic.

**언제 쓰나 / When to use**
- 신약 헬라어를 처음부터 체계적으로 익히고 싶을 때 / *To learn NT Greek systematically from scratch.*
- 특정 문법 사항(아오리스트·분사 등)만 빠르게 정리할 때 / *To clarify a specific grammar topic (aorist, participle, etc.).*
- 본문비평·주해 연구의 기초 문법을 다질 때 / *As a foundation for textual criticism and exegesis.*

**핵심 기능 / Key features**
- 모든 설명에 (1) 헬라어 원문 (2) 영어 음역 (3) 한글 발음 (4) 신약 실제 용례 4종 병기 / *Each item carries Greek + English transliteration + Korean phonetics + NT usage example.*
- 33강 순차 학습 또는 주제별 검색 양방향 / *Sequential by lesson, or freeform by topic.*
- 퀴즈·연습문제 지원 / *Quiz and exercise support.*

---

### 🏛 카테고리 2. 신학 코칭 · Theological Coaching

#### 6. `sermon-augustine-coaching`

**무엇이냐 / What it is**
- **KO** — **히포의 어거스틴(354–430)** 의 신학과 설교론으로 설교 주제를 개발하고 메시지를 형성하도록 돕는 코칭 스킬. 은혜의 우선성·전적 부패·예정·사랑의 질서(*ordo amoris*)·두 도성·악의 결핍 + *De Doctrina Christiana* 4권의 *docere/delectare/movere*.
- **EN** — A coaching skill grounded in **Augustine of Hippo (354–430)**: priority of grace, total depravity, predestination, *ordo amoris*, two cities, *privatio boni*, plus the rhetorical method of *De Doctrina Christiana* IV (*docere / delectare / movere*).

**언제 쓰나 / When to use**
- 어거스틴 신학에 기댄 깊이 있는 설교 주제를 잡을 때 / *To anchor a sermon in Augustinian theology.*
- 『고백록』·『하나님의 도성』·『기독교 교양』의 인용을 설교에 살릴 때 / *To weave in quotations from *Confessions*, *City of God*, *De Doctrina*.*
- 교부 시대의 시각을 설교에 더하고 싶을 때 / *To add patristic depth.*

**핵심 기능 / Key features**
- 본문 ↔ 어거스틴 텍스트 연결 제안 / *Pairs your passage with Augustinian texts.*
- 평이체·중간체·장엄체 3문체 제안 / *Three rhetorical registers (plain/middle/grand).*
- 칼빈·MLJ 코칭과 짝을 이루는 고대 교부 영역 / *Pairs with Calvin/MLJ coaching, owns the patristic axis.*

---

#### 7. `sermon-luther-coaching`

**무엇이냐 / What it is**
- **KO** — **마틴 루터(1483–1546)** 의 신학과 설교론을 토대로 한 코칭 스킬. 이신칭의·오직 은혜·오직 성경·만인제사장직·법과 복음·노예의지·십자가 신학(*theologia crucis*)·*simul iustus et peccator* + 평이한 회중 언어·복음의 직설.
- **EN** — A coaching skill grounded in **Martin Luther (1483–1546)**: justification by faith alone, sola gratia, sola scriptura, priesthood of all believers, law/gospel distinction, bondage of the will, *theologia crucis*, *simul iustus et peccator* — paired with his plain-tongue, gospel-direct preaching style.

**언제 쓰나 / When to use**
- 칭의·은혜·복음의 직설을 강조하는 설교를 준비할 때 / *For sermons emphasizing justification, grace, and direct gospel proclamation.*
- 95개 조항·『기독자의 자유』·『노예의지론』·갈라디아서 강해의 인용이 필요할 때 / *To draw from the 95 Theses, *Freedom of a Christian*, *Bondage of the Will*, Galatians lectures.*
- 종교개혁 주일·루터파 회중 설교 / *For Reformation Sunday or Lutheran congregations.*

**핵심 기능 / Key features**
- 본문 ↔ 루터 텍스트 연결 / *Passage ↔ Lutheran corpus mapping.*
- 법/복음 구분의 설교 적용 / *Applies law/gospel distinction in delivery.*
- 교파 중립적 — 장로교·감리교·성결교·침례교·성공회 어디서든 사용 가능 / *Denominationally neutral.*

---

#### 8. `sermon-calvin-institutes`

**무엇이냐 / What it is**
- **KO** — 존 칼빈(1509–1564)의 **『기독교 강요』(1559년 최종판) 4권 80장 전체**를 분석·해설하고 학습을 지원하는 조직신학 도우미. 1권 창조주 인식 → 2권 그리스도 안의 구속자 → 3권 성령의 사역과 연합·칭의·예정 → 4권 교회론·성례·국가론.
- **EN** — A systematic-theology tutor covering the **entire 80 chapters of Calvin's *Institutes of the Christian Religion* (1559 final edition)**: Book I (knowledge of God the Creator), II (Christ the Redeemer), III (the Spirit's work, union with Christ, justification, predestination), IV (church, sacraments, civil government).

**언제 쓰나 / When to use**
- 개혁주의 조직신학의 한 주제를 깊이 있게 정리할 때 / *To dig deep on a Reformed dogmatic topic.*
- TULIP·이중 인식론·그리스도 연합·이중예정 등의 정확한 칼빈 본문을 인용할 때 / *To cite Calvin's actual text on TULIP, duplex cognitio, unio cum Christo, double predestination.*
- 1559판 4권을 순차 학습하거나 주제별로 자유 검색할 때 / *For sequential or topical study of the 1559 edition.*

**핵심 기능 / Key features**
- 칼빈 본인 텍스트 인용과 함께 풀어냄 / *Explains with Calvin's own quotations.*
- 1559판 4권 80장 구조에 따른 순차 학습 / *Sequential walk-through of all 80 chapters.*
- 칼빈의 **설교 스타일**은 별도 스킬(`sermon-calvin-style-insight`)이 담당 — 본 스킬은 **신학 본체** / *Calvin's preaching style is a separate skill; this one owns the dogmatic core.*

---

#### 9. `sermon-bavinck-coaching`

**무엇이냐 / What it is**
- **KO** — **헤르만 바빙크(1854–1921)** 의 신학을 토대로 한 코칭 스킬. 마그눔 오푸스 **『개혁교의학』(Reformed Dogmatics, 4권)** 을 1차 자료로 삼고, 핵심 명제 "은혜는 자연을 회복하고 완성한다"·삼위일체 중심 세계관·일반 은총·유기적 사고를 다룬다.
- **EN** — A coaching skill grounded in **Herman Bavinck (1854–1921)**, with his magnum opus ***Reformed Dogmatics* (4 vols.)** as the primary source. Centers on his thesis "grace restores and perfects nature," Trinitarian worldview, common grace, and organic thinking.

**언제 쓰나 / When to use**
- 신칼빈주의·네덜란드 개혁주의 노선의 설교를 준비할 때 / *For neo-Calvinist / Dutch Reformed sermon preparation.*
- 일반 은총·기독교 세계관·창조-타락-구속-종말의 통합을 다룰 때 / *To address common grace, Christian worldview, creation-fall-redemption-consummation.*
- 카이퍼와 바빙크의 차이를 짚고 싶을 때 / *To distinguish Kuyper and Bavinck.*

**핵심 기능 / Key features**
- 바빙크 저작 안에서 **추측 없이** 답을 찾고, 못 찾은 경우 명시 / *Sources strictly from Bavinck's corpus; flags when no answer is found.*
- 『개혁교의학』 외 *Our Reasonable Faith*, *Christian Worldview* 등으로 확장 / *Extends to other Bavinck works as needed.*
- 교파 중립적 / *Denominationally neutral.*

---

#### 10. `sermon-lloyd-jones-coaching`

**무엇이냐 / What it is**
- **KO** — **마틴 로이드 존스(MLJ, 1899–1981) "The Doctor"** 의 명저 **『설교와 설교자』(*Preaching and Preachers*, 1971)** 를 토대로 설교자를 코칭하는 스킬. *Logic on Fire(불붙은 논리)*, 진단-처방(diagnosis-prescription) 방식, 부흥(revival) 의존, 강단 우선성, 교리적 설교 회복.
- **EN** — A coaching skill grounded in **Martyn Lloyd-Jones (MLJ, 1899–1981)**, "The Doctor," and his classic ***Preaching and Preachers* (1971)**. Foregrounds *Logic on Fire*, diagnosis-prescription preaching, revival dependence on the Spirit, and the recovery of doctrinal preaching.

**언제 쓰나 / When to use**
- 강해 설교 전통(영국·웨스트민스터 채플 계열)의 코칭이 필요할 때 / *For expository preaching coaching in the British/Westminster Chapel tradition.*
- 회중을 진단하고 처방하는 실존적 설교를 만들 때 / *To craft existential, diagnosis-prescription sermons.*
- "첫째도 설교 둘째도 설교 셋째도 설교"의 강단 회복을 추구할 때 / *To recover the primacy of preaching.*

**핵심 기능 / Key features**
- MLJ 고유의 회중 진단·실존적 호소·부흥 신학 / *MLJ's signature diagnosis, existential appeal, revival theology.*
- 자기 설교의 MLJ적 평가 요청 가능 / *Submit your draft for an MLJ-style critique.*
- 칼빈식 설교 스킬과 짝을 이루되 중복 회피 / *Pairs with Calvin's style without overlap.*

---

### 🌍 카테고리 3. 배경 & 컨텍스트 · Context & Background

#### 11. `sermon-history-culture-geo-context`

**무엇이냐 / What it is**
- **KO** — 성경 본문의 **역사적·문화적·지리적·사회적 배경**을 학문적 깊이로 풀어주는 배경 해설 도우미. 고대근동, 이스라엘 왕국, 바벨론 포로기, 페르시아·헬라·로마 시대의 정치·일상·관습·지리·교역로를 종합한다.
- **EN** — A background-reconstruction tool that recreates the **historical, cultural, geographical, and social setting** of a biblical passage at scholarly depth — Ancient Near East, Israelite kingdoms, Babylonian exile, Persian/Hellenistic/Roman periods: politics, daily life, customs, geography, trade routes.

**언제 쓰나 / When to use**
- 본문이 당대 청중에게 어떤 의미였는지 재구성할 때 / *To reconstruct what the text meant to its first audience.*
- 유대 절기·결혼·장례·식사·노예·세금·성전·회당 관습이 필요할 때 / *For Jewish feast, marriage, funeral, meal, slavery, tax, temple, synagogue customs.*
- 주변 제국과 이스라엘의 관계를 짚을 때 / *To trace Israel's relations with surrounding empires.*

**핵심 기능 / Key features**
- 본문 *바깥의* 무대 재구성에 특화 / *Specialized in offstage context (vs. textual analysis).*
- 시대별·지역별 학문적 자료 제시 / *Period- and region-specific scholarly references.*
- `sermon-bible-dictionary`(원어·신학)와 역할 분리 / *Role-separated from Bible-dictionary skill.*

---

#### 12. `sermon-christian-history-interpreter`

**무엇이냐 / What it is**
- **KO** — **고대부터 현대까지의 역사 사건·인물·사회 흐름**을 기독교적 관점에서 해석하고 신학적 통찰을 주는 학술 도우미. 콘스탄티누스·동서 분열·십자군·종교개혁·30년 전쟁·청교도·대각성·근대 선교·세계대전·**한국 교회사**(개신교 전래·평양 대부흥·신사참배·해방·산업화·민주화)까지.
- **EN** — A scholarly interpreter that reads **history from antiquity to today through a Christian lens**: Constantine, East-West schism, Crusades, Reformation, Thirty Years' War, Puritans, Great Awakenings, modern missions, world wars, and **Korean church history** (Protestant arrival, Pyongyang Revival, Shinto compulsion, liberation, industrialization, democratization).

**언제 쓰나 / When to use**
- 특정 역사 사건의 신학적 의미·섭리적 해석이 필요할 때 / *For theological / providential reading of a historical event.*
- 한국 교회사의 결정적 순간을 설교에 녹일 때 / *To weave Korean church history into preaching.*
- 회중에게 기독교적 역사관을 가르칠 때 / *To teach a Christian view of history.*

**핵심 기능 / Key features**
- 사실적 정확성·다관점 균형·공신력 있는 출처 3원칙 / *Factual accuracy + multiperspectival balance + credible sources.*
- 성경 시대 *이후*의 역사를 전담 (성경 시대 자체는 11번 스킬 영역) / *Owns post-biblical history (skill #11 owns the biblical era).*

---

#### 13. `sermon-topic-research-multidisciplinary`

**무엇이냐 / What it is**
- **KO** — 설교 주제 한 단어 또는 한 문장(예: "고난"·"용서"·"가난"·"AI"·"외로움")을 받아 **11개 학문 분야**(사회·기술·산업·경제·환경·정치·국제관계·법·제도·심리·영성)에서 학제간 기초 조사자료를 종합 산출.
- **EN** — Takes a sermon theme — a word or sentence ("suffering," "forgiveness," "poverty," "AI," "loneliness") — and produces multidisciplinary research across **11 fields** (society, technology, industry, economy, environment, politics, international relations, law, institutions, psychology, spirituality).

**언제 쓰나 / When to use**
- 본문과 회중 사이를 잇는 "현실 세계 컨텍스트"가 필요할 때 / *To bridge the text and the congregation with real-world context.*
- 통계·최신 연구·핵심 사상가·현장 사례가 필요할 때 / *For stats, recent studies, key thinkers, field cases.*
- 시사적 주제(AI·환경·전쟁·외로움)를 설교에 녹일 때 / *To address contemporary topics in preaching.*

**핵심 기능 / Key features**
- 11개 분야로 학제간 자료 자동 정리 / *Auto-organized across 11 disciplines.*
- 필요 시 웹 검색으로 최신 통계·뉴스 보강 / *Augments with web search for current data.*
- 본문·교리·문체 외부의 "주제 자료" 영역 전담 / *Owns the "topic research" axis outside text/doctrine/style.*

---

### ✍️ 카테고리 4. 설교문 작성 & 기획 · Sermon Writing & Planning

#### 14. `sermon-topic-message-coach`

**무엇이냐 / What it is**
- **KO** — 설교 주제 설정과 핵심 메시지 정립이 막힌 설교자를 **6단계 대화**로 코칭하는 인터랙티브 스킬. (1) 주제 명확화 → (2) 목적 구체화 → (3) 핵심 메시지 5개 추천 → (4) 메시지 선택과 핵심 단어 → (5) 성경 구절·사건 5개씩 → (6) 7가지 설교 작성법 중 선택과 목차.
- **EN** — A 6-step **interactive coach** that guides a stuck preacher from blank page to outline: (1) clarify theme → (2) define purpose → (3) suggest 5 candidate messages → (4) pick one + extract keywords → (5) recommend 5 verses + 5 biblical events → (6) choose among 7 sermon forms and outline.

**언제 쓰나 / When to use**
- 이번 주 설교 뭐 할지 막막할 때 (설교 준비의 *입구*) / *When you're blank on this week's sermon — the entry point.*
- 주제는 있는데 핵심 한 문장이 안 잡힐 때 / *When you have a theme but no controlling thesis.*
- 설교 형식(세 요점·내러티브·텍스트-주석·주제별·교리·연극·칼빈식) 중 선택을 도울 때 / *When choosing among 7 sermon forms.*

**핵심 기능 / Key features**
- 6단계 대화형 코칭 / *Six-step Socratic dialogue.*
- 7가지 설교 작성법(세 요점/내러티브/텍스트-주석/주제별/교리/연극 전달/칼빈식) / *7 sermon forms (three points / narrative / text-commentary / topical / doctrinal / dramatic / Calvinian).*
- 본문·주제가 정해진 *후*의 다른 스킬들과 역할 분리 / *Distinct from skills used after topic is set.*

---

#### 15. `sermon-emotive-writing-coach`

**무엇이냐 / What it is**
- **KO** — 설득력 있고 감동적인 설교문 작성을 **글쓰기 차원**에서 돕는 인터랙티브 코칭. (1) 전체 구조와 서·본·결 전개, (2) 문장·문단·전체 3계층 5가지 글쓰기 기술, (3) 영적·감정적 호소력 강화, (4) 사용자 초안에 대한 단락별 피드백.
- **EN** — An interactive coach for **persuasive, moving sermon writing** at the **craft level**: (1) full structure + intro/body/conclusion development, (2) five writing techniques across sentence/paragraph/whole layers, (3) heightened spiritual-emotional appeal, (4) paragraph-by-paragraph feedback on your draft.

**언제 쓰나 / When to use**
- 본문·메시지·목차가 잡힌 후 실제 글로 풀 때 / *Once text/message/outline are set and you need to write.*
- 자신의 초안을 단락별로 다듬고 싶을 때 / *To revise your draft paragraph by paragraph.*
- 설교의 어휘·리듬·수사가 약하다고 느낄 때 / *When diction/rhythm/rhetoric feels weak.*

**핵심 기능 / Key features**
- 강점 인정 → 개선점 식별 → 대안 제시 → 반복 학습 사이클 / *Affirm → diagnose → propose → iterate cycle.*
- 짧고 간결·반복 회피·리듬·수사·언어 다양성의 5가지 기술 / *Five techniques: brevity, anti-repetition, rhythm, rhetoric, lexical diversity.*
- 신학·전통과 무관하게 *글쓰기 자체*를 코칭 / *Tradition-agnostic — focuses on writing craft itself.*

---

#### 16. `sermon-doctrinal-planner`

**무엇이냐 / What it is**
- **KO** — 본문 또는 핵심 명제를 받아 **체계적 교리설교(*doctrinal preaching*) 기획안**을 자동 생성. 본문 분석 → 교리 함의 → 역사적 정립(니케아·웨스트민스터·하이델베르크) → **교리설교 4단계 구조**(본문 → 교리 진술 → 변증/오해 교정 → 적용) → 실생활 적용 → 추가 자료.
- **EN** — Auto-generates a **doctrinal-sermon plan**: passage analysis → doctrinal implications → historical formulation (Nicene/Westminster/Heidelberg) → the **4-stage doctrinal-sermon structure** (text → doctrinal statement → defense + correction of misreadings → application) → life application → further reading.

**언제 쓰나 / When to use**
- 사도신경·교리문답·신경 기반 시리즈를 기획할 때 / *For creed/catechism-based series.*
- 한 신학 명제(예: "구원은 오직 은혜")를 한 편의 설교로 풀어낼 때 / *To turn a theological proposition into one sermon.*
- 강해·내러티브·큐티가 아닌 *교리(doctrina)를 명확히 가르치는* 장르가 필요할 때 / *When the doctrinal genre — not exposition/narrative/QT — is needed.*

**핵심 기능 / Key features**
- 4단계 교리설교 고유 구조 / *Four-stage doctrinal structure.*
- 역사적 신경·표준 자동 참조 / *Auto-references historic creeds and confessional standards.*
- 적용·자료까지 한 번에 산출 / *Application and resources included.*

---

#### 17. `sermon-calvin-style-insight`

**무엇이냐 / What it is**
- **KO** — 칼빈의 **설교 스타일** 자체를 연구하고 **칼빈식 설교문**을 작성하도록 돕는 개혁주의 설교 도우미. *lectio continua*(연속 강해)·본문 충실성·교리/주해/적용 통합·절제된 수사·목회적 직설.
- **EN** — A Reformed-style preaching helper for **writing Calvin-style sermons**: *lectio continua* (continuous exposition), text-fidelity, integrated doctrine/exegesis/application, restrained rhetoric, pastoral directness.

**언제 쓰나 / When to use**
- 강해 설교 시리즈(엡 1, 롬 8 등)를 칼빈식으로 풀 때 / *For Calvin-style expository series (Eph 1, Rom 8, etc.).*
- 자신의 초안을 칼빈 설교 원칙에 비추어 검토받을 때 / *To review your draft by Calvin's preaching norms.*
- 장로교·개혁주의 회중에 적합한 설교문이 필요할 때 / *For Presbyterian / Reformed congregations.*

**핵심 기능 / Key features**
- 칼빈의 *설교* 영역 (#8 `sermon-calvin-institutes`는 *조직신학*) / *Owns Calvin's preaching (vs. #8 which owns dogmatics).*
- 본문·교리·적용을 한 흐름에 엮는 통합형 / *Integrates text, doctrine, and application in one flow.*

---

#### 18. `sermon-planner-52week`

**무엇이냐 / What it is**
- **KO** — 키워드 1개를 받아 **52주 연간 설교 계획**을 자동 생성하는 기획 도우미. 각 주차별 설교 주제·핵심 성경구절 5개·핵심 포인트 3개·세부 주제 5개·연관 찬송가 5곡 + 절기(부활절·성탄절·맥추감사절)와 **한국 교회 트렌드**(고립·세대갈등·회복·환경 등) 자동 반영.
- **EN** — Generates a **52-week annual preaching plan** from a single keyword: per week — theme + 5 core verses + 3 key points + 5 sub-themes + 5 related hymns; auto-applies the liturgical calendar (Easter, Christmas, Harvest Thanksgiving) and **Korean-church trends** (isolation, generational conflict, recovery, environment).

**언제 쓰나 / When to use**
- 한 해 설교 시리즈를 기획할 때 (소망/감사/믿음/사랑/제자도/은혜/회개/순종 등) / *For yearly series planning around a keyword.*
- 사경회·특별새벽기도회 주제를 정할 때 / *For revival meetings or early-morning special series.*
- 신학적 균형과 한국 교회 현장 감각을 동시에 잡을 때 / *To balance theological breadth with Korean-church reality.*

**핵심 기능 / Key features**
- 주차별 5+3+5+5 구조 자동 산출 / *Per-week 5+3+5+5 structure auto-emitted.*
- 절기·트렌드 자동 반영 / *Liturgical calendar + Korean-church trends auto-injected.*
- 설교 준비 시간 단축 + 신학적 균형 / *Shortens prep time, preserves balance.*

---

### 🙏 카테고리 5. 큐티 & 검증 · QT & Validation

#### 19. `sermon-qt-original-text-based`

**무엇이냐 / What it is**
- **KO** — 성경 본문을 받아 **원어 분석 기반의 완성된 큐티(QT)** 를 자동 생성. **'생명의 삶'·'매일성경' 스타일**의 짧은 설교형 구조 — (1) 신문기사·시·영화·도서 등 **예화 기반 서론** (웹 검색 활용), (2) 헬라어/히브리어 원문 분석과 발음(영어·한글), (3) **3대지 구성(한 대지는 반드시 원문 핵심 의미)**, (4) 적용과 오늘의 기도.
- **EN** — Generates a **complete QT (Quiet Time) devotional anchored in original-language analysis**, in the **'Life of Life' / 'Daily Bible' Korean QT style**: (1) **illustration-based intro** (news, poetry, film, books — via web search), (2) Hebrew/Greek original-language analysis with English + Korean phonetics, (3) **three points (one drawn directly from original-language meaning)**, (4) application + closing prayer.

**언제 쓰나 / When to use**
- 새벽기도·QT·소그룹 인도 준비 / *For dawn prayer, personal QT, small-group leading.*
- 짧은 설교형 묵상이 필요할 때 / *When a short sermon-form devotional is needed.*
- 원어의 핵심 의미를 묵상에 녹이고 싶을 때 / *To embed original-language insight in devotion.*

**핵심 기능 / Key features**
- 출력 3단계: 간단/표준/상세 설교형 / *3 output levels: brief / standard / sermon-style.*
- 한국어 개역개정 기본 / *Korean Revised Version as default.*
- 예화 서론에 웹 검색으로 최신 자료 활용 / *Web search powers the illustration intro.*

---

#### 20. `sermon-audience-feedback-persona`

**무엇이냐 / What it is**
- **KO** — 설교문 초안에 대해 **8명의 가상 회중 페르소나**가 강단 아래에서 듣는 것처럼 솔직한 반응을 돌려주는 다중 페르소나 시뮬레이션. 워킹맘·미혼 청년·중년 사업가·은퇴 직전 권사·새신자 청년·이혼 후 홀로 양육·고3 입시생·1세대 홀몸 권사. 각자의 시간표·신앙 연륜·죄성·신학 수준에서 응답.
- **EN** — A multi-persona simulation where **8 virtual congregation members** "sit under your pulpit" and react candidly to your sermon draft: working mom, single young adult, mid-career businessman, retiring senior elder, new young believer, single divorced parent, college-entrance senior, first-generation widowed elder. Each responds from their own schedule, spiritual maturity, sin nature, and theological level.

**언제 쓰나 / When to use**
- 설교문 초안을 회중 시각으로 검증받고 싶을 때 / *To validate your draft from the pew's perspective.*
- 특정 페르소나(워킹맘·청년·새신자) 시각이 궁금할 때 / *To probe a specific demographic.*
- "이 설교가 현실에 와닿는가"를 점검할 때 / *To gut-check whether the sermon lands.*

**핵심 기능 / Key features**
- 4가지 호출 패턴: 단일 페르소나 / 다중 비교 / 추천형 / 전체 8명 라운드 / *4 invocation patterns: single / multi-compare / recommended / full 8-person round.*
- 거룩한 척하지 않는 *진짜 영혼의 반응* — 반발·위로·의심·결단 / *Unsanitized soul-reactions — pushback, comfort, doubt, resolve.*
- 다른 스킬이 *설교자·신학자·작가* 시각이라면, 본 스킬은 *듣는 영혼* 시각 / *Other skills give pastor/theologian/writer angles; this one gives the listener's soul.*

---

## 🗺 추천 워크플로우 · Recommended Workflow

설교 준비를 **처음부터 끝까지** 진행할 때 권장 순서입니다.
*The full pipeline from blank page to a pulpit-ready sermon.*

### 기본 흐름 / Default flow

```
[입구 / Entry]
  sermon-topic-message-coach       핵심 메시지 정립 / Define the thesis
   ↓
[본문 분석 / Text Analysis]
  sermon-text-analysis-multimethod      7가지 분석 자동 / 7 auto-methods
  sermon-bible-dictionary               단어·인물·지명 / Words, names, places
  sermon-multi-bible-version-compare    번역본 비교 / Translation compare
  sermon-textual-criticism              사본 비교(선택) / MS compare (optional)
   ↓
[배경 / Context]
  sermon-history-culture-geo-context        시대 배경 재구성 / Historical setting
  sermon-topic-research-multidisciplinary   학제간 자료 / Multidisciplinary data
   ↓
[신학 / Theology]
  sermon-augustine / luther / calvin-institutes / bavinck / lloyd-jones-coaching
  택일 또는 복수 / Pick one or more
   ↓
[작성 / Writing]
  sermon-emotive-writing-coach     글쓰기 코칭 / Writing craft coach
  sermon-doctrinal-planner         교리설교 시 / For doctrinal genre
  sermon-calvin-style-insight      강해 설교 시 / For expository genre
   ↓
[검증 / Validation]
  sermon-audience-feedback-persona    회중 8인 반응 / 8 personas react
   ↓
[QT·연간 / QT & Year-Plan]
  sermon-qt-original-text-based    큐티 변환 / QT conversion
  sermon-planner-52week            연간 계획 / 52-week plan
```

---

### 단계별 산출물 / What each stage produces

| 단계 / Stage | 산출물 / Output | 다음 단계 신호 / Hand-off trigger |
|---|---|---|
| **입구 / Entry** | 핵심 메시지 한 문장 + 본문 후보 + 설교 형식 / *1-sentence thesis + candidate texts + sermon form* | 메시지·본문 확정 / *Thesis & text fixed* |
| **본문 분석 / Text** | 7+10가지 분석 + 단어·번역·사본 비교 / *7+10 methods + word/translation/MS compare* | 본문 의미 명확 / *Meaning clarified* |
| **배경 / Context** | 시대 배경 + 주제 학제간 자료 / *Period setting + multidisciplinary data* | 회중-본문 다리 확보 / *Bridge to congregation built* |
| **신학 / Theology** | 교부·종교개혁·근대 개혁주의 시각 / *Patristic / Reformation / neo-Calvinist depth* | 신학적 골격 완성 / *Theological frame done* |
| **작성 / Writing** | 설교문 초안 / *Sermon draft* | 초안 완료 / *Draft complete* |
| **검증 / Validation** | 8 페르소나 회중 반응 / *8-persona pew reactions* | 강단 준비 완료 / *Pulpit-ready* |
| **QT·연간 / QT & Year** | 큐티 변환 또는 52주 계획 / *QT or 52-week plan* | 새 사이클 시작 / *New cycle begins* |

---

### 변형 시나리오 / Common variations

**1. 강해 설교 시리즈 / Expository sermon series**

- 입구 → 본문 분석(전체) → 배경 → 칼빈/MLJ 코칭 → `sermon-calvin-style-insight` → 검증
- *Entry → Full Text Analysis → Context → Calvin/MLJ coaching → `sermon-calvin-style-insight` → Validation*

**2. 교리설교 / Doctrinal sermon**

- 입구 → 본문 분석(요약) → `sermon-doctrinal-planner`(주축) → 어거스틴/루터/칼빈/바빙크 코칭 → 작성 → 검증
- *Entry → Brief Text Analysis → `sermon-doctrinal-planner` (core) → Augustine/Luther/Calvin/Bavinck coaching → Writing → Validation*

**3. 절기 설교 (부활절·성탄절·맥추감사절) / Liturgical (Easter / Christmas / Harvest)**

- `sermon-planner-52week`로 절기 위치 확인 → 본문 분석 → 배경 → 작성 → 검증
- *`sermon-planner-52week` to anchor the liturgical date → Text Analysis → Context → Writing → Validation*

**4. 새벽기도·QT / Dawn prayer & devotion**

- 본문 선택 → `sermon-qt-original-text-based`(주축) → 필요 시 단어·배경 보강
- *Pick the passage → `sermon-qt-original-text-based` (core) → Augment with dictionary/context if needed*

**5. 시사 주제 설교 (AI·환경·외로움 등) / Contemporary-issue preaching (AI, environment, loneliness, etc.)**

- 입구 → `sermon-topic-research-multidisciplinary`(주축) → 본문 선정 → 본문 분석 → 작성 → 검증
- *Entry → `sermon-topic-research-multidisciplinary` (core) → Pick the text → Text Analysis → Writing → Validation*

---

전체 사용 예시는 [`examples/USAGE_EXAMPLES.md`](./examples/USAGE_EXAMPLES.md)에 7가지 시나리오로 정리해 두었습니다.
*Full end-to-end examples are in [`examples/USAGE_EXAMPLES.md`](./examples/USAGE_EXAMPLES.md) — 7 scenarios.*

---

## 🛠 동작 환경 · Supported Environments

본 스킬 패키지는 Claude의 **모든 주요 사용 표면(surface)** 에서 동작하도록 설계되었습니다.
*This skill pack is designed to run across **every major Claude surface**.*

| 환경 / Environment | 지원 / Support | 사용 방식 / How it works |
|---|:---:|---|
| **Claude Code CLI** (터미널 / terminal) | ✅ | `~/.claude/skills/`에 자동 인식 — `install.sh`가 심볼릭 링크 생성 후 Claude Code 재시작 시 활성화 / *Auto-detected at `~/.claude/skills/`. `install.sh` symlinks them; restart Claude Code to activate.* |
| **Claude.ai 웹 / Web** | ✅ | **Projects 첨부** 또는 **개별 ZIP 업로드** — `package.sh`로 만든 `dist/sermon-*.zip`을 끌어다 놓기 / *Attach to a **Project** or upload **individual ZIPs** built by `package.sh`.* |
| **Claude.ai 모바일 / Mobile (iOS · Android)** | ✅ | 웹에서 등록한 **Project가 모바일에 자동 동기화** — 즉시 호출 가능 / *Projects registered on web sync **automatically** to mobile — invoke instantly.* |
| **Claude Desktop (macOS · Windows)** | ✅ | Claude Code CLI 연동을 통해 사용 — 또는 Claude.ai 웹과 동일한 Projects 흐름 / *Via the bundled Claude Code integration, or the same Project flow as web.* |
| **API 직접 호출 / Direct API** | ⚠️ | **`SKILL.md` 본문을 시스템 프롬프트로 변환**하여 사용 — 자동 트리거는 없음 / *Convert `SKILL.md` bodies into **system prompts**; **no auto-trigger** in raw API.* |

---

### 권장 환경 / Recommended setup

- **개인 데일리 작업 / Daily personal use** — Claude Code CLI 설치 후 모든 스킬을 자동 활성화 / *Install via Claude Code CLI for auto-activation of all skills.*
- **팀·교회 공유 / Team or church sharing** — Claude.ai의 한 Project에 ZIP 묶음을 올려 권한 멤버가 함께 사용 / *Upload the bundle ZIP to a single Claude.ai Project and share with members.*
- **이동 중 빠른 사용 / On the move** — 모바일 Claude.ai에서 동기화된 Project로 호출 / *Use mobile Claude.ai with the synced Project.*

> 💡 **Claude.ai가 처음**이신 경우 — 무료 플랜에서도 Projects 첨부가 가능하며, Pro/Max 플랜이면 첨부 용량과 컨텍스트가 더 넉넉합니다.
> *New to Claude.ai? Project attachments work on the free tier; Pro/Max plans give larger attachment quotas and context.*

---

## 📁 저장소 구조 · Repository Structure

```
claude-sermon-skills/
├── README.md                  이 문서 / This document
├── LICENSE                    MIT 라이선스 / MIT license
├── CHANGELOG.md               변경 이력 / Release history
├── CONTRIBUTING.md            기여 가이드 / Contribution guide
├── CODE_OF_CONDUCT.md         행동 강령 / Code of conduct
│
├── skills/                    20개 스킬 (개별 폴더 유지) / 20 skills, one folder each
│   ├── sermon-text-analysis-multimethod/
│   │   └── SKILL.md           스킬 본체 / Skill spec
│   ├── sermon-audience-feedback-persona/
│   │   ├── SKILL.md
│   │   └── personas/          8명 회중 페르소나 / 8 congregation personas
│   ├── sermon-emotive-writing-coach/
│   │   ├── SKILL.md
│   │   └── references/        보조 자료 / Reference assets
│   └── … (나머지 17개 / 17 more)
│
├── docs/
│   ├── INSTALLATION.md        환경별 상세 설치 / Per-surface install guide
│   ├── ARCHITECTURE.md        스킬 간 관계도 / Inter-skill architecture
│   ├── TROUBLESHOOTING.md     문제 해결 / Troubleshooting
│   └── FAQ.md                 자주 묻는 질문 / Frequently asked questions
│
├── examples/                  7가지 실제 시나리오 / 7 end-to-end scenarios
│   ├── USAGE_EXAMPLES.md      시나리오 인덱스 / Scenario index
│   ├── 01-weekly-sermon-prep.md          매주 설교 준비 / Weekly prep
│   ├── 02-doctrinal-series.md            교리설교 시리즈 / Doctrinal series
│   ├── 03-monthly-qt.md                  월간 QT / Monthly QT
│   ├── 04-textual-criticism-deep.md      본문비평 심화 / Deep textual criticism
│   ├── 05-audience-feedback-validation.md 회중 검증 / Audience validation
│   ├── 06-annual-planning.md             연간 설교 기획 / Annual planning
│   └── 07-theologian-coaching.md         신학자 코칭 / Theologian coaching
│
├── scripts/
│   ├── install.sh             자동 설치 / Auto-installer
│   ├── uninstall.sh           제거 / Uninstaller
│   ├── verify.sh              설치 검증 / Install verification
│   ├── package.sh             Claude.ai 업로드용 ZIP 생성 / Build ZIPs for Claude.ai
│   └── set-github-username.sh 문서 placeholder 일괄 치환 / Bulk-replace docs placeholder
│
└── .github/
    ├── workflows/
    │   ├── validate-skills.yml frontmatter·구조 자동 검증 / Auto frontmatter+structure validation
    │   └── release.yml         태그 push 시 ZIP 자동 빌드 / Auto ZIP build on tag push
    ├── ISSUE_TEMPLATE/
    │   ├── bug_report.md
    │   ├── feature_request.md
    │   └── config.yml
    └── PULL_REQUEST_TEMPLATE.md
```

---

### 폴더 역할 한눈에 보기 / Folders at a glance

| 폴더 / Folder | 역할 / Role | 누가 보면 좋은가 / Audience |
|---|---|---|
| **`skills/`** | 20개 스킬의 본체. 각 폴더에 `SKILL.md`(필수) + 선택적 `references/`·`personas/`. / *The 20 skill bundles. Each holds `SKILL.md` (required) plus optional `references/` or `personas/`.* | 모든 사용자 / *All users* |
| **`docs/`** | 설치·아키텍처·트러블슈팅·FAQ 4종 심화 문서. / *Four reference docs: install, architecture, troubleshooting, FAQ.* | 도입·운영 담당 / *Adopters & maintainers* |
| **`examples/`** | 강해·교리·QT·본문비평·검증·연간 기획·신학자 코칭 7가지 실전 시나리오. / *Seven real-world scenarios — exposition, doctrinal, QT, textual criticism, validation, annual planning, theologian coaching.* | 실제 적용을 원하는 설교자 / *Preachers ready to apply* |
| **`scripts/`** | 설치·제거·검증·패키징·placeholder 치환 자동화 5종. / *Five automation scripts: install, uninstall, verify, package, placeholder swap.* | 터미널 사용자 / *CLI users* |
| **`.github/`** | CI(스킬 자동 검증)·릴리스(ZIP 자동 빌드)·이슈/PR 템플릿. / *CI (skill validation), release (ZIP build), issue/PR templates.* | 기여자 / *Contributors* |

> 💡 **스킬 폴더 단위가 곧 최소 배포 단위입니다** — `skills/sermon-*/` 한 폴더만 복사해도 그 스킬은 독립적으로 동작합니다.
> *A skill folder is the minimum deployable unit — copy any single `skills/sermon-*/` and that skill works standalone.*

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
