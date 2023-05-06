# !/bin/sh

# Check if Configuration File Exists
openssl	req -x509 -nodes -days 365 -newkey rsa:2048 \
            -keyout /etc/ssl/private/server_pkey.pem \
            -out /etc/ssl/certs/server.crt \
            -subj "/C=KR/ST=Seoul/L=Gaepo/O=42Seoul/OU=./CN=yachoi.42.fr/emailAddress=yachoi@student.42seoul.kr"
# Check if Configuration File Exists
if [ ! -f "/etc/nginx/conf.d/default.conf" ]; then
  # Copy Configuration File
  cp /tmp/nginx.conf /etc/nginx/conf.d/default.conf
  # Wait for WordPress to be ready
  sleep 5;
fi

# Run
nginx -g 'daemon off;'

