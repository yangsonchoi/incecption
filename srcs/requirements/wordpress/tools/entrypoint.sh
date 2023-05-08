#!/bin/sh

service php7.3-fpm start;
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

if [ ! -f /var/www/wordpress/wp-config.php ]; then
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp

  wp core download --allow-root --path=/var/www/wordpress/
  wp core config --dbname=$MARIADB_DB --dbuser=$MARIADB_USER --dbpass=$MARIADB_PWD --dbhost=$MARIADB_HOST --dbprefix=wp_ --allow-root --path=/var/www/wordpress/
  wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --allow-root --path=/var/www/wordpress/
  wp user create "$WP_USER" "$WP_USER_EMAIL" --role=subscriber --user_pass="$WP_USER_PWD" --allow-root --path=/var/www/wordpress/
fi

service php7.3-fpm stop;

exec "$@"