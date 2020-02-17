#!/bin/bash
yum install -y wget git
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm
printf '[dockerrepo] \nname=Docker Repository \nbaseurl=https://yum.dockerproject.org/repo/main/centos/7 \nenabled=1 \ngpgcheck=1 \ngpgkey=https://yum.dockerproject.org/gpg' > /etc/yum.repos.d/docker.repo
until [[ $(rpm -qa docker-engine | wc -l) -gt 0 ]]; do yum -y install docker-engine; echo \"Waiting until docker is installed..\"; sleep 5; done
service docker start
chkconfig docker on
docker run --name mynginx1 -p 80:80 -v nginx:/usr/share/nginx/html/ -P -d jembim/nginx-azb:0.1