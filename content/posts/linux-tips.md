---
title: "Linux Tips"
date: 2014-06-16T10:40:00
comments: true
categories: Linux
keywords: linux, tips
---

## How to Run Programs for X Server

```bash
sudo apt-get install xvfb
sudo Xvfb :10 -ac
export DISPLAY=:10
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

## Fix broken sudoers file

Run this:

```bash
pkexec visudo
```