# Use the latest Alpine base image
FROM alpine:3.18

# Install NGINX, openssl and gettext(envsubst)
RUN apk update && \
    apk add nginx &&\
    apk add openssl &&\
    apk add gettext &&\ 
    apk add nano

COPY nginx.conf.template /etc/nginx/nginx.conf.template

#just used for testing the NGINX WELCOME page, remove later
RUN mkdir /usr/share/nginx/html
COPY index.html /usr/share/nginx/html

COPY nginxscript.sh /
RUN chmod +x /nginxscript.sh

# Start NGINX and create a sslkey and store it in the CERT-directory
# Uses envsubst to generate a nginx.conf with actual paths and no variables
CMD ["/nginxscript.sh"]
