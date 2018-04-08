---
title: "Ubuntu commands"
date: 2012-08-30T02:28:00
comments: true
categories: Ubuntu
keywords: ubuntu, commands, programs, ubuntu cli, ls, cd, mkdir, pwd, du, rm, cp, mv, cat, more, nano, ps, kill, chgrp, chown, chmod, sudo, df, apt-get, grep, man, date, echo, locate, useradd, userdel, passwd, head, tail, mount, umount, touch, time, sleep, pwgen
---

Simple program execution: `program -[option1][option2] --[special_option]`

## Directories
* `ls [dir]`
    * `-h` - show file size in Kb, Mb.
    * `-l` - show extended information.
    * `-a` - show hidden files.
    * `-t` - sort by date.
    * `-S` - sort by size.
* `cd [dir]`
* `mkdir [dir]`
* `pwd` - current directory.
* `du -sh [dir]` - show how much size a directory takes.
* `du -hsx * | sort -rh | head -10` - show 10 biggest files/directories in the current directory.

## Files
* `rm [file]`
    * `-r` - delete recursively, also to delete directories.
    * `-f` - force-delete files.
* `cp [file1] [file2]`
    * `-r` - copy recursively.
    * `-i` - show notification on conflicts.
    * `-n` - don't ovewrite.
* `mv [file1] [file2]`
* `cat [file]`
* `more [file]`
* `scp -P [port] [user]@[hostname]:[file1] [file2]`
* `rsync -ah --stats -P [source-file] [destination]` - copy files with ability to resume.
* `rsync --rsync-path="sudo rsync" [source-file] [destination]` - copy files with sudo.
* `ln -s [existing-file] [link-file]` - create symbolic link (need to use full paths).

## Processes
* `ps` - show running processes by current user.
    * `ps ax` - show all running processes.
* `kill [PID]` - kill process *PID* (soft).
    * `-9` -  kill process *PID* (hard).

## Access rights
For all of the commands below: `-r` - recursive change.

* `chgrp [group] [file]`
* `chown`
    * `chown[user]:[group] [file]`
    * `chown[user] [file]`
* `chmod`

```bash
find [path] -type d -exec chmod 755 {} \;
find [path] -type f -exec chmod 644 {} \;
```

## Search

* Search directories and subsirectories.
    * `grep [text] [dir]`
        * `-r` - recursive search.
        * `-i` - case insensitive search.
        * `-I` - ignore binary files.
* Search files using locate
    * `locate [file]`
    * `sudo updatedb` - update search index.
* `find [dir] -name "[*.*]" -type f` - list files in a directory recursively.
    - add `-delete` to remove the files.
* `find . -type f -exec cat {} +` - output contents of all files in the current folder.

## File reading
* `head [file]`
    * `-n [x]` - show *x* number of lines.
* `tail [file]`
    * `-n [x]` - show *x* number of lines.
    * `-f` - auto update.

## Device mounting
* `mount [device] [directory]`
* `umount [dir]` / `umount [device]`

## Network
* `netstat -nat ` - show open ports.
* `netstat -peant | grep ":[port]"` - find process which uses port.

## Administration
* `sudo [program]`
    * `sudo su` - switch to user root.
    * `sudo su [user]` - switch user.
* `sudo shutdown now` / `sudo init 0`  - shutdown.
* `sudo reboot` - reboot.
* `df -h` - show disk space.
* `lsb_release -a` - show Ubuntu information.
* `free -h` - RAM utilization.
* `uname -a` - show information about the installed version of linux.

### User administration
* `sudo useradd [user] -m` - create user and a home directory.
* `sudo userdel [user]`
* `sudo passwd [user]`

### Package management
* `sudo dpkg -i` - install package.
* `sudo apt-get` - package manager.
    * `install [package]`
    * `remove --purge [package]` - remove *package*.
    * `clean` - remove unused packages.
    * `update`
    * `upgrade` - upgrade installed packages.
* `sudo add-apt-repository ppa:[user]/[name]`
* `sudo add-apt-repository ppa:[user]/[name] --remove`

### Variables
* `VAR='123'`
* `export VAR='123'`
* `unset VAR`

## Additional
* `wget [file-url]` - download file.
* `grep [text]`
* `man [program]`
* `date` - show current date and time.
    * `sudo date --set="25 March 2014 10:00:00"` - example to set up date and time.
    * `sudo /usr/sbin/ntpdate ntp.ubuntu.com` - syncronize date and time.
* `echo [text]`
* `touch [file]`
* `time [program]` - show how long a program is running.
* `sleep [x]`
* Patches
    * `diff [old_file] [new_file] > [patch].diff` - create patch.
    * `patch old_file patch` - apply patch.
* `sudo hostname your-new-name` - change hostname. Permanent value is in `/etc/hostname`.
* `bzip2 -c [file] > [archive.bz2]` 
* `tar -cvzf [archive.tar.gz] [file]`
* `curl -I http://google.com` - get headers only

## Shortcuts
* [Readline shortcuts](http://www.bigsmoke.us/readline/shortcuts)

## HowTos

* [HowTo: Find Out My Linux Distribution Name and Version](https://www.cyberciti.biz/faq/find-linux-distribution-name-version-number/)
* [How to Change the Hostname of a Linux System](http://www.ducea.com/2006/08/07/how-to-change-the-hostname-of-a-linux-system/)
