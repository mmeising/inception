all:
	docker compose up -d

ps:
	docker compose ps

down:
	docker compose down

del:
	docker compose down --rmi all --remove-orphans -v

re: del all