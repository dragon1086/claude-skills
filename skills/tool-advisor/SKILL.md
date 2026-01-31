---
name: tool-advisor
description: Analyzes natural language prompts to recommend optimal Claude Code tools, skills, and agents. Suggests harness patterns for complex iterative tasks and recommends tool installation when needed.
argument-hint: <prompt or task description>
metadata:
  author: dragon1086
  version: "1.0.0"
aliases:
  - ta
  - recommend
  - advisor
---

# Tool Advisor - Optimal Tool Recommendation Skill

Analyzes your natural language prompt to:
1. **Recommend optimal tools** - Select the best from your locally installed tools
2. **Suggest harness patterns** - Propose autonomous loop structures for complex long-running tasks
3. **Recommend installation** - Search and suggest tools if none are suitable

## Terminology

| Term | Definition |
|------|------------|
| **Tool** | Built-in Claude Code capability (Read, Edit, Bash, Grep, Glob, etc.) |
| **Skill** | Custom instructions in `~/.claude/skills/` or `.claude/skills/` that extend Claude's behavior |
| **Agent** | Specialized subagent in `~/.claude/agents/` for delegating specific tasks |
| **Plugin** | Packaged collection of skills/agents from a marketplace |
| **Harness** | Orchestration pattern for autonomous iterative loops (analyze→execute→verify→repeat) |

## Analysis Process

### Phase 1: Check Local Tool Inventory

**Run these commands first:**

```bash
# 1. Check installed plugins (if exists)
test -f ~/.claude/plugins/installed_plugins.json && \
  cat ~/.claude/plugins/installed_plugins.json | jq '.plugins | keys' 2>/dev/null || \
  echo "No plugins installed"

# 2. Check installed skills
ls ~/.claude/skills/ 2>/dev/null || echo "No custom skills"

# 3. Check installed agents
ls ~/.claude/agents/ 2>/dev/null || echo "No custom agents"
```

### Phase 2: Assess Task Complexity

| Complexity | Characteristics | Recommended Approach | Harness Needed |
|------------|-----------------|---------------------|----------------|
| **Simple** | 1-2 files, clear task | Direct tools (Read/Edit) | No |
| **Medium** | 3-5 files, multiple steps | Task agent or skill | No |
| **Complex** | 5+ files, design+implement+test | `/feature-dev` or workflow | Optional |
| **Long-running** | Loop until goal, multi-phase validation | **Harness pattern required** | **Yes** |

### Phase 3: Determine Harness Necessity

**Signals that harness is needed:**
- "until complete", "keep trying", "iterate until"
- "review → design → develop → QA → test" full cycle
- "automatically", "autonomously", "long-term"
- Multiple agents need coordination
- Auto-retry/fix on failure required

**Harness Pattern Types:**

| Pattern | Description | Use When |
|---------|-------------|----------|
| **Goal Loop** | Autonomous retry until goal achieved | "Keep trying until tests pass" |
| **Pipeline** | Sequential phases with validation | "Design, implement, then verify" |
| **Parallel Orchestration** | Multiple agents working concurrently | "Backend and frontend in parallel" |
| **Feedback Loop** | Iterative refinement with review | "Refine until quality threshold met" |

### Phase 4: Recommend Tool Installation (if needed)

If no suitable tools are locally available:

1. **Search for available tools**
```
WebSearch: "Claude Code [task-type] plugin skill 2026"
```

2. **Suggest installation (Human-in-the-loop)**
```markdown
## Recommended Tool Installation

No suitable tools found locally for [task].

### Recommended Tools

| Tool | Purpose | Install Command |
|------|---------|-----------------|
| [tool1] | [description] | `/plugin install [tool1]` |
| [tool2] | [description] | `/plugin install [tool2]` |

**Would you like to install these?** (yes/no/some)
```

3. **Proceed only after user approval**

---

## Output Format

Prompt: `$ARGUMENTS`

### Analysis Result Template

```markdown
## Prompt Analysis Result

### 1. Task Classification
- **Primary type**: [development/review/exploration/documentation/...]
- **Secondary type**: [...]
- **Complexity**: [simple/medium/complex/long-running]

### 2. Harness Necessity
- **Required**: [yes/no]
- **Reason**: [why needed or not]
- **Recommended pattern**: [Goal Loop/Pipeline/Parallel/Feedback/none]

### 3. Local Tool Status
- **Available**: [list of usable tools]
- **Missing**: [tools needed but not installed]

### 4. Recommendation

#### A. If local tools are sufficient

**Optimal choice**: [tool name]
**Usage**:
```
[command or prompt]
```

#### B. If additional tools needed

**Recommended installation**:

| Tool | Purpose | Install |
|------|---------|---------|
| [tool] | [description] | `/plugin marketplace add [source]` then `/plugin install [tool]` |

**After installation**:
```
[usage command]
```

**Install now?**

### 5. Workflow Suggestion (if applicable)

```
[step-by-step execution order]
```
```

---

## Built-in Tool Reference

These tools are always available in Claude Code:

