FROM alpine:3.12

RUN apk update && apk add su-exec libc6-compat
RUN wget https://dl.grafana.com/oss/release/grafana-7.4.3.linux-amd64.tar.gz && tar -zxvf grafana-7.4.3.linux-amd64.tar.gz
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_linux_amd64.tar.gz \
    && tar -xzvf telegraf-1.16.3_linux_amd64.tar.gz && rm telegraf-1.16.3_linux_amd64.tar.gz \
    && mv telegraf-1.16.3 telegraf
COPY grafana.db /grafana-7.4.3/data/grafana.db
COPY prob.sh /prob.sh
COPY telegraf.conf /telegraf.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]