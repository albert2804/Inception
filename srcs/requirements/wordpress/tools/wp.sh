#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

sleep 10
while ! mariadb -h mariadb -p3306 -u${DB_USR} -p${DB_PW}; do sleep 10; done

mkdir wp -p
cd wp
chown -R nginx:nginx /wp

if [ ! -e wp-config.php ]; then
	wp core download --allow-root
	wp core config --dbhost=mariadb --dbname=$DB_NAME --dbuser=$DB_USR --dbpass=$DB_PW --allow-root
	chmod 777 wp-config.php
	wp core install --url=localhost --title=$TITLE --admin_name=$ADMIN --admin_password=$ADMIN_PW --admin_email=$ADMIN_EMAIL
fi

php-fpm81 -F -R