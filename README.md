# 🧭 Tool Advisor

> **"Which tool should I use?"** — Stop guessing. Start knowing.

You've installed dozens of plugins, skills, and agents in Claude Code.
But every time you start a new task, the same question hits:
*"Which one is the right tool for THIS job?"*

**Tool Advisor analyzes your prompt and recommends the optimal tool automatically.**

![Tool Advisor Demo](./assets/demo.gif)

## ⚡ Quick Install

```bash
/plugin marketplace add dragon1086/claude-skills
/plugin install tool-advisor@dragon1086-skills
```

That's it. Two commands. You're ready.

---

## 😫 Before vs 😊 After

| Before Tool Advisor | After Tool Advisor |
|---------------------|-------------------|
| "I need to refactor auth... should I use `/feature-dev`? Or just `Edit`? Maybe there's a review skill?" | `/tool-advisor "refactor auth module"` → "Use `/feature-dev` for this multi-file refactoring task" |
| Scroll through `/help` trying to remember what each tool does | Get instant, context-aware recommendations |
| Install plugins you never end up using | Only install what you actually need |
| Complex tasks fail because you picked the wrong approach | Harness patterns suggested for iterative work |

---

## ✨ What It Does

### 1. 🔍 Analyzes Your Task
Understands complexity: Is this a quick fix or a multi-phase project?

### 2. 📦 Checks Your Inventory
Scans your installed plugins, skills, and agents — recommends from what you have.

### 3. 🎯 Recommends the Best Fit
Not just "use this tool" — explains *why* it's the right choice.

### 4. 🔄 Suggests Patterns for Complex Work
Need to loop until tests pass? It recommends harness patterns for autonomous iteration.

### 5. 🛒 Finds Missing Tools
Don't have the right tool? It searches and suggests installation — with your approval.

---

## 📊 Example

**Your prompt:**
```
Review auth.js and refactor to JWT. Add tests. Use plan mode.
```

**Tool Advisor output:**
```
## Prompt Analysis Result

### 1. Task Classification
- Primary type: Feature development/refactoring
- Complexity: Complex (5+ files, design needed)

### 2. Harness Necessity
- Required: No (multi-phase but one-time)
- Recommended pattern: None

### 3. Local Tool Status
- Available: feature-dev, code-review, comprehensive-review
- Missing: None

### 4. Recommendation

**Optimal choice**: `/feature-dev`

**Why**:
- "plan mode" requested → design-first approach fits
- Multi-file changes → guided workflow prevents mistakes
- Test requirement → feature-dev includes verification phase

**Usage**:
/feature-dev
> Refactor auth.js to use JWT tokens, add unit tests
```

---

## 🤔 FAQ

<details>
<summary><strong>Q: Does it work if I have no plugins installed?</strong></summary>

Yes! It recommends built-in tools (Read, Edit, Bash, Grep, Glob, Task) and suggests plugins to install if needed.
</details>

<details>
<summary><strong>Q: Will it install things without asking?</strong></summary>

Never. All installations require your explicit approval (Human-in-the-loop).
</details>

<details>
<summary><strong>Q: What's a "harness pattern"?</strong></summary>

An orchestration loop for tasks like "keep running tests until they pass." Tool Advisor detects when you need one and explains how to set it up.
</details>

<details>
<summary><strong>Q: Does it work with custom skills I created?</strong></summary>

Yes! It scans `~/.claude/skills/` and `.claude/skills/` to find your custom skills.
</details>

---

## 📋 Requirements

- Claude Code 1.0.33+
- Optional: `jq` (for detailed plugin inventory)

---

## 🤝 Contributing

Found a bug? Have an idea? [Open an issue](https://github.com/dragon1086/claude-skills/issues) or submit a PR.

---

## 📜 License

MIT © 2026 dragon1086
