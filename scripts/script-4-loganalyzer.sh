#!/bin/bash

LOGFILE=${1:-""}
KEYWORD=${2:-"error"}

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

clear
echo "╔══════════════════════════════════════════════╗"
echo "║              LOG ANALYZER PANEL              ║"
echo "╚══════════════════════════════════════════════╝"

if [ -z "$LOGFILE" ]; then
    echo ""
    echo -e "${YELLOW}⚠ No log file provided${NC}"
    echo ""
    CONF="$HOME/.config/libreoffice"
    echo "┌─[ DISCOVERY ]───────────────────────────────"
    if [ -d "$CONF" ]; then
        echo -e "│ ${BLUE}Scanning LibreOffice logs...${NC}"
        find "$CONF" -name "*.log" 2>/dev/null | while read -r f; do
            echo "│ • $f"
        done
    else
        echo "│ LibreOffice config not found"
    fi
    echo "└──────────────────────────────────────────────"
    echo ""
    echo "Usage: $0 <logfile> [keyword]"
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo -e "${RED}File not found: $LOGFILE${NC}"
    exit 1
fi

if [ ! -r "$LOGFILE" ]; then
    echo -e "${RED}File not readable${NC}"
    exit 1
fi

SIZE=$(du -h "$LOGFILE" | cut -f1)
LINES=$(wc -l < "$LOGFILE")
DATE=$(stat -c %y "$LOGFILE" | cut -d. -f1)

echo ""
echo "┌─[ FILE INFO ]───────────────────────────────"
echo "│ Path   : $LOGFILE"
echo "│ Size   : $SIZE"
echo "│ Lines  : $LINES"
echo "│ Edited : $DATE"
echo "└──────────────────────────────────────────────"

COUNT=$(grep -ic "$KEYWORD" "$LOGFILE")

echo ""
echo "┌─[ SEARCH ]──────────────────────────────────"
echo "│ Keyword : $KEYWORD"
echo -e "│ Matches : ${GREEN}$COUNT${NC}"
echo "└──────────────────────────────────────────────"

if [ "$COUNT" -gt 0 ]; then
    echo ""
    echo "┌─[ LAST 5 MATCHES ]──────────────────────────"
    grep -in "$KEYWORD" "$LOGFILE" | tail -5 | while IFS=: read -r n l; do
        echo -e "│ ${YELLOW}[$n]${NC} $l"
    done
    echo "└──────────────────────────────────────────────"

    echo ""
    echo "┌─[ FIRST MATCH ]─────────────────────────────"
    FIRST=$(grep -in "$KEYWORD" "$LOGFILE" | head -1)
    N=$(echo "$FIRST" | cut -d: -f1)
    L=$(echo "$FIRST" | cut -d: -f2-)
    echo -e "│ ${YELLOW}[$N]${NC} $L"
    echo "└──────────────────────────────────────────────"

    echo ""
    echo "┌─[ PATTERNS ]────────────────────────────────"
    C1=$(grep -ic "crash\|segfault\|abort\|assert" "$LOGFILE")
    C2=$(grep -ic "permission\|denied\|access" "$LOGFILE")
    C3=$(grep -ic "network\|connection\|timeout\|socket" "$LOGFILE")
    [ "$C1" -gt 0 ] && echo "│ Crash issues      : $C1"
    [ "$C2" -gt 0 ] && echo "│ Permission issues : $C2"
    [ "$C3" -gt 0 ] && echo "│ Network issues    : $C3"
    echo "└──────────────────────────────────────────────"

    if command -v bc &>/dev/null && [ "$LINES" -gt 0 ]; then
        P=$(echo "scale=2; $COUNT*100/$LINES" | bc)
        echo ""
        echo "┌─[ STATS ]───────────────────────────────────"
        echo "│ Match density : $P %"
        echo "└──────────────────────────────────────────────"
    fi
else
    echo -e "\n${GREEN}No matches found${NC}"
fi

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║             ANALYSIS COMPLETE               ║"
echo "╚══════════════════════════════════════════════╝"
