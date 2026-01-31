# 🧭 Tool Advisor

**Stop guessing which tool to use. Let Claude Code decide.**

Tool Advisor analyzes your prompt and recommends the optimal combination of tools, agents, MCP servers, and orchestration patterns.

![Demo](./assets/demo.gif)

## Install

```bash
# Add marketplace (one-time)
/plugin marketplace add dragon1086/claude-skills

# Install globally (default)
/plugin install tool-advisor@d1086

# Or install for current project only
/plugin install tool-advisor@d1086 --scope project
```

## Usage

### Slash Command
```bash
/d1086:ta "your task description"
/d1086:tool-advisor "your task description"
```

### Natural Language
You can also invoke it naturally in conversation:
```
"Use tool-advisor to analyze this task: refactor the auth module"
"tool-advisor 스킬로 이 작업 분석해줘"
```

## What It Does

```
Your Prompt
    ↓
┌─────────────────────────────┐
│      Tool Advisor           │
├─────────────────────────────┤
│ 1. Check local inventory    │
│ 2. Assess complexity        │
│ 3. Recommend plan mode?     │
│ 4. Select agents (3-tier)   │
│ 5. Check MCP needs          │
│ 6. Suggest installation     │
└─────────────────────────────┘
    ↓
Optimal Recommendation
```

## Features

| Feature | Description |
|---------|-------------|
| **Plan Mode Detection** | Recommends `EnterPlanMode` for complex tasks before execution |
| **3-Tier Agent Search** | Built-in → Local custom → Marketplace |
| **MCP Recommendation** | Image gen, database, browser automation, APIs |
| **Harness Patterns** | Goal loops, pipelines, parallel execution |
| **Human-in-the-loop** | Never installs without your approval |

## Example

**Input:**
```
/d1086:ta Refactor auth module to use JWT tokens
```

**Output:**
```
## Analysis Result

### 1. Classification
- Type: Refactoring — Complexity: Complex

### 2.5. Plan Mode
- Recommended: Yes
- Reason: Multiple files, architectural decision needed

### 3. Agent
- Agent: Plan → general-purpose

### 4. Recommendation
Step 1: EnterPlanMode — Design JWT strategy
Step 2: Execute with feature-dev after approval
```

## Command Reference

| Command | Description |
|---------|-------------|
| `/d1086:ta` | Short form |
| `/d1086:tool-advisor` | Full name |
| `/d1086:recommend` | Alias |
| `/d1086:advisor` | Alias |

## Installation Scopes

| Scope | Command | Location |
|-------|---------|----------|
| Global (default) | `/plugin install tool-advisor@d1086` | `~/.claude/` |
| Project | `/plugin install tool-advisor@d1086 --scope project` | `.claude/` |

## Requirements

- Claude Code CLI
- Optional: `jq` for detailed inventory check

## Documentation

- [한국어 문서](./README.ko.md)

## License

MIT © 2026 dragon1086

---

Sources: [Claude Code Plugins Documentation](https://code.claude.com/docs/en/plugins)
