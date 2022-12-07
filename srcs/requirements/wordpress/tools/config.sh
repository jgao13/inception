#!bin/bash
sleep 5
if [ ! -f /var/www/wordpress/wp-config.php ]
then

	mkdir -p /var/www/wordpress
	chmod -R 755 /var/www/wordpress
	wp core download --path=/var/www/html/ --allow-root

	wp config create	--allow-root \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=mariadb:3306 \
						--path='/var/www/html'

	wp core install     --url=jgao.42.fr --title=Inception --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root --path='/var/www/html'
	wp user create       $WP_USER $WP_EMAIL --user_pass=$WP_PASSWORD --allow-root --role="author" --path='/var/www/html'
fi