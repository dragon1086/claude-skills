#!/bin/bash
# Tool Advisor - One-line installer
# https://github.com/dragon1086/claude-skills

set -e

SKILL_DIR="$HOME/.claude/skills/tool-advisor"
REPO_URL="https://raw.githubusercontent.com/dragon1086/claude-skills/main"

echo "🧭 Installing Tool Advisor..."

# Create directory
mkdir -p "$SKILL_DIR"

# Download latest SKILL.md
curl -fsSL "$REPO_URL/skills/tool-advisor/SKILL.md" -o "$SKILL_DIR/SKILL.md"

echo ""
echo "✅ Tool Advisor installed successfully!"
echo ""
echo "Usage:"
echo "  \"Analyze with tool-advisor: <your task>\""
echo "  \"tool-advisor로 분석해줘: <작업>\""
echo ""
echo "To update, run this command again."
