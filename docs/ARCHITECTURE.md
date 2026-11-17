# 아키텍처 — 스킬 간 관계도

본 문서는 22개 sermon skill이 **어떤 영역을 분담**하고 **어떻게 서로 연결**되는지를 설명합니다.

---

## 🗺 전체 구조도

```
                    ┌─────────────────────────────────────────┐
                    │         설교자의 한 주 사역 사이클        │
                    └─────────────────────────────────────────┘
                                       │
                                       ▼
        ┌──────────────────────────────────────────────────────┐
        │                                                      │
   [입구 — 무엇을 설교할까?]                                    │
        │                                                      │
   sermon-topic-message-coach (6단계 대화)                      │
   sermon-planner-52week     (연간 계획)                        │
        │                                                      │
        ▼                                                      │
   [본문 분석 — 본문은 무엇을 말하는가?]                          │
        │                                                      │
   ┌────┴────────────────────────────────────────┐              │
   │                                             │              │
   sermon-text-analysis-multimethod              │              │
       (7가지 분석법 + 가짜 해석 검증)            │              │
                                                 │              │
   sermon-bible-dictionary                       │              │
       (단어·인물·지명 사전)                      │              │
                                                 │              │
   sermon-multi-bible-version-compare            │              │
       (9개 번역본 비교)                          │              │
                                                 │              │
   sermon-textual-criticism                      │              │
       (고대 사본 비교)                           │              │
                                                 │              │
   sermon-greek-grammar-machen                   │              │
       (헬라어 문법 학습)                         │              │
   └────┬────────────────────────────────────────┘              │
        │                                                      │
        ▼                                                      │
   [배경 — 당시·오늘 무대는 어떠한가?]                            │
        │                                                      │
   sermon-history-culture-geo-context  (성경 시대)               │
   sermon-bible-history-matcher        (성경 ↔ 세계사 매칭)     │
   sermon-christian-history-interpreter (성경 이후 역사)         │
   sermon-topic-research-multidisciplinary (현대 학제간)         │
        │                                                      │
        ▼                                                      │
   [신학 — 어떤 신학적 깊이로 풀까?]                              │
        │                                                      │
   sermon-augustine-coaching   (4–5세기 교부)                    │
   sermon-luther-coaching      (16세기 종교개혁)                 │
   sermon-calvin-institutes    (16세기 조직신학 본체)            │
   sermon-bavinck-coaching     (19–20세기 신칼빈주의)            │
   sermon-lloyd-jones-coaching (20세기 강해 부흥)                │
        │                                                      │
        ▼                                                      │
   [작성 — 어떻게 글로 풀어낼까?]                                 │
        │                                                      │
   sermon-k1-narrative           (K1 스타일 내러티브 설교)        │
   sermon-emotive-writing-coach  (글쓰기 코칭, 모든 장르)         │
   sermon-doctrinal-planner      (교리설교 4단계)                │
   sermon-calvin-style-insight   (강해 설교, lectio continua)    │
   sermon-qt-original-text-based (QT 형식)                       │
        │                                                      │
        ▼                                                      │
   [검증 — 회중에게 들리는가?]                                   │
        │                                                      │
   sermon-audience-feedback-persona (8명 회중 페르소나)          │
        │                                                      │
        ▼                                                      │
                            [강단]                              │
                                                                │
        ◀───────────────  다음 주 다시 입구로  ─────────────────┘
```

---

## 📊 5개 카테고리와 책임 분담

### 1️⃣ 본문 분석 & 원어 (5)

| 스킬 | 영역 | 다른 스킬과의 차이 |
|---|---|---|
| **text-analysis-multimethod** | 7가지 분석법 *동시* 수행 | 메타 분석 도구. 각 영역의 종합. |
| **bible-dictionary** | 단어·인물·지명 *개별* 해설 | 백과사전형. 단일 항목 깊이. |
| **textual-criticism** | 고대 *사본* 비교 | 사본 단위 (P75, ℵ, B 등) |
| **multi-bible-version-compare** | *번역본* 비교 | 번역본 단위 (개역개정, NIV 등) |
| **greek-grammar-machen** | 헬라어 *문법* 학습 | 메이첸 33강 체계적 학습 |

