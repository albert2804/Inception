#!/bin/sh

echo '1'

# init mysql_db
if [ ! -d "/var/lib/mysql/mysql" ]; then

    chown -R mysql:mysql /var/lib/mysql
    mysql_install_db --datadir=/var/lib/mysql --user=mysql
fi

echo '2'

# remove test and create WP_database
envsubst < /init_wpdb_template.sql > /init_wpdb.sql

echo '3'

/usr/bin/mysqld --user=mysql --bootstrap < /init_wpdb.sql

echo 'Database initialized'