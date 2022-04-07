#!/bin/bash
apt-get install mariadb-client -y

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --path=wp --allow-root
cd wp
wp core config --dbhost=${WORDPRESS_DB_HOST} \
				--dbname=${DB_NAME} \
				--dbuser=${DB_USER} \
				--dbpass=${DB_PASSWORD} \
				--allow-root

wp core install --url=${WP_URL} \
				--title=${WP_TITLE} \
				--admin_user=${WP_ADMIN_N} \
				--admin_password=${WP_ADMIN_PW} \
				--admin_email=${WP_ADMIN_MAIL} \
				--skip-email --allow-root

wp user create --allow-root ${SEC_USER} ${SEC_MAIL} --role=author --user_pass=${SEC_PASS}

mv * /var/www/wordpress/
/usr/sbin/php-fpm7.3 --nodaemonize
