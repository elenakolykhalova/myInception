#wordpress+php
FROM	debian:buster
RUN		apt-get update -y && apt-get install -y vim php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring php-xml net-tools curl
RUN		mkdir /run/php/

ADD		https://wordpress.org/latest.tar.gz .
RUN		tar -xf latest.tar.gz && rm -rf latest.tar.gz

COPY	/conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN		chmod 777 /etc/php/7.3/fpm/pool.d/www.conf

COPY	/tools/setup_wp.sh /
RUN		chmod 777 setup_wp.sh
CMD		./setup_wp.sh
