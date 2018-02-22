---
title: "nginx"
date: 2016-07-11T2:28:00
comments: true
categories: Ubuntu
description: nginx
keywords: ubuntu, server, nginx, hosting, php
---
## PHP setup

```bash
apt-get install php5-fpm php5-mysql
nano /etc/php5/fpm/php.ini
```

Change `cgi.fix_pathinfo=0`

Restart php

```bash
service php5-fpm restart
```

Create configuration file in ```/etc/nginx/sites-enabled/```

```
server {
    server_name [domain];
    charset     utf-8;
    root [path_to_site];
    index index.php;

    location ~ \.php$ {
           fastcgi_split_path_info ^(.+\.php)(/.+)$;
           try_files $uri =404;
           fastcgi_pass unix:/var/run/php5-fpm.sock;
           fastcgi_index index.php;
           include fastcgi_params;
    }
}
```

```bash
service nginx restart
```
