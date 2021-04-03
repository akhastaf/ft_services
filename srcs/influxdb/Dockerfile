FROM alpine:3.12
RUN apk update && apk add influxdb openrc libc6-compat && openrc reboot

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_linux_amd64.tar.gz \
    && tar -xzvf telegraf-1.16.3_linux_amd64.tar.gz && rm telegraf-1.16.3_linux_amd64.tar.gz \
    && mv telegraf-1.16.3 telegraf
    
COPY prob.sh /prob.sh
COPY telegraf.conf /telegraf.conf
RUN mkdir /etc/influxdb
COPY influxdb.conf /etc/influxdb/influxdb.conf

COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 8086
EXPOSE 8088
ENTRYPOINT ["./start.sh"]