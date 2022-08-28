---
title: "macOS Tips"
date: 2016-07-20T01:41:00
comments: true
categories: macOS
keywords: macos, tips
---

## Installation

Do not format your drive as a case-sensitive partition. You won't be able to run applications like Steam or Photoshop.

## Connect to a Windows Share Network Host

* Open Finder → `Go` → `Connect to Server`
* Enter `smb://[host]` where `host` is your network host

## Remove Duplicates in "open with"

```bash
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
```

## View Sleep/Wake Log

```bash
pmset -g log | grep -e " Sleep  " -e " Wake  "
```

## Reindex Spotlight Index

```bash
sudo mdutil -E /
sudo mdutil -i on /
```

## How to Wipe Your Mac & Reset to Factory Settings

* Restart, then hold down the [Cmd + R] until you see an Apple logo or spinning globe
* Select `Disk Utility` and click `Continue`
* Click the Erase button
* Select `Reinstall macOS`
* If you plan to give away your Mac, see details in the article [How to reinstall macOS](https://support.apple.com/en-gb/HT204904)
