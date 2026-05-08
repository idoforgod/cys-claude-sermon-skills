# Changelog

본 프로젝트의 모든 주요 변경사항은 이 문서에 기록됩니다.

형식은 [Keep a Changelog](https://keepachangelog.com/ko/1.1.0/)를 따르며,
버전은 [Semantic Versioning](https://semver.org/spec/v2.0.0.html)을 준수합니다.

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

[1.0.0]: https://github.com/idoforgod/claude-sermon-skills/releases/tag/v1.0.0
