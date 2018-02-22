---
title: "Ubuntu Installation"
date: 2013-07-09T08:10:00
comments: true
categories: Ubuntu
description: Ubuntu Installation
keywords: ubuntu, installation
---

## Write Ubuntu image on a flash drive

```bash
hdiutil convert -format UDRW -o ~/image ubuntu-12.10-desktop-amd64.iso
diskutil list  # find which drive is a flash drive
diskutil unmountDisk /dev/disk2  # disk2 is an example
sudo dd if=~/image.dmg of=/dev/rdisk2 bs=1m
diskutil eject /dev/disk2
```
