# 🧭 Tool Advisor

[English](./README.md) | **한국어** | [日本語](./README.ja.md) | [中文](./README.zh-CN.md) | [Español](./README.es.md) | [Português](./README.pt-BR.md) | [Русский](./README.ru.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md)

**어떤 도구를 써야 할지 고민하지 마세요. Claude Code가 알아서 추천합니다.**

Tool Advisor는 프롬프트를 분석하여 최적의 도구, 에이전트, MCP 서버, 오케스트레이션 패턴 조합을 추천합니다. 그리고 **바로 복사해서 실행할 수 있는 명령어**까지 제공합니다.

![Demo](./assets/demo.gif)

## 설치

```bash
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash
```

업데이트하려면 같은 명령어를 다시 실행하세요.

## 사용법

자연스럽게 대화하듯 요청하세요:

```
"tool-advisor로 분석해줘: 인증 모듈 리팩토링"
"tool-advisor, 이 데이터베이스 마이그레이션 어떻게 해야 해?"
"사용자 인증 구현하려면 어떤 방법이 좋을까?"
```

**tool-advisor**를 언급하거나 도구 추천을 요청하면 스킬이 활성화됩니다.

## 동작 방식

```
프롬프트 입력
    ↓
┌─────────────────────────────┐
│      Tool Advisor           │
├─────────────────────────────┤
│ 1. 로컬 인벤토리 확인        │
│ 2. 복잡도 평가               │
│ 3. Harness 필요 여부         │
│ 4. Plan Mode 필요 여부       │
│ 5. 에이전트 선택 (3단계)      │
│ 6. MCP 필요 여부 확인        │
│ 7. 설치 제안                 │
│ 8. Quick Action 테이블       │
└─────────────────────────────┘
    ↓
🎯 바로 복사해서 실행 가능한 명령어
```

## 주요 기능

| 기능 | 설명 |
|------|------|
| **Quick Action 테이블** | 바로 복사해서 실행 가능한 명령어 제공 |
| **Plan Mode 감지** | 복잡한 작업은 `EnterPlanMode` 추천 |
| **Harness 패턴** | "될 때까지", "반복해서" → Ralph 패턴 추천 |
| **3단계 에이전트 검색** | 빌트인 → 로컬 커스텀 → 마켓플레이스 |
| **MCP 추천** | 설치 상태 표시 (✅/❌) + 대안 제시 |
| **Human-in-the-loop** | 사용자 승인 없이 절대 설치하지 않음 |

## 예시

**입력:**
```
tool-advisor로 분석해줘: 인증 모듈을 JWT로 리팩토링
```

**출력:**
```markdown
## 분석 결과

### 1. 분류
- 유형: 리팩토링/아키텍처
- 복잡도: Complex (5+ 파일)

### 2. Harness
- 필요: 아니오

### 3. Plan Mode
- 추천: 예
- 이유: 여러 파일 수정, 보안 민감

### 4. 에이전트
- feature-dev (설치됨)
- backend-developer (로컬 에이전트)
- security-engineer (로컬 에이전트)

### 5. 추천
/feature-dev를 Plan Mode와 함께 사용

---

## 🎯 지금 바로 실행

| 당신의 상황 | 복사해서 붙여넣기 |
|------------|------------------|
| 계획 먼저 보고 싶다 | `Plan Mode로 JWT 리팩토링 계획 세워줘` |
| 가이드된 개발 원한다 | `/feature-dev` |
| 바로 구현해줘 | `auth를 JWT로 리팩토링해줘` |

→ "계획 먼저"를 권장 (5+ 파일, 보안 민감)
```

## 요구 사항

- Claude Code CLI

## 라이선스

MIT © 2026 dragon1086
