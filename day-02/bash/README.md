# Bash Scripting

The Bash work on Day 2 focused on writing small reusable operational scripts.

## Concepts

### Variables

```bash
count=1
echo "$count"
```

No spaces are used around `=` in assignment syntax.

### Command substitution

```bash
hostname=$(hostname)
```

### Conditions

```bash
if [ "$count" -le 5 ]
then
    echo "continue"
fi
```

The spaces around `[` and `]` matter because `[` is a command/test utility.

### Numeric operators

```text
-eq  equal
-ne  not equal
-lt  less than
-le  less than or equal
-gt  greater than
-ge  greater than or equal
```

### Arithmetic

```bash
count=$((count + 1))
```

### Exit codes

Linux commands conventionally return:

- `0` — success
- non-zero — failure

Bash can directly use a command's exit status:

```bash
if command
then
    echo "success"
fi
```

### Script arguments

```text
$0  script name
$1  first argument
$2  second argument
$#  number of arguments
$@  all arguments
```

### Functions

Functions make operational scripts reusable:

```bash
check_service(){
    ...
}

check_service "$service"
```

## Reusable service checker

The course evolved a service checker that distinguishes:

- running
- down
- not found

Example logic:

```bash
state=$(systemctl show "$1" --property=LoadState --value)

if [ "$state" = "not-found" ]
then
    echo "? $1 NOT FOUND"
elif systemctl is-active --quiet "$1"
then
    echo "✓ $1 RUNNING"
else
    echo "✗ $1 DOWN"
fi
```

## Important lesson

Quoting arguments such as `"$@"`, `"$service"` and `"$1"` is deliberate. It prevents word splitting and makes scripts safer when arguments contain spaces or shell metacharacters.
