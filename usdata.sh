#!/bin/bash

sudo yum install httpd php -y
sudo yum install mariadb-server -y
sudo yum install java-11-amazon-corretto -y 
sudo yum install MySQL-python -y
sudo yum install git -y


sudo service httpd restart
sudo service mariadb restart

sudo mysql -e "SET PASSWORD FOR root@localhost = PASSWORD('12345678');FLUSH PRIVILEGES;" 

printf "12345678\n n\n n\n n\n y\n y\n y\n" | sudo mysql_secure_installation


sudo mysql -u root -p12345678 -e "create database contacts"

sudo systemctl enable mysql
sudo service mariadb restart

git clone https://github.com/jebincvarghese/java_spring_boot_app.git  /var/website/java_spring_boot_app

cat <<EOF > /etc/systemd/system/javajar.service
[Unit]
Description=Java Application
Wants=syslog.target network.target remote-fs.target
After=remote-fs.target
Before=multi-user.target
[Service]
ExecStart=/bin/java -jar /var/website/java_spring_boot_app/contacts-0.0.1-SNAPSHOT.jar
ExecStop=/bin/kill -15 $MAINPID
Type = simple
[Install]
WantedBy=multi-user.target
EOF

sudo service mariadb restart
sudo systemctl daemon-reload 
sudo systemctl enable javajar.service
sudo systemctl start javajar.service