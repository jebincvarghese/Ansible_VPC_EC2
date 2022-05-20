#!/bin/bash

echo "ClientAliveInterval 60" >> /etc/ssh/sshd_config
echo "LANG=en_US.utf-8" >> /etc/environment
echo "LC_ALL=en_US.utf-8" >> /etc/environment
service sshd restart

yum install httpd php -y

echo "<VirtualHost *:80> 
ProxyPreserveHost On 
ProxyRequests Off 
ServerName  ansible_fqdn
ServerAlias  ansible_fqdn  
ProxyPass / https://jebin.com:80 
ProxyPassReverse / http://172.31.16.101:3000 
</VirtualHost>" >> /etc/httpd/conf/httpd.conf

service httpd restart
chkconfig httpd on
