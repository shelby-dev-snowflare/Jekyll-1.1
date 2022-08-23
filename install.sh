#!/bin/bash
echo 'installing..'

#完善相關信息------------------------------------------------------------
echo -n "CF_Key > "
read cfkey
echo "$cfkey" > Config/ID

echo -n "NG_Key > "
read ngkey
echo "$ngkey" > Config/ID-ng

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

#生成執行文件------------------------------------------------------------
dd if=Bin/jekyll-tunnel.spk |openssl des3 -d -k 8ddefff7-f00b-46f0-ab32-2eab1d227a61|tar zxf -
sleep 1
dd if=Bin/jekyll-tunnel-ng.spk |openssl des3 -d -k 8ddefff7-f00b-46f0-ab32-2eab1d227a61|tar zxf -
sleep 1
dd if=Bin/jekyll.spk |openssl des3 -d -k 8ddefff7-f00b-46f0-ab32-2eab1d227a61|tar zxf -
sleep 1
dd if=Bin/caddy.spk |openssl des3 -d -k 8ddefff7-f00b-46f0-ab32-2eab1d227a61|tar zxf -
sleep 10

#自動命名---------------------------------------------------------------
mv jekyll `cat Config/1-alice``cat Config/random``cat Config/2-type`
mv jekyll-tunnel `cat Config/1-alice``cat Config/random`-tunnel`cat Config/2-type`
mv jekyll-tunnel-ng `cat Config/1-alice``cat Config/random`-tunnel-ng`cat Config/2-type`
sleep 2


echo 'done'

