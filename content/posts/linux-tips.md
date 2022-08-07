---
title: "Linux Tips"
date: 2014-06-16T10:40:00
comments: true
categories: Linux
keywords: linux, tips
---

## Run Programs for X Server

```bash
sudo apt-get install xvfb
sudo Xvfb :10 -ac
export DISPLAY=:10
```

## Install telnet on Alpine

```bash
apk add busybox-extras
```

## Install ps on Ubuntu

```bash
sudo apt install procps
```

## Fix Locales

```bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
```

## VirtualBox

Enable auto time synchronization with host

```bash
vboxmanage setextradata [vbox] "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled" "1"
```

## Oh My Zsh

| Command    | Description                                                                               |
| ---------- | ----------------------------------------------------------------------------------------- |
| `alias`    | List all aliases                                                                          |
| `take`     | Create a new directory and change to it, will create intermediate directories as required |
| `exec zsh` | Apply changes made to `.zshrc`                                                            |

## Fix Broken sudoers File

Run this:

```bash
pkexec visudo
```

## Bash

### Make it so that the Script will always run Commands from the Directory the Script is in

```bash
cd "$(dirname "$0")"
```

### A Good Way to Start a Bash Script

```bash
#!/bin/bash

set -eou pipefail
```

* `pipefail` - If set, the return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands in the pipeline exit successfully.
* `-e` - Exit immediately if a pipeline, which may consist of a single simple command, a list, or a compound command returns a non-zero status.
* `-u` - Treat unset variables and parameters other than the special parameters ‘@’ or ‘*’ as an error when performing parameter expansion. An error message will be written to the standard error, and a non-interactive shell will exit.
* `-o [option-name]` - Set the option corresponding to `option-name`.

See details in the docs - [The Set Builtin](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html).
