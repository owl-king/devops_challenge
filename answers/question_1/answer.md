I use 2 steps build to build the target image. Ubuntu does not come with wget or curl so I use downloader
- downloader: download the files and check sum
- copy binary to final image. 

Use `run.sh` to build and scan on your machine. Note that it is hardcoded with url for m1 arm

Output: [./Dockerfile](Dockerfile) [./run.sh](run.sh)
Final output from trivy:
```bash

energi3-local (ubuntu 24.04)
============================
Total: 0 (HIGH: 0, CRITICAL: 0)


usr/local/bin/energi3 (gobinary)
================================
Total: 4 (HIGH: 3, CRITICAL: 1)

┌─────────────────────────────────────┬────────────────┬──────────┬────────┬───────────────────┬─────────────────┬──────────────────────────────────────────────────────────────┐
│               Library               │ Vulnerability  │ Severity │ Status │ Installed Version │  Fixed Version  │                            Title                             │
├─────────────────────────────────────┼────────────────┼──────────┼────────┼───────────────────┼─────────────────┼──────────────────────────────────────────────────────────────┤
│ github.com/prometheus/client_golang │ CVE-2022-21698 │ HIGH     │ fixed  │ v1.11.0           │ 1.11.1          │ prometheus/client_golang: Denial of service using            │
│                                     │                │          │        │                   │                 │ InstrumentHandlerCounter                                     │
│                                     │                │          │        │                   │                 │ https://avd.aquasec.com/nvd/cve-2022-21698                   │
├─────────────────────────────────────┼────────────────┤          │        ├───────────────────┼─────────────────┼──────────────────────────────────────────────────────────────┤
│ golang.org/x/net                    │ CVE-2023-39325 │          │        │ v0.10.0           │ 0.17.0          │ golang: net/http, x/net/http2: rapid stream resets can cause │
│                                     │                │          │        │                   │                 │ excessive work (CVE-2023-44487)                              │
│                                     │                │          │        │                   │                 │ https://avd.aquasec.com/nvd/cve-2023-39325                   │
├─────────────────────────────────────┼────────────────┼──────────┤        ├───────────────────┼─────────────────┼──────────────────────────────────────────────────────────────┤
│ stdlib                              │ CVE-2024-24790 │ CRITICAL │        │ 1.21.4            │ 1.21.11, 1.22.4 │ golang: net/netip: Unexpected behavior from Is methods for   │
│                                     │                │          │        │                   │                 │ IPv4-mapped IPv6 addresses                                   │
│                                     │                │          │        │                   │                 │ https://avd.aquasec.com/nvd/cve-2024-24790                   │
│                                     ├────────────────┼──────────┤        │                   ├─────────────────┼──────────────────────────────────────────────────────────────┤
│                                     │ CVE-2023-45288 │ HIGH     │        │                   │ 1.21.9, 1.22.2  │ golang: net/http, x/net/http2: unlimited number of           │
│                                     │                │          │        │                   │                 │ CONTINUATION frames causes DoS                               │
│                                     │                │          │        │                   │                 │ https://avd.aquasec.com/nvd/cve-2023-45288                   │
└─────────────────────────────────────┴────────────────┴──────────┴────────┴───────────────────┴─────────────────┴──────────────────────────────────────────────────────────────┘
```
