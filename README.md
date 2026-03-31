
# Open Source Audit Toolkit

A collection of Bash scripts for inspecting, auditing, and analyzing open source systems and software. The toolkit is designed to work with standard Linux utilities and provides a consistent terminal-based interface for all operations.

## Overview

This repository contains the following scripts:

- **System Identity Report**  
  Displays system-level information such as distribution, kernel version, uptime, and hardware details.

- **FOSS Package Inspector**  
  Retrieves metadata for installed packages using the system package manager, including version, license, and build information.

- **Disk and Permission Auditor**  
  Scans specific directories and reports insecure permission configurations such as world-writable access.

- **Log File Analyzer**  
  Processes log files to identify keyword occurrences, highlight relevant entries, and detect common issue patterns.

- **Open Source Manifesto Generator**  
  Generates a structured manifesto file based on user input and system context.

## Requirements

- Linux-based operating system (optimized for Arch Linux)
- Bash (version 4 or later)

### Required utilities

- `pacman`
- `grep`, `awk`, `sed`
- `find`, `stat`, `df`, `du`, `wc`
- `lscpu`, `free`

### Optional utilities

- `bc` (used for percentage calculations in log analysis)

## Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/open-source-audit-toolkit.git
cd open-source-audit-toolkit
```

## Running the Scripts

### System Identity Report

`./script-1-systemidentity.sh`

Displays system information such as distribution, kernel version, uptime, and hardware details.

---

### FOSS Package Inspector

`./script-2-foss-package.sh`

Inspects a predefined package (default: LibreOffice) and displays version, license, and metadata.

---

### Disk and Permission Auditor

`./script-3-security-audit.sh`

Scans directories and reports insecure permissions such as world-writable access.

---

### Log File Analyzer

`./script-4-loganalyzer.sh <logfile> [keyword]`

Examples:

`./script-4-loganalyzer.sh /var/log/syslog`  
`./script-4-loganalyzer.sh /var/log/pacman.log warning`

If no logfile is provided, the script attempts to locate LibreOffice logs automatically.

---

### Open Source Manifesto Generator

`./script-5-opensourcemanifesto.sh`

Prompts for input and generates a manifesto file in the current directory.

---

## Additional Notes

Some scripts may require elevated privileges:

`sudo ./script-4-loganalyzer.sh /var/log/syslog`

Ensure required utilities are installed before running the scripts.  
Designed for terminal usage with formatted output.

Make all scripts executable:

```bash
chmod +x *.sh
```
