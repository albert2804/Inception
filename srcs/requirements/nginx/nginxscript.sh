#!/bin/sh

#create ssl key and saves it into $CERT Directory
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $SSL_CERTIFICATE_KEY -out $SSL_CERTIFICATE -subj "/C=DE/L=HN/O=42/OU=area42/CN=AStrike"

#takes the template and substitutes the environemnt variables with the actual paths from .env
#because the conf files cannot take environment variables like for example the shell does.
envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
#starts nginx in the foreground
nginx -g 'daemon off;'
echo nginx started
