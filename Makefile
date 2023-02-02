all:
	docker compose up -d

ps:
	docker compose ps

down:
	docker compose down

del_vol:
	docker compose down --rmi all --remove-orphans -v
	sudo docker system prune -a
	sudo rm -rf /home/mmeising/volumes/wp_data/*
	sudo rm -rf /home/mmeising/volumes/db_data/*

del:
	docker compose down --rmi all --remove-orphans
	sudo docker system prune -a

re: del all

re_vol: del_vol all

#define('WP_HOME','https://mmeising.42.fr');
#define('WP_SITEURL','https://mmeising.42.fr');
