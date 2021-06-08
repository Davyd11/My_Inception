FROM alpine:3.13
LABEL maintainer="dpuente-"

#update packages and install mariadb
RUN apk update && apk add --no-cache mariadb


LABEL version="1.0"
LABEL description="MariaDB Server"

CMD ["mysqld"]