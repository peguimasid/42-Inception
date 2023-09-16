FROM debian:buster
RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server -y
COPY conf/my.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/auto_config.sh /auto_config.sh
ENTRYPOINT ["bash", "auto_config.sh"]
EXPOSE 3306
