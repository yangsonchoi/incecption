# !/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
  # Run Mariadb daemon to set up
  /usr/bin/mysqld_safe --datadir=/var/lib/mysql &
  # Change config to use for network
  sed -i "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf
  # Open port
  sed -i "s/.*bind-address\s*=.*/bind-address=0.0.0.0\nport=3306/g" /etc/my.cnf.d/mariadb-server.cnf
  # Read Query with Deleting New Lines and Embracing Quotes and Eval with Env Variables
  eval "echo \"$(cat /tmp/query.sql)\"" | mariadb
  # Terminate MariaDB Daemon
  pkill mariadb
fi