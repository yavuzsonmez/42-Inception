#!/bin/bash

service mysql start

mysql -u root -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "CREATE DATABASE ${WP_DB_NAME};"
mysql -u root -e "USE '${WP_DB_NAME}'; GRANT ALL PRIVILEGES ON * TO '${MYSQL_USER}'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -u root -e "alter user 'root'@'localhost' identified by '${MYSQL_ROOT_PASSWORD}'";