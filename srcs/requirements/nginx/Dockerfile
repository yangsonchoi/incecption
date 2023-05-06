FROM        debian:buster

# Install packages(nginx, openssl))
RUN         apt-get -y update &&    \
            apt-get -y upgrade &&   \
            apt-get -y install  \
            nginx   \
            openssl \
            vim

# Copy Files
COPY        conf/nginx.conf /tmp/nginx.conf
COPY        tools/script.sh /tmp/script.sh

# Expose 443 Port
EXPOSE 443

# Permission Control
RUN         chmod +x /tmp/script.sh

# Command to Execute by Entrypoint
CMD         [ "sh", "-c", "/tmp/script.sh" ]
