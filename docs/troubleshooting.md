# Troubleshooting Notes

## systemd: 203/EXEC

### Symptom

```text
Main process exited, code=exited, status=203/EXEC
```

### Meaning

systemd could not execute the command configured in `ExecStart`.

### Investigation

Check:

```bash
systemctl status <service>
systemctl cat <service>
journalctl -u <service> -b
```

Then verify:

```bash
ls -l /path/to/executable
head -n 1 /path/to/executable
```

Things to check:

- Does the path exist?
- Is the file executable?
- Is the shebang valid?
- Can the configured user access the file?
- Is the interpreter installed?

## Service vs port

A service check and a port check answer different questions.

```bash
systemctl is-active ssh
```

asks about a service unit.

```bash
ss -lnt | grep ':22 '
```

asks whether TCP port 22 is listening.

Do not automatically treat them as interchangeable.

## WSL filesystem

WSL exposes Windows drives under paths such as:

```text
/mnt/c
/mnt/d
```

Therefore `df -h` can show both Linux and Windows-mounted filesystems.

For Linux root filesystem health, inspect:

```bash
df -h /
```

rather than assuming every filesystem shown by `df` is equally relevant.

## CPU monitoring

`/proc/stat` contains cumulative counters. A single snapshot gives totals, not utilization.

The general approach is:

1. read counters at time T1
2. wait
3. read counters at time T2
4. calculate deltas
5. calculate the busy fraction

This is a recurring DevOps pattern: many monitoring metrics are derived from counter deltas rather than instantaneous values.
