#!/bin/bash
set -u
set -e
set -x
#create mysql user
if [[ `id mysql` && `groups mysql` ]]; then
echo "mysql user or group already exist!"
else
echo "mysql user is not exist!"
echo "create mysql group and user"
groupadd mysql
useradd -r -g mysql mysql -s /sbin/nologin -d /home/mysql -m
fi
#mkdir -p /data/mysql/mysql3306{data,logs.tmp}
#mkdir -p /data/mysql/mysql3306/logs/mysql-bin
