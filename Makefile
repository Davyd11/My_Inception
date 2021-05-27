# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpuente- <dpuente-@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/27 21:34:45 by dpuente-          #+#    #+#              #
#    Updated: 2021/05/27 21:36:56 by dpuente-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@echo ""
	@echo "Use the following parameters after the make rule for a personalized build"
	@echo ""
	@echo " -- [build] to build all images needed"
	@echo " -- [run] to mount all images"
	@echo " -- [fast] to build and mount all images"
#@echo "[up] to "
	@echo " -- [stop] to stop all running containers"
	@echo " -- [del] to delete all exited containers"
	@echo " -- [prune] to delete all conatiners and images created"
	@echo ""

build:
	docker build -t service_nginx srcs/nginx/
run:
	docker run -it -p 443:443 --name nginx service_nginx
fast:
	docker build -t service_nginx srcs/nginx/
	docker run -it -p 443:443 --name nginx service_nginx
stop:
	docker stop $$(docker ps -q)
del:
	docker rm $$(docker ps -a -q)
prune:
	docker rm $$(docker ps -a -q) | docker rmi $$(docker images -a -q)