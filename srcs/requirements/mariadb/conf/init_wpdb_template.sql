USE mysql;
/*
needed to avoid the --skip grant-tables error
*/
FLUSH PRIVILEGES;
/*
Delete cluttered or accumulated users in case there are any
Drop Database test, which gets Created by initalizeing the mysql db
Only local access on mysql database is possible for ipv4 and ipv6 addresses (deletes all users, which hosts dont have the localhost ip-address)
Change roots standard pw(none)
*/
DELETE FROM	mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PW}';

/*
Creates WP database and gradnt the privilges to a newly created user
*/

CREATE DATABASE ${DB_NAME};
CREATE USER '${DB_USR}'@'%' IDENTIFIED by '${DB_PW}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USR}@'%';

FLUSH PRIVILEGES;