FROM alpine:3.13
LABEL maintainer="dpuente-"

#update packages and install mariadb
RUN apk update && apk add --no-cache mariadb
RUN apk add openrc


LABEL version="1.0"
LABEL description="MariaDB Server"

#CMD ["mysqld"]
#CMD systemctl start mariadb
CMD tail -f /dev/null 