#!/bin/bash

# ===== CONFIGURATION =====
STUDENT_NAME="Utkarsh"
SOFTWARE_CHOICE="LibreOffice"

# ===== SYSTEM DATA COLLECTION =====
CURRENT_DATE=$(date '+%A, %d %B %Y %H:%M:%S')
CURRENT_USER=$(whoami)
HOME_DIR="$HOME"
KERNEL_VERSION=$(uname -r)
UPTIME=$(uptime -p)

# ===== DISTRIBUTION DETECTION =====
if [ -f /etc/os-release ]; then
    DISTRO=$(grep "^PRETTY_NAME=" /etc/os-release | cut -d'"' -f2)
elif command -v lsb_release &>/dev/null; then
    DISTRO=$(lsb_release -ds)
else
    DISTRO="Unknown Linux Distribution"
fi

# ===== UI RENDERING =====
clear
echo "╔══════════════════════════════════════════════╗"
echo "║              SYSTEM AUDIT PANEL              ║"
echo "╚══════════════════════════════════════════════╝"

# ===== SYSTEM INFO =====
echo ""
echo "┌─[ SYSTEM ]───────────────────────────────────"
echo "│ User        : $(id -un)"
echo "│ Host        : $(hostname)"
echo "│ Shell       : $SHELL"
echo "│ Uptime      : $UPTIME"
echo "│ Date        : $(date '+%d %b %Y %I:%M %p')"
echo "├──────────────────────────────────────────────"
echo "│ Distro      : $DISTRO"
echo "│ Kernel      : $KERNEL_VERSION"
echo "│ Arch        : $(uname -m)"
echo "└──────────────────────────────────────────────"

# ===== RESOURCE INFO =====
echo ""
echo "┌─[ RESOURCES ]────────────────────────────────"
echo "│ CPU         : $(lscpu | grep 'Model name' | cut -d':' -f2 | xargs)"
echo "│ Memory      : $(free -h | awk '/Mem:/ {print $3 " / " $2}')"
echo "│ Disk (/)    : $(df -h / | awk 'NR==2 {print $3 " / " $2}')"
echo "└──────────────────────────────────────────────"
