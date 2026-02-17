# 🧭 Tool Advisor

[English](./README.md) | [한국어](./README.ko.md) | **日本語** | [中文](./README.zh-CN.md) | [Español](./README.es.md) | [Português](./README.pt-BR.md) | [Русский](./README.ru.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md)

**ツール環境を発見し、能力を増幅します。**

Tool Advisorはランタイム環境をスキャンし — MCPサーバー、スキル、プラグイン、CLIツール — 最適なツール構成を**拘束力のないオプション**として提案します。モデルが自ら知り得ない情報を提供し、潜在能力を最大化します。

![Demo](./assets/demo.gif)

## インストール

**方法1: ワンライナーインストール**
```bash
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash
```

**方法2: [skills.sh](https://skills.sh)経由**
```bash
npx skills add dragon1086/claude-skills -y --agent claude-code
npx skills add dragon1086/claude-skills -y --agent codex
```

アップデートするには、同じコマンドを再度実行してください。

## 使い方

自然に質問するだけです：

```
"tool-advisorで分析して: 認証モジュールをリファクタリング"
"tool-advisor、このデータベース移行はどうすればいい？"
"ユーザー認証の実装に最適なアプローチは？"
```

**tool-advisor**と言及するか、ツールの推奨を求めると、スキルが有効になります。

## 仕組み

```
プロンプト入力
    ↓
┌──────────────────────────────────┐
│     Tool Advisor v3.3            │
│     「増幅器、司令官ではない」     │
├──────────────────────────────────┤
│ 1. 環境発見                       │
│    MCP / スキル / プラグイン / CLI │
│ 2. タスク分析 + 完了基準          │
│ 3. 能力マッチング                 │
│ 4. オプション提示（最大3つ）      │
│ 5. ギャップ分析                   │
│ 6. パフォーマンスティップス       │
└──────────────────────────────────┘
    ↓
オプション + クイックアクションテーブル
```

## 主な機能

| 機能 | 説明 |
|------|------|
| **4層環境スキャン** | MCPサーバー、スキル、プラグイン、CLIツールをランタイムで発見 |
| **完了基準** | プロンプトから「Done when」を抽出し、モデルがゴールを認識 |
| **スケール適応型出力** | 小規模タスク<10行、大規模タスクは完全分析 |
| **複数オプション提示** | 最大3つのアプローチ（慎重 / 高速 / 深掘り）— 強制しない |
| **能力ギャップ分析** | 未インストールツールの提案 +「なくても可能」を明示 |
| **Iron Rules & アンチパターン** | 9つの境界ルールでアドバイザーから実行者への逸脱を防止；3つのアンチパターン |
| **フェーズ強制** | 全フェーズが出力または明示的「N/A」を生成必須 — スキップ不可 |
| **ヒューマンインザループ** | 承認なしに絶対インストールしない |

## 例

**入力:**
```
tool-advisorで分析して: 認証モジュールをJWTにリファクタリング
```

**出力:**
```markdown
## Tool Advisor v3.3 — 環境 & 構成分析

Prompt: `認証モジュールをJWTにリファクタリング`

### あなたの環境

| レイヤー | 利用可能 |
|---------|---------|
| MCPサーバー | lsp, context7 |
| スキル | /feature-dev, /code-review, /tdd |
| プラグイン | oh-my-claudecode（33エージェント） |
| CLI | git, node, pytest, docker |

### タスクプロファイル
- **タイプ**: 修正 / **規模**: 大規模 / **特性**: 設計が必要、テストあり
- **Done when**: セッション認証がJWTに置換、テスト通過、セッションimportなし

### 関連能力
- `lsp_diagnostics` — 変更後の型チェック
- `ast_grep_search` — セッション使用パターンの構造検索
- `/feature-dev` — ガイド付き開発ワークフロー

### 推奨アプローチ

**A — 慎重**（推奨）
Task(Explore) -> EnterPlanMode -> 段階的にEdit -> Bash(pytest)

**B — スキル活用**
/feature-dev（フロー全体を自動処理）

**C — エージェント並列**
[Task(Explore, bg), WebSearch("JWT best practices")] -> 設計 -> 実装

---

## クイックアクション

| アプローチ | コピー＆ペースト |
|-----------|----------------|
| 慎重 | `Task(Explore)`でコードベース調査から開始 |
| スキル活用 | `/feature-dev`でリファクタリングを説明 |
| 高速 | `Glob("**/auth/**") + Grep("session")` 並列 |

-> 推奨: 「慎重」（大規模リファクタリングは設計優先が有利）
```

## 要件

- Claude Code CLI and/or Codex CLI

## ライセンス

MIT © 2026 dragon1086
