# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpuente- <dpuente-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/27 21:34:45 by dpuente-          #+#    #+#              #
#    Updated: 2021/06/04 12:17:26 by dpuente-         ###   ########.fr        #
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
	docker build -t service_nginx srcs/nginx/ &>/dev/null
	docker build -t service_wordpress srcs/wordpress/ &>/dev/null
	docker build -t service_mariadb srcs/Mariadb/ &>/dev/null

	docker run -it -p 80:80 --name nginx service_nginx	
#docker run -it -p 3306:3306 --name maridb service_mariadb
#docker run -it -p 9000:9000 --name wordpress service_wordpress

stop:
	docker stop $$(docker ps -q)
del:
	docker rm $$(docker ps -a -q)
prune:
	docker rm $$(docker ps -a -q) ; docker rmi $$(docker images -a -q)