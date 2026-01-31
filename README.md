# 🧭 Tool Advisor

**Stop guessing which tool to use. Let Claude Code decide.**

Tool Advisor analyzes your prompt and recommends the optimal combination of tools, agents, MCP servers, and orchestration patterns — with **copy-paste commands** you can run immediately.

![Demo](./assets/demo.gif)

## Install

```bash
# Add marketplace (one-time)
/plugin marketplace add dragon1086/claude-skills

# Install globally (default)
/plugin install tool-advisor@adv

# Or install for current project only
/plugin install tool-advisor@adv --scope project
```

## Usage

Just ask naturally:

```
"Analyze this task with tool-advisor: refactor the auth module"
"What's the best approach for implementing user authentication?"
"tool-advisor, how should I tackle this database migration?"
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
│ 8. Provide Quick Action table   │  ← NEW
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
Analyze this with tool-advisor: Refactor auth module to use JWT tokens
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

| Your situation       | Copy & paste                        |
|---------------------|-------------------------------------|
| Plan first          | `Plan Mode로 JWT 리팩토링 계획 세워줘` |
| Guided development  | `/feature-dev`                      |
| Just do it          | `auth를 JWT로 리팩토링해줘`           |

→ Recommended: "Plan first" (5+ files, security-sensitive)
```

## Command Reference

| Command | Description |
|---------|-------------|
| `/adv:tool-advisor` | Full name |
| `/adv:ta` | Short form |
| `/adv:도구추천` | Korean alias |

## Requirements

- Claude Code CLI
- Optional: `jq` for detailed inventory check

## Documentation

- [한국어 문서](./README.ko.md)
- [Changelog](./CHANGELOG.md)

## License

MIT © 2026 dragon1086