### 2️⃣ 신학 코칭 (5) — 연대순

```
4–5세기  →  어거스틴      Augustine      (서방교부의 정점)
       ↓
16세기   →  루터          Luther         (종교개혁 시작)
            칼빈          Calvin         (개혁주의 정립)
       ↓
19–20세기 → 바빙크        Bavinck        (신칼빈주의 종합)
            로이드 존스   Lloyd-Jones    (현대 강해 설교)
```

각 신학자의 **고유 강조점**:

| 신학자 | 핵심 강조 |
|---|---|
| 어거스틴 | 은혜의 우선성, 사랑의 질서(ordo amoris), 두 도성 |
| 루터 | 이신칭의(sola fide), 십자가 신학, 법과 복음 |
| 칼빈 | TULIP, 그리스도와의 연합, lectio continua |
| 바빙크 | 은혜는 자연을 회복·완성, 유기적 사고 |
| 로이드 존스 | Logic on Fire, 실존적 진단-답변, 성령 의존 |

### 3️⃣ 배경 & 컨텍스트 (4) — 시간축 분담

```
[성경 시대]                    [성경 ↔ 세계사 매칭]              [성경 이후~현재]                [현대 한국]
history-culture-geo-context  →  bible-history-matcher          →  christian-history-interpreter  →  topic-research-multidisciplinary
(BC ~ AD 1세기, 무대 재구성)   (성경 인물·사건의 외부 증거)        (AD 2세기 ~ 현재)                 (현재의 사회·기술·심리·영성)
```

각 스킬의 **고유 역할**:

| 스킬 | 영역 | 차별점 |
|---|---|---|
| **history-culture-geo-context** | 성경 시대 *내부* 무대 재구성 | 정치·일상·관습·지리 (서사 무대) |
| **bible-history-matcher** | 성경 인물·사건의 *외부* 증거 매칭 | 박물관 유물·고대 문헌·학술 컨센서스 (*증거 없으면 주장도 없다* 원칙) |
| **christian-history-interpreter** | 성경 시대 *이후* 역사 해석 | 콘스탄티누스 ~ 한국 교회사를 기독교 시각으로 |
| **topic-research-multidisciplinary** | 현대 *11분야* 학제간 자료 | 사회·기술·산업·경제·환경·정치·국제·법·제도·심리·영성 |

### 4️⃣ 설교문 작성 & 기획 (6) — 장르별

```
[입구]              topic-message-coach          (어떤 주제로 갈지 모를 때)
[연간]              planner-52week               (1년치 한 번에)
[내러티브]          k1-narrative                 (이야기 본문 → K1 스타일 스토리 설교)
[교리]              doctrinal-planner            (교리 명제 → 4단계)
[강해]              calvin-style-insight         (lectio continua)
[글쓰기 전반]       emotive-writing-coach        (모든 장르 공통, 문장·문단·전체)
```

**k1-narrative vs 인접 스킬**: 이야기 본문의 완성 설교문은 `k1-narrative`, 서신서 교리 단락은 `doctrinal-planner`·`calvin-style-insight`, 짧은 큐티는 `qt-original-text-based`, 장르 무관 문체 퇴고는 `emotive-writing-coach`. `k1-narrative`는 임도균 T&T 방법론 + K1 다섯 시그니처(수미쌍관·원포인트·반전·비관습·궁금증→해석→도전)를 강제한다.

### 5️⃣ 큐티 & 검증 (2)

```
[QT 변환]   qt-original-text-based      (생명의 삶/매일성경 스타일)
[검증]      audience-feedback-persona   (8명의 회중이 듣는다면?)
```

---

## 🔗 자주 함께 사용되는 조합

### 조합 1. 본문 종합 분석
```
text-analysis-multimethod (메인)
  + multi-bible-version-compare (번역 차이 보강)
  + textual-criticism (사본 차이 필요시)
  + bible-dictionary (특정 단어 깊이)
```

### 조합 2. 강해 설교 한 편
```
text-analysis-multimethod
  → history-culture-geo-context
  → calvin-institutes (조직신학 참조)
  → calvin-style-insight (실제 작성)
  → audience-feedback-persona (검증)
```

