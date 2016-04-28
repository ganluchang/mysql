#!/bin/bash
set -u
set -e
set -x
#create dir
mysql_port=3306
mysql_tar_file=/opt/Percona-Server-5.7.11-4-Linux.x86_64.ssl101.tar
mysql_base_dir=/usr/local/mysql
mysql_data_dir=/data/mysql${mysql_port}

mkdir -p /opt/mysql
cd mysql
tar -xvf /opt/ 
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
