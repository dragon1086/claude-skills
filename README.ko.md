# 🧭 Tool Advisor

**어떤 도구를 써야 할지 고민하지 마세요. Claude Code가 알아서 추천합니다.**

Tool Advisor는 프롬프트를 분석하여 최적의 도구, 에이전트, MCP 서버, 오케스트레이션 패턴 조합을 추천합니다.

![Demo](./assets/demo.gif)

## 설치

```bash
# 마켓플레이스 추가 (최초 1회)
/plugin marketplace add dragon1086/claude-skills

# 전역 설치 (기본값)
/plugin install tool-advisor@d1086

# 또는 현재 프로젝트에만 설치
/plugin install tool-advisor@d1086 --scope project
```

## 사용법

### 슬래시 커맨드
```bash
/d1086:ta "작업 설명"
/d1086:tool-advisor "작업 설명"
```

### 자연어 호출
대화 중에 자연스럽게 호출할 수도 있습니다:
```
"tool-advisor 스킬로 이 작업 분석해줘"
"tool-advisor를 써서 최적 도구 추천해줘"
```

## 동작 방식

```
프롬프트 입력
    ↓
┌─────────────────────────────┐
│      Tool Advisor           │
├─────────────────────────────┤
│ 1. 로컬 인벤토리 확인        │
│ 2. 복잡도 평가               │
│ 3. Plan Mode 필요 여부       │
│ 4. 에이전트 선택 (3단계)      │
│ 5. MCP 필요 여부 확인        │
│ 6. 설치 제안                 │
└─────────────────────────────┘
    ↓
최적 추천 결과
```

## 주요 기능

| 기능 | 설명 |
|------|------|
| **Plan Mode 감지** | 복잡한 작업은 실행 전 `EnterPlanMode` 추천 |
| **3단계 에이전트 검색** | 빌트인 → 로컬 커스텀 → 마켓플레이스 |
| **MCP 추천** | 이미지 생성, 데이터베이스, 브라우저 자동화, API |
| **하네스 패턴** | 목표 루프, 파이프라인, 병렬 실행 |
| **Human-in-the-loop** | 사용자 승인 없이 절대 설치하지 않음 |

## 예시

**입력:**
```
/d1086:ta 인증 모듈을 JWT로 리팩토링해줘
```

**출력:**
```
## 분석 결과

### 1. 분류
- 유형: 리팩토링 — 복잡도: Complex

### 2.5. Plan Mode
- 추천: 예
- 이유: 여러 파일 수정, 아키텍처 결정 필요

### 3. 에이전트
- 에이전트: Plan → general-purpose

### 4. 추천
Step 1: EnterPlanMode — JWT 전략 설계
Step 2: 승인 후 feature-dev로 실행
```

## 명령어 레퍼런스

| 명령어 | 설명 |
|--------|------|
| `/d1086:ta` | 짧은 형태 |
| `/d1086:tool-advisor` | 전체 이름 |
| `/d1086:recommend` | 별칭 |
| `/d1086:advisor` | 별칭 |

## 설치 범위

| 범위 | 명령어 | 위치 |
|------|--------|------|
| 전역 (기본값) | `/plugin install tool-advisor@d1086` | `~/.claude/` |
| 프로젝트 | `/plugin install tool-advisor@d1086 --scope project` | `.claude/` |

## 요구 사항

- Claude Code CLI
- 선택: `jq` (상세 인벤토리 확인용)

## 라이선스

MIT © 2026 dragon1086
