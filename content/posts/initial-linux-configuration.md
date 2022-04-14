---
title: "Initial Linux Configuration"
date: 2012-09-05T02:09:00
comments: true
categories: Linux
keywords: linux, configuration
---

### Setup SSH Access From One Computer to Another Without Passwords

```bash
EMAIL="[email]"
PORT="[port]"
USERNAME="[username]"
IP="[ip]"
ssh-keygen -t rsa -C "$EMAIL" -f ~/.ssh/id_rsa -N ""
ssh-copy-id -i ~/.ssh/id_rsa.pub "-p $PORT $USERNAME@$IP"
```

### Run Sudo Commands Without Password Request

```bash
USERNAME="[username]"
sudo su
echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
```

### Set a DNS Server

```bash
sudo nano /etc/resolv.conf
```

```bash
nameserver [ip]
```

### Enable Password Authentication Through SSH

```bash
sudo nano /etc/ssh/sshd_config
```

Change `PasswordAuthentication` and `ChallengeResponseAuthentication` to yes.

```bash
service ssh restart
```
