#!/bin/sh
addgroup -S grafana
adduser -G grafana -S grafana
chown -R grafana:grafana /grafana-7.4.3
cd /grafana-7.4.3/bin
./grafana-server web &
/telegraf/usr/bin/telegraf --config /telegraf.conf
cat /dev/random