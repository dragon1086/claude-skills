#!/bin/bash
# Demo script for Tool Advisor

# Colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color
BOLD='\033[1m'

clear

echo -e "${GRAY}$ claude${NC}"
echo ""
sleep 0.5

echo -e "${CYAN}You:${NC} /tool-advisor \"Refactor auth.js to JWT and add tests\""
echo ""
sleep 0.8

echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "🔍 Analyzing prompt..."
sleep 0.6
echo -e "📦 Checking local inventory..."
sleep 0.4
echo -e "✅ ${GREEN}Analysis complete!${NC}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
sleep 0.3

echo -e "${BOLD}## Prompt Analysis Result${NC}"
echo ""

echo -e "${YELLOW}### 1. Task Classification${NC}"
echo -e "   • Primary: Feature development"
echo -e "   • Complexity: ${WHITE}Complex${NC} (5+ files)"
echo ""
sleep 0.3

echo -e "${YELLOW}### 2. Recommendation${NC}"
echo ""
echo -e "   🎯 Optimal choice: ${GREEN}/feature-dev${NC}"
echo ""
echo -e "   ${BOLD}Why:${NC}"
echo -e "   → Multi-file refactoring needs guided workflow"
echo -e "   → Test requirement included in feature-dev"
echo ""
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

sleep 2
