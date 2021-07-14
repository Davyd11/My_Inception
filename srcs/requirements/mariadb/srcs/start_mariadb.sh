rc-service mariadb restart 

sleep 10

#if <expression for checking>;
#then
#<set of commands to be executed>
#else
#<set of other commands to be executed>
#fi

mysql -e "CREATE DATABASE $DB_NAME;"
mysql -e "CREATE USER '$DB_2U'@'%' IDENTIFIED BY '$DB_PW';"
mysql -e "CREATE USER '$DB_U'@'%' IDENTIFIED BY '$DB_PW';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_U'@'%';"
mysql -e "FLUSH PRIVILEGES;"