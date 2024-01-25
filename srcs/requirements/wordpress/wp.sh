#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir wp -p
cd wp
wp core download
# wp core config --dbhost=mariadb_container --dbname=$DB_NAME --dbuser=$DB_USR --dbpass=$DB_PW
