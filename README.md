# 🧭 Tool Advisor

**English** | [한국어](./README.ko.md) | [日本語](./README.ja.md) | [中文](./README.zh-CN.md) | [Español](./README.es.md) | [Português](./README.pt-BR.md) | [Русский](./README.ru.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md)

**Stop guessing which tool to use. Let Claude Code decide.**

Tool Advisor analyzes your prompt and recommends the optimal combination of tools, agents, MCP servers, and orchestration patterns — with **copy-paste commands** you can run immediately.

![Demo](./assets/demo.gif)

## Install

**Option 1: One-line install**
```bash
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash
```

**Option 2: Via [skills.sh](https://skills.sh)**
```bash
npx skills add dragon1086/claude-skills -y --agent claude-code
```

To update, run the same command again.

## Usage

Just ask naturally:

```
"Analyze with tool-advisor: refactor the auth module"
"tool-advisor, how should I tackle this database migration?"
"What's the best approach for implementing user authentication?"
```

The skill activates when you mention **tool-advisor** or ask for tool recommendations.

## What It Does

```
Your Prompt
    ↓
┌─────────────────────────────────┐
│        Tool Advisor             │
├─────────────────────────────────┤
│ 1. Check local inventory        │
│ 2. Assess complexity            │
│ 3. Detect harness needs         │
│ 4. Recommend plan mode?         │
│ 5. Select agents (3-tier)       │
│ 6. Check MCP needs              │
│ 7. Suggest installation         │
│ 8. Provide Quick Action table   │
└─────────────────────────────────┘
    ↓
🎯 Copy-paste commands ready to run
```

## Features

| Feature | Description |
|---------|-------------|
| **Quick Action Table** | Copy-paste commands for immediate execution |
| **Plan Mode Detection** | Recommends `EnterPlanMode` for complex tasks |
| **Harness Patterns** | Detects "until", "keep trying" → Ralph pattern |
| **3-Tier Agent Search** | Built-in → Local custom → Marketplace |
| **MCP Recommendation** | Shows install status (✅/❌) with alternatives |
| **Human-in-the-loop** | Never installs without your approval |

## Example

**Input:**
```
Analyze with tool-advisor: Refactor auth module to use JWT tokens
```

**Output:**
```markdown
## Analysis Result

### 1. Classification
- Type: Refactoring/Architecture
- Complexity: Complex (5+ files)

### 2. Harness
- Required: No

### 3. Plan Mode
- Recommended: Yes
- Reason: Multiple files, security-sensitive

### 4. Agent
- feature-dev (installed)
- backend-developer (local agent)
- security-engineer (local agent)

### 5. Recommendation
Use /feature-dev with Plan Mode

---

## 🎯 Quick Action

| Your situation       | Copy & paste                     |
|---------------------|----------------------------------|
| Plan first          | `Plan the JWT refactoring`       |
| Guided development  | `/feature-dev`                   |
| Just do it          | `Refactor auth to use JWT`       |

→ Recommended: "Plan first" (5+ files, security-sensitive)
```

## Requirements

- Claude Code CLI

## License

MIT © 2026 dragon1086
