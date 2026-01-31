---
name: tool-advisor
description: Analyzes prompts to recommend optimal tools, skills, agents, harness patterns, and suggests plan mode when needed.
argument-hint: <prompt or task description>
metadata:
  author: dragon1086
  version: "1.3.0"
aliases: [ta, recommend, advisor]
---

# Tool Advisor

Analyzes your prompt to recommend: **plan mode** → **tools** → **agents** → **MCP servers** → **harness patterns**

## Terminology

| Term | Definition |
|------|------------|
| **Tool** | Built-in capability (Read, Edit, Bash, Grep, Glob, Task, WebSearch) |
| **Skill** | Custom instructions in `~/.claude/skills/` |
| **Agent** | Subagent via `Task` tool - built-in, local (`~/.claude/agents/`), or marketplace |
| **MCP** | External tool servers in `~/.claude/mcp.json` (DB, image gen, APIs) |
| **Harness** | Orchestration pattern for iterative loops (analyze→execute→verify→repeat) |

---

## Phase 1: Check Local Inventory

```bash
# Plugins
cat ~/.claude/plugins/installed_plugins.json 2>/dev/null | jq '.plugins | keys' || echo "None"
# Skills
ls ~/.claude/skills/ 2>/dev/null || echo "None"
# Agents
ls ~/.claude/agents/ 2>/dev/null || echo "None"
# MCP Servers
cat ~/.claude/mcp.json 2>/dev/null | jq '.mcpServers | keys' || echo "None"
```

---

## Phase 2: Assess Complexity & Harness Need

| Complexity | Signals | Approach | Harness |
|------------|---------|----------|---------|
| Simple | 1-2 files | Direct tools | No |
| Medium | 3-5 files | Skill or Task agent | No |
| Complex | 5+ files, design needed | Workflow skill | Optional |
| Long-running | "until", "keep trying", "반복" | **Harness required** | **Yes** |

**Harness Patterns:**
- **Goal Loop**: Retry until goal ("until tests pass")
- **Pipeline**: Sequential phases ("design → implement → verify")
- **Parallel**: Concurrent agents ("backend and frontend simultaneously")
- **Feedback**: Iterative refinement ("until quality threshold met")

---

## Phase 2.5: Plan Mode Recommendation

**When to recommend `EnterPlanMode` BEFORE tool selection:**

| Signal | Plan Mode |
|--------|-----------|
| "I'm not sure how to approach this" | **Strongly recommend** |
| 5+ files expected to change | **Recommend** |
| Architectural decisions needed | **Recommend** |
| Multiple valid approaches possible | **Recommend** |
| "design", "architect", "plan" in prompt | **Recommend** |
| New feature implementation | **Recommend** |
| 1-2 files, clear task | Not needed |
| Simple bug fix | Not needed |

**Plan Mode Output:**
```markdown
### 2.5. Plan Mode
- **Recommended**: Yes
- **Reason**: [why plan mode helps here]
- **Suggest**: Run `EnterPlanMode` first, then execute with recommended tools
```

**Key insight**: For complex tasks, planning BEFORE execution prevents wasted effort.

---

## Phase 3: Select Agent (3-tier search)

### Tier 1: Built-in Subagents (always available)

| subagent_type | Use For |
|---------------|---------|
| `Explore` | Codebase exploration, "어디서", "where", "구조" |
| `Plan` | Implementation design, "계획", "설계" |
| `Bash` | Git, build, npm, docker commands |
| `claude-code-guide` | Claude Code questions, MCP, hooks |
| `general-purpose` | Complex multi-step research |

### Tier 2: Local Custom Agents

```bash
for f in ~/.claude/agents/*.md; do [ -f "$f" ] && echo "$(basename "$f" .md)"; done
```

Check for domain-specific agents: `security-reviewer`, `api-designer`, `test-generator`, etc.

### Tier 3: Marketplace Search (if Tier 1-2 insufficient)

```
WebSearch: "Claude Code [domain] agent plugin 2026"
WebSearch: "Claude Code [task-type] skill 2026"
```

**Selection Priority**: Local custom → Built-in → Marketplace

---

## Phase 3.5: MCP Server Recommendation

Check if task requires external tools:

```bash
cat ~/.claude/mcp.json 2>/dev/null | jq '.mcpServers | keys'
```

| Task Signal | MCP Server | Purpose |
|-------------|------------|---------|
| image, thumbnail, banner | `nano-banana`, `replicate` | Image generation |
| DB, database, query | `postgres`, `sqlite` | Database access |
| browser, scrape, crawl | `puppeteer`, `playwright` | Browser automation |
| notion, docs | `notion` | Notion API |
| GitHub API | `github` | GitHub operations |
| external filesystem | `filesystem` | External file access |

