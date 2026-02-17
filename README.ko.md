# 🧭 Tool Advisor

[English](./README.md) | **한국어** | [日本語](./README.ja.md) | [中文](./README.zh-CN.md) | [Español](./README.es.md) | [Português](./README.pt-BR.md) | [Русский](./README.ru.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md)

**당신의 도구 환경을 발견하고 역량을 증폭합니다. (Claude Code + Codex)**

Tool Advisor는 런타임 환경을 스캔하여 — MCP 서버, 스킬, 플러그인, CLI 도구 — 최적의 도구 조합을 **강제 아닌 옵션**으로 제시합니다. 모델이 스스로 알지 못하는 정보를 제공하여 잠재력을 극대화합니다.

![Demo](./assets/demo.gif)

## 설치

**방법 1: 원라인 설치 (기본: Claude Code + Codex 동시 설치)**
```bash
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash
```

특정 에이전트만 설치하려면:
```bash
# Codex만 설치
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash -s -- --agent codex

# Claude Code만 설치
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash -s -- --agent claude-code
```

**방법 2: [skills.sh](https://skills.sh) 사용**
```bash
npx skills add dragon1086/claude-skills -y --agent claude-code
npx skills add dragon1086/claude-skills -y --agent codex
```

업데이트하려면 같은 명령어를 다시 실행하세요.

## 사용법

자연스럽게 대화하듯 요청하세요:

```
"tool-advisor로 분석해줘: 인증 모듈 리팩토링"
"tool-advisor, 이 데이터베이스 마이그레이션 어떻게 해야 해?"
"사용자 인증 구현하려면 어떤 방법이 좋을까?"
"$tool-advisor로 이 작업 분석해줘: v2 API 마이그레이션 배포"
```

**tool-advisor**를 언급하거나 도구 추천을 요청하면 스킬이 활성화됩니다.

## 동작 방식

```
프롬프트 입력
    ↓
┌──────────────────────────────────┐
│     Tool Advisor v3.3            │
│     "증폭기, 지휘관이 아닌"       │
├──────────────────────────────────┤
│ 1. 환경 발견                      │
│    MCP / 스킬 / 플러그인 / CLI    │
│ 2. 태스크 분석 + 완료 기준        │
│ 3. 역량 매칭                      │
│ 4. 옵션 제시 (최대 3개)           │
│ 5. 갭 분석                        │
│ 6. 성능 팁                        │
└──────────────────────────────────┘
    ↓
옵션 + Quick Action 테이블
```

## 주요 기능

| 기능 | 설명 |
|------|------|
| **4-Layer 환경 스캔** | 런타임에 MCP 서버, 스킬, 플러그인, CLI 도구를 발견 |
| **완료 기준** | 프롬프트에서 "Done when"을 추출하여 모델이 목표를 인지 |
| **규모 적응형 출력** | 소규모 태스크 <10줄, 대규모 태스크 전체 분석 |
| **다중 옵션 제시** | 최대 3가지 접근법 (안전 / 빠름 / 깊이) — 강제하지 않음 |
| **역량 갭 분석** | 미설치 도구 제안 + "없어도 가능" 명시 |
| **Iron Rules & Anti-Patterns** | 9개 경계 규칙으로 advisor→executor 역할 이탈 방지; 3개 안티패턴 |
| **단계별 출력 강제** | 모든 단계가 출력을 생성하거나 명시적 "N/A" 표시 — 건너뛰기 불가 |
| **Human-in-the-loop** | 사용자 승인 없이 절대 설치하지 않음 |

## 예시

**입력:**
```
tool-advisor로 분석해줘: 인증 모듈을 JWT로 리팩토링
```

**출력:**
```markdown
## Tool Advisor v3.3 — 환경 & 구성 분석

Prompt: `인증 모듈을 JWT로 리팩토링`

### 당신의 환경

| 레이어 | 사용 가능 |
|--------|----------|
| MCP 서버 | lsp, context7 |
| 스킬 | /feature-dev, /code-review, /tdd |
| 플러그인 | oh-my-claudecode (33 에이전트) |
| CLI | git, node, pytest, docker |

### 태스크 프로필
- **유형**: 수정 / **규모**: 대규모 / **특성**: 설계 필요, 테스트 있음
- **Done when**: 세션 기반 인증이 JWT로 교체, 테스트 통과, 세션 import 없음

### 관련 역량
- `lsp_diagnostics` — 변경 후 타입 체크
- `ast_grep_search` — 세션 사용 패턴 구조적 검색
- `/feature-dev` — 가이드된 개발 워크플로우

### 접근법 제안

**A — 체계적** (권장)
Task(Explore) -> EnterPlanMode -> 단계별 Edit -> Bash(pytest)

**B — 스킬 활용**
/feature-dev (전체 플로우를 자동 처리)

**C — 에이전트 병렬**
[Task(Explore, bg), WebSearch("JWT best practices")] -> 설계 -> 구현

---

## Quick Action

| 접근법 | 복사해서 붙여넣기 |
|--------|------------------|
| 체계적 | `Task(Explore)`로 코드베이스 조사부터 시작 |
| 스킬 활용 | `/feature-dev` 후 리팩토링 설명 |
| 빠르게 | `Glob("**/auth/**") + Grep("session")` 병렬 |

-> 권장: "체계적" (대규모 리팩토링은 설계 우선이 유리)
```

## 요구 사항

- Claude Code CLI 또는 Codex CLI

## 라이선스

MIT © 2026 dragon1086
