FROM debian:buster
RUN apt update
RUN apt upgrade
RUN apt install nginx vim curl openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=BR/ST=RJ/L=RJ/O=42/OU=42/CN=gmasid.42.fr/UID=gmasid"
