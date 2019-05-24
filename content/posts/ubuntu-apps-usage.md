---
title: "Ubuntu Apps Usage"
date: 2014-06-16T10:40:00
comments: true
categories: Ubuntu
keywords: ubuntu, commands, programs, applications, apps
---

## Administration

### Monitoring

* htop - monitor system resources
* iotop - hard drive monitoring
* iftop - network monitoring
* [ngxtop](https://github.com/lebinh/ngxtop) - nginx monitoring
* mc - File manager

## Misc
* [httpie](https://github.com/jakubroztocil/httpie) - Modern command line HTTP client – user-friendly curl alternative with intuitive UI, JSON support, syntax highlighting, wget-like downloads, extensions, etc.
* [git-sh](https://github.com/rtomayko/git-sh) - A customized bash environment suitable for git work.
* [GNU Shockwave Flash (SWF) player](https://apps.ubuntu.com/cat/applications/raring/gnash/)
* git-gui
* [Ring](https://ring.cx/) - Ring is free software for universal communication which respects freedoms and privacy of its users.
* [gtk-recordmydesktop](https://apps.ubuntu.com/cat/applications/gtk-recordmydesktop/) - create screencasts

## Crontab
Examples:

```
0 0 * * * /home/script.sh > /var/log/script.log 2>&1  # run every day at 00:00, also record errors
0 0 1 * * /home/script.sh > /var/log/script.log  # run at 00:00 on the first day of the month
* * * * * /home/script.sh > /var/log/script.log  # run every minute
*/10 * * * * /home/script.sh > /var/log/script.log  # run every 10 minutes
@reboot /home/script.sh  # Run on reboot
```

## Nano

* [F3] - save file
* [Ctrl + X] - quit
* [Ctrl + C] - show current cursor position
* [Ctrl + W] - search
    * [Ctrl + R] - replace
    * [Ctrl + C] - cancel

## Screen

Screen manager.

* `screen` - run screen.
* `screen -r` - restore screen
* [Ctrl + A, D] - detach from screen
* [Ctrl + A, C] - create a new screen
* [Ctrl + A, Space] - switch screens

## How to be able to run programs for X server

```bash
sudo apt-get install xvfb
sudo Xvfb :10 -ac
export DISPLAY=:10
```

## Fix locales
```bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
```

## Virtualenv

```bash
virtualenv -p /usr/bin/python3.6 venv
```

## Virtualbox

Enable auto time synchronization with host

```bash
vboxmanage setextradata [vbox] "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled" "1"
```
## Terminator

Hotkeys:

* [Ctrl + Page Down] - go to next tab
* [Ctrl + Page Up] - go to previous tab
* F11 - toggle fullscreen
* [Ctrl + Shift + O] - split terminals horizontally
* [Ctrl + Shift + E] - split terminals vertically
* [Ctrl + Shift + W] - close current Panel
* [Ctrl + Shift + T] - open new tab
* [Ctrl + Shift + I] - open a new window
* [Alt + ↑] - move to the terminal above the current one
* [Alt + ↓] - move to the terminal below the current one 
* [Alt + ←] - move to the terminal left of the current one 
* [Alt + →] - move to the terminal right of the current one 
* [Ctrl + Shift + G] - reset terminal state and clear window
* [Ctrl + Shift + X] - toggle  between  showing  all  terminals  and  only  showing the current one (maximise)
* [Ctrl + Shift + Plus (+)] - increase font size.
* [Ctrl + Minus (-)] - decrease font size.
* [Ctrl + Zero (0)] - restore font size to original setting.
