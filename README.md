# Claude Skills by dragon1086

> Curated skills for Claude Code power users - tool selection, workflow optimization, and productivity

## Quick Install

```bash
# Add the marketplace (one-time)
/plugin marketplace add dragon1086/claude-skills

# Install the skill
/plugin install tool-advisor@dragon1086-skills
```

## Available Skills

### Tool Advisor

**Meta-skill that analyzes your prompts and recommends optimal Claude Code tools**

```bash
# Usage
/dragon1086-skills:tool-advisor "Review and refactor the authentication module with tests"
```

**What it does:**
- Analyzes your task complexity (simple/medium/complex/long-running)
- Checks your locally installed tools, skills, and agents
- Recommends the optimal approach for your specific task
- Suggests harness patterns for iterative/long-running tasks
- Recommends tool installation if needed (with your approval)

**Example output:**
```
## Prompt Analysis Result

### 1. Task Classification
- Primary type: Feature development
- Complexity: Complex (5+ files)

### 2. Harness Necessity
- Required: No
- Reason: Multi-phase but one-time task

### 3. Recommendation
Optimal choice: /feature-dev
...
```

## Why Use These Skills?

| Problem | Solution |
|---------|----------|
| "Which tool should I use for this task?" | Tool Advisor analyzes and recommends |
| "I have many plugins but don't know which fits" | Checks your local inventory first |
| "Complex task needs orchestration" | Suggests harness patterns |
| "Missing a tool for this job" | Searches and suggests installation |

## Requirements

- Claude Code 1.0.33 or later
- For full functionality: `jq` installed (optional, for plugin inventory check)

## License

MIT

## Contributing

Issues and PRs welcome at [github.com/dragon1086/claude-skills](https://github.com/dragon1086/claude-skills)
