FROM debian:buster

RUN apt update && apt upgrade
RUN apt install nginx -y && apt install nano -y && apt install curl -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/mmorue.crt -keyout /etc/nginx/ssl/mmorue.key -subj "/C=FR/ST=GE/L=Mulhouse/O=42/OU=42/CN=mmorue.42.fr/UID=mmorue"
RUN mkdir -p /var/run/nginx
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
COPY conf/nginx.conf /etc/nginx/http.d
EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]