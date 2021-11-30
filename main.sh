#!/bin/bash

chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

sed -i "s/Very_strong_dvwa_password/$LOGIN_PASS/" /var/www/html/dvwa/includes/DBMS/MySQL.php

echo '[+] Starting mysql...'
service mysql start

echo '[+] Starting apache'
service apache2 start

while true
do
    tail -f /var/log/apache2/*.log
    exit 0
done
