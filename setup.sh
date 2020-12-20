#!/bin/bash

####################################################
# installing packages
####################################################
yum install httpd  php -y


####################################################
# adding .html to php handler
####################################################
echo "<FilesMatch \.html\$>" >> /etc/httpd/conf.d/php.conf 
echo "  SetHandler application/x-httpd-php" >> /etc/httpd/conf.d/php.conf
echo "</FilesMatch>" >> /etc/httpd/conf.d/php.conf


####################################################
# restarting httpd
####################################################
service httpd restart
chkconfig httpd on


####################################################
# copying site contetn
####################################################

cp -r /root/site-data/*  /var/www/html/
service httpd restart
chkconfig httpd on



