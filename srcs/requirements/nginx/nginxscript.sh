#!/bin/sh

#create ssl key and saves it into $CERT Directory
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $SSL_CERTIFICATE_KEY -out $SSL_CERTIFICATE -subj "/C=DE/L=HN/O=42/OU=area42/CN=AStrike"
echo sslcreated
#takes the template and substitutes the environemnt variables with the actual paths from .env
#because the conf files cannot take environment variables like for example the shell does.
# export SSL_CERTIFICATE
# export SSL_CERTIFICATE_KEY
chmod +rwx $SSL_CERTIFICATE_KEY
chmod +rwx $SSL_CERTIFICATE
envsubst '$SSL_CERTIFICATE $SSL_CERTIFICATE_KEY' < /etc/nginx/nginx.conf.template > /etc/nginx/http.d/default.conf
echo envsubst
# cat /etc/nginx/nginx.conf
nginx -t
echo nginx syntax
#starts nginx in the foreground
nginx -g 'daemon off;'
# tail -f /dev/null
echo nginx started
