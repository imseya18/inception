FROM debian:buster
RUN apt update && apt upgrade && apt install nginx -y
RUN mkdir -p /etc/nginx/ssl
RUN chmod -R 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
