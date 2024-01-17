FROM debian:buster
RUN	apt update && apt upgrade && apt install nginx -y
RUN apt install openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/mmorue.crt -keyout /etc/nginx/ssl/mmorue.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=mmorue.42.fr/UID=mmorue"
RUN chmod -R 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN chmod 600 /etc/nginx/ssl/mmorue.*

CMD ["nginx", "-g", "daemon off;"]