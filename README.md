# 🧭 Tool Advisor

**English** | [한국어](./README.ko.md) | [日本語](./README.ja.md) | [中文](./README.zh-CN.md) | [Español](./README.es.md) | [Português](./README.pt-BR.md) | [Русский](./README.ru.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md)

**Discover your tool environment. Amplify your capabilities. (Claude Code + Codex)**

Tool Advisor scans your runtime environment — MCP servers, skills, plugins, CLI tools — and suggests optimal tool compositions as **non-binding options** with copy-paste commands. It arms the model with knowledge it wouldn't otherwise have.

![Demo](./assets/demo.gif)

## Install

**Option 1: One-line install (default: Claude Code + Codex)**
```bash
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash
```

Install for a single agent:
```bash
# Codex only
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash -s -- --agent codex

# Claude Code only
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash -s -- --agent claude-code
```

**Option 2: Via [skills.sh](https://skills.sh)**
```bash
npx skills add dragon1086/claude-skills -y --agent claude-code
npx skills add dragon1086/claude-skills -y --agent codex
```

To update, run the same command again.

## Usage

Just ask naturally:

```
"Analyze with tool-advisor: refactor the auth module"
"tool-advisor, how should I tackle this database migration?"
"What's the best approach for implementing user authentication?"
"Use $tool-advisor to analyze this task: ship v2 API migration"
```

The skill activates when you mention **tool-advisor** or ask for tool recommendations.

## What It Does

```
Your Prompt
    ↓
┌──────────────────────────────────┐
│     Tool Advisor v3.3            │
│     "Amplifier, not Commander"   │
├──────────────────────────────────┤
│ 1. Discover Environment          │
│    MCP / Skills / Plugins / CLI  │
│ 2. Analyze Task + Done When      │
│ 3. Match Capabilities            │
│ 4. Suggest Options (up to 3)     │
│ 5. Identify Gaps                 │
│ 6. Performance Tips              │
└──────────────────────────────────┘
    ↓
Options + Quick Action table
```

## Features

| Feature | Description |
|---------|-------------|
| **4-Layer Environment Scan** | Discovers MCP servers, skills, plugins, and CLI tools at runtime |
| **Completion Criteria** | Extracts "Done when" from prompts so the model knows the finish line |
| **Scale-Adaptive Output** | Small tasks get <10 lines; large tasks get full analysis |
| **Multi-Option Suggestions** | Up to 3 approaches (Methodical / Fast / Deep) — never mandates |
| **Capability Gap Analysis** | Suggests missing tools with "doable without these" disclaimer |
| **Iron Rules & Anti-Patterns** | 9 hard boundaries prevent advisor-to-executor drift; 3 concise anti-patterns |
| **Phase Enforcement** | Every phase MUST produce output or explicit "N/A" — no skipping allowed |
| **Human-in-the-loop** | Never installs without your approval |

## Example

**Input:**
```
Analyze with tool-advisor: Refactor auth module to use JWT tokens
```

**Output:**
```markdown
## Tool Advisor v3.3 — Environment & Composition Analysis

Prompt: `Refactor auth module to use JWT tokens`

### Your Environment

| Layer | Available |
|-------|-----------|
| MCP Servers | lsp, context7 |
| Skills | /feature-dev, /code-review, /tdd |
| Plugins | oh-my-claudecode (33 agents) |
| CLI | git, node, pytest, docker |

### Task Profile
- **Type**: Modification / **Scale**: Large / **Traits**: Needs planning, has tests
- **Done when**: all session-based auth replaced with JWT, tests pass, no session imports remain

### Relevant Capabilities
- `lsp_diagnostics` — Type-check after changes
- `ast_grep_search` — Find all session usage patterns
- `/feature-dev` — Guided development workflow

### Suggested Approaches

**A — Methodical** (Recommended)
Task(Explore) -> EnterPlanMode -> Edit in stages -> Bash(pytest)

**B — Skill-guided**
/feature-dev (handles the full flow)

**C — Agent-parallel**
[Task(Explore, bg), WebSearch("JWT best practices")] -> plan -> implement

---

## Quick Action

| Approach | Copy & Paste |
|----------|--------------|
| Methodical | Start with `Task(Explore)` to scout the codebase |
| Skill-guided | `/feature-dev` then describe the refactoring |
| Fast | `Glob("**/auth/**") + Grep("session")` parallel |

-> Recommended: "Methodical" (large refactoring benefits from planning first)
```

## Requirements

- Claude Code CLI and/or Codex CLI

## License

MIT © 2026 dragon1086
