---
title: "Editors Tips"
date: 2014-07-13T17:28:00
comments: true
categories: Text Editing
keywords: sublime text, vs code, editor, editing, tips
---

## VS Code

### Tips

#### Disable Hardware Acceleration

- Open the Command Palette [Ctrl + Shift + P]
- Run the `Preferences: Configure Runtime Arguments` command
- Add `"disable-hardware-acceleration": true`
- Restart VS Code

## Sublime Text

[Sublime Text](http://www.sublimetext.com/)

### Settings

#### Project Settings Example

```json
{
  "folders": [
    {
      "path": "[project_path]",
      "folder_exclude_patterns": ["[project_exclude_path]"],
      "file_exclude_patterns": ["[*.txt]"]
    }
  ]
}
```

### Tips

#### Edit Current Projects in the Switch Project List

Edit workspaces: `~/Library/Application Support/Sublime Text 3/Local/Session.sublime_session`.

#### Enable Middle Mouse Button Support in Ubuntu

```bash
nano ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-mousemap
```

```json
[
  // Mouse button 3 column select
  {
    "button": "button3",
    "press_command": "drag_select",
    "press_args": { "by": "columns" }
  },
  {
    "button": "button3",
    "modifiers": ["ctrl"],
    "press_command": "drag_select",
    "press_args": { "by": "columns", "additive": true }
  },
  {
    "button": "button3",
    "modifiers": ["alt"],
    "press_command": "drag_select",
    "press_args": { "by": "columns", "subtractive": true }
  }
]
```
