# systemd Lab

## Goal

Create, start, inspect and deliberately break a custom systemd service.

## Service

The lab service was named:

`devops-demo.service`

Conceptually:

```ini
[Unit]
Description=DevOps Training Demo Service
After=network.target

[Service]
Type=simple
ExecStart=/home/jefin3273/devops-course/day-02/systemd-lab/app.sh
Restart=on-failure
User=jefin3273

[Install]
WantedBy=multi-user.target
```

The service runs the Bash application as the normal user rather than root.

## Useful commands

```bash
sudo systemctl daemon-reload
sudo systemctl start devops-demo
sudo systemctl status devops-demo
sudo systemctl restart devops-demo
sudo systemctl stop devops-demo
sudo systemctl enable devops-demo
sudo systemctl enable --now devops-demo
journalctl -u devops-demo
journalctl -u devops-demo -f
```

## Failure lab: 203/EXEC

The executable referenced by `ExecStart` was deliberately renamed while the unit still referenced the old path.

systemd reported:

```text
status=203/EXEC
Failed with result 'exit-code'
```

### Diagnosis

`203/EXEC` means systemd failed to execute the configured `ExecStart` command.

Possible causes include:

- missing executable
- incorrect path
- executable bit missing
- invalid shebang/interpreter
- permissions problem
- invalid executable

`Restart=on-failure` then caused systemd to retry the service until its restart rate limit was reached.

## Key operational lesson

When a service fails, inspect the unit configuration and journal before guessing:

```bash
systemctl status devops-demo
journalctl -u devops-demo -b
```
