rc-service mariadb restart 

sleep 15

mysql -e "CREATE DATABASE $DB_N;"
mysql -e "CREATE USER '$DB_2U'@'%' IDENTIFIED BY '$DB_PW';"
mysql -e "CREATE USER '$DB_U'@'%' IDENTIFIED BY '$DB_PW';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_U'@'%';"
mysql -e "FLUSH PRIVILEGES;"