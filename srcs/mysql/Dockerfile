FROM alpine:3.12
RUN apk update && apk --no-cache add mysql mysql-client libc6-compat openrc && openrc reboot

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_linux_amd64.tar.gz \
    && tar -xzvf telegraf-1.16.3_linux_amd64.tar.gz && rm telegraf-1.16.3_linux_amd64.tar.gz \
    && mv telegraf-1.16.3 telegraf
COPY my.cnf /etc/my.cnf
RUN mkdir -p /var/lib/mysql /run/mysqld/
RUN chown -R mysql:root /run/mysqld/
COPY prob.sh /prob.sh
COPY telegraf.conf /telegraf.conf
COPY wp.sql /wp.sql
COPY start.sh /start.sh
EXPOSE 3306 
ENTRYPOINT ["sh", "/start.sh" ]