---
title: "PostgreSQL"
date: 2014-06-22T00:22:00
comments: true
description: PostgreSQL
categories: DB
keywords: postgresql, db
---

## Main commands

* `\list` - show list of DBs
* `\dt` - show tables
* `\d+ [table]` - show database structure

## Copy DB
```sql
CREATE DATABASE [db2] WITH TEMPLATE [db1] OWNER [user];
```

## Commands

### Connect to DB

```bash
sudo -u postgres psql "user='[user]' password='[password]' host='[localhost]' port='[port]' dbname='[db_name]'"
```

### Create database:
```bash
sudo -u postgres createdb -O user_owner --encoding='utf-8' --locale=en_US.utf8 my_database
```

### Run command:
```bash
sudo -u postgres psql "user='postgres' password='password' host='localhost' port='5432' dbname=my_database" -c "CREATE EXTENSION postgis";
```

### Import dump
```bash
sudo -u postgres psql "user='postgres' password='password' host='localhost' port='5432' dbname=my_database" -f file.sql
```

### Create db from template

```bash
sudo -u postgres createdb -O user_owner --encoding='utf-8' --locale=en_US.utf8 -T my_database my_database2
```

## Activate correct encoding

```sql
SET client_encoding = 'UTF8';
```

## Open access

* 192.168.0.0/24 - example of a subnet to trust

```bash
echo 'host all all 192.168.0.0/24 trust' >> /etc/postgresql/9.1/main/pg_hba.conf
```

* We need to edit /etc/postgresql/9.1/main/postgresql.conf, where [ip] can be \* which means any.

`listen_addresses='[ip]'`

* Then restart the service:

```bash
service postgresql restart
```
