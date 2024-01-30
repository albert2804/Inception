all:
# sudo rm -rf /home/aestraic/data/mariadb/*
# sudo rm -rf /home/aestraic/data/wordpress/*
	docker compose up --build

down:
	docker compose down
	docker rmi nginx_image
	docker rmi wp_image
	docker rmi mariadb_image
	@docker system prune --all --force --volumes
	@docker volume prune --force
	@docker network prune --force	
	sudo rm -rf /home/aestraic/data/mariadb/*
	sudo rm -rf /home/aestraic/data/wordpress/*