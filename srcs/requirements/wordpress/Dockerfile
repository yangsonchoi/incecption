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
COPY        tools/script.sh /tmp/script.sh

# Permission Control
RUN         chmod +x /tmp/script.sh

# Command to Execute by Entrypoint
CMD         [ "sh", "-c", "/tmp/script.sh" ]
