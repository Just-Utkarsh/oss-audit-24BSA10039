#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

DIRS=("/usr/lib/libreoffice" "/usr/share/libreoffice" "/etc/libreoffice")

clear
echo "╔══════════════════════════════════════════════╗"
echo "║            LIBREOFFICE SECURITY AUDIT        ║"
echo "╚══════════════════════════════════════════════╝"

echo ""
echo "┌─[ DIRECTORY PERMISSIONS ]────────────────────"

FOUND=0

for D in "${DIRS[@]}"; do
    if [ -d "$D" ]; then
        P=$(stat -c %A "$D")
        O=$(stat -c %a "$D" | cut -c3)
        if [ "$O" -ge 2 ]; then
            echo -e "│ ${RED}⚠ $D${NC}"
            echo "│   Perms : $P"
            echo "│   Risk  : World-writable"
            echo "├──────────────────────────────────────────────"
            FOUND=1
        else
            echo -e "│ ${GREEN}✔ $D${NC}"
            echo "│   Perms : $P"
            echo "├──────────────────────────────────────────────"
        fi
    else
        echo -e "│ ${YELLOW}• $D (missing)${NC}"
        echo "├──────────────────────────────────────────────"
    fi
done

if [ $FOUND -eq 0 ]; then
    echo -e "│ ${GREEN}No insecure directories detected${NC}"
fi

echo "└──────────────────────────────────────────────"

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║ STATUS : $([ $FOUND -eq 0 ] && echo -e "${GREEN}SECURE${NC}" || echo -e "${RED}ATTENTION NEEDED${NC}") ║"
echo "╚══════════════════════════════════════════════╝"
