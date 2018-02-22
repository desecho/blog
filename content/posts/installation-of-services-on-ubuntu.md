---
title: "Installation of Services on Ubuntu"
date: 2015-03-07T15:55:00
comments: true
categories: Ubuntu
description: Installation of Services on Ubuntu
keywords: ubuntu, samba, installation, vpn, ssl, octopress, grive, stunnel4
---

## Install a service

Create file with contents:

```
/etc/systemd/system/[name].service

[Unit]
Description=[Service Name]
After=syslog.target

[Service]
ExecStart=[command]
Restart=always
RestartSec=5s
KillSignal=SIGQUIT

[Install]
WantedBy=multi-user.target
```

Run

```
chmod 644 /etc/systemd/system/[name].service
systemctl daemon-reload
```

## Samba

```bash
sudo apt-get install samba
sudo smbpasswd -a [user] # Set a password for your user in Samba
sudo nano /etc/samba/smb.conf
```

Add this to the end of the file:

```
[[name]]
path = [path]
available = yes
valid users = [user]
read only = no
browseable = yes
public = yes
writable = yes
```

```bash
sudo restart smbd
```

## stunnel4

Stunnel allows old devices which don't support smtp connections through ssl to support them.

```bash
sudo apt-get install stunnel4

sudo sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4

openssl req -new -out mail.pem -keyout mail.pem -nodes -x509 -days 365
# (Common name - domain name)

sudo mv ~/mail.pem /etc/ssl/certs/mail.pem

sudo cp /usr/share/doc/stunnel4/examples/stunnel.conf-sample /etc/stunnel/stunnel.conf
sudo nano /etc/stunnel/stunnel.conf
```

Change:

```
cert = /etc/ssl/certs/mail.pem
sslVersion = all
```

Add: (example)

```
[yandex-smtp]
client = yes
accept = 0.0.0.0:25
connect = smtp.yandex.ru:465
```

## Octopress

```bash
sudo su
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
export PATH=$PATH:/usr/local/rvm/bin
rvmsudo rvm get stable --auto-dotfiles
apt-get install ruby-dev ruby
rvm install 1.9.3
exit
/bin/bash --login
rvm --default use 1.9.3
sudo gem install bundler
rvm fix-permissions system
rvm group add rvm $USER
sudo bundle install
```

## Grive

Install [Grive](https://github.com/Grive/grive) and sync

```bash
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get install grive -y
mkdir /mnt/GoogleDrive
cd /mnt/GoogleDrive
grive -a
```
