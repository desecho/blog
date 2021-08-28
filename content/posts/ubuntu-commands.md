---
title: "Ubuntu commands"
date: 2012-08-30T02:28:00
comments: true
categories: Ubuntu
keywords: ubuntu, commands, cli
---

Program execution: `program -[option1][option2] --[special_option]`.

## Directories
* `ls [dir]`
    * `-h` — show file size in Kb, Mb
    * `-l` — show extended information
    * `-a` — show hidden files
    * `-t` — sort by date
    * `-S` — sort by size
* `cd [dir]` — switch to *dir*
* `mkdir [dir]` — create *dir*
* `pwd` — show current directory
* `du -sh [dir]` — show how much size a directory takes
* `du -hsx * | sort -rh | head -10` — show 10 biggest files/directories in the current directory
* `ncdu` — show the size of directories and files graphically

## Files
* `rm [file]` — remove *file*
    * `-r` — delete recursively, also to delete directories
    * `-f` — force-delete files
* `cp [file1] [file2]` — copy file
    * `-r` — copy recursively
    * `-i` — show notification on conflicts
    * `-n` — don't ovewrite
* `mv [file1] [file2]` — move file
* `cat [file]` — print *file* contents
* `more [file]` — show file contents with ability to browser through the file
* `scp -P [port] [user]@[hostname]:[file1] [file2]` — copy file
* `rsync -ah --stats -P [source-file] [destination]` — copy files with ability to resume
* `rsync --rsync-path="sudo rsync" [source-file] [destination]` — copy files with sudo
* `ln -s [existing-file] [link-file]` — create symbolic link (need to use full paths)

## Processes
* `ps` — show running processes by the current user
    * `ps ax` — show all running processes
* `kill [PID]` — kill process *PID* (soft)
    * `-9` — kill process *PID* (hard)

## Access rights
For all of the commands below: `-r` — recursive change.

* `chgrp [group] [file]` — change *group* for *file*
* `chown [user]:[group] [file]` — change *file* group and owner
* `chown [user] [file]` — change *file* owner
* `chmod` — change file mode bits
* `find [path] -type d -exec chmod 755 {} \;`
* `find [path] -type f -exec chmod 644 {} \;`

## Search

* Search directories and subdirectories
    * `grep [text] [dir/file]`
        * `-r` — recursive search
        * `-i` — case insensitive search
        * `-I` — ignore binary files
* Search files using locate
    * `locate [file]` — locate *file*
    * `sudo updatedb` — update the search index.
* `find [dir] -name "[*.*]" -type f` — list files in a directory recursively
    - add `-delete` to remove the files
* `find . -type f -exec cat {} +` — output contents of all files in the current folder

## File reading
* `head [file]` — get file header
    * `-n [x]` — show *x* number of lines
* `tail [file]` — get file tail
    * `-n [x]` — show *x* number of lines
    * `-f` — auto-update

## Device mounting
* `mount [device] [directory]` — mount *device*
* `umount [device]` — unmount *device*
* `umount [dir]` — unmount *dir*

## Network
* `netstat -nat ` — show open ports
* `netstat -peant | grep ":[port]"` — find process which uses port

## Administration
* `sudo [program]`
    * `sudo su` — switch to user root
    * `sudo su [user]` — switch user
* `sudo shutdown now`/`sudo init 0` — shutdown
* `sudo reboot` — reboot
* `df -h` — show disk space
* `lsb_release -a` — show Ubuntu information
* `free -h` — show RAM utilization
* `uname -a` — show information about the installed version of Linux

### User administration
* `sudo useradd [user] -m` — create a*user* and a home directory
* `sudo userdel [user]` — delete a *user*
* `sudo passwd [user]` — change *user*'s password

### Package management
* `sudo dpkg -i [package]` — install *package*
* `sudo apt` — package manager
    * `install [package]` — install *package*
    * `remove --purge [package]` — remove *package*
    * `update` — update list of available packages
    * `upgrade` — upgrade installed packages
    * `autoremove` — remove unused packages
* `sudo add-apt-repository ppa:[user]/[name]` — add apt sources.list entries
* `sudo add-apt-repository ppa:[user]/[name] --remove` — remove apt sources.list entries

### Variables
* `VAR='123'`
* `export VAR='123'`
* `unset VAR`

## HTTP
* `curl http://google.com` — send *GET* request
    * `-d` — send data
    * `-H` — add header
    * `-I` — get headers only
    * `-X POST` — send *POST* request
    * `--resolve [domain]:[port]:[ip] http://[domain]` — send a request with specified domain resolution

## Additional
* `wget [file-url]` — download file
* `watch [command]` — watch changes of the command continuously
    * `watch '[command1] | [command2]'` — watch changes of the command continuously with usage of pipes
* `man [program]` — get *program* manual
* `date` — show current date and time
    * `date -d "yesterday" '+%d-%m-%Y'` — get yesterday's day in a specified format
    * `sudo /usr/sbin/ntpdate ntp.ubuntu.com` — synchronize date and time
* `echo [text]` — print *text*
* `touch [file]` — create a file
* `time [program]` — show how long a program is running
* `sleep [x]` — wait for *x* seconds
* Patches
    * `diff [old_file] [new_file] > [patch].diff` — create patch
    * `patch old_file patch` — apply a patch
* `sudo hostname your-new-name` — change the hostname. Permanent value is in `/etc/hostname`
* `tar -cvzf [archive.tar.gz] [file]` — archive file
* `truncate -s 0 [file]` — truncate a file to 0 bytes
* `pwgen -ys 15 1` — generate password
* `sed -i 's/old-text/new-text/g' [file]` — replace text in the file

## Shortcuts
* [Readline shortcuts](http://www.bigsmoke.us/readline/shortcuts)
