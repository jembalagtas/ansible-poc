#!/bin/bash
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf list docker-ce
dnf install docker-ce --nobest -y
systemctl start docker
systemctl enable docker
chkconfig docker on
docker run --name mynginx1 --restart always -p 80:80 -v nginx:/usr/share/nginx/html/ -P -d jembim/nginx-azb:0.1
