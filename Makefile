all:
	docker compose -f srcs/docker-compose.yml build --no-cache
	docker compose -f srcs/docker-compose.yml up -d

ps:
	docker compose -f srcs/docker-compose.yml ps -a

down:
	docker compose -f srcs/docker-compose.yml down

up:
	docker compose -f srcs/docker-compose.yml up -d

del_vol:
	docker compose -f srcs/docker-compose.yml down --rmi all --remove-orphans -v
	docker kill $(docker ps -q) || echo "nothing to kill"
	sudo docker system prune -a --volumes -f
	sudo rm -rf /home/mmeising/volumes/wp_data/*
	sudo rm -rf /home/mmeising/volumes/db_data/*

del:
	docker compose -f srcs/docker-compose.yml down --rmi all --remove-orphans
	docker kill $(docker ps -q) || echo "nothing to kill"
	sudo docker system prune -a -f

re: del all

re_vol: del_vol all
