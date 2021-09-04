---
title: "Installation Of Services On Ubuntu"
date: 2015-03-07T15:55:00
comments: true
categories: Ubuntu
keywords: ubuntu, samba, installation, ssl, stunnel4, service
---

## Install a Service
Create file `/etc/systemd/system/[name].service` with contents:
```ini
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
```bash
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
```ini
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

## Stunnel4

Stunnel allows old devices which don't support SMTP connections through SSL to support them.

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
```ini
cert = /etc/ssl/certs/mail.pem
sslVersion = all
```

Add config (for example):

```ini
[yandex-smtp]
client = yes
accept = 0.0.0.0:25
connect = smtp.yandex.ru:465
```
