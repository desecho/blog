---
title: "Linux CLI"
date: 2012-08-30T02:28:00
comments: true
categories: Linux
keywords: linux, commands, cli
---

## Files/Directories

- `rm [file/dir]` — remove a `file` or a `dir`
  - `-r` — delete recursively, also to delete directories
  - `-f` — force-delete
- `cp [source] [target]` — copy files/directories
  - `-r` — copy recursively
  - `-i` — show notification on conflicts
  - `-n` — don't overwrite
- `mv [source] [destination]` — move files/directories
- `scp -P [port] [user]@[hostname]:[source] [target]` — copy files/directories
- `rsync -a --stats [source] [target]` — copy files/directories with ability to resume and mirror
- `rsync -a --stats --delete -P [source] [target]` — copy files/directories with ability to resume and delete files in
  destination that are not in the source.
- `rsync --rsync-path="sudo rsync" [source] [target]` — copy files/directories with sudo
- `tar -cvzf [archive.tar.gz] [file/dir]` — archive a `file/dir`

## Directories

- `ls` — list current directory contents
  - `-h` — show file size in Kb/Mb
  - `-l` — show extended information
  - `-a` — show hidden files
  - `-t` — sort by date
  - `-S` — sort by size
- `ls [dir]` — list `dir` contents
- `cd [dir]` — switch to `dir`
- `mkdir [dir]` — create `dir`
- `pwd` — show current directory
- `du -sh [dir]` — show `dir` size
- `du -hsx * | sort -rh | head -10` — show 10 biggest files/directories in the current directory
- `ncdu` — show the size of directories and files graphically

## Files

- `ln -s [file] [link-file]` — create a symbolic link (need to use full paths)
- `cat [file]` — print `file` contents
- `cat > [file]` — create file. After entering the command, enter the file content and press [Ctrl + D].
- `more [file]` — show `file` contents with ability to browse through the `file`
- `head [file]` — get the `file` header
  - `-n [x]` — show `x` number of lines
- `tail [file]` — get the `file` tail
  - `-n [x]` — show `x` number of lines
  - `-f` — auto-update
- `touch [file]` — create an empty `file`
- `sed -i 's/[old-text]/[new-text]/g' [file]` — replace text in a `file`
- `sed -i '/^$/d' [file]` — remove empty lines in a `file`
- `grep -v [text] [file] > [file2]` — remove lines containing `text` in a `file` and save to `file2`
- `truncate -s 0 [file]` — truncate a `file` to 0 bytes

## Text

- `echo [text]` — print `text`
- `echo [text] | awk '{ print $1 }'` — print first column of `text`

## Processes

