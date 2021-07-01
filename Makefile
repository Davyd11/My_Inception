# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpuente- <dpuente-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/27 21:34:45 by dpuente-          #+#    #+#              #
#    Updated: 2021/07/01 10:15:32 by dpuente-         ###   ########.fr        #
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

build:
	mkdir -p srcs/wordpress/data
	mkdir -p srcs/mariadb/data
	docker build -t service_nginx srcs/nginx/ 
	docker build -t service_wordpress srcs/wordpress/
	docker build -t service_mariadb srcs/mariadb/

run:
	docker-compose -f srcs/docker-compose.yaml up -d

fast: build run

stop:
	docker stop $$(docker ps -q)

del:
	docker rm $$(docker ps -a -q)

del_data:
	rm -rf srcs/wordpress/data/*
	rm -rf srcs/mariadb/data/*
prune:
	docker system prune -a -f
	docker volume prune -f

nginx:
	docker exec -it nginx sh

wordpress:
	docker exec -it wordpress sh

mariadb:
	docker exec -it mariadb sh

re:	stop prune fast