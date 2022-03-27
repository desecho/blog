---
title: "Ubuntu Network Settings"
date: 2012-08-28T22:17:00
comments: true
categories: Ubuntu
keywords: ubuntu, network, configuration, administration
---

## IP Configuration

Clear the configuration file.

```bash
sudo cat /dev/null > /etc/network/interfaces
```

Edit configuration file with appropriate settings.

Restart networking service.

```bash
sudo service networking restart
```

### Static IP

```bash
auto lo eth0
iface lo inet loopback
iface eth0 inet static
    address 192.168.0.2
    netmask 255.255.255.0
    network 192.168.0.0
    broadcast 192.168.0.255
    gateway 192.168.0.1
    dns-nameservers 8.8.8.8
```

### Dynamic IP

```bash
auto lo eth0
iface lo inet loopback
iface eth0 inet dhcp
```

## VLAN Configuration

```bash
sudo apt-get install -y vlan
```

```bash
auto lo eth0.10 eth0.20
iface lo inet loopback
iface eth0.10 inet static
    address 192.168.0.2
    netmask 255.255.255.0
    network 192.168.0.0
    broadcast 192.168.0.255
    gateway 192.168.0.1
    dns-nameservers 8.8.8.8
iface eth0.20 inet static
    address 192.168.1.2
    netmask 255.255.255.0
    network 192.168.1.0
    broadcast 192.168.1.255
```
