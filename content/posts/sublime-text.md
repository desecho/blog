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

The way to edit current projects (in the switch project list): Edit workspaces: `~/Library/Application Support/Sublime Text 3/Local/Session.sublime_session`.

## Hotkeys

* [Cmd + P] — switch files
* [Cmd + R] — go to functions/classes
* [Cmd + D] — quick select
* [Cmd + K], [Cmd + d] — skip selection
* [Cmd + Shift + L] — create multiple cursors
* [Cmd + Shift + P] — command mode
* [Cmd + F] — find text
* [Cmd + F], [alt + enter] —  find text and then select them all
* [Cmd + Alt + F] — replace text
* [Cmd + /] — comment/uncomment
* [Cmd + Ctrl + F] — full screen
* [Cmd + Ctrl + Shift + F] — distraction free
* [Cmd + K + B] — toggle sidebar
* [Ctrl + G] — go to line number
* [Ctrl + L] — center window
* [Cmd + L] — select line
* [Ctrl + Shift + K] — delete line
* [Cmd + ]] — indent
* [Cmd + [] — unindent
* [Cmd + Shift + Alt + 2/3] — change window layout to 2 or 3 rows
* [Cmd + Alt + 1/2/3] — change window layout to 1/2/3 columns
* [Ctrl + M] — go to matching bracket
* Bookmarks
    * [Cmd + F2] — create/delete bookmark
    * [Cmd + Shift + F2] — clear bookmarks
    * [F2] — go to next bookmark
    * [Shift + F2] — go to previous bookmark


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
