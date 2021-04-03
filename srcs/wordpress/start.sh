#!/bin/sh
/usr/sbin/php-fpm7
# telegraf --config /etc/telegraf/telegraf.conf
service nginx restart
rm ./wordpress/wp-config-sample.php
/telegraf/usr/bin/telegraf --config /telegraf.conf 
cat /dev/random