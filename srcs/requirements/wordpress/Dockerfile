FROM debian:buster
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y wget php7.3 php-fpm php-mysql mariadb-client
RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz
RUN chown -R root:root /var/www/wordpress
COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/wp-config.php /wp-config.php
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY tools/auto_config.sh /auto_config.sh
EXPOSE 443
CMD ["bash", "auto_config.sh"]
