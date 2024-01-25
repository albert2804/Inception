FROM alpine:3.18

RUN apk update && \
    apk add nano \
    bash \
    openrc \
    gettext \
    mariadb \
    mariadb-client \
    mariadb-openrc
    
COPY init_wpdb_template.sql /
COPY wp_db.sh /
RUN touch init_wpdb.sql

RUN chmod 777 /init_wpdb_template.sql
RUN chmod 777 /wp_db.sh
RUN chmod 777 /init_wpdb.sql

# RUN /bin/sh /wp_db.sh

CMD ["/bin/sh", "-c", "/wp_db.sh && tail -f /dev/null"]