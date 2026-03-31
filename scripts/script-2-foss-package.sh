#!/bin/bash

# ===== CONFIGURATION =====
PACKAGE="libreoffice"

# ===== UI HEADER =====
clear
echo "╔══════════════════════════════════════════════╗"
echo "║            FOSS PACKAGE INSPECTOR            ║"
echo "╚══════════════════════════════════════════════╝"

# ===== TARGET DISPLAY =====
echo ""
echo "┌─[ TARGET ]───────────────────────────────────"
echo "│ Package : $PACKAGE"
echo "└──────────────────────────────────────────────"

# ===== PACKAGE INSPECTION =====
echo ""
echo "┌─[ PACKAGE STATUS ]───────────────────────────"

if pacman -Qi "$PACKAGE" &>/dev/null; then
    echo "│ Status      : Installed"
    echo "├──────────────────────────────────────────────"

    # ===== PACKAGE METADATA =====
    echo "│ Version     : $(pacman -Qi $PACKAGE | awk -F': ' '/Version/ {print $2}')"
    echo "│ Arch        : $(pacman -Qi $PACKAGE | awk -F': ' '/Architecture/ {print $2}')"
    echo "│ License     : $(pacman -Qi $PACKAGE | awk -F': ' '/Licenses/ {print $2}')"
    echo "│ Build Date  : $(pacman -Qi $PACKAGE | awk -F': ' '/Build Date/ {print $2}')"
    echo "│ Packager    : $(pacman -Qi $PACKAGE | awk -F': ' '/Packager/ {print $2}')"

    # ===== RUNTIME CHECK =====
    if command -v "$PACKAGE" &>/dev/null; then
        echo "│ Running     : $($PACKAGE --version 2>/dev/null | head -n1)"
    fi
else
    echo "│ Status      : Not Installed"
    echo "│ Action      : sudo pacman -S ${PACKAGE}-fresh"
fi

echo "└──────────────────────────────────────────────"
