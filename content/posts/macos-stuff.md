---
title: "MacOS Stuff"
date: 2016-07-20T01:41:00
comments: true
categories: MacOS
description: MacOS Stuff
keywords: macos
---

## Remove duplicates in "open with"

```bash
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
```

## View sleep/wake log

```bash
pmset -g log|grep -e " Sleep  " -e " Wake  "
```

## Reindex Spotlight index
```
sudo mdutil -E /
sudo mdutil -i on /
```
