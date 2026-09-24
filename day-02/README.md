# Day 2 — Linux + Bash + systemd

Day 2 focused on understanding Linux as the operating environment underneath DevOps tooling.

## Topics completed

### Linux fundamentals
- Linux architecture: user → shell → system calls → kernel → hardware
- Kernel responsibilities
- Shell vs terminal
- Processes, PIDs and PPIDs
- Linux filesystem hierarchy
- Users, groups and permissions
- Directory permissions
- Services and background processes
- Logs and `journalctl`
- Signals and graceful vs forceful termination

### systemd
- `systemd` as the system/service manager
- `systemctl`
- service lifecycle
- enabling services
- service status
- service logs
- `journalctl -u`
- diagnosing service startup failures

### Bash
- variables
- command substitution
- loops
- conditionals
- numeric comparisons
- arithmetic expansion
- exit codes
- positional parameters
- `$#`, `$@`
- functions
- reusable service-check functions
- `awk` for parsing command output

### Monitoring / health checks
- CPU time counters
- memory usage
- filesystem usage
- service state
- TCP listening ports
- threshold-based health status

## Labs

- `linux/`
- `bash/`
- `systemd/`
- `server-health-check/`

## Troubleshooting lesson

One of the most useful labs was deliberately breaking a systemd service by pointing `ExecStart` at a missing executable.

The service produced:

`status=203/EXEC`

This was used to understand that systemd had failed to execute the configured command, rather than treating the error as an application-level failure.

## Next

The next Linux topic is process states, including zombies, followed by resource troubleshooting, permissions controls such as `umask`, SUID/SGID/sticky bits, and a broken-server incident lab.
