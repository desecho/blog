---
title: "Initial Ubuntu configuration"
date: 2012-09-05T02:09:00
comments: true
categories: Ubuntu
keywords: ubuntu
---

## Setup SSH Access from one computer to another without the need of entering password each time
```bash
ssh-keygen -t rsa -C "[email]" -f ~/.ssh/id_rsa -N ''
ssh-copy-id -i ~/.ssh/id_rsa.pub '-p [port] [username]@[ip]'
```

### Run sudo commands without password request
`sudo visudo`
Add to the end: `[user] ALL=(ALL) NOPASSWD: ALL`

### Set up DNS server
```bash
nano /etc/resolv.conf
nameserver 8.8.8.8
```

### Protect from attacks
[How To Protect SSH with Fail2Ban on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-fail2ban-on-ubuntu-14-04?utm_source=legacy_reroute)
