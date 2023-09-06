FROM alpine:3.18

RUN apk update && \
    apk add nano && \
    apk add openrc && \
    apk add gettext && \
    apk add mariadb mariadb-client mariadb-openrc

COPY init_wpdb_template.sql /
COPY wp_db.sh /
RUN touch init_wpdb.sql

RUN chmod 777 /init_wpdb_template.sql
RUN chmod 777 /wp_db.sh
RUN chmod 777 /init_wpdb.sql

RUN /bin/sh wp_db.sh

RUN rm /wp_db.sh
RUN rm /init_wpdb_template.sql
RUN rm /init_wpdb.sql
#ENTRYPOINT ["/wp_db.sh"]