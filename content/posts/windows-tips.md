---
title: "Windows Tips"
date: 2018-02-25T20:43:49-05:00
comments: true
categories: Windows
keywords: windows, tips
---

## Usage Tips

- Open `Add or remove programs` to uninstall programs
- Manage processes: `Task Manager` → `Processes`
- Monitor network activity: `Task Manager` → `Performance` → select `Ethernet`
- Press [Win + R], enter `shell:startup` to access startup
- Press [Win + R], enter `shell:AppsFolder` to access application folder
- To find out if your drive is an SSD drive or not, press [Win + R], enter `dfrgui`

### Add a Custom Host

- Run Notepad as administrator and open `C:\Windows\System32\drivers\etc\hosts`
- Add a new host

### Run System File Checker

Run `Command Prompt` → `sfc /scannow`

### Run chkdsk

Run `Command Prompt` → `chkdsk /f /x /r [disk]:`

### Boost Microphone

Install [Equalizer APO](https://sourceforge.net/projects/equalizerapo/)

Run it. The Configurator will ask you to select the devices for which the program is to be installed, go to "Capture devices" and select the microphone. Reboot if asked.

Install [Peace Equalizer, interface Equalizer APO](https://sourceforge.net/projects/peace-equalizer-apo-extension/)

Run it. Choose `Simple interface`. Choose the microphone and then adjust the Pre Amplifying level from the top slider, that one going from -30 dB to +30 dB. Click `Done` in the bottom right.
