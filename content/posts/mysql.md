---
title: "MySQL"
date: 2014-06-16T01:29:00
comments: true
categories: DB
keywords: mysql, db
---

## Reset root password
```bash
sudo service mysql stop
sudo mysqld --skip-grant-tables &
mysql -u root mysql
```

```sql
UPDATE user SET Password=PASSWORD('[password]') WHERE User='root';
FLUSH PRIVILEGES;
```

## Administer users
`[ip]` can be `%`, which means `any`, `localhost`, or `ip-address`

```sql
CREATE USER '[user]'@'[ip]' IDENTIFIED BY '[password]';
DROP USER '[user]'@'[ip]';
```

## Open access
Instead of `[db]` and `[table]` can be `*`, which means `any`.
`[privilege]` can be `ALL`, `USAGE`, `SELECT` etc.
You can optionally add `WITH GRANT OPTION` to the `GRANT` command for the user to be able to grant permissions

[Details](http://dev.mysql.com/doc/refman/5.1/en/grant.html#idm47213304336736)

```sql
GRANT [privilege] ON `[db]`.`[table]` to '[user]'@'[ip]' IDENTIFIED BY '[password]';
GRANT [privilege] ON *.* to '[user]'@'[ip]' IDENTIFIED BY '[password]';
SHOW GRANTS for '[user]'@'[ip]';
REVOKE [privilege] ON *.* FROM '[user]'@'[ip]';
FLUSH PRIVILEGES;
```

## Create database
```sql
CREATE DATABASE `[name]` CHARACTER SET utf8 COLLATE utf8_general_ci;
```

## Open access to external users
```bash
mysql -uroot -p[password] -e "GRANT ALL ON *.* to root@'%' IDENTIFIED BY '[password]' WITH GRANT OPTION; FLUSH PRIVILEGES;"
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
service mysql restart
```

# Encoding

## Check encoding

### For Databases:
```sql
SELECT default_character_set_name FROM information_schema.SCHEMATA WHERE schema_name = "[dbname]";
```

### For Tables:
```sql
SELECT CCSA.character_set_name FROM information_schema.`TABLES` T,
       information_schema.`COLLATION_CHARACTER_SET_APPLICABILITY` CCSA
WHERE CCSA.collation_name = T.table_collation
  AND T.table_schema = "[dbname]"
  AND T.table_name = "[tablename]";
```

### For Columns:
```sql
SHOW FULL COLUMNS FROM [tablename];
```

## Change collation for a database
```sql
ALTER DATABASE [dbname] CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE [tablename] CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
```

## Add timezone info to the DB
```bash
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -D mysql -u root -p
mysql -u root -p -e "flush tables;"
```
