NAME = inception

all:
	mkdir -p ${HOME}/data/wordpress ${HOME}/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

re:
	bash srcs/requirements/wordpress/tools/make_dir.sh
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

log	:
	sudo docker-compose -f srcs/docker-compose.yml logs -f

clean: down
	docker system prune -a
	sudo rm -rf ~/data/wordpress/*
	sudo rm -rf ~/data/mariadb/*

fclean:
	docker stop $$(docker ps -qa)
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	sudo rm -rf ~/data/wordpress/*
	sudo rm -rf ~/data/mariadb/*

.PHONY	: all down re log clean fclean