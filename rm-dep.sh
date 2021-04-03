#!/bin/sh

kubectl delete -f ./srcs/deployment/mysql.yaml
kubectl delete -f ./srcs/deployment/influxdb.yaml
kubectl delete -f ./srcs/deployment/grafana.yaml
kubectl delete -f ./srcs/deployment/nginx.yaml
kubectl delete -f ./srcs/deployment/phpmyadmin.yaml
kubectl delete -f ./srcs/deployment/ftps.yaml
kubectl delete -f ./srcs/deployment/wordpress.yaml