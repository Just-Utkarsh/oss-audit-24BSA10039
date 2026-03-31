#!/bin/bash
clear
echo "╔══════════════════════════════════════════════╗"
echo "║              SYSTEM AUDIT PANEL              ║"
echo "╚══════════════════════════════════════════════╝"
echo ""
echo "┌─[ SYSTEM ]───────────────────────────────────"
echo "│ User        : $(id -un)"
echo "│ Host        : $(hostname)"
echo "│ Shell       : $SHELL"
echo "│ Uptime      : $(uptime -p)"
echo "│ Date        : $(date '+%d %b %Y %I:%M %p')"
echo "├──────────────────────────────────────────────"
if [ -f /etc/os-release ]; then
    echo "│ Distro      : $(. /etc/os-release && echo $PRETTY_NAME)"
else
    echo "│ Distro      : $(uname -s)"
fi
echo "│ Kernel      : $(uname -r)"
echo "│ Arch        : $(uname -m)"

echo "└──────────────────────────────────────────────"
echo ""
echo "┌─[ RESOURCES ]────────────────────────────────"

echo "│ CPU         : $(lscpu | grep 'Model name' | cut -d':' -f2 | xargs)"
echo "│ Memory      : $(free -h | awk '/Mem:/ {print $3 " / " $2}')"
echo "│ Disk (/)    : $(df -h / | awk 'NR==2 {print $3 " / " $2}')"

echo "└──────────────────────────────────────────────"
echo ""
echo "┌─[ LICENSE ]──────────────────────────────────"

echo "│ Kernel      : GPL v2"
echo "│ System      : Mixed FOSS (GPL / MIT / BSD)"

echo "└──────────────────────────────────────────────"

echo ""
echo "┌─[ SOFTWARE AUDIT ]───────────────────────────"

if command -v libreoffice &>/dev/null; then
    VERSION=$(libreoffice --version | head -n1)
    echo "│ LibreOffice : Installed"
    echo "│ Version     : $VERSION"
else
    echo "│ LibreOffice : Not Installed"
fi

echo "│ License     : MPL 2.0"
echo "│ Maintainer  : The Document Foundation"

echo "└──────────────────────────────────────────────"

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║        Report generated: $(date '+%T')        ║"
echo "╚══════════════════════════════════════════════╝"
