# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpuente- <dpuente-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/27 21:34:45 by dpuente-          #+#    #+#              #
#    Updated: 2021/06/10 13:00:46 by dpuente-         ###   ########.fr        #
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
#@echo "[up] to "
	@echo " -- [stop] to stop all running containers"
	@echo " -- [del] to delete all exited containers"
	@echo " -- [prune] to delete all conatiners and images created"
	@echo ""

info:
	@echo "--------------------------------------------------------------------------"	
	docker images
	@echo "--------------------------------------------------------------------------"
	docker ps -a
	@echo "--------------------------------------------------------------------------"
build:
	docker build -t service_nginx srcs/nginx/ &>/dev/null
	docker build -t service_wordpress srcs/wordpress/ &>/dev/null
	docker build -t service_mariadb srcs/Mariadb/ &>/dev/null
run:
#docker run -it -p 443:443 --name nginx service_nginx
	docker run -it -p 9000:9000 --name wordpress service_wordpress
fast:
	docker build -t service_nginx srcs/nginx/
	docker build -t service_wordpress srcs/wordpress/ &>/dev/null
	docker build -t service_mariadb srcs/Mariadb/ &>/dev/null

	docker-compose -f srcs/docker-compose.yaml up -d
#docker run -it -p 80:80 --name nginx service_nginx	
#docker run -it -p --name maridb service_mariadb
#docker run -it -p 9000:9000 --name wordpress service_wordpress

stop:
	docker stop $$(docker ps -q)
del:
	docker rm $$(docker ps -a -q)
prune:
	docker system prune -a -f