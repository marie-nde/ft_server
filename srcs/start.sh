service nginx start
service mysql start
service php7.3-fpm start

mysql --user=root <<_EOF_
  CREATE DATABASE wordpress;
  CREATE USER 'wpuser'@'localhost' IDENTIFIED BY '1234';
  GRANT ALL ON wordpress.* TO 'wpuser'@'localhost' IDENTIFIED BY '1234' WITH GRANT OPTION;
  CREATE USER 'admin'@'localhost' IDENTIFIED BY '1234';
  GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY '1234' WITH GRANT OPTION;
  FLUSH PRIVILEGES;
_EOF_

rm /var/www/html/index.nginx-debian.html
