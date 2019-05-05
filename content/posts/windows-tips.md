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
Display -> Scale and layout -> Change the size of text, apps, and other items -> 200%.  
Power & Sleep -> Screen -> 15 minutes
Power & Sleep -> Sleep -> Never
Notification & actions -> Notifications ->  Get notifications from apps and other senders -> Off
Storage -> Storage Sense -> On

#### Personalization
Background -> Choose your picture

#### Accounts
Your info -> Create your picture -> Browser for one -> Choose your avatar.

### Misc
Color management -> Advanced -> Display calibration -> Calibrate display.  

Right click on the taskbar -> Cortana -> Hidden.  
Right click on the taskbar -> Show People Button -> uncheck.  

## Software Configuration

### Free Download Manager

Open hamburger menu -> Settings.  
Browser Integration -> Enable integration with your browser and install the extension.  
Browser Integration -> Automatically catch downloads from browsers -> Deselect "Use browser if you cancel download via FDM".  
Traffic Limits -> Set limits.

### NordVPN

Countries -> Select a country you'd like to save as a favorite -> Hamburger menu -> Heart.

Settings:  
Enable "Auto connect", "Start NordVPN on startup", "Start minimized", "App Kill Switch" and select applications you want to kill if a VPN connection drops. The apps have to be running while setting this up. Choose System of measurement.

### Google Chrome

chrome://settings/ -> On startup -> Continue where you left off

## Usage

Remember to run `GeForce Experience` to update drivers from time to time.  
Open `Add or remove programs` to uninstall programs.  
Manage processes: Task Manager -> Processes.  
Monitor network activity: Task Manager -> Performance -> Select Ethernet.

## Games

### Steam
Steam -> Settings -> Downloads -> Content Libraries -> Steam library folders -> Add library folder
Steam -> Settings -> Account -> Beta participation -> Change -> Steam Beta Update
Steam -> Settings -> Downloads -> Download Restrictions -> Limit bandwidth to
Steam -> Settings -> Downloads -> Download Restrictions -> Allow downloads during gameplay

### Uplay

Settings -> Downloads -> Default game installation location -> Change
Settings -> Downloads -> Bandwidth usage limit

### GOG Galaxy
Settings -> Downloads -> Installing games -> Game installation folder
Settings -> Downloads -> Installing games -> Create shortcut on desktop -> check
Settings -> Downloads -> Bandwidth -> While playing -> Pause downloads when playing -> uncheck
Settings -> Downloads -> Bandwidth -> Bandwidth limit

## VMWare Player
Disable top bar

* Open `%APPDATA%\VMware\preferences.ini`
* Add `pref.vmplayer.fullscreen.nobar = 1`

Enable copypaste between host and guest machines

```
isolation.tools.copy.disable = "FALSE"
isolation.tools.paste.disable = "FALSE"
```