#!/bin/sh

echo '1'
# alpine specific. mysql demon has to be added to the running processes
if [ ! -d "/run/mysqld" ]; then

    mkdir -p /run/mysqld
    chown -R mysql:mysql /run/mysqld
fi

# init mysql_db
if [ ! -d "/var/lib/mysql/mysql" ]; then

    chown -R mysql:mysql /var/lib/mysql
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql
fi

echo '2'

# remove test and create WP_database
envsubst < /init_wpdb_template.sql > /init_wpdb.sql

echo '3'

/usr/bin/mysqld --user=mysql --bootstrap < /init_wpdb.sql


sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
echo 'Database initialized'

exec /usr/bin/mysqld --user=mysql --console