# Wireshark Traffic Analysis

Part of my [100 Days of Building Cybersecurity Projects](../) learning journey.

## Overview
This project captures live network traffic on a local interface (`eth0`) using Wireshark, then
analyzes the capture to identify protocols in use, examine plaintext vs. encrypted traffic, and
document the security implications of what's visible to a packet sniffer.

## What I did
1. Opened Wireshark and selected the active interface (`eth0`).
2. Started a live capture.
3. Launched a browser and generated everyday traffic (DNS lookups, an HTTP request, and HTTPS/TLS
   connections) to produce a realistic mixed capture.
4. Stopped the capture and reviewed the packets using Wireshark's protocol column, packet details
   pane, and display filters (`http`, `dns`, `tcp.port==443`).
5. Wrote up the findings in [`analysis-report.md`](./analysis-report.md).

## Folder structure
```
wireshark-traffic-analysis/
├── README.md
├── captures/          # raw .pcapng capture files
├── screenshots/        # annotated screenshots from the practical
└── analysis-report.md  # write-up of findings
```

## Key takeaways
- DNS queries and responses are sent in plaintext and reveal every domain a device looks up.
- Plain HTTP traffic (no TLS) exposes the full request/response, including any data sent, to
  anyone capturing traffic on the same network.
- Even with TLS 1.2/1.3 encrypting the actual data, the TLS Client Hello still exposes the
  destination domain via the SNI (Server Name Indication) field.

## Tools used
- Wireshark 4.6.4
- Kali Linux (eth0 interface)
