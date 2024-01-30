LOGIN			= aestraic
VOLUMES			= /home/${LOGIN}/data
WP_VOLUME		= ${VOLUMES}/wordpress
DB_VOLUME		= ${VOLUMES}/mariadb
DCOMPOSE		= ./srcs/docker-compose.yml

all: dir
	docker compose -f ${DCOMPOSE} up --build

build:
	docker compose -f ${DCOMPOSE} --build

up:
	docker compose -f ${DCOMPOSE} up

down:
	docker compose -f ${DCOMPOSE} down

dir:
	mkdir -m 744 -p ${WP_VOLUME}
	mkdir -m 744 -p ${DB_VOLUME}

clean: down
	docker rmi nginx_image
	docker rmi wp_image
	docker rmi mariadb_image
	-@docker system prune --all --force --volumes
	-@docker volume prune --force
	-@docker network prune --force	
	sudo rm -rf ${WP_VOLUME}
	sudo rm -rf ${DB_VOLUME}


.PHONY: all clean build up dir