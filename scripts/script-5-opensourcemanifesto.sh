#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m'

clear
echo -e "${PURPLE}╔══════════════════════════════════════════════╗"
echo -e "║        OPEN SOURCE MANIFESTO GENERATOR       ║"
echo -e "╚══════════════════════════════════════════════╝${NC}"

echo ""
echo -e "${YELLOW}Answer 3 questions to generate your manifesto${NC}"
echo ""
read -p "Press Enter to continue..."

clear
echo -e "${BLUE}┌─[ QUESTION 1 ]──────────────────────────────┐${NC}"
echo -e "${YELLOW}Tool you use daily:${NC}"
read -p "➜ " TOOL

echo ""
echo -e "${BLUE}┌─[ QUESTION 2 ]──────────────────────────────┐${NC}"
echo -e "${YELLOW}Freedom (one word):${NC}"
read -p "➜ " FREEDOM

echo ""
echo -e "${BLUE}┌─[ QUESTION 3 ]──────────────────────────────┐${NC}"
echo -e "${YELLOW}Something you'd build:${NC}"
read -p "➜ " BUILD

DATE=$(date '+%d %B %Y')
USER_NAME=$(id -un)
HOST=$(hostname)
DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d'"' -f2)

OUT="manifesto_${USER_NAME}_$(date +%Y%m%d).txt"

cat > "$OUT" <<EOF
╔══════════════════════════════════════════════════════════════╗
║                    OPEN SOURCE MANIFESTO                     ║
╠══════════════════════════════════════════════════════════════╣
║ Date   : $DATE
║ User   : $USER_NAME@$HOST
║ System : $DISTRO
╚══════════════════════════════════════════════════════════════╝

I use $TOOL daily. It represents a system built openly and shared freely.

Freedom means $FREEDOM. Software should be transparent, modifiable, and owned by its users.

I will contribute back by building and sharing $BUILD.

I commit to supporting open source, learning publicly, and contributing where possible.

Signed,
$USER_NAME
$DATE
EOF

clear
echo -e "${GREEN}✔ Manifesto Generated${NC}"
echo ""
echo -e "${YELLOW}File: $OUT${NC}"

echo ""
echo "┌─[ PREVIEW ]─────────────────────────────────"
cat "$OUT"
echo "└──────────────────────────────────────────────"

echo ""
read -p "Press Enter to exit..."
