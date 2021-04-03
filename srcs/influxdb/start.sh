#!/bin/sh
touch /run/openrc/softlevel
rc-status
service influxdb start
/telegraf/usr/bin/telegraf --config /telegraf.conf
cat /dev/random