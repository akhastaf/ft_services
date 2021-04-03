#!/bin/sh
minikube start
eval $(minikube docker-env)

sed -E -i '' "s/[0-9]{2,3}\.[0-9]{2,3}\.[0-9]{1,3}\.[0-9]{1,3}/$(minikube ip)/g" srcs/deployment/metallb.yaml
sed -E -i '' "s/[0-9]{2,3}\.[0-9]{2,3}\.[0-9]{1,3}\.[0-9]{1,3}/$(minikube ip)/g" srcs/nginx/site.conf
sed -E -i '' "s/[0-9]{2,3}\.[0-9]{2,3}\.[0-9]{1,3}\.[0-9]{1,3}/$(minikube ip)/g" srcs/ftps/vsftpd.conf
sed -E -i '' "s/[0-9]{2,3}\.[0-9]{2,3}\.[0-9]{1,3}\.[0-9]{1,3}/$(minikube ip)/g" srcs/mysql/wp.sql

docker build ./srcs/mysql -t mysql-local
docker build ./srcs/influxdb -t influxdb-local
docker build ./srcs/grafana -t grafana-local
docker build ./srcs/nginx -t nginx-local
docker build ./srcs/phpmyadmin -t phpmyadmin-local
docker build ./srcs/ftps -t ftps-local
docker build ./srcs/wordpress -t wordpress-local


kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml

kubectl apply -f ./srcs/deployment/metallb.yaml

kubectl apply -f ./srcs/deployment/mysql.yaml
kubectl apply -f ./srcs/deployment/influxdb.yaml
kubectl apply -f ./srcs/deployment/grafana.yaml
kubectl apply -f ./srcs/deployment/nginx.yaml
kubectl apply -f ./srcs/deployment/phpmyadmin.yaml
kubectl apply -f ./srcs/deployment/ftps.yaml
kubectl apply -f ./srcs/deployment/wordpress.yaml


minikube dashboard &