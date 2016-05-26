

#!/bin/bash
set -u
set -e
set -x
#create dir
mysql_port=3306   #实例端口号
mysql_tar_file=/opt/Percona-Server-5.6.17-rel66.0-608.Linux.x86_64.tar.gz #MySQL二级制包位置
mysql_base_dir=/usr/local/mysql  #软连接
mysql_data_dir=/data/mysql${mysql_port} #数据文件路径

#mkdir -p /opt/mysql  #
cd /opt/
tar -xvf ${mysql_tar_file}
#mv Percona-Server-5.6.17-rel66.0-608 mysql${port}
cd /usr/local/
ln -s /opt/Percona-Server-5.6.17-rel66.0-608.Linux.x86_64  mysql
#check mysql user and group
if [[ `id mysql` && `groups mysql` ]]; then
echo "mysql user or group already exist!"
else
echo "mysql user is not exist!"
echo "create mysql group and user"
groupadd mysql
useradd -r -g mysql mysql -s /sbin/nologin -d /home/mysql -m
fi
#create mysql data,log dir.
mkdir -p /data/mysql/mysql${mysql_port}/{data,logs,tmp}
mkdir -p /data/mysql/mysql${mysql_port}/logs/bin-log
mkdir -p /data/mysql/mysql${mysql_port}/logs/relay-log
