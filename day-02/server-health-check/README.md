# Bash Server Health Check

A small operational Bash utility built during the Linux/Bash module.

## Purpose

The script combines several independent checks into one report:

- host information
- memory information
- disk information
- service state
- TCP listening ports
- root filesystem usage
- memory usage

## Monitoring model

The project helped establish a useful mental model:

`Collect → Parse → Normalize → Evaluate → Report`

The script does not magically "know" server health. It collects measurements from Linux interfaces and tools, interprets them, applies thresholds, and reports the result.

## Checks implemented

### System information

Uses commands such as:

```bash
hostname
whoami
pwd
date
uptime
```

### Memory

Raw memory:

```bash
free -h
```

The health calculation uses `available` memory rather than treating the raw `free` value as the complete definition of memory pressure.

### Disk

Filesystem information:

```bash
df -h
```

Root filesystem usage is evaluated separately using `df -P /`.

Current policy used in the lab:

- `>= 85%` → Critical
- `>= 70%` → Warning
- below `70%` → Normal

These thresholds are policy choices, not universal Linux standards.

### Services

The script checks service state with `systemctl`.

A useful distinction was discovered:

**service state and port state are separate signals.**

For example, a port can be listening even when a particular service unit reports an unexpected state, especially when socket activation or other systemd mechanisms are involved.

### Ports

TCP listening ports are checked with:

```bash
ss -lnt
```

The health checker tests ports such as:

```text
22
8080
80
443
```

### CPU exploration

The lab also explored `/proc/stat`.

The first `cpu` line contains cumulative CPU time counters:

```text
cpu user nice system idle iowait irq softirq steal guest guest_nice
```

A single reading is **not** CPU utilization. Utilization requires comparing counters over an interval.

This was intentionally left as a learning exercise rather than pretending that a one-line calculation is a production CPU monitor.

## Example output

The script produced results such as:

```text
✓ Port 22 LISTENING
✗ Port 8080 NOT LISTENING
✗ Port 80 NOT LISTENING
✗ Port 443 NOT LISTENING

Memory Usage:
7% -> Normal
```

## What I learned

The most important lesson was not the individual commands. It was learning how to decompose a monitoring problem into measurable signals and then validate each signal independently.
