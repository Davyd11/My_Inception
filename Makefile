# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpuente- <dpuente-@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/27 21:34:45 by dpuente-          #+#    #+#              #
#    Updated: 2021/07/01 00:23:13 by dpuente-         ###   ########.fr        #
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
	@mkdir -p srcs/wordpress/data
	@mkdir -p srcs/Mariadb/data
	docker build -t service_nginx srcs/nginx/ &>/dev/null
	docker build -t service_wordpress srcs/wordpress/ &>/dev/null
	docker build -t service_mariadb srcs/Mariadb/
run:
	docker-compose -f srcs/docker-compose.yaml up -d
fast:
	docker build -t service_nginx srcs/nginx/ 
	docker build -t service_wordpress srcs/wordpress/
	docker build -t service_mariadb srcs/Mariadb/

	docker-compose -f srcs/docker-compose.yaml up -d

stop:
	docker stop $$(docker ps -q)
del:
	docker rm $$(docker ps -a -q)
prune:
	docker system prune -a -f
	docker volume prune -f
nginx:
	docker exec -it nginx bash
wordpress:
	docker exec -it wordpress bash
mariadb:
	docker exec -it mariadb bash
re:	stop prune fast