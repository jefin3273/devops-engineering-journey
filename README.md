# DevOps Engineering Journey

A hands-on record of my journey from Linux and Bash fundamentals to production-oriented DevOps engineering.

This repository documents what I **build, break, troubleshoot, and learn** rather than only collecting notes.

## Roadmap

- [x] Day 1 — DevOps fundamentals
- [x] Day 2 — Linux, systemd, Bash scripting, server health checks
- [ ] Day 3 — Networking
- [ ] Day 4 — Git + advanced Bash
- [ ] Day 5 — Java + Maven + Tomcat
- [ ] Day 6 — Jenkins + CI/CD
- [ ] Day 7 — AWS fundamentals
- [ ] Terraform
- [ ] Docker
- [ ] Kubernetes
- [ ] EKS
- [ ] Ansible + Nginx
- [ ] Monitoring + Logging
- [ ] DevSecOps
- [ ] Production-style capstone

## Repository philosophy

For every major topic I aim to leave behind:

1. Working code or a reproducible lab
2. Documentation explaining the underlying concepts
3. Troubleshooting notes
4. Interview-oriented takeaways
5. A real-world connection to DevOps work

## Day 2 highlights

- Linux architecture
- Filesystem hierarchy
- Users, groups and permissions
- Processes and PIDs
- Services and systemd
- `systemctl` and `journalctl`
- Signals and process termination
- Bash variables, loops and conditionals
- Exit codes
- Script arguments
- Functions
- `awk` and command substitution
- Service health checks
- TCP port checks with `ss`
- Disk health checks
- Memory health checks
- A reusable Bash server health-check utility
- Troubleshooting a real `systemd` `203/EXEC` failure

## Example project

`day-02/server-health-check/`

The health-check utility reports:

- system information
- memory information
- disk information
- service status
- TCP listening ports
- root filesystem usage
- memory usage

## Current learning approach

I am intentionally learning the Linux/DevOps fundamentals deeply enough to troubleshoot systems independently instead of relying on copy-paste commands.

More advanced automation and infrastructure will be added incrementally as the course progresses.
