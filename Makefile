SRCS = ./srcs/
SOCK = /var/run/



all:
	sudo mkdir -p /home/lcadogan/data/wordpress
	sudo mkdir -p /home/lcadogan/data/mysql
	cd $(SRCS) && docker-compose up -d

down:
	cd $(SRCS) && docker-compose down

rul:
	cd $(SOCK) && sudo chown ${USER}: docker docker.sock

fclean: down
	-docker rm `docker ps -qa`
	-docker rmi -f `docker images -qa`
	-docker volume rm `docker volume ls -q`
	-docker network rm `docker network ls -q`
	sudo rm -rf /home/lcadogan/data
