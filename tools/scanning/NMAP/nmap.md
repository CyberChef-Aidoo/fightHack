# 🧰 Nmap

> The Swiss Army knife of network scanning — find hosts, open ports, and running services in seconds.

| | |
|---|---|
| **Category** | 📡 Scanning |
| **Date covered** | 2026-08-01 |
| **Author** | @cyberChef-Aidoo |

---

## 🔎 What It Is

Nmap ("Network Mapper") is a free, open-source tool for network discovery and security auditing. It identifies live hosts, open ports, running services, and service versions on a network, and can run scripts (NSE) to detect vulnerabilities and misconfigurations.

## 📥 Installation

```bash
# Debian/Ubuntu
sudo apt install nmap

# macOS (Homebrew)
brew install nmap

# Docker
docker run -it --rm instrumentisto/nmap
```

## 🚀 Basic Usage

```bash
# Basic TCP scan of a host
nmap 192.168.56.10

# Scan all 65535 ports with service/version detection
nmap -p- -sV 192.168.56.10

# Run default NSE scripts + version detection
nmap -sC -sV 192.168.56.10

# OS detection
sudo nmap -O 192.168.56.10
```

Example output (truncated):

```
PORT     STATE SERVICE VERSION
22/tcp   open  ssh     OpenSSH 8.2p1
80/tcp   open  http    Apache httpd 2.4.41
3306/tcp open  mysql   MySQL 8.0.28
```

## 🧪 Use Case Walkthrough

Ran a full port + version scan against a local Metasploitable2 VM (isolated lab network, own hardware). The scan surfaced an outdated vsftpd version on port 21, which cross-referenced with a known public CVE — a good reminder of why version detection alone is often enough to flag risk before any exploitation step.

## 💡 Key Takeaways

- ✅ `-sC -sV` is a solid default for a first-pass scan; add `-p-` when you need full port coverage
- ⚠️ Scans against large ranges can be slow — `-T4` speeds things up but is noisier/more detectable
- ✅ NSE scripts (`--script=vuln`) can flag known CVEs directly, useful as a fast triage step
- ⚠️ Always scope scans tightly; an unscoped `-p-` sweep of a big subnet can take a very long time and generate a lot of noise

## 🔗 References

- https://nmap.org/book/man.html
- https://nmap.org/nsedoc/
