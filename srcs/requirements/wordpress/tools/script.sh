# !/bin/sh

# Change the Listening Host with 9000 Port
  sed -i "s/.*listen = 127.0.0.1.*/listen = 9000/g" /etc/php7/php-fpm.d/www.conf

# Check Whether Another Configuration File Exists or Not
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
  # Wait MariaDB to be Prepared (MariaDB Container is Running Daemon by the Script, not Daemon Directly)
  sleep 5;
  # WordPress Stuffs
  wp core download --allow-root --path=/var/www/html/
  wp core config --dbname=$MARIADB_DB --dbuser=$MARIADB_USER --dbpass=$MARIADB_PWD --dbhost=$MARIADB_HOST --dbprefix=wp_ --allow-root --path=/var/www/html/
  wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --path=/var/www/wordpress
  wp user create "$WP_USER" "$WP_USER_EMAIL" --role=subscriber --user_pass="$WP_USER_PWD" --allow-root --path=/var/www/html/
fi

# Run 
php-fpm7.3
