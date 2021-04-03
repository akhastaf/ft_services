#!/bin/sh
/usr/sbin/php-fpm7
service nginx start
/telegraf/usr/bin/telegraf --config /telegraf.conf 
cat /dev/random