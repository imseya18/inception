#!/bin/sh
if [ ! -f "/var/www/html/wp-config.php" ]; then
cat << EOF > /var/www/html/wp-config.php
<?php
define( 'DB_NAME', '${DB_NAME}' );
define( 'DB_USER', '${DB_USER}' );
define( 'DB_PASSWORD', '${DB_PASS}' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('FS_METHOD','direct');
\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
define( 'ABSPATH', __DIR__ . '/' );}
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
require_once ABSPATH . 'wp-settings.php';
EOF

	wp core install --url="https://mmorue.42.fr" --title="inception" --admin_user="${WP_USER}" --admin_password="${WP_PASS}" --admin_email="${WP_USER}@example.com" --path='/var/www/html'

	wp user create ${WP_CUSER} ${WP_USER}@student.42muhlouse.fr --role=administrator --user_pass="${WP_CPASS}" --path='/var/www/html'

fi

/usr/sbin/php-fpm8 -F