---
title: "PostgreSQL"
date: 2014-06-22T00:22:00
comments: true
categories: DB
keywords: postgresql, db
---

## Main Commands

* `\list` — show list of DBs
* `\dt` — show tables
* `\d+ [table]` — show database structure

## Copy a DB

```sql
CREATE DATABASE [db2] WITH TEMPLATE [db1] OWNER [user];
```

## Commands

### Connect to a DB

```bash
sudo -u postgres psql "user='[user]' password='[password]' host='[localhost]' port='[port]' dbname='[db]'"
```

### Create a New DB

```bash
sudo -u postgres createdb -O [user] --encoding='utf-8' --locale=en_US.utf8 [db]
```

### Run Command

```bash
sudo -u postgres psql "user='postgres' password='[password]' host='localhost' port='5432' dbname=[db]" -c "CREATE EXTENSION postgis";
```

### Import DB Dump

```bash
sudo -u postgres psql "user='postgres' password='[password]' host='localhost' port='5432' dbname=[db]" -f [file]
```

### Create a DB From Template

```bash
sudo -u postgres createdb -O [user] --encoding='utf-8' --locale=en_US.utf8 -T [db] [db2]
```

## Activate Correct Encoding

```sql
SET client_encoding = 'UTF8';
```

## Open Access

* 192.168.0.0/24 - example of a subnet to trust

```bash
echo 'host all all [subnet] trust' >> /etc/postgresql/9.1/main/pg_hba.conf
```

* We need to edit `/etc/postgresql/9.1/main/postgresql.conf`, where `ip` can be `*` which means any.

`listen_addresses='[ip]'`

* Then restart the service:

```bash
service postgresql restart
```
