FROM        debian:buster

# Install packages(nginx, openssl))
RUN         apt-get -y update &&    \
            apt-get -y upgrade &&   \
            apt-get -y install  \
            nginx   \
            openssl \
            vim

# Copy Files
COPY        conf/default /tmp/default
COPY        tools/entrypoint.sh /tmp/entrypoint.sh

# Expose 443 Port
EXPOSE      443

# Permission Control
RUN         chmod +x /tmp/entrypoint.sh

ENTRYPOINT  [ "/tmp/entrypoint.sh" ]

# Command to Execute by Entrypoint
CMD         ["nginx", "-g", "daemon off;"]
