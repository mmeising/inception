all:
	sleep 3 && docker compose build --no-cache
	docker compose up -d

ps:
	docker compose ps -a
	docker container ls -a
	docker ps -a

down:
	docker compose down

up:
	docker compose up -d

del_vol:
	docker compose down --rmi all --remove-orphans -v
	docker kill $(docker ps -q) || echo "nothing to kill"
	sudo docker system prune -a --volumes -f
	sudo rm -rf /home/mmeising/volumes/wp_data/*
	sudo rm -rf /home/mmeising/volumes/db_data/*

del:
	docker compose down --rmi all --remove-orphans
	docker kill $(docker ps -q) || echo "nothing to kill"
	sudo docker system prune -a -f

re: del all

re_vol: del_vol all

#define('WP_HOME','https://mmeising.42.fr');
#define('WP_SITEURL','https://mmeising.42.fr');
