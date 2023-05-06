# Base image(Penultimate stable version)
FROM        debian:buster

# Install packages(MariaDB)
RUN         apt-get update && apt-get install -y --no-cache\
            apt-get install mariadb mariadb-client && \
            mkdir -p /run/mysqld /var/lib/mysql && \
            mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal && \
            chown -R mysql:mysql /var/lib/mysql /run/mysqld

# Open 3306 port
EXPOSE      3306

# Copy files
COPY        conf/query.sql /tmp/query.sql
COPY        tools/script.sh /tmp/script.sh

# Permission control
RUN         chmod +x /tmp/script.sh

# Entrypoint command
ENTRYPOINT [ "sh", "-c", "/tmp/script.sh" ]

# Default command
CMD ["/usr/bin/mysqld", "--skip-log-error"]
