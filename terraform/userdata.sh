#!/bin/bash

yum update -y

amazon-linux-extras enable nginx1
yum install nginx -y

systemctl enable nginx
systemctl start nginx

yum install git -y

cd /tmp
git clone https://github.com/Daniyal1Hazari/terraform-static-website.git

cp -r /tmp/terraform-static-website/website/* /usr/share/nginx/html/
