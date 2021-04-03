#!/bin/sh

kubectl apply -f ./srcs/deployment/mysql.yaml
kubectl apply -f ./srcs/deployment/influxdb.yaml
kubectl apply -f ./srcs/deployment/grafana.yaml
kubectl apply -f ./srcs/deployment/nginx.yaml
kubectl apply -f ./srcs/deployment/phpmyadmin.yaml
kubectl apply -f ./srcs/deployment/ftps.yaml
kubectl apply -f ./srcs/deployment/wordpress.yaml