**If MCP needed but not installed:**
```
WebSearch: "Claude Code [domain] MCP server 2026"
```

---

## Phase 4: Recommend Installation (if needed)

```markdown
## Recommended Installation

| Type | Name | Purpose | Install |
|------|------|---------|---------|
| Agent/Skill | [name] | [desc] | `/plugin marketplace add [source]` |

**Install now?** (yes/no)
```

---

## Output Template

```markdown
## Analysis Result

### 1. Classification
- **Type**: [development/review/exploration/...]
- **Complexity**: [simple/medium/complex/long-running]

### 2. Harness
- **Required**: [yes/no] — **Pattern**: [Goal Loop/Pipeline/Parallel/Feedback/none]

### 2.5. Plan Mode (if complexity >= medium)
- **Recommended**: [yes/no]
- **Reason**: [why plan mode helps or not needed]

### 3. Agent Recommendation
- **Source**: [built-in/local/marketplace]
- **Agent**: [name] — **Reason**: [why]

### 3.5. MCP Recommendation (if needed)
- **MCP**: [server name] — **Purpose**: [why needed]

### 4. Recommendation
**Use**: [tool/skill/agent name]
```
[usage example]
```

### 5. Installation (if needed)
| Name | Install |
|------|---------|
| [x] | `/plugin marketplace add [source]` |
```

---

## Decision Flow

1. **Check local inventory** (plugins, skills, agents, MCP)
2. **Assess complexity** → Determine if harness needed
3. **Check plan mode need** → Recommend `EnterPlanMode` if complex/uncertain
4. **Select agent**: Local custom → Built-in → Marketplace search
5. **Check MCP needs**: Image, DB, browser, APIs
6. **Recommend tool/skill/MCP** with usage guide
7. **Suggest installation** if needed (human-in-the-loop)

---

## Examples

### Example 1: Simple Task

**Input**: `Fix the typo in README.md`

**Output**:
```markdown
## Analysis Result
### 1. Classification
- **Type**: Bug fix — **Complexity**: Simple

### 2. Harness
- **Required**: No

### 2.5. Plan Mode
- **Recommended**: No — Simple single-file fix

### 4. Recommendation
**Use**: Direct tools (Read + Edit)
```

### Example 2: Complex Task with Plan Mode

**Input**: `Refactor the authentication module to use JWT tokens`

**Output**:
```markdown
## Analysis Result
### 1. Classification
- **Type**: Refactoring — **Complexity**: Complex

### 2. Harness
- **Required**: No (one-time refactoring)

### 2.5. Plan Mode
- **Recommended**: Yes
- **Reason**: Multiple files affected, architectural decision (JWT implementation strategy)
- **Suggest**: Run `EnterPlanMode` first to design the approach

### 3. Agent Recommendation
- **Source**: Built-in
- **Agent**: `Plan` → then `general-purpose` for execution

### 4. Recommendation
**Step 1**: `EnterPlanMode` — Design JWT integration strategy
**Step 2**: After plan approval, execute with `feature-dev` or direct tools
```

### Example 3: MCP + Multi-step Task

**Input**: `Create a blog thumbnail and fetch recent posts from DB to write a marketing post`

**Output**:
```markdown
## Analysis Result
### 1. Classification
- **Type**: Content creation — **Complexity**: Complex

### 2. Harness
- **Required**: No (one-time task)

### 2.5. Plan Mode
- **Recommended**: No — Clear sequential steps, no architectural decisions

### 3. Agent Recommendation
- **Agent**: `general-purpose` — Multi-step content task

### 3.5. MCP Recommendation
- **MCP**: `nano-banana` — Thumbnail generation | **Missing** ✗
- **MCP**: `postgres` — DB query | **Installed** ✓

### 4. Recommendation
**Phase 1**: Fetch data via `postgres` MCP
**Phase 2**: Generate thumbnail via `nano-banana` MCP
**Phase 3**: Write post with `general-purpose` agent

### 5. Installation
| MCP | Install |
|-----|---------|
| nano-banana | Add to `~/.claude/mcp.json` |

**Install now?** (yes/no)
```

---

## Fallback (Built-in only)

| Need | Use |
|------|-----|
| Exploration | `Task` + `Explore` |
| Planning | `Task` + `Plan` |
| Code review | `Task` + `general-purpose` |
| Claude Code help | `Task` + `claude-code-guide` |
| Commands | `Task` + `Bash` |

---

Analyze prompt: $ARGUMENTS
