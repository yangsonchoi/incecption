#!/bin/sh

service mysql start

sed -i "s/bind-address/#bind-address/" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/password =/password = $MARIADB_ADMIN_PWD/g" /etc/mysql/debian.cnf

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ADMIN_PWD}';" | mysql -u$MARIADB_ADMIN_USER -p$MARIADB_ADMIN_PWD
echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DB;" | mysql -u$MARIADB_ADMIN_USER -p$MARIADB_ADMIN_PWD
echo "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PWD';" | mysql -u$MARIADB_ADMIN_USER -p$MARIADB_ADMIN_PWD
echo "GRANT ALL PRIVILEGES ON mysql.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PWD';" | mysql -u$MARIADB_ADMIN_USER -p$MARIADB_ADMIN_PWD
echo "GRANT ALL PRIVILEGES ON $MARIADB_DB.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PWD';" | mysql -u$MARIADB_ADMIN_USER -p$MARIADB_ADMIN_PWD
echo "FLUSH PRIVILEGES;" | mysql -u$MARIADB_ADMIN_USER -p$MARIADB_ADMIN_PWD

service mysql stop

exec "$@"