# Linux Fundamentals

## Architecture

A simplified Linux execution path:

`User → Shell → System Calls → Kernel → Hardware`

The kernel manages CPU scheduling, memory, processes, storage, networking and security.

## Filesystem

Important paths studied:

| Path | Purpose |
|---|---|
| `/` | Root filesystem |
| `/home` | Normal users' home directories |
| `/root` | Root user's home |
| `/etc` | System configuration |
| `/var` | Variable data such as logs |
| `/tmp` | Temporary files |
| `/opt` | Optional application software |
| `/usr` | User-space programs and libraries |
| `/proc` | Virtual process/kernel information |
| `/dev` | Device interfaces |
| `/sys` | Kernel/device information |
| `/run` | Runtime state |

## Permissions

Linux permissions use:

- `r` — read
- `w` — write
- `x` — execute

For directories:

- `r` — list entries
- `w` — create/delete/rename directory entries
- `x` — traverse/access entries

Examples:

- `644` → `rw-r--r--`
- `755` → `rwxr-xr-x`
- `640` → `rw-r-----`
- `600` → `rw-------`

## Users and groups

Useful commands:

```bash
whoami
id
groups
```

Important files:

```text
/etc/passwd
/etc/group
/etc/shadow
```

## Processes

A process is a running instance of a program.

Useful commands:

```bash
ps
ps aux
ps -ef
top
pstree
```

Each process has a PID and normally a parent PID (PPID).

## Services

A service is typically a long-running background process managed by a service manager.

Examples:

- SSH
- Nginx
- Tomcat
- Docker
- Jenkins
- PostgreSQL

## Logs

Common tools:

```bash
journalctl
journalctl -u <service>
journalctl -u <service> -f
journalctl -b
journalctl -p err
```

## Troubleshooting sequence

A useful first-pass sequence:

1. Is the server alive?
2. Is the process running?
3. Is the service healthy?
4. Is the expected port listening?
5. Does the application respond locally?
6. What do the logs say?
7. Are permissions correct?
8. Are CPU/memory/disk resources exhausted?
9. Is the network path/firewall correct?

## Next Linux lab

Process states will be studied next, including deliberately creating and identifying a zombie process.
