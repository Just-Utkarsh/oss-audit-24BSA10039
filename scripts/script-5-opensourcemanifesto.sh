#!/bin/bash

# ===== COLOR CONFIG =====
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# ===== UI HEADER =====
clear
echo "╔══════════════════════════════════════════════╗"
echo "║      OPEN SOURCE MANIFESTO GENERATOR         ║"
echo "╚══════════════════════════════════════════════╝"

# ===== USER INPUT =====
echo ""
echo -e "${YELLOW}Tool you use daily:${NC}"
read -p "➜ " TOOL

echo ""
echo -e "${YELLOW}Freedom (one word):${NC}"
read -p "➜ " FREEDOM

echo ""
echo -e "${YELLOW}Something you'd build:${NC}"
read -p "➜ " BUILD

# ===== SYSTEM CONTEXT =====
DATE=$(date '+%d %B %Y')
USER_NAME=$(id -un)
HOST=$(hostname)

OUT="manifesto_${USER_NAME}_$(date +%Y%m%d).txt"

# ===== FILE GENERATION =====
cat > "$OUT" <<EOF
Open Source Manifesto

User: $USER_NAME@$HOST
Date: $DATE

I use $TOOL daily.
Freedom means $FREEDOM.
I will build and share $BUILD.
EOF

# ===== OUTPUT =====
echo -e "${GREEN}Manifesto generated: $OUT${NC}"
