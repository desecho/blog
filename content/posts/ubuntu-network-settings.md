---
title: "Ubuntu network settings"
date: 2012-08-28T22:17:00
comments: true
categories: Ubuntu
description: Ubuntu network settings. Static IP, DHCP, VLAN
keywords: ubuntu, network configuration, administration
---

## IP Configuration

1. Clear the configuration file ```sudo cat /dev/null > /etc/network/interfaces```
2. Edit configuration file with appropriate settings
3. Restart networking service

```
sudo service networking restart
```

### Static IP

```
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

```
auto lo eth0
iface lo inet loopback
iface eth0 inet dhcp
```

## Vlan Configuration
```
sudo apt-get install -y vlan
```

```
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
