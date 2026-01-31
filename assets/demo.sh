#!/bin/bash
# Demo script for Tool Advisor v1.3

# Colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
MAGENTA='\033[0;35m'
NC='\033[0m'
BOLD='\033[1m'

clear

echo -e "${GRAY}$ claude${NC}"
echo ""
sleep 0.5

echo -e "${CYAN}You:${NC} /d1086:ta Refactor auth module to use JWT tokens"
echo ""
sleep 0.8

echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "🔍 Checking local inventory..."
sleep 0.4
echo -e "📊 Assessing complexity..."
sleep 0.4
echo -e "🎯 Selecting optimal approach..."
sleep 0.3
echo -e "✅ ${GREEN}Analysis complete!${NC}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
sleep 0.3

echo -e "${BOLD}## Analysis Result${NC}"
echo ""

echo -e "${YELLOW}### 1. Classification${NC}"
echo -e "   • Type: Refactoring"
echo -e "   • Complexity: ${WHITE}Complex${NC}"
echo ""
sleep 0.3

echo -e "${MAGENTA}### 2.5. Plan Mode${NC}"
echo -e "   • Recommended: ${GREEN}Yes${NC}"
echo -e "   • Reason: Multiple files, architectural decision"
echo ""
sleep 0.3

echo -e "${YELLOW}### 3. Agent${NC}"
echo -e "   • Agent: ${WHITE}Plan${NC} → ${WHITE}general-purpose${NC}"
echo ""
sleep 0.3

echo -e "${YELLOW}### 4. Recommendation${NC}"
echo ""
echo -e "   ${GREEN}Step 1${NC}: EnterPlanMode — Design JWT strategy"
echo -e "   ${GREEN}Step 2${NC}: Execute with feature-dev after approval"
echo ""
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

sleep 2
