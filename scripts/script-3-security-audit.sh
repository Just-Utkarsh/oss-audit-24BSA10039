#!/bin/bash

# ===== COLOR CONFIG =====
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# ===== TARGET DIRECTORIES =====
DIRS=("/usr/lib/libreoffice" "/usr/share/libreoffice" "/etc/libreoffice")

# ===== UI HEADER =====
clear
echo "╔══════════════════════════════════════════════╗"
echo "║        LIBREOFFICE SECURITY AUDIT            ║"
echo "╚══════════════════════════════════════════════╝"

# ===== PERMISSION ANALYSIS =====
echo ""
echo "┌─[ DIRECTORY PERMISSIONS ]────────────────────"

FOUND=0

for D in "${DIRS[@]}"; do
    if [ -d "$D" ]; then
        P=$(stat -c %A "$D")
        O=$(stat -c %a "$D" | cut -c3)

        # ===== SECURITY CHECK =====
        if [ "$O" -ge 2 ]; then
            echo -e "│ ${RED}⚠ $D${NC}"
            echo "│   Perms : $P"
            echo "│   Risk  : World-writable"
            FOUND=1
        else
            echo -e "│ ${GREEN}✔ $D${NC}"
            echo "│   Perms : $P"
        fi
        echo "├──────────────────────────────────────────────"
    fi
done

# ===== FINAL RESULT =====
[ $FOUND -eq 0 ] && echo -e "│ ${GREEN}No insecure directories detected${NC}"
echo "└──────────────────────────────────────────────"
