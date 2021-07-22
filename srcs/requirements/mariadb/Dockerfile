FROM alpine:3.13
LABEL maintainer="dpuente-"
LABEL version="1.0"
LABEL description="mariadb Server"

#update packages and install mariadb maria db_client y openrc
RUN apk update && apk add --no-cache mariadb mariadb-client mariadb-common
RUN apk add --no-cache openrc
#deja corriendo en el back openrc, prepara la configuracion de mariadb y la inicia
RUN openrc && touch /run/openrc/softlevel && /etc/init.d/mariadb setup && /etc/init.d/mariadb start

RUN sed -e '/skip-networking/s/^/#/g' -i /etc/my.cnf.d/mariadb-server.cnf
COPY srcs/start_mariadb.sh .
RUN chmod -R 777 start_mariadb.sh

CMD ./start_mariadb.sh && mysqld_safe