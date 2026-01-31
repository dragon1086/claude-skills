# 🧭 Tool Advisor

[English](./README.md) | [한국어](./README.ko.md) | [日本語](./README.ja.md) | **中文** | [Español](./README.es.md) | [Português](./README.pt-BR.md) | [Русский](./README.ru.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md)

**不要再纠结用哪个工具了，让 Claude Code 来决定。**

Tool Advisor 分析你的提示词，推荐最优的工具、代理、MCP 服务器和编排模式组合——并提供**可直接复制粘贴执行的命令**。

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
┌─────────────────────────────────┐
│        Tool Advisor             │
├─────────────────────────────────┤
│ 1. 检查本地工具清单              │
│ 2. 评估复杂度                    │
│ 3. 检测 Harness 需求             │
│ 4. 是否推荐 Plan Mode？          │
│ 5. 选择代理（3层）               │
│ 6. 检查 MCP 需求                 │
│ 7. 建议安装                      │
│ 8. 提供快速操作表                │
└─────────────────────────────────┘
    ↓
🎯 可直接复制粘贴的命令
```

## 功能特性

| 功能 | 描述 |
|------|------|
| **快速操作表** | 可立即执行的复制粘贴命令 |
| **Plan Mode 检测** | 复杂任务推荐使用 `EnterPlanMode` |
| **Harness 模式** | 检测"直到"、"持续尝试"→ Ralph 模式 |
| **3层代理搜索** | 内置 → 本地自定义 → 市场 |
| **MCP 推荐** | 显示安装状态（✅/❌）及替代方案 |
| **人机协作** | 未经你的批准绝不安装 |

## 示例

**输入：**
```
用 tool-advisor 分析：将认证模块重构为 JWT
```

**输出：**
```markdown
## 分析结果

### 1. 分类
- 类型：重构/架构
- 复杂度：复杂（5+ 文件）

### 2. Harness
- 需要：否

### 3. Plan Mode
- 推荐：是
- 原因：多文件、安全敏感

### 4. 代理
- feature-dev（已安装）
- backend-developer（本地代理）
- security-engineer（本地代理）

### 5. 推荐
使用 /feature-dev 配合 Plan Mode

---

## 🎯 快速操作

| 你的情况 | 复制粘贴 |
|---------|---------|
| 先看计划 | `制定 JWT 重构计划` |
| 引导式开发 | `/feature-dev` |
| 直接开干 | `将认证重构为 JWT` |

→ 推荐："先看计划"（5+ 文件，安全敏感）
```

## 要求

- Claude Code CLI

## 许可证

MIT © 2026 dragon1086
