#!/bin/sh

dhclient
yum update -y
yum install -y docker net-tools

groupadd docker || true
usermod -aG docker vagrant || true

systemctl restart docker || true
systemctl enable docker || true

systemctl disable firewalld || true
systemctl stop firewalld || true
