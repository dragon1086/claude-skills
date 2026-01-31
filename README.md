# 🧭 Tool Advisor

> **"Which tool should I use?"** — Stop guessing. Start knowing.

You've installed dozens of plugins, skills, and agents in Claude Code.
But every time you start a new task, the same question hits:
*"Which one is the right tool for THIS job?"*

**Tool Advisor analyzes your prompt and recommends the optimal tool, skill, agent, and orchestration pattern — then Claude Code executes it for you.**

![Tool Advisor Demo](./assets/demo.gif)

## ⚡ Quick Install

```bash
/plugin marketplace add dragon1086/claude-skills
/plugin install tool-advisor@dragon1086-skills
```

That's it. Two commands. You're ready.

---

## 🚀 What's New in v1.2

- **MCP Server Recommendation**: Image gen, DB, browser automation, APIs
- **3-Tier Agent Search**: Built-in → Local → Marketplace
- **Multi-Agent Orchestration**: Recommends agent combinations for complex tasks
- **Token Efficient**: ~1,500 tokens (70% reduction from v1.0)

---

## 😫 Before vs 😊 After

| Without Tool Advisor | With Tool Advisor |
|---------------------|-------------------|
| "Explore? Grep? Task? 뭘 써야 하지..." | `/ta 에러 처리 어디서 해?` → `Explore` 추천 |
| "하네스? 오케스트레이션? 그게 뭔데?" | 자동으로 Goal Loop 패턴 제안 |
| "보안 리뷰 에이전트가 있나?" | 3-tier 검색 (로컬 → 마켓플레이스) |
| "이미지 생성하려면 MCP 설정을..." | `nano-banana` MCP 추천 + 설정 가이드 |
| "여러 에이전트 조합은 어떻게?" | 추천 → "해줘" → Claude Code 자동 실행 |

---

## ✨ Features

### 1. 🔍 Smart Task Analysis
Classifies complexity: Simple → Medium → Complex → Long-running

### 2. 🤖 3-Tier Agent Search
```
Tier 1: Built-in (Explore, Plan, Bash, claude-code-guide, general-purpose)
    ↓
Tier 2: Local Custom (~/.claude/agents/)
    ↓
Tier 3: Marketplace Search (if needed)
```

### 2.5. 🔌 MCP Server Recommendation
| Task | MCP Server |
|------|------------|
| Image generation | nano-banana, replicate |
| Database | postgres, sqlite |
| Browser automation | puppeteer, playwright |
| Notion/Docs | notion |
| GitHub API | github |

### 3. 🔄 Harness Pattern Recommendation
- **Goal Loop**: "테스트 통과할 때까지 반복"
- **Pipeline**: "설계 → 구현 → 검증"
- **Parallel**: "백엔드와 프론트 동시에"
- **Feedback**: "품질 기준 충족까지"

### 4. 🎯 Multi-Agent Orchestration
Recommends agent combinations → You accept → **Claude Code executes everything automatically**

```
Tool Advisor: "Use Explore + Plan + Goal Loop"
You: "해줘"
Claude Code: (executes the entire workflow)
```

### 5. 🛒 Marketplace Integration
Missing the right tool? Searches and suggests installation — with your approval.

---

## 📊 Examples

### Simple Task
```
/ta Fix the typo in README.md
```
→ **Use**: Direct tools (Read + Edit)

### Complex + MCP + Marketplace
```
/ta 블로그 썸네일 만들고 DB에서 최근 글 가져와서 마케팅 포스트 작성해줘
```
→ **Output**:
```markdown
## Analysis Result

### 1. Classification
- Type: Content creation — Complexity: Complex

### 3. Agent Recommendation
- Agent: general-purpose

### 3.5. MCP Recommendation
- MCP: nano-banana (thumbnail) — Missing ✗
- MCP: postgres (DB query) — Installed ✓

### 5. Installation
| Type | Name | Install |
|------|------|---------|
| MCP | nano-banana | Add to ~/.claude/mcp.json |

Install now? (yes/no)
```

