#!/bin/sh

# service mysql start;

# echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password; ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
# echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
# echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}'; GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"| mysql -uroot -p$MYSQL_ROOT_PASSWORD
# echo "test"

service mysql stop
service mysql start;

