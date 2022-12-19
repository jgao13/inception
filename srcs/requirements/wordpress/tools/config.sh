#!bin/bash

if [ -f "/var/www/wordpress/.installed" ]
then
	echo "already installed"
else
	sleep 10
	mkdir -p /var/www/html
	chmod -R 755 /var/www/html
	wp core download --path=/var/www/html/ --allow-root

	echo "config creating"
	echo "$MYSQL_USER"
	wp config create	--allow-root \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=mariadb:3306 \
						--path='/var/www/html'

	echo "created"
	wp core install --url=jgao.42.fr --title=Inception --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --allow-root --path='/var/www/html'
	echo "wp core install done"
	wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_PASSWORD --role="author" --path="/var/www/html" --allow-root
	echo "wp user created"

	touch /var/www/wordpress/.installed
fi

if [ ! -d /run/php ]
then
    mkdir ./run/php
fi
/usr/sbin/php-fpm7.3 -F