**You**: "설치하고 실행해"
**Claude Code**: *(configures MCP, generates image, queries DB, writes post!)*

---

## 🎯 Real-World Use Cases

### 1. 오픈소스 프로젝트 마케팅
```
/ta prism-insight 최근 업데이트로 블로그 포스트 작성하고 썸네일도 만들어줘
```
**Tool Advisor 추천:**
- `Explore` → CHANGELOG 분석
- `nano-banana` MCP → 썸네일 생성
- `general-purpose` → 포스트 작성

**결과**: 한 번의 요청으로 분석 → 이미지 → 글 작성 완료

### 2. 보안 리뷰 + 자동 수정
```
/ta 이 코드 보안 취약점 검토하고 수정해서 테스트 통과할 때까지 반복해줘
```
**Tool Advisor 추천:**
- `security-reviewer` (마켓플레이스) 또는 `Explore` (fallback)
- **Goal Loop** 하네스 패턴
- `Bash` → 테스트 실행

**결과**: 취약점 발견 → 수정 → 테스트 → 반복 (자동)

### 3. 레거시 코드 마이그레이션
```
/ta 이 프로젝트 TypeScript로 마이그레이션 계획 세우고 실행해줘
```
**Tool Advisor 추천:**
- `Plan` → 마이그레이션 전략 수립
- `Explore` → 코드베이스 분석
- **Pipeline** 하네스 (분석 → 변환 → 테스트)

**결과**: 체계적인 단계별 마이그레이션

### 4. 데이터 기반 리포트 생성
```
/ta DB에서 이번 달 매출 데이터 가져와서 리포트 만들어줘
```
**Tool Advisor 추천:**
- `postgres` MCP → DB 쿼리
- `general-purpose` → 리포트 작성
- `Write` → 파일 저장

**결과**: 데이터 추출부터 리포트 완성까지 자동화

---

## 🎮 How It Works

```
┌─────────────────┐
│  Your Prompt    │
└────────┬────────┘
         ▼
┌─────────────────┐
│  Tool Advisor   │  ← Analyzes & Recommends
└────────┬────────┘
         ▼
┌─────────────────┐
│  You: "해줘"    │  ← Accept
└────────┬────────┘
         ▼
┌─────────────────┐
│  Claude Code    │  ← Executes Everything
│  (Auto-pilot)   │
└─────────────────┘
```

**Tool Advisor = Navigation**
**Claude Code = Self-driving car**

You just say where to go. It drives.

---

## 💰 Token Efficient

| Version | Lines | Tokens |
|---------|-------|--------|
| v1.0 | 699 | ~5,500 |
| v1.1 | 207 | ~1,500 |
| v1.2 | 230 | ~1,600 |

**70% reduction** — No billing surprises.

---

## 🤔 FAQ

<details>
<summary><strong>Q: Does it work if I have no plugins installed?</strong></summary>

Yes! It recommends built-in tools and subagents first, then suggests marketplace plugins only if needed.
</details>

<details>
<summary><strong>Q: Will it install things without asking?</strong></summary>

Never. All installations require your explicit approval (Human-in-the-loop).
</details>

<details>
<summary><strong>Q: What's multi-agent orchestration?</strong></summary>

Tool Advisor recommends combinations like "Explore → Plan → Goal Loop". When you accept, Claude Code automatically executes each agent in sequence, passes results between them, and handles retries.
</details>

<details>
<summary><strong>Q: Does it work with my custom agents?</strong></summary>

Yes! It scans `~/.claude/agents/` for your custom agents and prioritizes them over built-ins when appropriate.
</details>

<details>
<summary><strong>Q: Is it expensive to use?</strong></summary>

No. v1.1 uses only ~1,500 tokens — less than a typical code file. We optimized aggressively.
</details>

---

## 📋 Requirements

- Claude Code CLI
- Optional: `jq` (for detailed plugin inventory)

---

## 🤝 Contributing

Found a bug? Have an idea? [Open an issue](https://github.com/dragon1086/claude-skills/issues) or submit a PR.

---

## 📜 License

MIT © 2026 dragon1086
