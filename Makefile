# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpuente- <dpuente-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/27 21:34:45 by dpuente-          #+#    #+#              #
#    Updated: 2021/07/22 11:50:50 by dpuente-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#silence bash output &>/dev/null
all:
	@echo ""
	@echo "Use the following parameters after the make rule for a personalized build"
	@echo ""
	@echo " -- [info] display all images, containers and volumes"
	@echo " -- [append] append domain redirection"
	@echo " -- [build] to build all images needed"
	@echo " -- [run] to mount all images"
	@echo " -- [fast] to build and mount all images"
	@echo " -- [stop] to stop all running containers"
	@echo " -- [del] to delete all exited containers"
	@echo " -- [prune] to delete all containers, images created and volumes"
	@echo " -- [re] execute prune and fast"
	@echo " -- [nginx] access bash container"
	@echo " -- [wordpress] access bash container"
	@echo " -- [mariadb] access bash container"
	@echo ""

info:
	@echo "--------------------------------------------------------------------------"
	docker images
	@echo "--------------------------------------------------------------------------"
	docker ps -a
	@echo "--------------------------------------------------------------------------"
	docker volume ls
	@echo "--------------------------------------------------------------------------"

append:
	echo "127.0.0.1		dpuente-.42.fr">> /etc/hosts \
	&& echo "127.0.0.1		www.dpuente-.42.fr">> /etc/hosts

build:
	mkdir -p /home/dpuente-/data/wordpress
	mkdir -p /home/dpuente-/data/mariadb
	docker build -t service_nginx srcs/requirements/nginx/
	docker build -t service_wordpress srcs/requirements/wordpress/
	docker build -t service_mariadb srcs/requirements/mariadb/ 

run:
	docker-compose -f srcs/docker-compose.yaml up -d

fast: build run

stop:
	docker stop $$(docker ps -q)

del:
	docker rm $$(docker ps -a -q)

prune:
	docker system prune -a -f
	docker volume rm srcs_mariadb
	docker volume rm srcs_wordpress
	rm -rf srcs/requirements/wordpress/data
	rm -rf srcs/requirements/mariadb/data
	
nginx:
	docker exec -it nginx sh

wordpress:
	docker exec -it wordpress sh

mariadb:
	docker exec -it mariadb sh

re:	stop prune fast