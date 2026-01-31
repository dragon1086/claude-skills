---
name: tool-advisor
description: Analyzes prompts to recommend optimal tools, skills, agents, and harness patterns. Searches marketplace if needed.
argument-hint: <prompt or task description>
metadata:
  author: dragon1086
  version: "1.2.0"
aliases: [ta, recommend, advisor]
---

# Tool Advisor

Analyzes your prompt to recommend: **tools** → **skills** → **agents** → **MCP servers** → **harness patterns**

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
- **Goal Loop**: Retry until goal ("테스트 통과할 때까지")
- **Pipeline**: Sequential phases ("설계 → 구현 → 검증")
- **Parallel**: Concurrent agents ("백엔드와 프론트 동시에")
- **Feedback**: Iterative refinement ("품질 기준 충족까지")

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
| 이미지 생성, thumbnail, banner | `nano-banana`, `replicate` | Image generation |
| DB 쿼리, 데이터베이스 | `postgres`, `sqlite` | Database access |
| 브라우저, 스크래핑, 크롤링 | `puppeteer`, `playwright` | Browser automation |
| 노션, 문서 | `notion` | Notion API |
| GitHub API | `github` | GitHub operations |
| 파일 시스템 (외부) | `filesystem` | External file access |

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
3. **Select agent**: Local custom → Built-in → Marketplace search
4. **Check MCP needs**: Image, DB, browser, APIs
5. **Recommend tool/skill/MCP** with usage guide
6. **Suggest installation** if needed (human-in-the-loop)

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

### 4. Recommendation
**Use**: Direct tools (Read + Edit)
```

### Example 2: Complex + MCP + Marketplace

**Input**: `블로그 썸네일 이미지 만들고, DB에서 최근 글 가져와서 마케팅 포스트 작성해줘`

**Output**:
```markdown
## Analysis Result
### 1. Classification
- **Type**: Content creation + Data retrieval — **Complexity**: Complex

### 2. Harness
- **Required**: No (one-time task)

### 3. Agent Recommendation
- **Source**: Built-in
- **Agent**: `general-purpose` — **Reason**: Multi-step content task

### 3.5. MCP Recommendation
- **MCP**: `nano-banana` — **Purpose**: Thumbnail image generation
- **MCP**: `postgres` — **Purpose**: Fetch recent posts from DB

**Installed**: postgres ✓ | **Missing**: nano-banana ✗

### 4. Recommendation
**Phase 1**: Fetch data via `postgres` MCP
**Phase 2**: Generate thumbnail via `nano-banana` MCP
**Phase 3**: Write marketing post with `general-purpose` agent

### 5. Installation
| Type | Name | Install |
|------|------|---------|
| MCP | nano-banana | Add to `~/.claude/mcp.json` |

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
