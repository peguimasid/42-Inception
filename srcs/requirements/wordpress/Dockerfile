FROM debian:buster
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y wget php7.3 php-fpm php-mysql mariadb-client
RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz
RUN chown -R root:root /var/www/wordpress
COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf
