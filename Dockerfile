FROM debian:buster

RUN apt update \
&& apt install nginx -y \
&& apt install mariadb-server mariadb-client -y \
&& apt install wget -y \
&& apt install php-fpm php-mysql -y \
&& wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-english.tar.gz \
&& mkdir /var/www/html/phpmyadmin \
&& tar -zxvf phpMyAdmin-4.9.2-english.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin \
&& cp /var/www/html/phpmyadmin/config.sample.inc.php /var/www/html/phpmyadmin/config.inc.php \
&& chmod 660 /var/www/html/phpmyadmin/config.inc.php \
&& chown -R www-data:www-data /var/www/html/phpmyadmin \
&& apt install php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip -y \
&& apt install php7.3-fpm -y \
&& wget http://fr.wordpress.org/latest-fr_FR.tar.gz -P /tmp \
&& tar xzf /tmp/latest-fr_FR.tar.gz -C /var/www/html

EXPOSE 8080

ADD /srcs/default /etc/nginx/sites-available/

ADD /srcs/wp-config.php /var/www/html/wordpress/

ADD /srcs/start.sh .

ADD /srcs/certificat.key /etc/ssl/

ADD /srcs/certificat.crt /etc/ssl
