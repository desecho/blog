---
title: "Windows Tips"
date: 2018-02-25T20:43:49-05:00
comments: true
categories: Windows
keywords: windows, tips
---

## Windows Configuration
Download and install [Windows Update](https://www.microsoft.com/en-us/software-download/windows10/)

### Settings

#### System
* `Display` → `Scale and layout` → `Change the size of text, apps, and other items` → `200%`
* `Power & Sleep` → `Screen` → `Never`
* `Power & Sleep` → `Sleep` → `Never`
* `Notification & actions` → `Notifications` → `Get notifications from apps and other senders` → `Off`
* `Storage` → `Storage Sense` → `On`

#### Personalization
`Background` → `Choose your picture`

#### Accounts
`Your info` → `Create your picture` → `Browser for one` → `Choose your avatar`

#### Misc
* `Color management` → `Advanced` → `Display calibration` → `Calibrate display`
* Right-click on the taskbar → uncheck `Show People Button`

### Install Posy's improved cursors
[Posy's improved cursors](http://www.michieldb.nl/other/cursors/)

### Access Startup
Press [Win + R], enter `shell:startup`.

## Software Configuration

### NordVPN
Open Settings:
* `Auto connect` → `VPN protocol` → `NordLynx`
* `Kill Switch` → `App Kill Switch` → enable, then select applications you want to kill if a VPN connection drops

### Google Chrome
`chrome://settings/` → `On startup` → `Continue where you left off`.

## Usage
* Open `Add or remove programs` to uninstall programs
* Manage processes: `Task Manager` → `Processes`
* Monitor network activity: `Task Manager` → `Performance` → select `Ethernet`

## Games

### Steam
open `Steam` → `Settings`:
* `Downloads` → `Content Libraries` → `Steam library folders` → add a library folder
* `Downloads` → `Download Restrictions` → `Allow downloads during gameplay`

### Ubisoft Connect
Open `Settings`:
* `Downloads` → `Default game installation location` → `Change`

### GOG Galaxy
Open `Settings` → `Downloads`:
* `Installing games` → `Game installation folder`
* `Installing games` → `Create a shortcut on desktop` → check
* `Bandwidth` → `While playing` → `Pause downloads when playing` → uncheck

## Tips

### How to Find Out if Your Drive Is an SSD Drive or Not
[Win + R] → `dfrgui`

### How to Add a Custom Host
* Run Notepad as administrator and open `C:\Windows\System32\drivers\etc\hosts`
* Add a new host

### Boost Microphone
Install [Equalizer APO](https://sourceforge.net/projects/equalizerapo/)

Run it. The Configurator will ask you to select the devices for which the program is to be installed, go to "Capture devices" and select the microphone. Reboot if asked.

Install [Peace Equalizer, interface Equalizer APO](https://sourceforge.net/projects/peace-equalizer-apo-extension/)

Run it. Choose `Simple interface`. Choose the microphone and then adjust the Pre Amplifying level from the top slider, that one going from -30 dB to +30 dB. Click `Done` in the bottom right.