- `ps` — show running processes
  - `ps aux` — show running processes in more detail. See [What does aux mean in "ps aux"?](https://unix.stackexchange.com/questions/106847/what-does-aux-mean-in-ps-aux) for more details
- `kill [PID]` — kill process with `PID` (soft)
  - `-9` — kill process with `PID` (hard)

## Access Rights

For all of the `chrgrp` and `chown` commands below: `-r` — recursive change.

- `chgrp [group] [file/dir]` — change `group` for a `file/dir`
- `chown [user]:[group] [file/dir]` — change `file/dir`'s `group` and owner
- `chown [user] [file/dir]` — change `file/dir`'s owner
- `chmod [ABC] [file/dir]` — change `file/dir`'s mode bits to `ABC` (example — `644`)
- `find [path] -type d -exec chmod [ABC] {} \;` — set `ABC` permissions for all directories in `path` recursively
- `find [path] -type f -exec chmod [ABC] {} \;` — set `ABC` permissions for all files in `path` recursively

## Search

- `grep [text] [file/dir]` — search for `text`
  - `-r` — recursive search
  - `-i` — case insensitive search
  - `-I` — ignore binary files
- Search files using locate
  - `locate [file]` — locate a `file`
  - `sudo updatedb` — update the search index
- `find [dir] -name "[mask]" -type f` — list files in a `dir` recursively. `mask` can be `*.*` for example
  - `-delete` — remove the found files
- `find . -type f -exec cat {} +` — output contents of all files in the current directory recursively

## Device Mounting

- `mount [device] [dir]` — mount a `device` to a `dir`
- `umount [device]` — unmount a `device`
- `umount [dir]` — unmount a `dir`

## Network

- `netstat -peanut` — show open ports
- `netstat -peanut | grep ":[port]"` — find process which uses `port`
- `nc -zv [host] [port]` — check connection to a `host:port`

## Administration

- `sudo [program]` — run `program` with root privileges
  - `sudo su` — switch to user root
  - `sudo su [user]` — switch to the `user`
- `sudo shutdown now`/`sudo init 0` — shutdown
- `sudo reboot` — reboot
- `df -h` — show disk space
- `free -h` — show RAM utilization
- `uname -a` — show information about the installed version of Linux
- `sudo hostname your-new-name` — change the hostname. Permanent value is in `/etc/hostname`
- `journalctl -S [date-time1] -U [date-time2]` — show journal records from `date-time1` until `date-time2`. Where date-time format is like this: `2022-01-0100:00:00`

### User Administration

- `sudo useradd [user] -m` — create a `user` and a home directory
- `sudo userdel [user]` — delete a `user`
- `sudo passwd [user]` — change `user`'s password

### Package Management (Debian)

- `sudo dpkg -i [package]` — install a `package`
- `sudo apt` — package manager
  - `install [package]` — install a `package`
  - `remove --purge [package]` — remove a `package`
  - `update` — update the list of available packages
  - `upgrade` — upgrade installed packages
  - `autoremove` — remove unused packages
- `sudo add-apt-repository ppa:[user]/[name]` — add apt sources.list entries
- `sudo add-apt-repository ppa:[user]/[name] --remove` — remove apt sources.list entries

## Fedora

- `sudo systemctl restart chronyd` — sync date & time
- `sudo rpm -i [file]` — install rpm package

## Ubuntu/Debian

- `lsb_release -a` — show Ubuntu information
- `sudo /usr/sbin/ntpdate ntp.ubuntu.com` — synchronize date and time

## Variables

- `VAR="123"` — define a variable
- `export VAR` — export a variable
- `unset VAR` — unset a variable

## HTTP

- `curl [url]` — send a `GET` request
  - `-d` — send data
  - `-H` — add header
  - `-I` — get headers only
  - `-X POST` — send a `POST` request
  - `--resolve [domain]:[port]:[ip] [scheme]://[domain]` — send a request with specified domain resolution

## Patches

- `diff [old-file] [new-file] > [patch]` — create a `patch`
- `patch [old-file] [patch]` — apply a `patch`

## Conversion

- `yq eval -j [file-yaml] > [file-json]` — convert a YAML file `file-yaml` to a JSON file `file-json`.
- `cat [file-json] | yq e -P - > [file-yaml]` — convert a JSON file `file-json` to a YAML file `file-yaml`.

## Miscellaneous

- `wget [file-url]` — download a file
- `watch [command]` — watch changes of the command continuously
  - `watch '[command1] | [command2]'` — watch changes of the command continuously when using pipes
- `man [program]` — get `program`'s manual
- `date` — show current date and time
  - `date [format]` — show date in a specified `format`. Format can be `+%d-%m-%Y` for example
  - `date -d "yesterday"` — get yesterday's day
- `time [program]` — show how long a `program` is running
- `sleep [x]` — wait for `x` seconds
- `pwgen -ys 15 1` — generate password
- `screen` — screen manager
  - `-r` — restore screen
- `ssh [user]@[ip]` — connect to an `ip` with `user` through SSH
  - `-i [key]` — connect with `key`
- `timedatectl` — find the current time sync status
- `[command] 2>[file]` — redirect error output to `file`. Example - `file` = `/dev/null`
