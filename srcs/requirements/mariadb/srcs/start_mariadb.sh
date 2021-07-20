rc-service mariadb restart 

sleep 5

mysql -e "CREATE DATABASE $DB_NAME;"
mysql -e "CREATE USER '$DB_2U'@'%' IDENTIFIED BY '$DB_PW';"
mysql -e "CREATE USER '$DB_U'@'%' IDENTIFIED BY '$DB_PW';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_U'@'%';"
mysql -e "FLUSH PRIVILEGES;"