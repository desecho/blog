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
