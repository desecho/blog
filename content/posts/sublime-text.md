---
title: "Sublime Text"
date: 2014-07-13T17:28:00
comments: true
categories: ['Sublime Text']
keywords: sublime text, editor
---

[Sublime Text](http://www.sublimetext.com/3)

## Settings

### Project settings example

```
{
    "folders":
    [
        {
            "path": "[project_path]",
            "folder_exclude_patterns": ["[project_exclude_path]"],
            "file_exclude_patterns": ["[*.txt]"],
        }
    ]
}
```

## Tips

The way to edit current projects (in the switch project list): Edit workspaces: ```~/Library/Application Support/Sublime Text 3/Local/Session.sublime_session```

## Hotkeys

* [cmd + p] - switch files
* [cmd + r] - go to functions/classes
* [cmd + d] - quick select
* [cmd + k], [cmd + d] - skip selection
* [cmd + shift + l] - create multiple cursors
* [cmd + shift + p] - command mode
* [cmd + f] - find text
* [cmd + f], [alt + enter] -  find text and then select them all
* [cmd + alt + f] - replace text
* [cmd + /] - comment / uncomment
* [cmd + ctrl + f] - full screen
* [cmd + ctrl + shift + f] - distraction free
* [cmd + k + b] - toggle sidebar
* [ctrl + g] - go to line number
* [ctrl + l] - center window
* [cmd + l] - select line
* [ctrl + shift + k] - delete line
* [cmd + ]] - indent
* [cmd + [] - unindent
* [cmd + shift + alt + 2/3] - change window layout to 2 or 3 rows
* [cmd + alt + 1/2/3] - change window layout to 1/2/3 columns
* [ctrl + m] - go to matching bracket
* Bookmarks
    * [cmd + F2] - create/delete bookmark
    * [cmd + shift + F2] - clear bookmarks
    * [F2] - go to next bookmark
    * [shift + F2] - go to previous bookmark


## Ubuntu

Enable middle mouse support.

```bash
nano ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-mousemap
```

```
[
    // Mouse 3 column select
    {
        "button": "button3",
        "press_command": "drag_select",
        "press_args": {"by": "columns"}
    },
    {
        "button": "button3", "modifiers": ["ctrl"],
        "press_command": "drag_select",
        "press_args": {"by": "columns", "additive": true}
    },
    {
        "button": "button3", "modifiers": ["alt"],
        "press_command": "drag_select",
        "press_args": {"by": "columns", "subtractive": true}
    }
]
```
