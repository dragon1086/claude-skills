#!/bin/bash
# Demo script for Tool Advisor v2.1

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
sleep 1

echo -e "${CYAN}You:${NC} Analyze this with tool-advisor: Refactor auth module to use JWT"
echo ""
sleep 1.5

echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "🔍 Checking local inventory..."
sleep 0.8
echo -e "📊 Assessing complexity..."
sleep 0.8
echo -e "🎯 Selecting optimal approach..."
sleep 0.6
echo -e "✅ ${GREEN}Analysis complete!${NC}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
sleep 0.8

echo -e "${BOLD}## Analysis Result${NC}"
echo ""

echo -e "${YELLOW}### 1. Classification${NC}"
echo -e "   • Type: Refactoring/Architecture"
echo -e "   • Complexity: ${WHITE}Complex${NC} (5+ files)"
echo ""
sleep 0.8

echo -e "${YELLOW}### 2. Harness${NC}"
echo -e "   • Required: No"
echo ""
sleep 0.5

echo -e "${MAGENTA}### 3. Plan Mode${NC}"
echo -e "   • Recommended: ${GREEN}Yes${NC}"
echo -e "   • Reason: Multiple files, security-sensitive"
echo ""
sleep 0.8

echo -e "${YELLOW}### 4. Agent${NC}"
echo -e "   • ${WHITE}feature-dev${NC} (installed)"
echo -e "   • ${WHITE}backend-developer${NC} (local agent)"
echo -e "   • ${WHITE}security-engineer${NC} (local agent)"
echo ""
sleep 0.8

echo -e "${YELLOW}### 5. Recommendation${NC}"
echo -e "   Use ${WHITE}/feature-dev${NC} with Plan Mode"
echo ""
sleep 0.8

echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${BOLD}🎯 Quick Action${NC}"
echo ""
echo -e "   ┌──────────────────────┬─────────────────────────────────┐"
echo -e "   │ Your situation       │ Copy & paste                    │"
echo -e "   ├──────────────────────┼─────────────────────────────────┤"
echo -e "   │ Plan first           │ ${GREEN}Plan the JWT refactoring${NC}        │"
echo -e "   │ Guided development   │ ${GREEN}/feature-dev${NC}                    │"
echo -e "   │ Just do it           │ ${GREEN}Refactor auth to use JWT${NC}        │"
echo -e "   └──────────────────────┴─────────────────────────────────┘"
echo ""
echo -e "   ${WHITE}→ Recommended: \"Plan first\"${NC} (5+ files, security-sensitive)"
echo ""
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

sleep 3
