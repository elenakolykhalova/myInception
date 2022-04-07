all: mkdir
	docker-compose -f srcs/docker-compose.yaml up --build -d

restart: clean all

mkdir:
	mkdir /home/mcarry/data/wordpress
	mkdir /home/mcarry/data/mariadb

clean:
	docker stop $$(docker ps -a -q)
	docker container prune -f
	docker image prune -a -f
	docker volume rm $$(docker volume ls -q)
	docker network prune -f
	sudo rm -rf /home/mcarry/data/wordpress
	sudo rm -rf /home/mcarry/data/mariadb
