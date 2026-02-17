#!/usr/bin/env bash
# Tool Advisor installer (Claude Code + Codex)
# https://github.com/dragon1086/claude-skills

set -euo pipefail

REPO_URL="${REPO_URL:-https://raw.githubusercontent.com/dragon1086/claude-skills/main}"
SKILL_PATH="skills/tool-advisor"
AGENT_TARGET="both"
CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"

usage() {
  cat <<'EOF'
Usage: install.sh [--agent <claude-code|codex|both>]

Examples:
  install.sh
  install.sh --agent codex
  install.sh --agent claude-code
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --agent|-a)
      if [[ $# -lt 2 ]]; then
        echo "❌ Missing value for --agent"
        usage
        exit 1
      fi
      AGENT_TARGET="$2"
      shift 2
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "❌ Unknown argument: $1"
      usage
      exit 1
      ;;
  esac
done

INSTALL_CLAUDE=false
INSTALL_CODEX=false

case "$AGENT_TARGET" in
  claude|claude-code)
    INSTALL_CLAUDE=true
    ;;
  codex)
    INSTALL_CODEX=true
    ;;
  both|all)
    INSTALL_CLAUDE=true
    INSTALL_CODEX=true
    ;;
  *)
    echo "❌ Invalid --agent value: $AGENT_TARGET"
    usage
    exit 1
    ;;
esac

download_skill() {
  local target_dir="$1"
  mkdir -p "$target_dir"
  curl -fsSL "$REPO_URL/$SKILL_PATH/SKILL.md" -o "$target_dir/SKILL.md"
}

echo "🧭 Installing Tool Advisor..."

if [[ "$INSTALL_CLAUDE" == true ]]; then
  CLAUDE_SKILL_DIR="$HOME/.claude/skills/tool-advisor"
  download_skill "$CLAUDE_SKILL_DIR"
  echo "  ✓ Claude Code: $CLAUDE_SKILL_DIR"
fi

if [[ "$INSTALL_CODEX" == true ]]; then
  CODEX_SKILL_DIR="$CODEX_HOME_DIR/skills/tool-advisor"
  download_skill "$CODEX_SKILL_DIR"
  mkdir -p "$CODEX_SKILL_DIR/agents"
  curl -fsSL "$REPO_URL/$SKILL_PATH/agents/openai.yaml" -o "$CODEX_SKILL_DIR/agents/openai.yaml"
  echo "  ✓ Codex: $CODEX_SKILL_DIR"
fi

echo ""
echo "✅ Tool Advisor installed successfully!"
echo ""
echo "Usage:"
echo "  \"Analyze with tool-advisor: <your task>\""
echo "  \"tool-advisor로 분석해줘: <작업>\""
echo "  \"Use \$tool-advisor to plan this task\""
echo ""
echo "To update, run this command again."
