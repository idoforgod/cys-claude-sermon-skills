# 기여 가이드 (Contributing)

`claude-sermon-skills`에 관심을 가져주셔서 감사합니다. 이 문서는 새 스킬 제안, 버그 리포트, 문서 개선 등 기여 절차를 안내합니다.

---

## 🎯 기여 가능한 영역

### 1. 새 스킬 제안
- 기존 20개 스킬과 **명확히 구별되는 고유 영역**이어야 합니다
- 정통 기독교 신앙 위에 서되 교파 중립적이어야 합니다

### 2. 기존 스킬 개선
- 잘못된 번역, 부정확한 신학적 진술, 누락된 인용 보완
- description 정확도 개선 (트리거 정확도 향상)

### 3. 사용 시나리오 추가
- `examples/` 폴더에 실제 설교 준비 사례 공유

### 4. 문서·번역
- 영문(English), 일문(日文), 중문(中文) 번역
- 환경별 설치 가이드 보완

---

## 📋 새 스킬 작성 규칙

### 폴더 구조
```
skills/sermon-<name>/
├── SKILL.md              (필수, frontmatter 포함)
└── references/           (선택, 분량이 큰 보조 자료)
    └── *.md
```

### SKILL.md frontmatter
```yaml
---
name: sermon-<name>
description: <한글로 작성, 트리거 키워드와 사용 상황을 명확히 명시>
---
```

#### description 작성 원칙
- **언제 발동하는지**를 구체적으로 명시 (트리거 키워드 5–10개 포함)
- **무엇을 산출하는지**를 한 문장에 요약
- **다른 sermon 스킬과의 차별점**을 명시
- 길이는 200–400자 권장

### 본문 작성 원칙
1. **신학적 정확성** — 1차 자료를 우선 인용, 추측 금지
2. **교파 중립** — 특정 교파의 입장을 절대화하지 않음
3. **한국 강단 적용성** — 한국어 회중을 위한 적용 포함
4. **재현성** — 같은 입력에 일관된 결과를 산출하는 명확한 절차 명시

---

## 🐛 버그 리포트

[GitHub Issues](https://github.com/idoforgod/claude-sermon-skills/issues)에서 다음 정보를 포함하여 등록해 주세요.

- **환경**: Claude Code CLI / Claude.ai 웹 / 모바일
- **Claude 모델**: 예) Claude Opus 4.7
- **사용한 스킬**: 예) `sermon-text-analysis-multimethod`
- **입력**: 어떤 본문/주제를 입력했는지
- **기대 결과** vs **실제 결과**
- **재현 절차**

---

## 📝 PR(Pull Request) 절차

```bash
# 1. Fork 후 clone
git clone https://github.com/<YOUR_USERNAME>/claude-sermon-skills.git
cd claude-sermon-skills

# 2. 브랜치 생성
git checkout -b feature/sermon-<name> 또는 fix/<topic>

# 3. 작업 후 검증
bash scripts/verify.sh

# 4. 커밋 (Conventional Commits 권장)
git commit -m "feat(skills): add sermon-spurgeon-coaching"
git commit -m "fix(text-analysis): 가짜 어원 카탈로그 보완"
git commit -m "docs(examples): 부활절 시리즈 시나리오 추가"

# 5. Push & PR
git push origin feature/sermon-<name>
```

### PR 체크리스트
- [ ] `scripts/verify.sh` 통과
- [ ] frontmatter `name`, `description` 모두 존재
- [ ] 다른 스킬과 description이 충돌하지 않음 (트리거 정확도)
- [ ] `CHANGELOG.md` 업데이트
- [ ] `README.md` 스킬 목록 업데이트 (해당 시)

---

## 🚫 거절 사유가 될 수 있는 항목

- 특정 교파의 정치적·사회적 입장을 강요하는 내용
- 1차 자료 없는 추측성 신학 주장
- 저작권 침해 가능 자료의 직접 인용 (15단어 초과)
- 한국 교회를 단편적으로 폄하하거나 미화하는 내용
- 이단 또는 이단성 짙은 해석을 정통으로 소개하는 내용

---

## 📜 행동 강령

[CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md)를 준수해 주시기 바랍니다.

---

## 🙏 감사합니다

여러분의 한 줄 기여가 한국 강단을 더 풍성하게 합니다.

> "주의 말씀은 내 발에 등이요 내 길에 빛이니이다" — 시편 119:105
