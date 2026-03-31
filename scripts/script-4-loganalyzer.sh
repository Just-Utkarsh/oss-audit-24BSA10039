#!/bin/bash

# ===== INPUT PARAMETERS =====
LOGFILE=${1:-""}
KEYWORD=${2:-"error"}

# ===== COLOR CONFIG =====
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# ===== UI HEADER =====
clear
echo "╔══════════════════════════════════════════════╗"
echo "║              LOG ANALYZER PANEL              ║"
echo "╚══════════════════════════════════════════════╝"

# ===== INPUT VALIDATION =====
if [ -z "$LOGFILE" ]; then
    echo -e "${YELLOW}No log file provided${NC}"
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo -e "${RED}File not found${NC}"
    exit 1
fi

# ===== FILE METADATA =====
SIZE=$(du -h "$LOGFILE" | cut -f1)
LINES=$(wc -l < "$LOGFILE")

echo ""
echo "┌─[ FILE INFO ]───────────────────────────────"
echo "│ Path   : $LOGFILE"
echo "│ Size   : $SIZE"
echo "│ Lines  : $LINES"
echo "└──────────────────────────────────────────────"

# ===== SEARCH EXECUTION =====
COUNT=$(grep -ic "$KEYWORD" "$LOGFILE")

echo ""
echo "┌─[ SEARCH ]──────────────────────────────────"
echo "│ Keyword : $KEYWORD"
echo "│ Matches : $COUNT"
echo "└──────────────────────────────────────────────"

# ===== RESULTS =====
if [ "$COUNT" -gt 0 ]; then
    echo ""
    echo "┌─[ LAST MATCHES ]────────────────────────────"
    grep -in "$KEYWORD" "$LOGFILE" | tail -5
    echo "└──────────────────────────────────────────────"
fi
