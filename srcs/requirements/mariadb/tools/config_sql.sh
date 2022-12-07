#!/bin/sh

service mysql start;

# mysql -u root -p'$MYSQL_ROOT_PASSWORD'


# Change root user login plugin to allow passwords, and update root password
# 	echo "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password; ALTER USER root@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
# #Delete default test database
# 	echo "DROP DATABASE test; DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
# #Delete blank users
# 	echo "DELETE FROM mysql.user WHERE User='';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
# 	echo "test"
# #Explicitly prevent root remote login by deleting any root users on any host other than localhost (default in most installations)
# 	echo "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
# #Update permissions that were altered in the previous commands
# 	echo "FLUSH PRIVILEGES;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
# #Create database and user for wordpress
# 	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD

echo "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password; ALTER USER root@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
echo "CREATE DATABASE IF NOT EXISTS `${MYSQL_DATABASE}`;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "CREATE USER `${MYSQL_USER}`@localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "GRANT ALL PRIVILEGES ON wordpress.* TO \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "FLUSH PRIVILEGES;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD


echo "test"
/etc/init.d/mysql stop
# mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
# exec "$@"
exec mysqld_safe

