FROM alpine:3.12
LABEL maintainer="dpuente-"

#update packages and install mariadb
RUN apk update && apk add --no-cache mariadb


LABEL version="1.0"
LABEL description="MariaDB Server"

CMD ["mysqld"]