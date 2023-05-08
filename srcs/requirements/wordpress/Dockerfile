FROM        debian:buster

# Install packages(Wordpress, PHP)
RUN         apt-get -y update && \
            apt-get -y upgrade && \
            apt-get -y install \
            php7.3 \
            php-fpm \
            php-cli \
            wget \
            curl \
            php-mysql \
            php-mbstring \
            php-xml \
            sendmail \
            vim \
            mariadb-client 

# Copy Files
COPY        tools/entrypoint.sh /tmp/entrypoint.sh

# Permission Control
RUN         chmod +x /tmp/entrypoint.sh

# Open 9000 port
EXPOSE      9000

# Command to Execute by Entrypoint
ENTRYPOINT  [ "/tmp/entrypoint.sh" ]

CMD         ["php-fpm7.3", "-F"]
