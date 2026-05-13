# Changelog

본 프로젝트의 모든 주요 변경사항은 이 문서에 기록됩니다.

형식은 [Keep a Changelog](https://keepachangelog.com/ko/1.1.0/)를 따르며,
버전은 [Semantic Versioning](https://semver.org/spec/v2.0.0.html)을 준수합니다.

## [1.1.0] - 2026-05-13

### 🔬 신규 스킬 1개 + 21개 스킬 정밀 검증 사이클 완료

v1.0.0 이후 신규 스킬 1개를 추가하고, 21개 스킬 전체에 임의 케이스 정밀 검증을 수행하여 그 결과를 SKILL.md·references·TEST-REPORT로 통합 반영. 21개 스킬 모두 검증 데이터에 기반한 정합 상태로 정리.

#### Added — 신규 스킬 (1)
- `sermon-bible-history-matcher` — 성경 인물·사건을 세계사 자료(고고학 유물·고대 문헌·학술 컨센서스)와 할루시네이션 없이 매칭하는 스킬. 배경 & 컨텍스트 카테고리에 편입.

#### Added — 검증 보고서 (TEST-REPORT, 총 33건)
- 20개 스킬 각각 1~4개 라운드의 정밀 검증 보고서를 스킬 폴더 내에 동봉.
- 다라운드 검증 수행 스킬: `sermon-lloyd-jones-coaching`(V1~V4), `sermon-luther-coaching`(R1·R2·기본), `sermon-planner-52week`(V1~V4), `sermon-topic-research-multidisciplinary`(ROUND1~ROUND4), `sermon-history-culture-geo-context`(R1·R2), `sermon-textual-criticism`(V1·V2), `sermon-bible-dictionary`(2라운드), `sermon-bible-history-matcher`(V2), `sermon-calvin-institutes`(PROMPT 검증), `sermon-emotive-writing-coach`(PROMPT 검증), `sermon-bavinck-coaching`(검증 보고서 갱신).

#### Added — 신규 레퍼런스 폴더 (8개 스킬)
- `sermon-calvin-style-insight/references/` — 칼빈 설교 원리·서지·코퍼스 팩트·통상 오독 4종
- `sermon-christian-history-interpreter/references/` — 할루시네이션 체크리스트·검증 핵심 사건·사학 방법론·한국 교회사 4종
- `sermon-doctrinal-planner/references/` — 신경·고백·교리 본문 매핑·정통 vs 이단 명제·표준 서지 6종
- `sermon-history-culture-geo-context/references/` — 시대 타임라인 검증·1차 자료 인용 표준·학자 균형 토론 4종
- `sermon-lloyd-jones-coaching/references/` — MLJ 검증 서지·핵심 주제·통상 오독 3종
- `sermon-luther-coaching/references/` — 루터 검증 서지·교파 비교·핵심 인용·통상 오독 4종
- `sermon-qt-original-text-based/references/` — 원어 음역 표준·핵심 본문 검증·자기 검증 체크리스트·통상 오적용 등 5종
- `sermon-topic-message-coach/references/` — 할루시네이션 체크리스트·메시지 다양성 프레임·설교 분류·신학적 안전 가이드 4종

#### Changed — SKILL.md 정밀 보강 (20개 스킬)
- 21개 스킬 중 `sermon-audience-feedback-persona`(v1.0.0 직후 검증 완료된 1개)를 제외한 **20개 스킬의 SKILL.md를 검증 결과에 맞춰 보강**.
- 메타데이터 `description` 정밀화, 트리거 키워드 확장, 1차 자료 인용 강화, 할루시네이션 방지 규약 명문화.
- 보강 분량: 약 +18,000줄 / -340줄 (테스트 보고서·신규 레퍼런스 포함).

#### Changed — 기존 레퍼런스 보강
- `sermon-bavinck-coaching/references/key-themes-and-sources.md`
- `sermon-bible-history-matcher/references/anti-hallucination-checklist.md`·`confirmed-cases.md`
- `sermon-calvin-institutes/references/key-quotes-by-chapter.md`
- `sermon-emotive-writing-coach/references/whole-sermon-techniques.md`
- `sermon-planner-52week/references/hymn_themes.md`·`keyword_themes.md`·`liturgical_calendar.md`
- `sermon-text-analysis-multimethod/references/false-interpretations-catalog.md`

#### Notes
- README "스킬 목록 (21개)" 카운트와 표 항목 모두 정합 상태 유지 (5+5+4+5+2 = 21).
- 백업 파일(`*.bak.*`)은 원격에 포함하지 않음.

---

## [1.0.0] - 2026-05-08

### 🎉 첫 공개 배포

20개의 sermon skill을 단일 저장소로 통합하여 첫 공개 배포.

#### Added — 본문 분석 & 원어 (5)
- `sermon-text-analysis-multimethod` — 7+10가지 본문 분석법 통합
- `sermon-bible-dictionary` — 성경 인물·지명·단어 사전
- `sermon-textual-criticism` — 고대 사본 본문비평
- `sermon-multi-bible-version-compare` — 9개 번역본 다층 비교
- `sermon-greek-grammar-machen` — 메이첸 헬라어 문법 33강

#### Added — 신학 코칭 (5)
- `sermon-augustine-coaching` — 어거스틴 신학·설교론
- `sermon-luther-coaching` — 루터 종교개혁 신학
- `sermon-calvin-institutes` — 칼빈 『기독교 강요』
- `sermon-bavinck-coaching` — 바빙크 신칼빈주의
- `sermon-lloyd-jones-coaching` — MLJ Logic on Fire

#### Added — 배경 & 컨텍스트 (3)
- `sermon-history-culture-geo-context` — 성경 시대 배경
- `sermon-christian-history-interpreter` — 기독교적 역사 해석
- `sermon-topic-research-multidisciplinary` — 11분야 학제간 자료

#### Added — 설교문 작성 & 기획 (5)
- `sermon-topic-message-coach` — 6단계 주제·메시지 코칭
- `sermon-emotive-writing-coach` — 설교문 글쓰기 코칭
- `sermon-doctrinal-planner` — 교리설교 4단계 기획안
- `sermon-calvin-style-insight` — 칼빈식 강해 설교
- `sermon-planner-52week` — 52주 연간 설교 계획

#### Added — 큐티 & 검증 (2)
- `sermon-qt-original-text-based` — 원어 기반 큐티
- `sermon-audience-feedback-persona` — 8명 회중 페르소나 피드백

#### Infrastructure
- 자동 설치 스크립트 (`scripts/install.sh`)
- 검증 스크립트 (`scripts/verify.sh`)
- claude.ai 업로드용 ZIP 패키징 (`scripts/package.sh`)
- GitHub Actions: 스킬 frontmatter 자동 검증
- 7가지 사용 시나리오 예시 문서

---

## [Unreleased]

### 계획 중
- 영문(English) README 추가
- 추가 신학 코칭 스킬: 조나단 에드워즈, 스펄전, 본회퍼
- 설교 영상 분석 스킬 (멀티모달)
- VSCode/Cursor 연동 가이드

[1.1.0]: https://github.com/idoforgod/cys-claude-sermon-skills/releases/tag/v1.1.0
[1.0.0]: https://github.com/idoforgod/cys-claude-sermon-skills/releases/tag/v1.0.0
