all:
	sudo docker compose up

down:
	sudo docker compose down
	sudo docker rmi nginx_image
	sudo docker rmi wp_image
	sudo docker rmi mariadb_image
	sudo rm -rf /home/aestraic/data/mariadb/*
	sudo rm -rf /home/aestraic/data/wordpress/*