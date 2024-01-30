FROM alpine:3.18

RUN apk update && \
    apk add nano \
    bash \
    mariadb \
    mariadb-client \
    gettext
    
COPY /conf/init_wpdb_template.sql /
COPY tools/wp_db.sh /
RUN touch init_wpdb.sql

RUN chmod 777 /init_wpdb_template.sql
RUN chmod 777 /wp_db.sh
RUN chmod 777 /init_wpdb.sql

ENTRYPOINT ["/bin/sh", "/wp_db.sh"]