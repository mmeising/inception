DOCKER_PS = $$(sudo docker ps -qa)
DOCKER_IMAGES = $$(sudo docker images -qa)
VOL_LS = $$(sudo docker volume ls -q)
NW_LS = $$(sudo docker network ls -q)

all:
	sudo docker compose -f srcs/docker-compose.yml build --no-cache
	sudo docker compose -f srcs/docker-compose.yml up -d

ps:
	sudo docker ps -a
	sudo docker images -a
	sudo docker volume ls
	sudo docker network ls

down:
	sudo docker compose -f srcs/docker-compose.yml down

up:
	sudo docker compose -f srcs/docker-compose.yml up -d

clean:
	sudo docker stop $(DOCKER_PS)		|| echo "nothing to stop"
	sudo docker rm $(DOCKER_PS)			|| echo "nothing to rm"
	sudo docker rmi -f $(DOCKER_IMAGES)	|| echo "no image to rm"
	sudo docker volume rm $(VOL_LS)		|| echo "no volume to rm"
	sudo docker network rm $(NW_LS)		|| echo "no network to rm"

del_vol:
	sudo docker compose -f srcs/docker-compose.yml down --rmi all --remove-orphans -v
	sudo docker kill $(DOCKER_PS) || echo "nothing to kill"
	sudo docker system prune -a --volumes -f
	sudo rm -rf /home/mmeising/data/wp_data/*
	sudo rm -rf /home/mmeising/data/db_data/*
	sudo docker network rm $(NW_LS) || echo "no network to kill"

del:
	sudo docker compose -f srcs/docker-compose.yml down --rmi all --remove-orphans
	sudo docker kill $(DOCKER_PS) || echo "nothing to kill"
	sudo docker system prune -a -f
	sudo docker network rm $(NW_LS) || echo "no network to kill"

re: del all

re_vol: del_vol all


# The following part is only for the first installation:

prep:
	sudo apt-get update
	sudo apt-get upgrade
	mkdir -p /home/mmeising/data/db_data
	mkdir -p /home/mmeising/data/wp_data
	echo '# New host for inception project:'	| sudo tee -a /etc/hosts > /dev/null
	echo '127.0.0.1 mmeising.42.fr'				| sudo tee -a /etc/hosts > /dev/null
	echo '# End of part for inception project'	| sudo tee -a /etc/hosts > /dev/null

ssh:
	sudo apt-get update
	sudo apt-get install openssh-server
	sudo service ssh status

ip:
	sudo apt install net-tools
	ifconfig | grep "inet "

docker:
	@echo "install docker following the steps  from 'Set up the repository', \
	through 'Install Docker Engine' up to the 'sudo docker run hello-world' command. \
	Afterwards, use the 'sudo docker system prune -a -f' command."
	xdg-open https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

open:
	@echo 'this should only be executed form the vm'
	xdg-open https://mmeising.42.fr
	@echo 'don't forget to fill the .env file with credentials of your choice!'

.PHONY: all ps down up del_vol del re re_vol prep ssh ip docker open
#sudo /usr/bin/lubuntu-upgrader --full-upgrade