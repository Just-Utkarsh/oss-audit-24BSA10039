#!/bin/bash
PACKAGE="libreoffice"
clear
echo "╔══════════════════════════════════════════════╗"
echo "║            FOSS PACKAGE INSPECTOR            ║"
echo "╚══════════════════════════════════════════════╝"
echo ""
echo "┌─[ TARGET ]───────────────────────────────────"
echo "│ Package : $PACKAGE"
echo "└──────────────────────────────────────────────"
echo ""
echo "┌─[ PACKAGE STATUS ]───────────────────────────"

if pacman -Qi "$PACKAGE" &>/dev/null; then
    echo "│ Status      : Installed"

    echo "├──────────────────────────────────────────────"
    echo "│ Version     : $(pacman -Qi $PACKAGE | awk -F': ' '/Version/ {print $2}')"
    echo "│ Arch        : $(pacman -Qi $PACKAGE | awk -F': ' '/Architecture/ {print $2}')"
    echo "│ License     : $(pacman -Qi $PACKAGE | awk -F': ' '/Licenses/ {print $2}')"
    echo "│ Build Date  : $(pacman -Qi $PACKAGE | awk -F': ' '/Build Date/ {print $2}')"
    echo "│ Packager    : $(pacman -Qi $PACKAGE | awk -F': ' '/Packager/ {print $2}')"
    if command -v "$PACKAGE" &>/dev/null; then
        echo "│ Running     : $($PACKAGE --version 2>/dev/null | head -n1)"
    fi
else
    echo "│ Status      : Not Installed"
    echo "│ Action      : sudo pacman -S ${PACKAGE}-fresh"
fi
echo "└──────────────────────────────────────────────"

echo ""
echo "┌─[ PHILOSOPHY ]───────────────────────────────"

case "$PACKAGE" in
    libreoffice)
        echo "│ LibreOffice"
        echo "│"
        echo "│ Community-driven fork (2010)"
        echo "│ Ensures independence from corporate control"
        echo "│"
        echo "│ License  : MPL 2.0"
        echo "│ Model    : File-level copyleft"
        echo "│ Focus    : Open standards (ODF)"
        echo "│"
        echo "│ Key Idea : Digital sovereignty"
        ;;
    httpd)
        echo "│ Apache HTTP Server"
        echo "│ Backbone of the open web"
        ;;
    mysql)
        echo "│ MySQL Database"
        echo "│ Widely used open-source RDBMS"
        ;;
    vlc)
        echo "│ VLC Media Player"
        echo "│ Plays almost all media formats"
        ;;
    firefox)
        echo "│ Firefox Browser"
        echo "│ Privacy-focused, open web advocate"
        ;;
    *)
        echo "│ No philosophy notes available"
        ;;
esac
echo "└──────────────────────────────────────────────"
-
echo ""
echo "┌─[ OPEN SOURCE PRINCIPLES ]───────────────────"

echo "│ ✔ Community-driven development"
echo "│ ✔ Transparent source code"
echo "│ ✔ Freedom to modify and share"
echo "│ ✔ No vendor lock-in"
echo "│ ✔ Free distribution model"
echo "└──────────────────────────────────────────────"
echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║   Generated at: $(date '+%H:%M:%S %d-%m-%Y')   ║"
echo "╚══════════════════════════════════════════════╝"
