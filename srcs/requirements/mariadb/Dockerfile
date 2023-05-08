# Base image(Penultimate stable version)
FROM        debian:buster

# Install packages(MariaDB)
RUN         apt-get -y update && \
            apt-get -y upgrade && \
            apt-get -y install \
            mariadb-server \
            vim

# Open 3306 port
EXPOSE      3306

# Copy files
COPY        tools/entrypoint.sh /tmp/entrypoint.sh

# Permission control
RUN         chmod +x /tmp/entrypoint.sh

# Entrypoint command
ENTRYPOINT ["/tmp/entrypoint.sh" ]

# Default command
CMD ["mysqld"]
