FROM alpine:3.18

RUN apt update -y && apt install -y nginx && apt install -y openssl

# Use the latest Alpine base image
FROM alpine:latest

# Install NGINX
RUN apk update && \
    apk add nginx &&\
    && apt install -y openssl &&\
    apk add nano

COPY nginx.conf /etc/nginx

RUN mkdir /usr/share/nginx/html
COPY index.html /usr/share/nginx/html

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]