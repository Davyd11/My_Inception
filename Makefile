# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpuente- <dpuente-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/27 21:34:45 by dpuente-          #+#    #+#              #
#    Updated: 2021/07/13 10:13:40 by dpuente-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#silence bash output &>/dev/null
all:
	@echo ""
	@echo "Use the following parameters after the make rule for a personalized build"
	@echo ""
	@echo " -- [info] display all images and containers"
	@echo " -- [build] to build all images needed"
	@echo " -- [run] to mount all images"
	@echo " -- [fast] to build and mount all images"
	@echo " -- [stop] to stop all running containers"
	@echo " -- [del] to delete all exited containers"
	@echo " -- [prune] to delete all conatiners and images created"
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

build:
	mkdir -p srcs/requirements/wordpress/data
	mkdir -p srcs/requirements/mariadb/data
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