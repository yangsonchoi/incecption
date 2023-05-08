NAME = inception

all:
	mkdir -p /home/yachoi/data/wordpress /home/yachoi/data/mariadb
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

build:
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env --build

up:
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d 

down:
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

log	:
	sudo docker compose -f srcs/docker-compose.yml logs -f

clean: down
	docker system prune -a

fclean:
	docker stop $$(docker ps -qa)
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	sudo rm -rf /home/yachoi/data/*


.PHONY	: all up down build log clean fclean