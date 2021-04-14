---
title: "Windows Tips"
date: 2018-02-25T20:43:49-05:00
comments: true
categories: Windows
keywords: windows
---

## Windows Configuration

### Settings
#### System
Display → Scale and layout → Change the size of text, apps, and other items → 200%.  
Power & Sleep → Screen → 15 minutes.  
Power & Sleep → Sleep → Never.  
Notification & actions → Notifications →  Get notifications from apps and other senders → Off.  
Storage → Storage Sense → On.  

#### Personalization
Background → Choose your picture.

#### Accounts
Your info → Create your picture → Browser for one → Choose your avatar.

#### Misc
Color management → Advanced → Display calibration → Calibrate display.  

Right-click on the taskbar → Cortana → Hidden.  
Right-click on the taskbar → Show People Button → uncheck.  

### Access startup

Press [Win + R], enter `shell:startup`.

## Software Configuration

### Free Download Manager

Open hamburger menu → `Settings`:  
`Browser Integration` → `Enable integration with your browser and install the extension`.  
`Browser Integration` → `Automatically catch downloads from browsers` → Unselect `Use browser if you cancel download via FDM`.  

### NordVPN
Settings:  
* `Auto connect` → `VPN protocol` → `NordLynx`
* `Kill Switch` → `App Kill Switch` → enable, then select applications you want to kill if a VPN connection drops

### Google Chrome
`chrome://settings/` → `On startup` → `Continue where you left off`.

## Usage
Remember to run `GeForce Experience` to update drivers from time to time.  
Open `Add or remove programs` to uninstall programs.  
Manage processes: `Task Manager` → `Processes`.  
Monitor network activity: `Task Manager` → `Performance` → select `Ethernet`.

## Games

### Steam
`Steam` → `Settings`:  
`Downloads` → `Content Libraries` → `Steam library folders` → add library folder.  
If you want to participate in beta: `Account` → `Beta participation` → `Change` → `Steam Beta Update`. 
`Downloads` → `Download Restrictions` → `Allow downloads during gameplay`.  

### Uplay
Settings:  
`Downloads` → `Default game installation location` → `Change`

### GOG Galaxy
`Settings` → `Downloads`:  
`Installing games` → `Game installation folder`.
`Installing games` → `Create a shortcut on desktop` → check.
`Bandwidth` → `While playing` → `Pause downloads when playing` → uncheck.

## Tips

### How to find out if your drive is SSD or not
[Win + R] → dfrgui

### How to add a custom host
* Run notepad as administrator and open `C:\Windows\System32\drivers\etc\hosts`
* Add a new host