| Tool | Purpose | Example |
|------|---------|---------|
| `Read` | Read file contents | `Read file.js` |
| `Edit` | Modify existing files | `Edit with old/new string` |
| `Write` | Create new files | `Write to path with content` |
| `Bash` | Execute shell commands | `Bash: npm test` |
| `Glob` | Find files by pattern | `Glob: **/*.ts` |
| `Grep` | Search file contents | `Grep: function.*export` |
| `Task` | Delegate to subagent | `Task: explore codebase` |
| `WebSearch` | Search the internet | `WebSearch: React 19 features` |
| `WebFetch` | Fetch URL content | `WebFetch: https://...` |

---

## Decision Tree

```
User Prompt
      │
      ▼
┌─────────────────┐
│ Harness needed? │
└────────┬────────┘
         │
    ┌────┴────┐
    ▼         ▼
  [Yes]      [No]
    │          │
    ▼          ▼
 Local     Complexity?
harness        │
available? ┌───┴───┐
    │      ▼       ▼
┌───┴───┐ [Complex] [Simple/Medium]
▼       ▼    │          │
[Yes] [No]   │          ▼
  │     │    │     Local tools
  │     ▼    │     sufficient?
  │  WebSearch    │
  │  + suggest    ├───┬───┐
  │  install  │   ▼       ▼
  ▼     │     │  [Yes]   [No]
Use   Install │    │       │
guide  then   │    │   WebSearch
       use    │    │   + suggest
              │    ▼       │
              │ Direct     ▼
              │ tools    Install
              │ or skill then use
              ▼
         Workflow skill
         or harness
```

---

## Execution Guidelines

1. **Phase 1**: Run Bash to check local tool inventory
2. **Phase 2**: Analyze prompt (complexity, harness necessity)
3. **Phase 3**: Determine if local tools are sufficient
4. **Phase 4**: If not, WebSearch for tools → suggest installation
5. **Phase 5**: Provide final recommendation with usage guide

**Important**: Tool installation requires user approval (Human-in-the-loop)

---

## Examples

### Example 1: Simple Task

**Input**:
```
Fix the typo in README.md
```

**Output**:
```markdown
## Prompt Analysis Result

### 1. Task Classification
- **Primary type**: Bug fix
- **Complexity**: Simple (1 file, clear task)

### 2. Harness Necessity
- **Required**: No
- **Reason**: Single file, one-time fix

### 3. Recommendation

**Optimal choice**: Direct tools (Read + Edit)

**Usage**:
```
1. Read README.md to find the typo
2. Edit to fix it
```
```

### Example 2: Complex Feature Development

**Input**:
```
Review auth.js and refactor to use JWT tokens.
Add tests and update the documentation.
Use plan mode approach.
```

**Output**:
```markdown
## Prompt Analysis Result

### 1. Task Classification
- **Primary type**: Feature development/refactoring
- **Secondary type**: Testing, documentation
- **Complexity**: Complex (5+ files, design needed)

### 2. Harness Necessity
- **Required**: Optional (multi-phase but one-time)
- **Reason**: Design→implement→test cycle, but not iterative
- **Recommended pattern**: None (but consider Pipeline if issues arise)

### 3. Local Tool Status
- **Available**: feature-dev, code-review
- **Missing**: None

### 4. Recommendation

**Optimal choice**: `/feature-dev`

**Reason**:
- "plan mode" requested → design-first approach
- Pattern analysis required → guided workflow helpful
- Multi-phase with checkpoints → feature-dev provides structure

**Usage**:
```
/feature-dev

Prompt to enter:
Review auth.js authentication flow.
Refactor to use JWT tokens instead of sessions.
Add unit tests for token validation.
Update API documentation.
```

### 5. Alternatives
1. **EnterPlanMode** - For more freeform planning
2. **Direct approach** - If familiar with the codebase
```

### Example 3: Long-running Iterative Task

**Input**:
```
Keep running the test suite and fix failures until all tests pass.
```

**Output**:
```markdown
## Prompt Analysis Result

### 1. Task Classification
- **Primary type**: Testing/debugging
- **Complexity**: Long-running (loop until goal)

### 2. Harness Necessity
- **Required**: Yes
- **Reason**: "until all tests pass" = goal-based loop
- **Recommended pattern**: Goal Loop

### 3. Recommendation

**Approach**: Goal Loop Harness

**Structure**:
```
┌─────────────────────────────────┐
│         Goal Loop Harness        │
├─────────────────────────────────┤
│                                  │
│  ┌────────┐  ┌────────┐  ┌────┐ │
│  │Run test│─▶│Analyze │─▶│Fix │ │
│  └────────┘  │failures│  └──┬─┘ │
│       ▲      └────────┘     │   │
│       │                     │   │
│       └─────────────────────┘   │
│                                  │
│  Exit: All tests pass OR        │
│        max iterations reached   │
└─────────────────────────────────┘
```

**Usage**:
```bash
# Manual loop approach (built-in)
while ! npm test; do
  echo "Tests failed, analyzing..."
  # Claude analyzes and fixes
done
```

**Or use orchestration skill if installed**
```
```

---

## Fallback Recommendations

If specialized tools are unavailable, use these built-in approaches:

| Need | Fallback Approach |
|------|-------------------|
| Iterative development | Shell script loop + Claude analysis |
| Multi-agent coordination | Sequential prompts with shared context |
| Complex planning | Markdown file to track state/progress |
| Code review | Use `Task` with `code-reviewer` agent type |
| Codebase exploration | Use `Task` with `Explore` agent type |

---

Analyze prompt: $ARGUMENTS
