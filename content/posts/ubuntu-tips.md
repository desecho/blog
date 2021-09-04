---
title: "Ubuntu Tips"
date: 2014-06-16T10:40:00
comments: true
categories: Ubuntu
keywords: ubuntu, tips
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
