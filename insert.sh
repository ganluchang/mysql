#!/bin/bash
set -u
#set -e
set -x
login='/opt/mysql3306/bin/mysql -u root -pglcglc -h 127.0.0.1'
i=0
while [ ${i} -lt 50 ]
do
${login} -e "insert into  glc.t1(name,sex,degree ) values('glc',"$i","$i");"
((i++))
sleep 1;
done;
