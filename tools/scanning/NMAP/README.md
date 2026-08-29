# Nmap

Notes, exercises, and reference documentation for learning and using **Nmap** (Network Mapper) — part of my ongoing cybersecurity tools training.

## Status

- ✅ Module 1 — Host Discovery
- ✅ Module 2 — Port Scanning
- ⬜ Module 3 — Service & Version Detection
- ⬜ Module 4 — Timing & Performance
- ⬜ Module 5 — Nmap Scripting Engine (NSE)
- ⬜ Module 6 — Output & Reporting
- ⬜ Module 7 — Evasion & IDS/Firewall Bypass

This folder is updated daily, reflecting only the module(s) completed that day.

## What's in this folder

| Path | Contents |
|---|---|
| `docs/` | Full polished reference documentation (Word doc) — command breakdowns, flag explanations, analyst use cases, exercises, and observation notes for each module |
| `screenshots/` | Screenshots from hands-on exercises, organized by module |
| `notes/` | Working markdown notes per module (raw notes before being folded into the polished doc) |
| `scan-outputs/` | Saved nmap scan results (`-oN` / `-oX` / `-oG`) from lab exercises |
| `scripts/` | Any custom NSE scripts or wrapper scripts |

## What is Nmap

Nmap is a network scanning tool used for:
- **Host discovery** — identifying live hosts on a network
- **Port scanning** — finding open, closed, and filtered ports
- **Service/version detection** — fingerprinting the software behind each open port
- **Scriptable auditing** — via the Nmap Scripting Engine (NSE), for banner grabbing, vulnerability checks, and more

Used across cybersecurity roles: pentesters (recon), blue teamers (asset inventory, shadow IT detection), sysadmins (firewall/config verification), and bug bounty hunters.

## Lab environment

- **Legal test target:** `scanme.nmap.org`
- **Local lab VM:** Metasploitable2 (intentionally vulnerable)
- **Attacker machine:** Kali Linux

All scanning is done only against owned lab infrastructure or explicitly authorized legal test targets — never against networks or hosts without permission.

## Key lesson so far

Discovery-scan results (`-sn`) are not automatically trustworthy — virtual network configurations (e.g. VMware NAT/Host-only mode) or proxy ARP can produce false positives. Always cross-check with a second data source (`arp-scan`, DHCP leases, or a deeper `-sV`/`-O` scan on a sample of hosts) before treating scan output as ground truth. Full writeup in `docs/nmap-documentation.docx`.
