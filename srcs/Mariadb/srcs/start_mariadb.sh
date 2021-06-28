rc-service mariadb restart

sleep 10 #el sleep tiene que cambiarse por saber cuando el proceso esta iniciado 

mysql -e "CREATE DATABASE mydb;"
mysql -e "CREATE USER 'user'@'%' IDENTIFIED BY 'user';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';"
mysql -e "FLUSH PRIVILEGES;"