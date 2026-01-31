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

## 🚀 What's New in v1.1

- **3-Tier Agent Search**: Built-in → Local → Marketplace
- **Multi-Agent Orchestration**: Recommends agent combinations for complex tasks
- **Token Efficient**: ~1,500 tokens (70% reduction from v1.0)

---

## 😫 Before vs 😊 After

| Before Tool Advisor | After Tool Advisor |
|---------------------|-------------------|
| "Should I use `Explore` or `Grep`?" | Instant recommendation with reasoning |
| "How do I set up a test-until-pass loop?" | Harness pattern auto-suggested |
| "Is there a security review agent?" | 3-tier search finds it (local or marketplace) |
| "How do I coordinate multiple agents?" | Orchestration pattern + Claude Code executes |

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

### Complex + Marketplace Search
```
/ta 보안 취약점 검토하고 수정해서 테스트 통과할 때까지 반복해줘
```
→ **Output**:
```markdown
## Analysis Result

### 1. Classification
- Type: Security review + Bug fix
- Complexity: Long-running

### 2. Harness
- Required: Yes — Pattern: Goal Loop

### 3. Agent Recommendation
- Source: Marketplace (no local security agent)
- Agent: security-reviewer
- Search: "Claude Code security review agent 2026"

### 5. Installation
| Name | Install |
|------|---------|
| security-scanner | `/plugin marketplace add github.com/...` |

Install now? (yes/no)

Fallback: Task + Explore + manual review
```

**You**: "설치하고 실행해"
**Claude Code**: *(installs, scans, fixes, tests, done!)*

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
