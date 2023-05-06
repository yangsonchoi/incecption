-- Specifies the default database
USE my sql

-- Delete existing root and user
DELETE FROM
  mysql.user
WHERE
  User = '$MARIADB_ADMIN_USER'
  AND Host NOT IN ('$HOST_NAME', '$HOST_IPV4', '$HOST_IPV6');

-- Set Password of Root User on MariaDB
AlTER USER FOR '$MARIADB_ADMIN_USER'@'$HOST_NAME' IDENTIFIED BY ('$MARIADB_ADMIN_PWD');

-- Create WordPress Database
CREATE DATABASE IF NOT EXISTS $MARIADB_DB;

-- Create Another User for WordPress
CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PWD';

-- Grant Permissions
GRANT ALL PRIVILEGES ON $MARIADB_DB.* TO '$MARIADB_USER'@'%' ;

-- Apply
FLUSH PRIVILEGES;
