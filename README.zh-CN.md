# 🧭 Tool Advisor

[English](./README.md) | [한국어](./README.ko.md) | [日本語](./README.ja.md) | **中文** | [Español](./README.es.md) | [Português](./README.pt-BR.md) | [Русский](./README.ru.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md)

**发现你的工具环境，放大你的能力。**

Tool Advisor 扫描你的运行时环境 — MCP 服务器、技能、插件、CLI 工具 — 并以**非强制性选项**的形式建议最优工具组合，附带可直接复制粘贴的命令。它为模型提供其自身无法获知的信息，最大化潜能。

![Demo](./assets/demo.gif)

## 安装

**方式一：一行命令安装**
```bash
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash
```

**方式二：通过 [skills.sh](https://skills.sh)**
```bash
npx skills add dragon1086/claude-skills -y --agent claude-code
```

更新时运行相同的命令即可。

## 使用方法

自然地提问即可：

```
"用 tool-advisor 分析：重构认证模块"
"tool-advisor，这个数据库迁移应该怎么做？"
"实现用户认证的最佳方法是什么？"
```

当你提到 **tool-advisor** 或询问工具推荐时，技能会自动激活。

## 工作原理

```
你的提示词
    ↓
┌──────────────────────────────────┐
│     Tool Advisor v3.2            │
│     「放大器，而非指挥官」         │
├──────────────────────────────────┤
│ 1. 发现环境                       │
│    MCP / 技能 / 插件 / CLI        │
│ 2. 分析任务 + 完成标准            │
│ 3. 匹配能力                       │
│ 4. 建议选项（最多3个）            │
│ 5. 差距分析                       │
│ 6. 性能提示                       │
└──────────────────────────────────┘
    ↓
选项 + 快速操作表
```

## 功能特性

| 功能 | 描述 |
|------|------|
| **4层环境扫描** | 在运行时发现 MCP 服务器、技能、插件和 CLI 工具 |
| **完成标准** | 从提示词中提取"Done when"，让模型明确目标 |
| **规模自适应输出** | 小任务<10行，大任务完整分析 |
| **多选项建议** | 最多3种方案（稳妥 / 快速 / 深入）— 不强制执行 |
| **能力差距分析** | 建议缺失工具 + 明确标注"没有也能完成" |
| **Iron Rules & 反模式** | 9条边界规则防止顾问角色偏移为执行者；3条反模式 |
| **阶段强制输出** | 每个阶段必须产生输出或明确标注"N/A" — 不可跳过 |
| **人机协作** | 未经你的批准绝不安装 |

## 示例

**输入：**
```
用 tool-advisor 分析：将认证模块重构为 JWT
```

**输出：**
```markdown
## Tool Advisor v3.2 — 环境与组合分析

Prompt: `将认证模块重构为 JWT`

### 你的环境

| 层 | 可用 |
|----|------|
| MCP 服务器 | lsp, context7 |
| 技能 | /feature-dev, /code-review, /tdd |
| 插件 | oh-my-claudecode（33个代理） |
| CLI | git, node, pytest, docker |

### 任务概况
- **类型**：修改 / **规模**：大型 / **特征**：需要规划、有测试
- **Done when**：会话认证替换为JWT、测试通过、无会话import残留

### 相关能力
- `lsp_diagnostics` — 变更后类型检查
- `ast_grep_search` — 查找所有会话使用模式
- `/feature-dev` — 引导式开发工作流

### 建议方案

**A — 稳妥**（推荐）
Task(Explore) -> EnterPlanMode -> 分阶段 Edit -> Bash(pytest)

**B — 技能引导**
/feature-dev（自动处理整个流程）

**C — 代理并行**
[Task(Explore, bg), WebSearch("JWT best practices")] -> 规划 -> 实施

---

## 快速操作

| 方案 | 复制粘贴 |
|------|---------|
| 稳妥 | 从 `Task(Explore)` 开始探索代码库 |
| 技能引导 | `/feature-dev` 然后描述重构内容 |
| 快速 | `Glob("**/auth/**") + Grep("session")` 并行 |

-> 推荐："稳妥"（大规模重构，先规划更有利）
```

## 要求

- Claude Code CLI

## 许可证

MIT © 2026 dragon1086
