#!/bin/sh
# telegraf --config /etc/telegraf/telegraf.conf
service nginx start
service sshd start
/telegraf/usr/bin/telegraf --config /telegraf.conf 
cat /dev/random
