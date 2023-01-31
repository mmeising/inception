all:
	docker compose up -d

ps:
	docker compose ps

down:
	docker compose down

del:
	docker compose down --rmi all --remove-orphans -v
	sudo docker system prune -a
	sudo rm -rf /home/mmeising/volumes/wp_data/*
	sudo rm -rf /home/mmeising/volumes/db_data/*
#delete local volume content

re: del all
