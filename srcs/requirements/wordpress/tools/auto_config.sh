#!bin/bash

if [ ! -e /var/www/wordpress/wp-config.php ]; then
  rm -rf /var/www/wordpress/*
  wp core download --allow-root --path='/var/www/wordpress'

  mv /wp-config.php /var/www/wordpress
  sed -i -r "s/db1/$SQL_DATABASE/1"   /var/www/wordpress/wp-config.php
  sed -i -r "s/user/$SQL_USER/1"  /var/www/wordpress/wp-config.php
  sed -i -r "s/pwd/$SQL_PASSWORD/1"    /var/www/wordpress/wp-config.php
  
  wp core install --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email --allow-root --path='/var/www/wordpress'
  wp user create --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS --path='/var/www/wordpress' >> /log.txt
fi

if [ ! -d /run/php ]; then
  mkdir ./run/php
fi

/usr/sbin/php-fpm7.3 -F
