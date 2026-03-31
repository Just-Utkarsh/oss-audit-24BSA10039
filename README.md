
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
