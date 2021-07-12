rc-service mariadb restart 

sleep 10

#if <expression for checking>;
#then
#<set of commands to be executed>
#else
#<set of other commands to be executed>
#fi

mysql -e "CREATE DATABASE mydb;"
mysql -e "CREATE USER 'user'@'%' IDENTIFIED BY 'user';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';"
mysql -e "FLUSH PRIVILEGES;"