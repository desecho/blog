---
title: "MacOS Tips"
date: 2016-07-20T01:41:00
comments: true
categories: MacOS
keywords: macos
---

## Installation
Do not format your drive as a case sensitive partition. You won't be able to run applications like Steam or Photoshop.

## MacOS Configuration
Contacts -> File -> New Smart Group -> Card / is not member of / any group

## Remove duplicates in "open with"
```bash
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
```

## View sleep/wake log

```bash
pmset -g log|grep -e " Sleep  " -e " Wake  "
```

## Reindex Spotlight index
```bash
sudo mdutil -E /
sudo mdutil -i on /
```

## How to wipe your Mac & reset to factory settings

* Restart, then hold down the [Command + R] until you see an Apple logo or spinning globe.
* Select Disk Utility and click Continue.
* Click the Erase button.
* Select 'Reinstall macOS'.
* If you plan to give away your Mac, see details in the article [How to reinstall macOS](https://support.apple.com/en-gb/HT204904).
