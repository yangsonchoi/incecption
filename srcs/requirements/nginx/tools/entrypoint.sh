#!/bin/sh

# OpenSSL generate a self-signed X.509 certificate and private
openssl	req -x509 -nodes -days 365 -newkey rsa:2048 \
            -keyout /etc/ssl/private/server_pkey.pem \
            -out /etc/ssl/certs/server.crt \
            -subj "/C=KR/ST=Seoul/L=Gaepo/O=42Seoul/OU=./CN=yachoi.42.fr/emailAddress=yachoi@student.42seoul.kr"

# Copy Configuration File
cp /tmp/default /etc/nginx/sites-available/default

exec "$@"