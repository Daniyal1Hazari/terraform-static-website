#!/bin/bash

# Step 1: Update packages
apt update -y

# Step 2: Install Nginx
apt install nginx -y

# Step 3: Enable Nginx (start on boot)
systemctl enable nginx

# Step 4: Start Nginx service
systemctl start nginx

# Step 5: Display a simple homepage
echo "Hello from Terraform Nginx Server 🚀" > /var/www/html/index.html