### 조합 3. 교리 설교 시리즈
```
doctrinal-planner (4단계 기획)
  → augustine-coaching 또는 calvin-institutes (신학 자료)
  → emotive-writing-coach (실제 글쓰기)
  → audience-feedback-persona (검증)
```

### 조합 3-b. K1 스타일 내러티브 설교 한 편
```
text-analysis-multimethod (본문 관찰 + 가짜 해석 필터)
  → history-culture-geo-context (무대 배경)
  → k1-narrative (K1 시그니처로 완성 설교문)
  → emotive-writing-coach (문장·단락 퇴고)
  → audience-feedback-persona (검증)
```

### 조합 4. 큐티 작성
```
text-analysis-multimethod (간단 분석)
  → bible-dictionary (핵심 단어)
  → qt-original-text-based (QT 형식 변환)
```

### 조합 5. 1년 사역 계획
```
planner-52week (52주 키워드 기반 자동 생성)
  → 매주 → topic-message-coach + 본문 분석 카테고리
```

---

## ⚙️ 트리거 우선순위 (Description 충돌 방지)

여러 스킬이 동시 후보가 될 수 있는 입력에서 Claude가 어떤 스킬을 우선 호출하는지의 원칙:

| 입력 패턴 | 1순위 스킬 |
|---|---|
| "○○○ 본문 다각도 분석" | `text-analysis-multimethod` |
| "○○ 단어/인물/지명이 뭔가" | `bible-dictionary` |
| "○○ 본문 사본 비교" | `textual-criticism` |
| "○○ 본문 번역본 비교" | `multi-bible-version-compare` |
| "헬라어 문법 ○강" | `greek-grammar-machen` |
| "○○ 인물/사건의 역사적 증거" | `bible-history-matcher` |
| "큐티 만들어줘" | `qt-original-text-based` |
| "교리설교" | `doctrinal-planner` |
| "○○○로 칼빈식 설교" | `calvin-style-insight` |
| "기독교 강요 ○권" | `calvin-institutes` |
| "회중 시각으로 들어줘" | `audience-feedback-persona` |
| "주제를 못 잡겠다" | `topic-message-coach` |
| "52주 설교 계획" | `planner-52week` |
| "K1 스타일 설교" / "내러티브·스토리 설교" / "수미쌍관 예화" / "반전 있는 설교" | `k1-narrative` |
| "설교문 다듬어줘" | `emotive-writing-coach` |

---

## 🎯 설계 원칙

### 1. 단일 책임 원칙 (Single Responsibility)
각 스킬은 **하나의 영역**만 담당합니다. 예: bible-dictionary는 단어·인물 해설만, textual-criticism은 사본 비교만.

### 2. 명확한 차별화 (Clear Differentiation)
description에서 "다른 sermon 스킬과의 차별점"을 명시하여 트리거 충돌을 방지합니다.

### 3. 조합 가능성 (Composability)
스킬 간 호출이 가능하도록 입력/출력 형식을 일관되게 유지합니다.

### 4. 교파 중립성 (Denominational Neutrality)
모든 스킬은 정통 기독교 교파의 사용자가 활용할 수 있도록 중립적 기조를 유지하되, 인용된 신학자의 입장은 그의 1차 자료에 충실히 전달합니다.

### 5. 한국 강단 적용성 (Korean Context)
한국어 회중을 위한 적용·예시·언어를 기본으로 하되, 학문적 정확성을 양보하지 않습니다.

---

## 🔮 향후 확장 영역

다음 카테고리에서 추가 스킬을 검토 중입니다:

- **추가 신학자**: 조나단 에드워즈, 스펄전, 본회퍼, 칼 바르트
- **장르 확장**: 장례·결혼·임직 예식 설교, 청년·아동 설교
- **사역 도구**: 설교 후 적용 카드, 소그룹 토의 질문, 설교 시리즈 홍보 카피
- **멀티모달**: 설교 영상 분석, 예화 이미지 생성

기여를 원하시면 [CONTRIBUTING.md](../CONTRIBUTING.md)를 참고하세요.
